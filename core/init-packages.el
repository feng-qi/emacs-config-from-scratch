(setq use-package-always-ensure t)

(use-package try)
(use-package magit)
(use-package evil-magit)
(use-package which-key
  :config
  (which-key-mode))
(use-package smartparens
  :config
  (smartparens-global-mode)
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "`" nil :actions nil))
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

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
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

(use-package swiper)
(use-package haskell-mode)

;; (use-package evil-smartparens
;;   :config
;;   (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))


(provide 'init-packages)
