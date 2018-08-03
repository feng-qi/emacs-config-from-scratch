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

(defun switch-to-scratch-buffer ()
  "Switch to the `*scratch*' buffer. Create it first if needed."
  (interactive)
  (let ((exists (get-buffer "*scratch*")))
    (switch-to-buffer (get-buffer-create "*scratch*"))))

(defun switch-to-ansi-term-buffer ()
  "Switch to the `*ansi-term*' buffer. Create it first if needed."
  (interactive)
  (let ((exists (get-buffer "*ansi-term*")))
    (if exists
        (switch-to-buffer (get-buffer "*ansi-term*"))
      (ansi-term "/usr/bin/zsh"))))

(defun copy-whole-buffer-to-clipboard ()
  "Copy entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max)))

(defun fengqi/define-key (keymap &rest bindings)
  (while bindings
    (define-key keymap (pop bindings) (pop bindings))))

(defun fengqi/copy-current-buffer-file-name ()
  "Copy current current buffer file name to clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Buffer file name '%s' copied." filename))))

(defun my-haskell-mode-config ()
  (evil-local-set-key 'normal (kbd ", '") 'haskell-interactive-bring))


(provide 'init-functions)
