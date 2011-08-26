(let ((rbenv-bin   (format "%s/.rbenv/bin"   (getenv "HOME")))
      (rbenv-shims (format "%s/.rbenv/shims" (getenv "HOME"))))
  
  (setq exec-path  (cons rbenv-bin (cons rbenv-shims exec-path)))

  (setenv "PATH" (format "%s:%s:%s"
                         rbenv-bin
                         rbenv-shims
                         (getenv "PATH"))))
