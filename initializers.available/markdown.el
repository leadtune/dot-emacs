(ensure-packages-installed
  '(markdown-mode))

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files." t nil)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
