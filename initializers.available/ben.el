(add-hook 'slime-repl-mode-hook 'viper-mode)
(add-hook 'slime-repl-mode-hook 'paredit-mode)

;; gracias a http://www.emacswiki.org/emacs/DeletingWhitespace#toc3
(add-hook 'before-save-hook 'delete-trailing-whitespace)
