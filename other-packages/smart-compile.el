;; (global-set-key (kbd "<f9>") 'smart-compile)
(defun smart-compile()
  "auto select make gcc or g++"
  (interactive)
  ;; find Makefile
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
        (command nil))
    (if (some #'file-readable-p candidate-make-file-name)
        (setq command "make -k ")
      ;; There is no Makefile, check current language mode
      (if (null (buffer-file-name (current-buffer)))
          (message "Buffer not attached to a file, won't compile!")
        (case major-mode
          ('c-mode
           (setf command
                 (concat "clang -Wall -o "
                         (file-name-sans-extension
                          (file-name-nondirectory buffer-file-name))
                         " "
                         (file-name-nondirectory buffer-file-name)
                         " -g -lm ")))
          ('c++-mode
           (setf command
                 (concat "clang++ -Wall -o "
                         (file-name-sans-extension
                          (file-name-nondirectory buffer-file-name))
                         " "
                         (file-name-nondirectory buffer-file-name)
                         " -g -lm -std=c++1y ")))
          ('rust-mode
           (setf command
                 (concat "rustc -o "
                         (file-name-sans-extension
                          (file-name-nondirectory buffer-file-name))
                         " "
                         (file-name-nondirectory buffer-file-name)
                         " ")))
          ('lisp-mode
           (setf command
                 (concat "buildapp --output "
                         (file-name-sans-extension
                          (file-name-nondirectory buffer-file-name))
                         ".run --load "
                         (file-name-nondirectory buffer-file-name)
                         " --entry main")))
          (t
           (message "Unknow mode, won't compile!")))))
    (when command
      (setf command (read-from-minibuffer "Compile command: " command))
      (compile command))))

(provide 'smart-compile)
