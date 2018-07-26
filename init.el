(setq package-archives
      '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
	("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq use-package-always-ensure t)
(setq-default tab-width      4
	      fill-column    80
	      truncate-lines t
	      c-basic-offset 4)
(fset 'yes-or-no-p 'y-or-n-p)

(blink-cursor-mode 0)
(global-hl-line-mode)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
;; (ido-mode)

(use-package try)
(use-package magit)
(use-package which-key
  :config
  (which-key-mode))
(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode))
(use-package evil
  :config
  (evil-mode t))
(use-package evil-unimpaired
  :load-path "elpa/"
  :config (evil-unimpaired-mode))
(use-package evil-iedit-state)
(use-package evil-nerd-commenter)
(use-package evil-numbers)
(use-package evil-surround
  :config
  (global-evil-surround-mode 1))
(use-package evil-leader
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")))

(defun close-compilation-window ()
  "Close the window containing the '*compilation*' buffer."
  (interactive)
  (when compilation-last-buffer
    (delete-windows-on compilation-last-buffer)))

(defun delete-current-window (&optional arg)
  "Delete the current window.
If the universal prefix argument is used then kill the buffer too."
  (interactive "P")
  (if (equal '(4) arg)
      (kill-buffer-and-window)
    (delete-window)))

(recentf-mode)
(define-key evil-normal-state-map (kbd "SPC TAB") 'evil-buffer)
(define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
(define-key evil-normal-state-map (kbd "s") 'evil-surround-region)
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
  "bd"  'kill-buffer
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
  "nf"  'narrow-to-defun
  "nr"  'narrow-to-region
  "qq"  'save-buffers-kill-terminal
  "Ts"  'load-theme
  "wd"  'delete-current-window
  "wm"  'delete-other-windows
  "wo"  'delete-other-windows)

;; (use-package evil-smartparens
;;   :config
;;   (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))


;; (defalias 'evil-insert-state 'evil-emacs-state)
(setq evil-insert-state-map (make-sparse-keymap))
(define-key evil-insert-state-map
  (kbd "<escape>") 'evil-normal-state)


(use-package solarized-theme)
(use-package zenburn-theme)
(use-package winum
  :config (winum-mode))
(use-package ivy
  :config
  (ivy-mode))
(use-package counsel
  :config
  (counsel-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
	(magit evil-surround evil-numbers winum counsel ivy zenburn-theme solarized-theme evil-nerd-commenter evil-iedit-state evil-leader evil-unimpaired which-key use-package try evil-smartparens))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
