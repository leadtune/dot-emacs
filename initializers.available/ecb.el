(add-to-list 'load-path "~/.emacs.d/vendor/ecb")
;; (add-to-list 'load-path "~/.emacs.d/vendor/cedet/common")

(defun ecb-load-and-activate ()
  "autoload ECB and run it"
  (interactive)
  (require 'ecb-autoloads)
  ;; (require 'cedet)
  (ecb-activate))

(global-set-key (kbd "C-c . a") 'ecb-load-and-activate)
(global-set-key (kbd "C-c . d") 'ecb-deactivate)

;; (ecb-excluded-directories-regexps (quote ("^\\(CVS\\|.git\\)$")))
;; (ecb-layout-name "left7")
;; (ecb-options-version "2.40")
;; (ecb-source-path (quote ((#("/" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) #("/" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu"))) ("/Users/timcharper/LMP/lt-uber/appraiser/src" "appraiser"))))
;; (ecb-tip-of-the-day nil)
;; (ecb-windows-width 40)
