(add-to-list 'load-path "~/.emacs.d/vendor/ess/")
(add-to-list 'load-path "~/.emacs.d/vendor/ess/lisp")

(autoload 'R-mode "ess-site" "" t nil)
;;(autoload 'R-mode "ess-rutils" "" t nil)
;;(autoload 'R-mode "ess-eldoc" "" t nil)

(autoload 'R "ess-site" "" t nil)
;;(autoload 'R "ess-rutils" "" t nil)
;;(autoload 'R "ess-eldoc" "" t nil)

(load-file "~/.emacs.d/vendor/ess/lisp/ess-site.el")

(autoload 'ess-rdired "ess-rdired"
  "View *R* objects in a dired-like buffer." t)

;;http://stackoverflow.com/questions/3164996/emacs-ess-r-how-did-i-do-this
;; Show function argument completion while editing R code and interacting with
;; an inferior R process
(define-key ess-mode-map [f2] 'ess-r-args-show)
(define-key ess-mode-map [f3] 'ess-r-args-insert)
(define-key inferior-ess-mode-map [f2] 'ess-r-args-show)
(define-key inferior-ess-mode-map [f3] 'ess-r-args-insert)

;; https://stat.ethz.ch/pipermail/ess-help/2009-February/005158.html
(setq ess-eval-visibly-p nil)

;; fix retarded, non-standard, horrible keyboard bindings
(define-key ess-mode-map "_" nil)
(define-key ess-mode-map (kbd "M-TAB") 'ess-R-complete-object-name)
(define-key ess-mode-map (kbd "C-c TAB") nil)
(define-key inferior-ess-mode-map "_" nil)


;; http://stackoverflow.com/questions/2891136/asking-ess-r-users-for-suggestions-for-elisp-codes-in-emacs-file
;; http://www.kieranhealy.org/blog/archives/2009/10/12/make-shift-enter-do-a-lot-in-ess/
;; Use shift-enter to split window & launch R (if not running), execute highlighted
;; region (if R running & area highlighted), or execute current line
;; (and move to next line, skipping comments). Nice. 
;; See http://www.emacswiki.org/emacs/EmacsSpeaksStatistics,
;; FelipeCsaszar. Adapted to spilit vertically instead of
;; horizontally. 

(setq ess-ask-for-ess-directory nil)
(setq ess-local-process-name "R")
  (setq ansi-color-for-comint-mode 'filter)
  (setq comint-prompt-read-only t)
  (setq comint-scroll-to-bottom-on-input t)
  (setq comint-scroll-to-bottom-on-output t)
  (setq comint-move-point-for-output t)
  (defun my-ess-start-R ()
    (interactive)
    (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
      (progn
    (delete-other-windows)
    (setq w1 (selected-window))
    (setq w1name (buffer-name))
    (setq w2 (split-window w1 nil t))
    (R)
    (set-window-buffer w2 "*R*")
    (set-window-buffer w1 w1name))))
  (defun my-ess-eval ()
    (interactive)
    (my-ess-start-R)
    (if (and transient-mark-mode mark-active)
    (call-interactively 'ess-eval-region)
      (call-interactively 'ess-eval-line-and-step)))
  (add-hook 'ess-mode-hook
        '(lambda()
           (local-set-key [(shift return)] 'my-ess-eval)))
  (add-hook 'inferior-ess-mode-hook
        '(lambda()
           (local-set-key [C-up] 'comint-previous-input)
           (local-set-key [C-down] 'comint-next-input)))


(require 'ess-site)


(require 'ess-rutils)
(require 'ess-eldoc)


(add-hook 'inferior-ess-mode-hook 'ess-use-eldoc)
