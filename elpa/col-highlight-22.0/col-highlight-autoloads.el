;;; col-highlight-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "col-highlight" "col-highlight.el" (22136 52394
;;;;;;  654491 191000))
;;; Generated autoloads from col-highlight.el

(let ((loads (get 'column-highlight 'custom-loads))) (if (member '"col-highlight" loads) nil (put 'column-highlight 'custom-loads (cons '"col-highlight" loads))))

(defvar col-highlight-vline-face-flag t "\
*Non-nil means `column-highlight-mode' uses `col-highlight-face'.
nil means that it uses `vline-face'.")

(custom-autoload 'col-highlight-vline-face-flag "col-highlight" t)

(defvar col-highlight-period 1 "\
*Number of seconds to highlight the current column.")

(custom-autoload 'col-highlight-period "col-highlight" t)

(defface col-highlight '((t (:background "#080808"))) "\
*Face for current-column highlighting by `column-highlight-mode'.
Not used if `col-highlight-vline-face-flag' is nil." :group (quote column-highlight) :group (quote faces))

(defvar column-highlight-mode nil "\
Non-nil if Column-Highlight mode is enabled.
See the command `column-highlight-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `column-highlight-mode'.")

(custom-autoload 'column-highlight-mode "col-highlight" nil)

(autoload 'column-highlight-mode "col-highlight" "\
Toggle highlighting the current column.
With ARG, turn column highlighting on if and only if ARG is positive.

Column-Highlight mode uses the functions
`col-highlight-unhighlight' and `col-highlight-highlight'
on `pre-command-hook' and `post-command-hook'.

\(fn &optional ARG)" t nil)

(defalias 'toggle-highlight-column-when-idle 'col-highlight-toggle-when-idle)

(autoload 'col-highlight-toggle-when-idle "col-highlight" "\
Turn on or off highlighting the current column when Emacs is idle.
With prefix argument, turn on if ARG > 0; else turn off.

\(fn &optional ARG)" t nil)

(autoload 'col-highlight-set-interval "col-highlight" "\
Set wait until highlight current column when Emacs is idle.
Whenever Emacs is idle for this many seconds, the current column
will be highlighted in the face that is the value of variable
`col-highlight-face'.

To turn on or off automatically highlighting the current column
when Emacs is idle, use `\\[toggle-highlight-column-when-idle].

\(fn SECS)" t nil)

(defalias 'flash-column-highlight 'col-highlight-flash)

(autoload 'col-highlight-flash "col-highlight" "\
Highlight the current column for `col-highlight-period' seconds.
With a prefix argument, highlight for that many seconds.

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; col-highlight-autoloads.el ends here
