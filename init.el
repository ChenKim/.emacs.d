;; git clone https://github.com/tuhdo/emacs-c-ide-demo.git ~/.emacs.d
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(defconst demo-packages
  '(anzu
    company
    duplicate-thing
    ggtags
    helm
    helm-gtags
    helm-projectile
    helm-swoop
    ;; function-args
    clean-aindent-mode
    comment-dwim-2
    dtrt-indent
    ws-butler
    iedit
    yasnippet
    smartparens
    projectile
    volatile-highlights
    undo-tree
    zygospore))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package demo-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-helm)
(require 'setup-helm-gtags)
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'taglist)

(windmove-default-keybindings)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-semantic company-backends)
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; company-c-headers
(add-to-list 'company-backends 'company-c-headers)

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq
 c-default-style "linux" ;; set style to "linux"
 )

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Package: smartparens
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

;; Package zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

(load-theme 'tango-dark t)

;; (setq-local imenu-create-index-function 'ggtags-build-imenu-index)
;; (setq speedbar-show-unknown-files t)


(if (eq system-uses-terminfo t)
    (progn                              ;; PuTTY hack - needs to be in SCO mode
      (define-key key-translation-map [\e] [\M])
      (define-key input-decode-map "\e[H" [home])
      (define-key input-decode-map "\e[F" [end])
      (define-key input-decode-map "\e[D" [S-left])
      (define-key input-decode-map "\e[C" [S-right])
      (define-key input-decode-map "\e[A" [S-up])
      (define-key input-decode-map "\e[B" [S-down])
      (define-key input-decode-map "\e\e[D" [M-left])
      (define-key input-decode-map "\e\e[C" [M-right])
      (define-key input-decode-map "\e\e[A" [M-up])
      (define-key input-decode-map "\e\e[B" [M-down])
      (define-key input-decode-map "\e[C" [S-right])
      (define-key input-decode-map "\e[I" [prior])
      (define-key input-decode-map "\e[G" [next])
      (define-key input-decode-map "\e[M" [f1])
      (define-key input-decode-map "\e[Y" [S-f1])
      (define-key input-decode-map "\e[k" [C-f1])
      (define-key input-decode-map "\e\e[M" [M-f1])
      (define-key input-decode-map "\e[N" [f2])
      (define-key input-decode-map "\e[Z" [S-f2])
      (define-key input-decode-map "\e[l" [C-f2])
      (define-key input-decode-map "\e\e[N" [M-f2])
      (define-key input-decode-map "\e[O" [f3])
      (define-key input-decode-map "\e[a" [S-f3])
      (define-key input-decode-map "\e[m" [C-f3])
      (define-key input-decode-map "\e\e[O" [M-f3])
      (define-key input-decode-map "\e[P" [f4])
      (define-key input-decode-map "\e[b" [S-f4])
      (define-key input-decode-map "\e[n" [C-f4])
      (define-key input-decode-map "\e\e[P" [M-f4])
      (define-key input-decode-map "\e[Q" [f5])
      (define-key input-decode-map "\e[c" [S-f5])
      (define-key input-decode-map "\e[o" [C-f5])
      (define-key input-decode-map "\e\e[Q" [M-f5])
      (define-key input-decode-map "\e[R" [f6])
      (define-key input-decode-map "\e[d" [S-f6])
      (define-key input-decode-map "\e[p" [C-f6])
      (define-key input-decode-map "\e\e[R" [M-f6])
      (define-key input-decode-map "\e[S" [f7])
      (define-key input-decode-map "\e[e" [S-f7])
      (define-key input-decode-map "\e[q" [C-f7])
      (define-key input-decode-map "\e\e[S" [M-f7])
      (define-key input-decode-map "\e[T" [f8])
      (define-key input-decode-map "\e[f" [S-f8])
      (define-key input-decode-map "\e[r" [C-f8])
      (define-key input-decode-map "\e\e[T" [M-f8])
      (define-key input-decode-map "\e[U" [f9])
      (define-key input-decode-map "\e[g" [S-f9])
      (define-key input-decode-map "\e[s" [C-f9])
      (define-key input-decode-map "\e\e[U" [M-f9])
      (define-key input-decode-map "\e[V" [f10])
      (define-key input-decode-map "\e[h" [S-f10])
      (define-key input-decode-map "\e[_" [C-f10])
      (define-key input-decode-map "\e\e[V" [M-f10])
      (define-key input-decode-map "\e[W" [f11])
      (define-key input-decode-map "\e[i" [S-f11])
      (define-key input-decode-map "\e[u" [C-f11])
      (define-key input-decode-map "\e\e[W" [M-f11])
      (define-key input-decode-map "\e[X" [f12])
      (define-key input-decode-map "\e[j" [S-f12])
      (define-key input-decode-map "\e[v" [C-f12])
      (define-key input-decode-map "\e\e[X" [M-f12])))

;; Add package sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(add-hook 'c-mode-common-hook   'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq
  c-default-style "linux" ;; set style to "linux"
   )

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; show line number
;; (global-linum-mode t)

;;set windows undo and redo
(when (fboundp 'winner-mode)
        (winner-mode 1)
        (global-set-key (kbd "C-x 4 u") 'winner-undo)
        (global-set-key (kbd "C-x 4 r") 'winner-redo)
        )

;; set open multi shell
(defun wcy-shell-mode-auto-rename-buffer (text)
    (if (eq major-mode 'shell-mode)
              (rename-buffer  (concat "shell:" default-directory) t)))
(add-hook 'comint-output-filter-functions'wcy-shell-mode-auto-rename-buffer)

;; delete current line(C-w), copy current line(M-w)
(defadvice kill-ring-save (before slickcopy activate compile)
    (interactive
        (if mark-active (list (region-beginning) (region-end))
               (list (line-beginning-position)
                                (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)
    (interactive
        (if mark-active (list (region-beginning) (region-end))
               (list (line-beginning-position)
                                (line-beginning-position 2)))))

;; optimize M-; comment cmd
(defun qiang-comment-dwim-line (&optional arg)
    (interactive "*P")
      (comment-normalize-vars)
        (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
                  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
              (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)

;; jump to line hotkey M-g
(global-set-key "\M-g" 'goto-line)

;; cua mode config
;; (cua-mode t)
;;     (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
;;     (transient-mark-mode 1) ;; No region when it is not highlighted
;;     (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
;; (cua-selection-mode t)

;; ;; Make shifted direction keys work on the Linux console or in an xterm
;; ;; (when (member (getenv "TERM") '("linux" "xterm"))
;;  (when (member (getenv "TERM") '("xterm-256color" "xterm"))
;;    (dolist (prefix '("\eO" "\eO1;" "\e[1;"))
;;      (dolist (m '(("2" . "S-") ("3" . "M-") ("4" . "S-M-") ("5" . "C-")
;;                   ("6" . "S-C-") ("7" . "C-M-") ("8" . "S-C-M-")))
;;        (dolist (k '(("A" . "<up>") ("B" . "<down>") ("C" . "<right>")
;;                     ("D" . "<left>") ("H" . "<home>") ("F" . "<end>")))
;;          (define-key function-key-map
;;                      (concat prefix (car m) (car k))
;;                      (read-kbd-macro (concat (cdr m) (cdr k))))))))

;; (cua-mode t)

(global-set-key "\M-#" 'cua-set-rectangle-mark)


;; resize buffer size
;;(global-set-key (kbd "<M-up>") 'shrink-window)
;;(global-set-key (kbd "<M-down>") 'enlarge-window)
(global-set-key (kbd "<M-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<M-right>") 'enlarge-window-horizontally)
(define-key (current-global-map) [remap sp-splice-sexp-killing-backward] 'shrink-window)
(define-key (current-global-map) [remap sp-splice-sexp-killing-forward] 'enlarge-window)


(define-key (current-global-map) [remap transpose-sexps] 'sr-speedbar-toggle)


;; redo
(require 'redo+)
(global-set-key (kbd "C-M-_") 'undo-tree-redo)

;; reload all files from hard disk
(defun revert-all-buffers ()
      "Refreshes all open buffers from their respective files."
      (interactive)
      (dolist (buf (buffer-list))
        (with-current-buffer buf
          (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
            (revert-buffer t t t) ))))
(global-set-key (kbd "C-M-r") 'revert-all-buffers)

;; find word in current file
(global-set-key (kbd "C-f") 'list-matching-lines)

;; evil search word highlight forward/backward
;; (evil-mode t)
;; (evil-mode -1)
;; (global-set-key (kbd "ESC <right>") 'evil-search-word-forward)
;; (global-set-key (kbd "ESC <left>") 'evil-search-word-backward)
;; (add-hook 'c-mode-hook
;;           (lambda () (modify-syntax-entry ?_ "w")))

;; highlight current symbol at cursor
(require 'highlight-symbol)
(global-set-key (kbd "ESC <up>") 'highlight-symbol)
(global-set-key (kbd "ESC <right>") 'highlight-symbol-next)
(global-set-key (kbd "ESC <left>") 'highlight-symbol-prev)

;; update gtags after save file
  (defun gtags-root-dir ()
    "Returns GTAGS root directory or nil if doesn't exist."
    (with-temp-buffer
      (if (zerop (call-process "global" nil t nil "-pr"))
          (buffer-substring (point-min) (1- (point-max)))
        nil)))
  (defun gtags-update ()
    "Make GTAGS incremental update"
    (call-process "global" nil nil nil "-u"))
  (defun gtags-update-hook ()
    (when (gtags-root-dir)
      (gtags-update)))
  (add-hook 'after-save-hook #'gtags-update-hook)

;; show line number
(global-set-key (kbd "<f6>") 'linum-mode)

;; show parent matching
(show-paren-mode t)

;; crosshairs
;; (crosshairs-mode t)

;; window-margins
;; (add-hook 'text-mode-hook 'turn-on-window-margin-mode)
;; (add-hook 'text-mode-hook 'longlines-mode)

;; open imenu
(global-set-key (kbd "<f7>") 'imenu)

;; magit config
(global-set-key (kbd "C-x g") 'magit-status)

;; flycheck syntex error
;; (add-hook 'after-init-hook #'global-flycheck-mode)


;; (require 'highlight-parentheses)
;; (highlight-parentheses-mode 1)

;; cua column mode
;; (cua-mode 'emacs)
;; (cua-selection-mode t)

;; colors
(set-face-foreground 'font-lock-comment-face "#585858")

;; treat underscore symbol as word
(add-hook 'c-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'c++-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))

;; ifdef
;; (require 'hideif)
;; (setq hide-ifdef-initially t)
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (setq hide-ifdef-shadow t)
;;             (setq hide-ifdef-mode t)
;;             (hide-ifdefs)
;;             ))
