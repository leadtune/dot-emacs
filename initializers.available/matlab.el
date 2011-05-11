(add-to-list 'load-path "~/.emacs.d/vendor/matlab-emacs")
(load-library "matlab-load")

(add-hook 'matlab-mode
          '(lambda()
             (local-set-key [(shift return)] 'matlab-shell-run-region-or-line)))
