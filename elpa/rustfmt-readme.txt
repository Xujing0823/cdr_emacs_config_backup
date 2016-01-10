Call `rustfmt-format-buffer' to format the current buffer using rustfmt. It is
convenient to bind it to a key, such as:

   (define-key rust-mode-map (kbd "C-c C-f") #'rustfmt-format-buffer)

Errors and warnings will be visible in the `*rustfmt*' buffer.
