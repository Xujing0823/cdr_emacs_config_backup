
;;; cc-mode related
(defun my-c-hook ()
  (c-toggle-hungry-state 1))
(add-hook 'c-mode-common-hook 'my-c-hook)
;; (add-hook 'c-mode-common-hook 'color-identifiers-mode)

(font-lock-add-keywords 'c-mode
 `((,(concat
   "\\<[_a-zA-Z][_a-zA-Z0-9]*\\>"       ; Object identifier
   "\\s *"                              ; Optional white space
   "\\(?:\\.\\|->\\)"                   ; Member access
   "\\s *"                              ; Optional white space
   "\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>" ; Member identifier
   "\\s *"                              ; Optional white space
   "(")                                 ; Paren for method invocation
   1 'font-lock-function-name-face t)))

(font-lock-add-keywords 'c++-mode
 `((,(concat
   "\\<[_a-zA-Z][_a-zA-Z0-9]*\\>"       ; Object identifier
   "\\s *"                              ; Optional white space
   "\\(?:\\.\\|->\\)"                   ; Member access
   "\\s *"                              ; Optional white space
   "\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>" ; Member identifier
   "\\s *"                              ; Optional white space
   "(")                                 ; Paren for method invocation
	1 'font-lock-function-name-face t)))

(font-lock-add-keywords 'c-mode
  '(("\\(\\w+\\)\\s-*\("
    (1 'cdrink-font-lock-function-call-face)))
  t)

(font-lock-add-keywords 'c++-mode
  '(("\\(\\w+\\)\\s-*\("
    (1 'cdrink-font-lock-function-call-face)))
  t)

;; comment
(defun my-c-comment-hook()
  (setq comment-start "//")
  (setq comment-end ""))
(add-hook 'c-mode-hook 'my-c-comment-hook)
(add-hook 'c++-mode-hook 'my-c-comment-hook)


(provide 'my-c-mode-config)
