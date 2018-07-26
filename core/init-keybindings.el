(recentf-mode)
(define-key evil-normal-state-map (kbd "SPC TAB") 'evil-buffer)
(define-key evil-normal-state-map (kbd "SPC '") (lambda () (interactive) (ansi-term "/usr/bin/zsh")))
(define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
(define-key evil-normal-state-map (kbd "s") 'evil-surround-region)

(require 'evil)
(require 'evil-leader)
(evil-leader/set-key
  "1"   'winum-select-window-1
  "2"   'winum-select-window-2
  "3"   'winum-select-window-3
  "4"   'winum-select-window-4
  "5"   'winum-select-window-5
  "6"   'winum-select-window-6
  "7"   'winum-select-window-7
  "8"   'winum-select-window-8
  "9"   'winum-select-window-9
  ";"   'evilnc-comment-operator
  ;; "ff" 'ido-find-file
  "bb"  'ivy-switch-buffer
  "bd"  'kill-buffer
  "bs"  'switch-to-scratch-buffer
  "bv"  'mark-whole-buffer
  "by"  'copy-whole-buffer-to-clipboard
  "cc"  'compile
  "cd"  'close-compilation-window
  "cr"  'recompile
  "fCr" 'revert-buffer-with-coding-system
  "fCs" 'set-buffer-file-coding-system
  "ff"  'counsel-find-file
  "fr"  'recentf-open-files
  "fs"  'save-buffer
  "gs"  'magit-status
  "iv"  'rectangle-number-lines
  "se"  'evil-iedit-state/iedit-mode
  "ss"  'swiper
  "nf"  'narrow-to-defun
  "nr"  'narrow-to-region
  "qq"  'save-buffers-kill-terminal
  "Ts"  'load-theme
  "wd"  'delete-current-window
  "wm"  'delete-other-windows
  "wo"  'delete-other-windows)

;; (defalias 'evil-insert-state 'evil-emacs-state)
(setq evil-insert-state-map (make-sparse-keymap))
(define-key evil-insert-state-map
  (kbd "<escape>") 'evil-normal-state)


(provide 'init-keybindings)
