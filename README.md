# Cutehax0r Tap

## How do I install these formulae?

`brew install cutehax0r/tap/<formula>`

Or `brew tap cutehax0r/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "cutehax0r/tap"
brew "<formula>"
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

# Wishlist

Build a makefile to help with maintenance.

* `release-all` - builds latest version of all taps

* `release FOO` - updates a particular project

* `unrelease FOO` - deletes the most recent release of `foo` and makes the previous version current

* `unrelease FOO VERSION` - deletes a specific version of foo (rolling back head if required

* `lint` - `brew test-bot --only-tap-syntax --tap=cutehax0r/tap` - checks for syntax issues. Also
  `brew style`

* `test` - some kind of docker/container/emu "test that it installs on a clean system" test

* `test FOO` - test a specific formula only

* `test FOO version` - test a specific formula version only

* `deploy` - Take all the local changes and make them public `git push`
