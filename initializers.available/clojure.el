(ensure-packages-installed
  '(starter-kit starter-kit-lisp
       clojure-mode midje-mode clojure-test-mode slime
          highlight-parentheses))

(require 'highlight-parentheses)
(require 'starter-kit-lisp)

(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)
(add-hook 'slime-repl-mode-hook 'highlight-parentheses-mode)

;; not really clojure... should move..
(add-hook 'emacs-lisp-mode-hook (lambda () (highlight-parentheses-mode)))

(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)
