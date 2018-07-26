(setq package-archives
      '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
        ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/core")

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq-default tab-width        4
              fill-column      80
              truncate-lines   t
              c-basic-offset   4
              indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'org-mode-hook (lambda () (progn
                                      (setq show-trailing-whitespace t)
                                      (turn-on-auto-fill))))

(blink-cursor-mode 0)
(global-hl-line-mode)
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq scroll-step 1)
(setq scroll-conservatively 101)
(setq auto-window-vscroll nil)

;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode)

(require 'init-packages)
(require 'init-functions)
(require 'init-keybindings)


(setq custom-file (expand-file-name "customize-group-setup.el" user-emacs-directory))
(load custom-file 'no-error 'no-message)
