# Microblogging sample application

This is a sample application that emulates Twitter and Mastodon, done
following the steps detailed in [*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Environment setup/Getting started

First clone the repo and install the needed gems:
#+BEGIN_SRC sh
$ bundle install --without production
#+END_SRC

Next step, migrate the database:
#+BEGIN_SRC sh
$ rails db:migrate
#+END_SRC

Finally, run the test suite to check if everything is working as intended:
#+BEGIN_SRC sh
$ rails test
#+END_SRC

If all tests are passing, you're ready to run the app in the local server:
#+BEGIN_SRC sh
$ rails server
#+END_SRC

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).
