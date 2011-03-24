(require 'scheme)
(define-key scheme-mode-map (kbd "C-c x") 'run-mzscheme-file)

;; run mzscheme
(defun run-mzscheme-file (&optional file)
  "Run the current file in mzscheme."
  (interactive)
  (save-buffer)
  (shell-command
   (format "%s -lt errortrace %s" quack-default-program buffer-file-name)))

;; open in dr scheme
(defun dr-scheme (&optional file)
  " file in mzscheme."
  (interactive)
  (save-buffer)
  (shell-command
   (format "/Applications/PLT\\ Scheme\\ v4.2.1/DrScheme.app/Contents/MacOS/DrScheme \"%s\"" buffer-file-name)))
