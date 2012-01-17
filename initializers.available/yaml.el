(ensure-packages-installed
  '(yaml-mode))

(autoload 'yaml-mode "yaml-mode" "Major mode for editing YAML files" t nil)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
