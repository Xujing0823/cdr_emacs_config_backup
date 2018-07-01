
;; (add-hook 'after-init-hook 'global-color-identifiers-mode)

(setq column-number-mode t)

;;; set tab-width
(setq-default tab-width 4)

;;;; set scroll bar on right side
(set-scroll-bar-mode 'right)

;;; mouse used in terminal 
;; (xterm-mouse-mode)

;; enable line number
(global-linum-mode 1)

;;;;  kill current buffers
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
;
;;;;  set tab 
(setq tab-always-indent t)
(setq c-tab-always-indent t)

;; ;;; set indent-tabs-mode
(setq indent-tabs-mode nil)

;; C-k delete whole line 
(setq kill-whole-line t)

;; use y or n instead of yes or no 
(defalias 'yes-or-no-p 'y-or-n-p)

;; show time and date 
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;; match the parentheses
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; ;; another way about scroll
(setq mouse-wheel-scroll-amount '(4 ((shift) . 1) ((control))))
;; ;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;;;; redo
(require 'redo+)
(global-set-key (kbd "C-\\") 'redo)

;;;;; undo-no-redo
(setq undo-no-redo t)

;;;;; undo-only
(global-set-key (kbd "C-/") 'undo-only)

(desktop-save-mode)
(setq desktop-base-file-name "emacs.desktopSave")

;; font
;; (add-to-list 'default-frame-alist
;; 			 '(font . "Consolas 16"))
(add-to-list 'default-frame-alist
			 '(font . "Monaco 24"))


;; add tab bar
(require 'tabbar)
(tabbar-mode)
(global-set-key (kbd "C-<left>") 'tabbar-backward)
(global-set-key (kbd "C-<right>") 'tabbar-forward)
(global-set-key (kbd "C-x C-<left>") 'tabbar-backward-group)
(global-set-key (kbd "C-x C-<right>") 'tabbar-forward-group)


;;; wrap or truncate
(setq word-wrap 1)

(defun my-truncate-hook()
  (setq longlines-auto-wrap nil)
  (setq truncate-lines t)
  (put 'scroll-left 'disabled nil)
  (local-set-key "\C-[PgDn]" 'scroll-left)
  (local-set-key "\C-[PgUp]" 'scroll-right))
;; (add-hook 'c-mode-common-hook 'my-truncate-hook)

(defun my-text-wrap-hook()
  (setq longlines-auto-wrap 1)
  (setq truncate-partial-width-windows nil)
  (setq truncate-lines nil)
  (setq word-wrap 1))
(add-hook 'text-mode-hook 'my-text-wrap-hook)

(defun fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
						 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
(global-set-key [M-f11] 'fullscreen)

(defun maximize-frame (&optional f)
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
						 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
						 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
;; (global-set-key [f10] 'maximize-frame)
(global-set-key [M-f10] 'maximize-frame)

(add-hook 'window-setup-hook 'maximize-frame)


(setq-default inhibit-startup-screen t)

;; inhibit tool bar
(tool-bar-mode 0)

;;
(setq x-select-enable-clipboard t)


(defun my-c-style-mode ()
   (c-set-style "Stroustrup")
;;   (c-toggle-auto-state)
   (setq c-electric-flag t)
   (setq c-auto-newline nil)
)
(add-hook 'c++-mode-hook 'my-c-style-mode)
(add-hook 'c-mode-hook 'my-c-style-mode)

;;; display-battery-mode 
(setq display-battery-mode t)

;;; display-time-mode
(setq display-time-mode t)

;;             C  mode
(add-hook 'c-mode-hook 'hs-minor-mode)
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  ;; (setq skeleton-pair-alist  '(
  ;;   (?` ?` _ "''")
  ;;   (?\( ?  _ " )")
  ;;   (?\[ ?  _ " ]")
  ;;   (?{ \n > _ \n ?} >)))
  (setq skeleton-pair-alist nil)
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;  (local-set-key (kbd "<") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

(defun my-c-mode-hook()
  (local-set-key (kbd "{") 'skeleton-c-mode-left-brace)
  )
(defun skeleton-c-mode-left-brace (arg)
  (interactive "*P")
  (if (c-in-literal (c-most-enclosing-brace (c-parse-state)))
	  (self-insert-command 1)
	;; auto insert complex things.
	(let* ((current-line (delete-and-extract-region
						  (line-beginning-position)
						  (line-end-position)))
		   (lines (and arg
					   (mark t)
					   (delete-and-extract-region (mark t) (point))))
		   (after-point (make-marker)))
       ;;; delete extra blank begin and after the LINES
	  (setq lines (and lines
					   (with-temp-buffer
						 (insert lines)
						 (beginning-of-buffer)
						 (delete-blank-lines)
						 (delete-blank-lines)
						 (end-of-buffer)
						 (delete-blank-lines)
						 (delete-blank-lines)
						 (buffer-string))))
	  (save-excursion
		(let* ((old-point (point)))
		  (insert (if current-line current-line "")  "{\n")
		  (and lines (insert lines))
		  (move-marker after-point (point))
		  ;; (insert "\n}\n")
		  (insert "\n}")
		  (indent-region old-point (point) nil)))
	  (goto-char after-point)
	  (c-indent-line)
	  )))
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)


(defun my-rust-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  ;; (setq skeleton-pair-alist  '(
  ;;   (?` ?` _ "''")
  ;;   (?\( ?  _ " )")
  ;;   (?\[ ?  _ " ]")
  ;;   (?{ \n > _ \n ?} >)))
  (setq skeleton-pair-alist nil)
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;  (local-set-key (kbd "<") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "|") 'skeleton-pair-insert-maybe))
(add-hook 'rust-mode-hook 'my-rust-mode-auto-pair)



(defun my-rust-mode-hook()
  (local-set-key (kbd "{") 'skeleton-rust-mode-left-brace)
  )
(defun skeleton-rust-mode-left-brace (arg)
  (interactive "*P")
  ;; auto insert complex things.
  (let* ((current-line (delete-and-extract-region
						(line-beginning-position)
						(line-end-position)))
		 (lines (and arg
					 (mark t)
					 (delete-and-extract-region (mark t) (point))))
		 (after-point (make-marker)))
       ;;; delete extra blank begin and after the LINES
	(setq lines (and lines
					 (with-temp-buffer
					   (insert lines)
					   (beginning-of-buffer)
					   (delete-blank-lines)
					   (delete-blank-lines)
					   (end-of-buffer)
					   (delete-blank-lines)
					   (delete-blank-lines)
					   (buffer-string))))
	(save-excursion
	  (let* ((old-point (point)))
		(insert (if current-line current-line "")  "{\n")
		(and lines (insert lines))
		(move-marker after-point (point))
		;; (insert "\n}\n")
		(insert "\n}")
		(indent-region old-point (point) nil)))
	(goto-char after-point)
	(indent-for-tab-command)
	))
(add-hook 'rust-mode-hook 'my-rust-mode-hook)


(provide 'my-common-config)
