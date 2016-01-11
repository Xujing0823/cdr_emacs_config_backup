(require 'package)
(setq package-load-list '(all))
(package-initialize)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


(defun package-update-load-path ()
  "Update the load path for newly installed packages."
  (interactive)
  (let ((package-dir (expand-file-name package-user-dir)))
    (mapc (lambda (pkg)
            (let ((stem (symbol-name (car pkg)))
                  (version "")
                  (first t)
                  path)
              (mapc (lambda (num)
                      (if first
                          (setq first nil)
                        (setq version (format "%s." version)))
                      (setq version (format "%s%s" version num)))
                    (aref (cdr pkg) 0))
              (setq path (format "%s/%s-%s" package-dir stem version))
              (add-to-list 'load-path path)))
          package-alist)))
(package-update-load-path)

;; ;;; auto-complete
(load "~/.emacs.d/my-auto-complete-set.el")


;; Rust
(require 'rust-mode)
(require 'racer)
(require 'ac-racer)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook 'auto-complete-mode)
(add-hook 'rust-mode-hook
          (lambda ()
            (setq ac-sources '(ac-source-racer))))

(load-file "~/.emacs.d/my-helm.el")

;;; some configurations of common using
(load "~/.emacs.d/my-common-set.el")

;;;; ;;; theme
(load "~/.emacs.d/my-theme.el")

;;; cc-mode related
(defun my-c-hook ()
  (c-toggle-hungry-state 1))
(add-hook 'c-mode-common-hook 'my-c-hook)

;; smart compile
(load-file "~/.emacs.d/smart-compile.el")

;; comment
(defun my-c-comment-hook()
  (setq comment-start "//")
  (setq comment-end ""))
(add-hook 'c-mode-hook 'my-c-comment-hook)
(add-hook 'c++-mode-hook 'my-c-comment-hook)

;; gdb
(load-file "~/.emacs.d/my-gdb.el")

