(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa". "https://melpa.org/packages/")))
;;       '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)
(prefer-coding-system 'utf-8)

(add-to-list 'load-path "~/.emacs.d/core")
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

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

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'c++-mode-hook        'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)

(electric-pair-mode t)
(column-number-mode 1)
(blink-cursor-mode 0)
(global-hl-line-mode)
(setq-default show-trailing-whitespace t)

(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq sentence-end-double-space nil)

(setq scroll-step 1)
(setq scroll-conservatively 101)
(setq auto-window-vscroll nil)
(setq c-default-style "k&r"
      default-tab-width 4)

(with-eval-after-load "org"
;; (org-toggle-inline-images)
  (setq org-export-with-section-numbers  nil
        org-export-with-sub-superscripts nil
        org-export-with-toc              nil
        org-html-include-timestamps      nil
        org-startup-with-inline-images   t))

;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode)


;; See https://github.com/joaotavora/yasnippet/issues/785#issuecomment-285437447
(defvar smartparens-mode-original-value)

(defun disable-sp-hippie-advice (&rest _)
  (setq smartparens-mode-original-value smartparens-mode)
  (setq smartparens-mode nil)
  t) ; We should still return t.
;; This advice could be added to other functions that usually insert
;; balanced parens, like `try-expand-list'.
(advice-add 'yas-hippie-try-expand :after-while #'disable-sp-hippie-advice)

(defun reenable-sp-hippie-advice (&rest _)
  (when (boundp 'smartparens-mode-original-value)
    (setq smartparens-mode smartparens-mode-original-value)
    (makunbound 'smartparens-mode-original-value)))
(advice-add 'hippie-expand :after #'reenable-sp-hippie-advice
            ;; Set negative depth to make sure we go after
            ;; `sp-auto-complete-advice'.
            '((depth . -100)))


(require 'init-packages)
(require 'init-functions)
(require 'init-keybindings)

(setq custom-file (expand-file-name "customize-group-setup.el" user-emacs-directory))
(load custom-file 'no-error 'no-message)
(put 'narrow-to-region 'disabled nil)
