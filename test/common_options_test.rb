require 'test/unit'
require 'rubygems'
require 'mocha'
require 'forwardable'
require 'ruby-debug'

require 'open_gem/common_options'

class Test_CommonOptions < Test::Unit::TestCase
  extend Forwardable
  
  include OpenGem::CommonOptions
  include Gem::VersionOption
  
  def_delegators :@command, :options
  
  def setup
    @command = Gem::Command.new 'open'
    @word_one = 'foo'
    @word_two = 'bar'
  end

  def test_get_spec
    Gem.source_index.stubs(:all_gems).returns(mock_specs_hash(test_gem))
    
    choices = mock_specs_hash(test_gem).values.reverse.map{ |s| "#{s.name} #{s.version}" }
    expects(:choose_from_list).with(anything, choices).returns([choices.first, 0])
    
    spec_chosen = get_spec(test_gem)
    
    assert spec_chosen.eql?(mock_specs_hash(test_gem).values.reverse.first)
  end

  private
  
  def test_gem
    "#{@word_one}_#{@word_two}"
  end
  
  def gemset
    ['', '-', '_'].map { |joiner| "#{@word_one}#{joiner}#{@word_two}" }
  end
  
  def mock_specs_hash(testee)
    @mock_specs_hash ||= gemset.inject({}) do |result, spec_name|
      unless spec_name == testee
        result[spec_name] = stub(
          :name => spec_name,
          :version => stub(:>= => true, :to_s => '0.1'),
          :sort_obj => [spec_name, stub(:>= => true), -1]
        )
      end
      result
    end
  end
end
