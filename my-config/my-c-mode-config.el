
;;; cc-mode related
(defun my-c-hook ()
  (c-toggle-hungry-state 1))
(add-hook 'c-mode-common-hook 'my-c-hook)


;; comment
(defun my-c-comment-hook()
  (setq comment-start "//")
  (setq comment-end ""))
(add-hook 'c-mode-hook 'my-c-comment-hook)
(add-hook 'c++-mode-hook 'my-c-comment-hook)


(provide 'my-c-mode-config)
