
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/init-load.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(helm-gtags-auto-update nil)
 '(helm-gtags-cache-select-result t)
 '(helm-gtags-display-style (quote detail))
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote absolute))
 '(racer-cmd "~/ws/Rust/Racer/racer/target/release/racer")
 '(racer-rust-src-path "~/ws/Rust/rust/src/")
 '(safe-local-variable-values
   (quote
	((eval c-set-offset
		   (quote innamespace)
		   0)
	 (lexical-binding . t)
	 (c-set-style . "BSD")
	 (buffer-file-coding-system . utf-8-unix))))
 '(semantic-c-dependency-system-include-path (quote ("/usr/include" "~/Workspace/unix/include")))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
