(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'load-path "~/.dotfiles/solarized/emacs")

(require 'package) (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) (package-initialize)

(require 'color-theme-solarized)
(eval-after-load "color-theme"
  '(progn
     (color-theme-solarized-dark)))

