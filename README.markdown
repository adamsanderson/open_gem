OpenGem
========

Simply opens the specified gem in your default editor.
  
  gem open rails
  
If you just want to read documentation you can do:

  gem read activerecord
  
Installation:
------------
OpenGem require rubygems 1.3.2 or higher.  You may need
to update rubygems to take advantage of the new plugin support:

    gem update --system

Just install like any normal gem:

    gem install open_gem

Or for the edge version use GemCutter.org:
    
    gem sources -a http://gemcutter.org
    gem install open_gem

For more help: 

    gem open --help
  
Adam Sanderson, netghost@gmail.com