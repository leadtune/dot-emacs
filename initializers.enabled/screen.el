(defun yank-screen-exchange ()
  (interactive)
  (let ((contents (with-temp-buffer
                    (insert-file-contents "/tmp/screen-exchange")
                    (buffer-string))))
    (insert contents)))

(global-set-key (kbd "C-c <") 'yank-screen-exchange)
