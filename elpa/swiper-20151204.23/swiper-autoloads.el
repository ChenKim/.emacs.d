;;; swiper-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ivy-recentf ivy-switch-buffer ivy-mode ivy-completing-read
;;;;;;  ivy-resume) "ivy" "ivy.el" (22116 63259 660199 521000))
;;; Generated autoloads from ivy.el

(autoload 'ivy-resume "ivy" "\
Resume the last completion session.

\(fn)" t nil)

(autoload 'ivy-completing-read "ivy" "\
Read a string in the minibuffer, with completion.

This interface conforms to `completing-read' and can be used for
`completing-read-function'.

PROMPT is a string to prompt with; normally it ends in a colon and a space.
COLLECTION can be a list of strings, an alist, an obarray or a hash table.
PREDICATE limits completion to a subset of COLLECTION.
REQUIRE-MATCH is specified with a boolean value.  See `completing-read'.
INITIAL-INPUT is a string that can be inserted into the minibuffer initially.
HISTORY is a list of previously selected inputs.
DEF is the default value.
_INHERIT-INPUT-METHOD is currently ignored.

\(fn PROMPT COLLECTION &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT HISTORY DEF INHERIT-INPUT-METHOD)" nil nil)

(defvar ivy-mode nil "\
Non-nil if Ivy mode is enabled.
See the command `ivy-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ivy-mode'.")

(custom-autoload 'ivy-mode "ivy" nil)

(autoload 'ivy-mode "ivy" "\
Toggle Ivy mode on or off.
Turn Ivy mode on if ARG is positive, off otherwise.
Turning on Ivy mode sets `completing-read-function' to
`ivy-completing-read'.

Global bindings:
\\{ivy-mode-map}

Minibuffer bindings:
\\{ivy-minibuffer-map}

\(fn &optional ARG)" t nil)

(autoload 'ivy-switch-buffer "ivy" "\
Switch to another buffer.

\(fn)" t nil)

(autoload 'ivy-recentf "ivy" "\
Find a file on `recentf-list'.

\(fn)" t nil)

;;;***

;;;### (autoloads (swiper swiper-mc swiper-avy) "swiper" "swiper.el"
;;;;;;  (22116 63259 656199 522000))
;;; Generated autoloads from swiper.el

(autoload 'swiper-avy "swiper" "\
Jump to one of the current swiper candidates.

\(fn)" t nil)

(autoload 'swiper-mc "swiper" "\


\(fn)" t nil)

(autoload 'swiper "swiper" "\
`isearch' with an overview.
When non-nil, INITIAL-INPUT is the initial search pattern.

\(fn &optional INITIAL-INPUT)" t nil)

;;;***

;;;### (autoloads nil nil ("colir.el" "ivy-hydra.el" "swiper-pkg.el")
;;;;;;  (22116 63259 672538 286000))

;;;***

(provide 'swiper-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; swiper-autoloads.el ends here