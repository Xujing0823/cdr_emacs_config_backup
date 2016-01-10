
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
;; (color-theme-charcoal-black)
(if (display-graphic-p)
	(color-theme-digital-ofs1)
  (color-theme-arjen))
