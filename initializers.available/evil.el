(add-to-list 'load-path "~/.emacs.d/vendor/evil")
(add-to-list 'load-path "~/.emacs.d/vendor/evil-surround")
(require 'evil)
(require 'surround)
(evil-mode 1)
(global-surround-mode 1)

(global-set-key (kbd "s-j") 'evil-normal-state)

(define-key evil-insert-state-map "\C-y" nil)
(define-key evil-insert-state-map "\C-e" nil)
(define-key evil-insert-state-map "\C-k" nil)
(define-key evil-motion-state-map "\C-i" nil)
(define-key evil-normal-state-map (kbd "M-.") nil)
(define-key evil-normal-state-map (kbd "M-.") nil)

(global-set-key (kbd "C-]") 'evil-find-char)
(global-set-key (kbd "C-M-]") 'evil-find-char-backward)
