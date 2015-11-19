# Aftermath's Convenience Store

These are a collection of dotfiles and little things such as a maintainence
script or setting up rails with rspec that make my life a bit easier.

## To Install Dotfiles
``` git clone repository ```
  
``` ruby install.rb ```

The script will move your existing dotfiles into a folder called old_dotfiles in
your home directory.

## To Use rails_rspec
From project root run

```ruby rails_rspec```

If you write Rails apps and use rpsec there is a small ruby script that will do
the initial setting up for you.
It will install and set up basics like rspec, capybara, poltergeist, factory girl
and database cleaner.

## To Install Powerline
uncomment powerline at end of install.rb

Powerline is not in use currently as it has a bug where if tmux is opened for a few
hours, exiting tmux would cause a system wide freeze.

## To use Brewfile or Cleanup
```sh filename ```

Brewfile will install cask and various other apps I find to be useful. Cleanup will
clean up brew, npm, pip, bower and gems whilst also updating components.

## Inspirations:
 * Thoughtbot
 * r00k
 * Christ Toomey
 * and others at https://dotfiles.github.io/
