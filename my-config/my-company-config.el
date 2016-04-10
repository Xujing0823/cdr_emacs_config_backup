(require 'company)

(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "M-/") 'helm-company)
     (define-key company-active-map (kbd "M-/") 'helm-company)))

(add-hook 'after-init-hook 'global-company-mode)


(provide 'my-company-config)
