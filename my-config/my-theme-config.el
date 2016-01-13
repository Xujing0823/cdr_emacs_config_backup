
(require 'color-theme)
(color-theme-initialize)
;; (color-theme-charcoal-black)
(if (display-graphic-p)
	(color-theme-digital-ofs1)
  (color-theme-arjen))


(provide 'my-theme-config)
