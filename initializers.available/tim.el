;; complete filename
(global-set-key "\M-\\" 'comint-dynamic-complete-filename)

;; (global-set-key (kbd "s-;") 'dabbrev-expand)
(global-set-key (kbd "s-b") 'switch-to-buffer)

(defun yank-location-with-filenum ()
  (interactive)
  "Yank (to clipboard) the current location, in /path/to/file:line format"
  (let* ((root (textmate-project-root))
         (filename (buffer-file-name))
         (local-filename (if root
                             (replace-regexp-in-string (format "^%s" (regexp-quote root)) "./" filename)
                           filename))
         (location (format "%s:%d"
                           local-filename
                           (line-number-at-pos))))
    (message "%s" location)
    (kill-new location)))


(defun open-emacs-d ()
  (interactive)
  (let ((*textmate-project-root* "/Users/timcharper/.emacs.d/"))
    (textmate-goto-file)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;
;; Increment decimal a number under the point
;; doesn't exactly work with negative numbers.
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;
;; Decrement decimal a number under the point
;; doesn't exactly work with negative numbers.
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;;;;;;;;;;;;;;;;;;;
(defun decrement-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1- (string-to-number (match-string 0))))))

(global-set-key (kbd "C-c +") 'increment-number-at-point)
(global-set-key (kbd "C-c -") 'decrement-number-at-point)
