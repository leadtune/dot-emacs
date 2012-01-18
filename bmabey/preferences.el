(ensure-packages-installed
 '(
color-theme-cobalt
ace-jump-mode
))

;;(require 'color-theme-blackboard)
(require 'color-theme)
(require 'color-theme-cobalt)
(color-theme-cobalt)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(blink-cursor-mode t)

(setq evil-emacs-state-cursor '("white" box))
(setq evil-insert-state-cursor '("dark orange" bar))
(setq evil-visual-state-cursor '("black" hollow))

(require 'linum)
(global-linum-mode)


;; yes, I like paredit on in my REPL
(add-hook 'slime-repl-mode-hook 'paredit-mode)
