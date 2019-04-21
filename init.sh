## Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Git
git config --global user.name "John Midgley"
git config --global user.email john.midgley@gmail.com
git config --global core.editor "emacs"
git config --global push.default simple

## Setup Keys (https://help.github	.com/articles/generating-ssh-keys)
ssh-keygen -t rsa -C "john.midgley@gmail.com"
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
# Paste into github admin https://github.com/settings/ssh
ssh -T git@github.com # Test connection
git clone git@github.com:johnmidgley/.dotfiles.git ~/.dotfiles

## Link to bin
ln -s ~/.dotfiles/bin ~
# cp tmpp from Google Drive/install

## Fish
brew install fish
fish # Run to create ~/.config/fish
ln -s ~/.dotfiles/config.fish ~/.config/fish/config.fish

## iTerm
# Install from https://iterm2.com/
# Point to ~/.dotfiles/iterm in preferences 

## Emacs
# Best to just follow: https://github.com/flyingmachine/emacs-for-clojure/
# Most recent emacs can be Installed from Google Drive/install/Emacs-26.2-universal.dmg
# Base .emacs.d  in Google Drive/install/emacs-for-clojure-book1.zip
ln -s ~/.dotfiles/.emacs.d/ ~/.emacs.d

## Clojure 
brew install leiningen
brew install rlwrap
ln -s ~/.dotfiles/.lein ~/.lein

## Sublime
# Install from http://www.sublimetext.com/3
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
# Install package manager from "Tools" menu
# - BracketHighlighter
# - ClojureDocSearch
# - Enhance Clojure
# - Indent XML
# - lispindent
# - paredit



