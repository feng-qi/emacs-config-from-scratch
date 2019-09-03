;; This file contains the packages information.

(setq use-package-always-ensure t)


(defun fengqi/setup-helm-find-files-key-bindings ()
  (define-key helm-find-files-map (kbd "C-h") #'helm-find-files-up-one-level)
  (define-key helm-find-files-map (kbd "C-l") #'helm-execute-persistent-action))
(use-package helm
  :config
  (add-hook 'helm-find-files-after-init-hook #'fengqi/setup-helm-find-files-key-bindings)
  (define-key helm-map (kbd "<escape>")      #'helm-keyboard-quit)
  (define-key helm-map (kbd "C-j")           #'helm-next-line)
  (define-key helm-map (kbd "C-k")           #'helm-previous-line)
  (helm-mode 1))
(use-package helm-ag
  :after helm)

(use-package evil
  :config
  (evil-mode t)
  (setq evil-normal-state-cursor   '("DarkGoldenrod2" box)
        evil-insert-state-cursor   '("chartreuse3" (bar . 2))
        evil-visual-state-cursor   '("gray" (hbar . 2))
        evil-motion-state-cursor   '("plum3" box)
        evil-replace-state-cursor  '("chocolate" (hbar . 2))
        evil-operator-state-cursor 'evil-half-cursor))
(use-package evil-magit
  :after magit)
(use-package evil-exchange
  :after evil
  :config
  ;; (setq evil-exchange-key (kbd "gx"))
  (evil-exchange-install))
(use-package evil-iedit-state
  :after evil)
(use-package evil-nerd-commenter
  :after evil)
(use-package evil-numbers
  :after evil)
(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1)
  (define-key evil-visual-state-map (kbd "s") 'evil-surround-region)
  (define-key evil-visual-state-map (kbd "S") 'evil-change-whole-line))
(use-package evil-leader
  :after evil
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")))
(use-package evil-unimpaired
  :after evil
  :load-path "elpa/"
  :config (evil-unimpaired-mode))
(use-package evil-visualstar
  :after evil
  :config
  (global-evil-visualstar-mode t))
(use-package treemacs-evil
  :after (treemacs evil))


(use-package magit
  :defer t)
;; (use-package ivy
;;   :config
;;   (ivy-mode)
;;   (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
;;   (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line))
(use-package counsel
  :defer t)
  ;; :config
  ;; (counsel-mode))
(use-package swiper
  :defer t)
  ;; :config
  ;; (define-key swiper-all-map (kbd "<escape>") #'keyboard-quit))


(use-package try
  :defer t)
(use-package which-key
  :defer t
  :config
  (which-key-mode))
(use-package smartparens
  :config
  (smartparens-global-mode)
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "`" nil :actions nil))
(use-package org-bullets
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; (use-package solarized-theme
;;   :defer t)
(use-package zenburn-theme)
(use-package winum
  :config (winum-mode))
(use-package mwim)
(use-package yasnippet
  :defer t
  :config
  (yas-global-mode 1)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (add-to-list 'hippie-expand-try-functions-list 'yas-hippie-try-expand))
(use-package yasnippet-snippets
  :defer t)
;; (use-package persp-mode
;;   :defer t
;;   :config
;;   (with-eval-after-load "persp-mode"
;;     (setq wg-morph-on nil)
;;     (setq persp-autokill-buffer-on-remove 'kill-weak)
;;     (add-hook 'after-init-hook #'(lambda () (persp-mode 1)))))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.3)
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)
  (define-key company-search-map (kbd "C-j") 'company-select-next)
  (define-key company-search-map (kbd "C-k") 'company-select-previous))

(use-package company-c-headers
  :after company
  :config
  (add-to-list 'company-backends 'company-c-headers))

(use-package shell-pop
  :config
  (setq shell-pop-shell-type '("ansi-term" "*ansi-term*" (lambda () (ansi-term shell-pop-term-shell)))
        shell-pop-term-shell      "/usr/bin/zsh"
        shell-pop-window-height   20
        shell-pop-window-position "bottom"
        shell-pop-full-span       t)
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

(use-package htmlize)
(use-package youdao-dictionary)
(use-package chinese-wbim
  :config
  (register-input-method
   "chinese-wbim" "euc-cn" 'chinese-wbim-use-package "五笔" "汉字五笔输入法" "wb.txt")
  (setq default-input-method "chinese-wbim"))

;; (use-package evil-smartparens
;;   :config
;;   (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

(use-package haskell-mode
  :mode "\\.l?hs\\'"
  :config
  (add-hook 'haskell-mode-hook 'my-haskell-mode-config))

(use-package treemacs
  :defer t)


;; ------------ UI -----------------

;; (use-package smart-mode-line
;;   :config
;;   (setq sml/theme 'respectful
;;         sml/no-confirm-load-theme t)
;;   (sml/setup))

(use-package doom-modeline
  :defer t
  :config (setq doom-modeline-height 20)
  :hook (after-init . doom-modeline-init))


(provide 'init-packages)
