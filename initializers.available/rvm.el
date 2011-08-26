(defcustom rvm-default-ruby-name "ruby-1.8.7-p249"
  "The name of the ruby interpreter to use on startup, as shown by `rvm list'")

(defcustom rvm-ruby-187-name "ruby-1.8.7-p249"
  "The name of the ruby 1.8.7 interpreter, as shown by `rvm list'")

(defcustom rvm-ruby-192-name "ruby-1.9.2-p0"
  "The name of the ruby 1.9.2 interpreter, as shown by `rvm list'")


(eval-after-load 'ruby-mode
  '(progn
     (require 'rvm)
     ;; (rvm-use rvm-default-ruby-name "*default*")

     (defun inf-ruby187 ()
       (interactive)
       "Runs rvm-use, then inf-ruby"
       (rvm-use rvm-ruby-187-name "*default*")
       (inf-ruby))

     (defun inf-ruby192 ()
       (interactive)
       "Runs rvm-use, then inf-ruby"
       (rvm-use rvm-ruby-192-name "*default*")
       (inf-ruby))))
