(add-to-list 'load-path "~/.emacs.d/my-config/")
(add-to-list 'load-path "~/.emacs.d/other-packages/")

(require 'my-emacs-package-config)
;;;; package config
;; (load "~/.emacs.d/my-emacs-package-config.el")

;; ;;; auto-complete
(require 'my-auto-complete-config)
 
;; ;; rust-lang
(require 'my-rust-config)

;; ;; helm config
(require 'my-helm-config)

;;; some configurations of common using
(require 'my-common-config)

;;;; ;;; theme
(require 'my-theme-config)


;; smart compile
(require 'smart-compile)

;;; ;;; C-lang
(require 'my-c-mode-config)


;; gdb
(require 'my-gdb-config)
