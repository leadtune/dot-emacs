(add-to-list 'load-path user-emacs-directory)

;; old starter kit legacy code...
;;TODO: remove dependece on the following lines and rm -rf corresponding files...
(setq dotfiles-dir user-emacs-directory)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(setq autoload-file (concat dotfiles-dir "loaddefs.el")) 
(load autoload-file)
;;;;

(setq custom-file (format "%s/%s-custom.el" user-emacs-directory user-login-name))

(require 'package)
(add-to-list 'package-archives
              '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
              '("tromey" . "http://tromey.com/elpa/") t)

(package-initialize)

(when (not package-archive-contents)
   (package-refresh-contents))

(defun ensure-packages-installed (packages)
  (dolist (p packages)
  (when (not (package-installed-p p))
    (package-install p))))

(ensure-packages-installed
 '(starter-kit starter-kit-bindings starter-kit-eshell))

(load (concat dotfiles-dir "initializers.el"))
(ini-load-all)

(load custom-file 'noerror)

(server-start)
