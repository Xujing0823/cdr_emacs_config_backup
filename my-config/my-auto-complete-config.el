
(require 'auto-complete)
(require 'auto-complete-config)

(add-hook 'emacs-lisp-mode-hook
		  (lambda ()
			(setq ac-sources
				  '(
                    ac-source-abbrev
					ac-source-symbols
                    ;; ac-source-filename
                    ac-source-features
					;; ac-source-filename
					ac-source-semantic
					))))

(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")

;; ;; Ignore case if completion target string doesn't include upper characters
(setq ac-ignore-case 'smart)
(setq ac-menu-height 10)
(setq ac-use-menu-map 1)
(setq ac-auto-start 2)
(setq ac-dwim 1)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
(ac-set-trigger-key "TAB")


(setq ac-use-quick-help nil)
;; (setq ac-quick-help-delay 0.1)

;; semantic
(require 'semantic/ia)

(add-hook 'c++-mode-hook
          (lambda ()
			(setq ac-sources '(
							   ;; ac-source-clang
                               ;; ac-source-template
                               ;; ac-source-semantic
                               ac-source-words-in-buffer
                               ac-source-gtags
							   ))
            ))

(add-hook 'c-mode-hook
          (lambda ()
			(setq ac-sources '(
							   ;; ac-source-clang
                               ;; ac-source-semantic
							   ac-source-words-in-buffer
                               ac-source-gtags
							   ))
            ))


(global-auto-complete-mode 1)


(provide 'my-auto-complete-config)
