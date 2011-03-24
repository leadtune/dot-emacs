;;; ==================================================================
;;; Author: Jim Weirich
;;; File:   ini-auctex.el
;;; Purpose: Initialize auctex and general LaTeX stuff
;;; ==================================================================

(setq texlive-root "/usr/local/texlive/2009")
(setenv "PATH" (concat texlive-root "/bin/universal-darwin:" (getenv "PATH")))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")

;; If the tex-site libarary is available
(require 'tex-site)

(require 'preview-latex)
;; (load "preview-latex.el" nil t t)

(setq TeX-print-command "dvips -P%p %s -2")
(setq auto-mode-alist (cons '("\\.tex$"   . tex-mode) auto-mode-alist))

;;; Setup for LaTeX Outline Mode

(make-variable-buffer-local 'outline-prefix-char)
(setq-default outline-prefix-char "\C-l")
(make-variable-buffer-local 'outline-regexp)
(setq-default outline-regexp "[*\^l]+")
(make-variable-buffer-local 'outline-level-function)
(setq-default outline-level-function 'outline-level-default)
(setq-default TeX-master nil) ; Query for master file.


;;; Extra Latex Functions ============================================

(defun latex-small-margins ()
  "Insert the LaTeX commands that setup small margins."
  (interactive)
  (insert-string "% fixup margins to fit more text on page.\n")
  (insert-string "\\sloppy\n")
  (insert-string "\\setlength{\\textwidth}{6.5in}\n")
  (insert-string "\\setlength{\\oddsidemargin}{0pt}\n")
  (insert-string "\\setlength{\\evensidemargin}{0pt}\n")
  (insert-string "\\setlength{\\textheight}{8.5in}\n")
  (insert-string "\\setlength{\\topmargin}{-0.5in}\n")
  (insert-string "\\pagestyle{headings}\n") )


(setq TeX-parse-self t)

(setq TeX-output-view-style (quote (("^dvi$" "^xdvi$" "open %o")
                                    ("^pdf$" "." "open %o")
                                    ("^html?$" "." "open %o"))))

(setq TeX-view-style (quote (("." "%(o?)open %dS %d"))))

(add-hook 'LaTeX-mode-hook (lambda () (TeX-global-PDF-mode 1)))

(defun TeX-insert-percent ()
  "Inserts an escaped % sign"
  (interactive)
  (insert "\\%"))

(add-hook 'LaTeX-mode-hook (lambda () (define-key TeX-mode-map (kbd "%") 'TeX-insert-percent)))
