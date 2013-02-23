; Note - to completely unisntall Aquamacs, so as to start fresh, do the following:
; rm -rf /Applications/Aquamacs.app/
; rm -rf ~/Library/Preferences/Aquamacs\ Emacs/
; rm -rf ~/Library/Application\ Support/Aquamacs\ Emacs/

; Package Support

; Packages to auto-install
(setq package-list '(clojure-mode nrepl))

(add-to-list 'load-path "~/.emacs.d/packages/")
(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/")) 
(package-initialize)

; fetch the list of packages available 
(when (not package-archive-contents)
  (package-refresh-contents))

; install any missing packages
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))

(add-to-list 'load-path "~/.dotfiles/solarized/emacs")
(require 'color-theme-solarized)

(eval-after-load "color-theme"
  '(progn
     (color-theme-solarized-dark)))

; Slime extension for sending s-expr to REPL
(defun slime-send-dwim (arg)
  "Send the appropriate forms to CL to be evaluated."
  (interactive "P")
  (save-excursion
    (cond
      ;;Region selected - evaluate region
      ((not (equal mark-active nil))
       (copy-region-as-kill (mark) (point)))
      ;; At/before sexp - evaluate next sexp
      ((or (looking-at "(")
           (save-excursion
             (ignore-errors (forward-char 1))
             (looking-at "(")))
       (forward-list 1)
       (let ((end (point))
             (beg (save-excursion
                    (backward-list 1)
                    (point))))
         (copy-region-as-kill beg end)))
      ;; At/after sexp - evaluate last sexp
      ((or (looking-at ")")
           (save-excursion
             (backward-char 1)
             (looking-at ")")))
       (if (looking-at ")")
           (forward-char 1))
       (let ((end (point))
             (beg (save-excursion
                    (backward-list 1)
                    (point))))
         (copy-region-as-kill beg end)))
      ;; Default - evaluate enclosing top-level sexp
      (t (progn
           (while (ignore-errors (progn
                                   (backward-up-list)
                                   t)))
           (forward-list 1)
           (let ((end (point))
                 (beg (save-excursion
                        (backward-list 1)
                        (point))))
             (copy-region-as-kill beg end)))))
    (set-buffer (slime-output-buffer))
    (unless (eq (current-buffer) (window-buffer))
      (pop-to-buffer (current-buffer) t))
    (goto-char (point-max))
    (yank)
    (if arg (progn
              (slime-repl-return)
              (other-window 1)))))

(add-hook 'slime-connected-hook (lambda ()
  (define-key slime-mode-map (kbd "C-c s") 'slime-send-dwim)))


