;;; window-margin-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "window-margin" "window-margin.el" (22136 53893
;;;;;;  230443 107000))
;;; Generated autoloads from window-margin.el

(autoload 'window-margin-mode "window-margin" "\
Restrict visual width of window using margins for `visual-line-mode'.
With a prefix argument ARG, enable Window Margin mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil.

When Window Margin mode is enabled, the visual width of windows
will be restricted using margins in `visual-line-mode' (which
will also be turned on for the selected buffer).

\(fn &optional ARG)" t nil)

(autoload 'turn-on-window-margin-mode "window-margin" "\


\(fn)" nil nil)

(autoload 'turn-off-window-margin-mode "window-margin" "\


\(fn)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; window-margin-autoloads.el ends here
