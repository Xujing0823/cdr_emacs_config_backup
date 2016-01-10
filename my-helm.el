(require 'async-bytecomp)
;; (require 'helm-config)
;; (require 'helm-mode)
(require 'semantic/ia)
(add-hook 'c-mode-common-hook #'(lambda () (semantic-mode)))

(require 'helm)
(require 'helm-semantic)
(require 'helm-files)
(require 'helm-ring)
(require 'helm-gtags)

(setq helm-command-prefix-key (kbd "C-c"))
(mapc (lambda (hook)
        (add-hook hook
                  (lambda ()
                    (local-set-key (kbd "C-c C-l") 'helm-semantic)
                    ;; (define-key helm-map (kbd "C-c C-f") 'helm-find-files)
                    (local-set-key (kbd "C-c C-y") 'helm-show-kill-ring)
                    ;; (local-set-key (kbd "C-c C-d") 'helm-
                    )))
      '(c-mode-common-hook emacs-lisp-mode-hook))


;; (helm-mode 1)


(global-set-key (kbd "C-c C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c C-c") 'helm-resume)
;; (global-set-key (kbd "C-c C-g") 'helm-do-grep)


;;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)


;;; Customize
(custom-set-variables
 '(helm-gtags-path-style 'absolute)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update nil)
 '(helm-gtags-display-style 'detail)
 '(helm-gtags-cache-select-result t)
)

;; key bindings
;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "C-c C-d") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "C-c C-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "C-c C-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "C-c C-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c C-f") 'helm-gtags-find-files)
     (define-key helm-gtags-mode-map (kbd "C-c C-c") 'helm-resume)
     (define-key helm-gtags-mode-map (kbd "C-c C-l") 'helm-semantic)
     (define-key helm-gtags-mode-map (kbd "C-c C-b") 'helm-buffers-list)
     (define-key helm-gtags-mode-map (kbd "C-c ,") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c .") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "C-c C-t") 'helm-gtags-pop-stack)))



