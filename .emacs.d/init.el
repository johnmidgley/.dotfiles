(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("tromey" . "http://tromey.com/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(load "~/.emacs.d/user.el")

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(setq cider-show-error-buffer nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1fcf7b5d771fe826f05d53ba00b2237feda4b76c709095cab97e6e499f6e24d9" "52b2f7c8daf60ab1dcf87422ea0173964f2fa851bc801caaf668210c575e4765" "a171aa571be73689952e7bc1cb12184f55ecfb015c0c577a28e6f6d2b2c49f88" "23b85026ec3dfa3b1c4e170b83b1e9f4e7828c44f1f32fb427d5252e66e60b7b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
