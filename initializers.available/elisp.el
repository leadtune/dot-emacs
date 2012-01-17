(ensure-packages-installed
  '(elisp-slime-nav ;; remove once we can add starter-kit back in...
    ;; starter-kit-lisp ;; comment in once new starter-kit has been pushed to marmalade
          highlight-parentheses))

(require 'starter-kit-lisp)
(require 'highlight-parentheses)

(add-hook 'emacs-lisp-mode-hook (lambda () (highlight-parentheses-mode)))
