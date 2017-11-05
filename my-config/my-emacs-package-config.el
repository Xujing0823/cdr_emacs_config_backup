(require 'package)

(setq package-load-list '(all))
(package-initialize)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


;; (if (null (string-match-p "Mac" emacs-build-system))
;; 	(defun package-update-load-path ()
;; 	  "Update the load path for newly installed packages."
;; 	  (interactive)
;; 	  (let ((package-dir (expand-file-name package-user-dir)))
;; 		(mapc (lambda (pkg)
;; 				(let ((stem (symbol-name (car pkg)))
;; 					  (version "")
;; 					  (first t)
;; 					  path)
;; 				  (mapc (lambda (num)
;; 						  (if first
;; 							  (setq first nil)
;; 							(setq version (format "%s." version)))
;; 						  (setq version (format "%s%s" version num)))
;; 						(aref (cdr pkg) 0))
;; 				  (setq path (format "%s/%s-%s" package-dir stem version))
;; 				  (add-to-list 'load-path path)))
;; 			  package-alist)))

;;   (defun package-update-load-path ()
;; 	"Update the load path for newly installed packages."
;; 	(interactive)
;; 	(mapc (lambda (pkg)
;; 			(let ((path (package-desc-dir (car (cdr pkg)))))
;; 			  (add-to-list 'load-path path)))
;; 		  package-alist))
;;   )


(defun package-update-load-path ()
  "Update the load path for newly installed packages."
  (interactive)
  (mapc (lambda (pkg)
		  (let ((path (package-desc-dir (car (cdr pkg)))))
			(add-to-list 'load-path path)))
		package-alist))


(package-update-load-path)


(provide 'my-emacs-package-config)
