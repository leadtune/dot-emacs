(add-hook 'latex-mode-hook
          (lambda ()
            (define-key latex-mode-map (kbd "C-c x") 'tex-build-and-preview))
          )

;;(define-key TeX-mode-map (kbd "C-c x") 'tex-build-and-preview)

(setq pdflatex "/usr/local/texlive/2008basic/bin/universal-darwin/pdflatex")

(defun tex-build-and-preview (&optional file)
  (interactive)
  (save-buffer)
  (shell-command (format "mkdir -p /tmp/pdflatex; %s -output-directory=/tmp/pdflatex %s && open /tmp/pdflatex/%s" pdflatex buffer-file-name (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".pdf")))
  )



(defun gsub (search-string replace string &optional regexp-flag)
  "Like Ruby gsub."
  (with-temp-buffer
    (insert string)
    (goto-char (point-min))
    (let ((search-function (if regexp-flag 're-search-forward 'search-forward)))
      (while (funcall search-function search-string nil t)
        (replace-match replace))
      (buffer-string))))

(defun yas/latex/trow-pieces ()
  (save-excursion
    (let (
          count
          result
          (string "tabular *} *{ *")
          )
      (search-backward-regexp string)
      (search-forward-regexp string)
      (setq p1 (point))
      (search-forward-regexp " }")
      (backward-char)
      (let (
            (count (length (gsub "[^clr]" "" (buffer-substring p1 (point)) t)))
            (pieces '())
            )
        (dotimes (number count pieces)
          (setq pieces (append pieces (list "${contents}"))))
        (mapconcat 'identity pieces " & ")
        )
      )
    )
  )
