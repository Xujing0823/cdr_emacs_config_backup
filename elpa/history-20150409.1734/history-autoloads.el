;;; history-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (history-mode history-toggle-window-local-history
;;;;;;  history-next-history history-prev-history history-kill-histories
;;;;;;  history-goto-history history-show-history history-add-history)
;;;;;;  "history" "history.el" (21994 61327 511409 591000))
;;; Generated autoloads from history.el

(autoload 'history-add-history "history" "\
Add current position into the database, which is `global-mark-ring'. If 
SAVE-THING? is t, it will cache the symbol string at point (if any) and use it as 
a comparison in checking algorithm when navigating to it. If they are not matched, 
the history will be deleted immediately.

\(fn &optional SAVE-THING\\?)" t nil)

(autoload 'history-show-history "history" "\
Show histories in a pretty way.

\(fn)" t nil)

(autoload 'history-goto-history "history" "\


\(fn)" t nil)

(autoload 'history-kill-histories "history" "\
Discard all the histories.

\(fn)" t nil)

(autoload 'history-prev-history "history" "\
Navigate to previous history.

\(fn)" t nil)

(autoload 'history-next-history "history" "\
Navigate to next history.

\(fn)" t nil)

(autoload 'history-toggle-window-local-history "history" "\
Switch between window-local history or global history mode.
See `history-window-local-history'.

\(fn)" t nil)

(defvar history-mode nil "\
Non-nil if History mode is enabled.
See the command `history-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `history-mode'.")

(custom-autoload 'history-mode "history" nil)

(autoload 'history-mode "history" "\
Add menus, toolbar buttons and more.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("history-pkg.el") (21994 61327 878637
;;;;;;  156000))

;;;***

(provide 'history-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; history-autoloads.el ends here
