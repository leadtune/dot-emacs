;; complete filename
(global-set-key "\M-\\" 'comint-dynamic-complete-filename)

;; (global-set-key (kbd "s-;") 'dabbrev-expand)
(global-set-key (kbd "s-b") 'switch-to-buffer)

(defun tim/path (&optional root)
  (let* ((root (or root (textmate-project-root)))
         (filename (buffer-file-name))
         (local-filename (if root
                             (replace-regexp-in-string (format "^%s" (regexp-quote root)) "./" filename)
                           filename)))
    (message "%s" local-filename)))

(defun tim/path-with-line (&optional root)
  (message "%s" (format "%s:%d"
                        (tim/path root)
                        (line-number-at-pos))))

(defun yank-path-with-line ()
  (interactive)
  "Yank (to clipboard) the current location, in /path/to/file:line format"
  (let ((location (tim/path-with-line)))
    (message "%s" location)
    (kill-new location)))

(defun rspec-yank-command ()
  (interactive)
  (let* ((root (or (rspec-project-root) (textmate-project-root)))
         (command (format "cd %S; be rspec %s" root (tim/path-with-line root))))
    (message "%s" command)
    (kill-new command)))


(defun cuc-yank-command ()
  (interactive)
  (let ((command (format "cd %S; be cucumber %s" (textmate-project-root) (tim/path-with-line))))
    (message "%s" command)
    (kill-new command)))

(eval-after-load 'rspec-mode
  '(define-key
     rspec-mode-keymap
     (kbd "<C-s-pause>") ;; Control-command-r ... lame how emacs gets these remapped like this
     'rspec-yank-command))

(eval-after-load 'feature-mode
  '(define-key
     feature-mode-map
     (kbd "<C-s-pause>") ;; Control-command-r ... lame how emacs gets these remapped like this
     'cuc-yank-command))


(defun open-emacs-d ()
  (interactive)
  (let ((*textmate-project-root* "/Users/timcharper/.emacs.d/"))
    (textmate-goto-file)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Increment decimal a number under / before the point
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun increment-number-at-point (arg)
  (interactive "p")
    (interactive "p")
  "Modify number at point by arg"
  (skip-chars-backward "0123456789")
  (skip-chars-backward "-")
  (or (looking-at "-?[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (+ (string-to-number (match-string 0)) (or arg 1)))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Decrement decimal a number under / before the point
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun decrement-number-at-point (arg)
  (interactive "p")
  (increment-number-at-point (* -1 arg)))

(global-set-key (kbd "C-c +") 'increment-number-at-point)
(global-set-key (kbd "C-c -") 'decrement-number-at-point)

(defun dired-create-file (file)
  "Create an empty file called FILE."
  (interactive
   (list (read-file-name "Touch file: " (dired-current-directory))))
  (let ((expanded (expand-file-name file)))
    (message "%s" (shell-command-to-string (format "%s %S" dired-touch-program expanded)))
    (dired-add-file expanded)
    (dired-move-to-filename)))

(eval-after-load 'dired
  '(define-key dired-mode-map (kbd "F") 'dired-create-file))

(defun yank-annotated ()
  "Yanks the region, puts a filename and line numbers. Lots of fun"
  (interactive)
  (let* ((start-pos (save-excursion (goto-char (region-beginning))
                                    (beginning-of-line)
                                    (point)))
         (end-pos (save-excursion (goto-char (region-end))
                                  (end-of-line)
                                  (point)))
         (start-line (line-number-at-pos (region-beginning)))
         (content (buffer-substring start-pos end-pos))
         (filename buffer-file-name)
         (r (with-temp-buffer
               (insert content)
               (newline)
               (while (line-move -1 t)
                 (beginning-of-line)
                 (insert (format "%4d | " (+ (line-number-at-pos) start-line -1))))

               (goto-char (point-min))
               (insert filename)
               (newline)
               (newline)
               (buffer-string))))
    ;; (message "%s %s %d %d %d" filename content start-pos end-pos start-line)
    (message "%s" r)
    (kill-new r)
    (deactivate-mark)))
