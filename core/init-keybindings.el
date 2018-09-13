(global-set-key (kbd "C-a") #'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") #'mwim-end-of-code-or-line)
(global-set-key (kbd "M-/") #'hippie-expand)
(global-set-key (kbd "M-=") #'count-words-region)
(global-set-key (kbd "M-x") #'helm-M-x)

(fengqi/define-key evil-normal-state-map
                   (kbd "SPC TAB") 'evil-buffer
                   (kbd "SPC '")   'shell-pop
                   (kbd "TAB")     'indent-for-tab-command
                   "+"             'evil-numbers/inc-at-pt
                   "-"             'evil-numbers/dec-at-pt)

(require 'evil)
(require 'evil-leader)
(evil-leader/set-key
  "0"   #'treemacs-select-window
  "1"   #'winum-select-window-1
  "2"   #'winum-select-window-2
  "3"   #'winum-select-window-3
  "4"   #'winum-select-window-4
  "5"   #'winum-select-window-5
  "6"   #'winum-select-window-6
  "7"   #'winum-select-window-7
  "8"   #'maximize-frame
  "9"   #'winum-select-window-9
  ";"   #'evilnc-comment-operator
  "/"   #'helm-do-ag-project-root
  "au"  #'undo-tree-visualize
  "bb"  #'helm-mini
  "bd"  #'kill-buffer
  "br"  #'revert-buffer
  "bs"  #'switch-to-scratch-buffer
  "bv"  #'mark-whole-buffer
  "by"  #'copy-whole-buffer-to-clipboard
  "cc"  #'compile
  "cd"  #'close-compilation-window
  "cr"  #'recompile
  "dw"  #'delete-trailing-whitespace
  "en"  #'next-error
  "ep"  #'previous-error
  "fCr" #'revert-buffer-with-coding-system
  "fCs" #'set-buffer-file-coding-system
  ;; "ff" 'ido-find-file
  "ff"  #'helm-find-files
  "fr"  #'helm-recentf
  "fs"  #'save-buffer
  "ft"  #'treemacs
  "fx"  #'hexl-find-file
  "gs"  #'magit-status
  "iv"  #'rectangle-number-lines
  "nf"  #'narrow-to-defun
  "nr"  #'narrow-to-region
  "oc"  #'fengqi/copy-current-buffer-file-name
  "oy"  #'youdao-dictionary-search-at-point+
  "qq"  #'save-buffers-kill-terminal
  "se"  #'evil-iedit-state/iedit-mode
  "sf"  #'helm-do-ag
  "ss"  #'swiper
  "Ts"  #'load-theme
  "wd"  #'delete-current-window
  "wm"  #'delete-other-windows
  "wo"  #'delete-other-windows
  "ws"  #'evil-window-split
  "wv"  #'evil-window-vsplit
  "ww"  #'evil-window-next)

;; (defalias 'evil-insert-state 'evil-emacs-state)
(setq evil-insert-state-map (make-sparse-keymap))
(define-key evil-insert-state-map
  (kbd "<escape>") 'evil-normal-state)


(provide 'init-keybindings)
