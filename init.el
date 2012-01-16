(add-to-list 'load-path user-emacs-directory)

;; old starter kit legacy code...
;;TODO: remove dependece on the following lines and rm -rf corresponding files...
(setq dotfiles-dir user-emacs-directory)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(setq autoload-file (concat dotfiles-dir "loaddefs.el")) 
(load autoload-file)
;;;;


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

;; TODO: move custom file to esk-user-dir.. Need to figure out how to
;;load the initializers before esk loads everything in esk-user-dir to
;;prevent errors...
;;(setq custom-file (concat esk-user-dir "custom.el"))
(setq custom-file (format "%s%s-custom.el" user-emacs-directory user-login-name))
(load custom-file 'noerror)

(server-start)
