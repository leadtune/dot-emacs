(ensure-packages-installed
  '(elisp-slime-nav ;; remove once we can add starter-kit back in...
    ;; starter-kit-lisp ;; comment in once new starter-kit has been pushed to marmalade
       clojure-mode midje-mode clojure-test-mode slime
          highlight-parentheses))

(require 'starter-kit-lisp)
(require 'highlight-parentheses)

(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)
(add-hook 'slime-repl-mode-hook 'highlight-parentheses-mode)

(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)
