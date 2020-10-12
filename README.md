# Live pages

Installation

    $ git clone https://github.com/sergeykish/live-pages.git
    $ sudo pacman -S ruby attr
    $ cd live-pages
    $ bundle install
    $ bundle exec rackup

Open [http://localhost:9292/](http://localhost:9292/).

I store `Content Type` in `xattr`, it is not preserved in git repo so it should be reset

    $ ./setmime text/css live.css

Otherwise modern browsers refuse to apply it.
