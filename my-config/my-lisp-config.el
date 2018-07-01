;; (require 'highlight-sexps)


;; (add-hook 'lisp-mode-hook 'highlight-sexps-mode)
;; (add-hook 'emacs-lisp-mode-hook 'highlight-sexps-mode)
;; (add-hook 'emacs-lisp-mode-hook
;;           '(lambda ()
;;              (highlight-parentheses-mode)
;;              (setq autopair-handle-action-fns
;;                    (list 'autopair-default-handle-action
;;                          '(lambda (action pair pos-before)
;;                             (hl-paren-color-update))))))
;; (add-hook 'highlight-parentheses-mode-hook
;;           '(lambda ()
;;              (setq autopair-handle-action-fns
;;                    (append
;; 					(if autopair-handle-action-fns
;; 						autopair-handle-action-fns
;; 					  '(autopair-default-handle-action))
;; 					'((lambda (action pair pos-before)
;; 						(hl-paren-color-update)))))))


(provide 'my-lisp-config)
