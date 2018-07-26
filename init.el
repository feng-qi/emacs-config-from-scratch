(setq package-archives
      '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
	("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)
(setq use-package-always-ensure t)

(use-package try)

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

;; (use-package evil-smartparens
;;   :config
;;   (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))

(use-package evil-unimpaired
  :load-path "elpa/"
  :config (evil-unimpaired-mode))


(blink-cursor-mode 0)
(global-hl-line-mode)
(ido-mode)
(fset 'yes-or-no-p 'y-or-n-p)

;; (defalias 'evil-insert-state 'evil-emacs-state)
(setq evil-insert-state-map (make-sparse-keymap))
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-unimpaired which-key use-package try evil-smartparens))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
