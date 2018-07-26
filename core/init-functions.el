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

(provide 'init-functions)
