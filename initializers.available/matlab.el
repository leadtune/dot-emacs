(add-to-list 'load-path "~/.emacs.d/vendor/matlab-emacs")
(load-library "matlab-load")
;; TODO: turn on auto-complete-mode and lin-num-mode...
;; TODO: find out why the below doesn't work.. the hook is never added!
(add-hook 'matlab-mode
          '(lambda()
             (local-set-key [(shift return)] 'matlab-shell-run-region-or-line)))
