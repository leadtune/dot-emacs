(add-to-list 'load-path "~/.emacs.d/vendor/midje-mode/")
(autoload 'midje-mode "midje-mode" nil t)
(add-hook 'clojure-mode-hook 'midje-mode)
