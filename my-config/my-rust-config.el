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

(provide 'my-rust-config)
