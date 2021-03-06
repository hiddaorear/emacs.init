;;; Commentary:
;;
;;


;;; Code:

(setq user-full-name "ginkgo")

(when (version< emacs-version "25.1")
  (error "This requires Emacs 25.1 and above!"))

(setq debug-on-error t)

(defvar ginkgo-gc-cons-threshold (if (display-graphic-p) 8000000 800000)
  "The default value to use for `gc-cons-threshold'. If you experience freezing,
decrease this. If you experience stuttering, increase this.")

(defvar ginkgo-gc-cons-upper-limit (if (display-graphic-p) 400000000 100000000)
  "The temporary value for `gc-cons-threshold' to defer it.")

(defvar ginkgo-gc-timer (run-with-idle-timer 10 t #'garbage-collect)
  "Run garbarge collection when idle 10s.")

(defvar default-file-name-handler-alist file-name-handler-alist)

(setq file-name-handler-alist nil)
(setq gc-cons-threshold ginkgo-gc-cons-upper-limit)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after startup."
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold ginkgo-gc-cons-threshold)

            ;; GC automatically while unfocusing the frame
            ;; `focus-out-hook' is obsolete since 27.1
            (if (boundp 'after-focus-change-function)
                (add-function :after after-focus-change-function
                  (lambda ()
                    (unless (frame-focus-state)
                      (garbage-collect))))
              (add-hook 'focus-out-hook 'garbage-collect))

            ;; Avoid GCs while using `ivy'/`counsel'/`swiper' and `helm', etc.
            ;; @see http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
            (defun my-minibuffer-setup-hook ()
              (setq gc-cons-threshold ginkgo-gc-cons-upper-limit))

            (defun my-minibuffer-exit-hook ()
              (setq gc-cons-threshold ginkgo-gc-cons-threshold))

            (add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
            (add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)))

;; Load path
;; Optimize: Force "lisp" at the head to reduce the startup time.

(defun update-load-path (&rest _)
  "Update `load-path'."
  (push (expand-file-name "site-lisp" user-emacs-directory) load-path)
  (push (expand-file-name "lisp" user-emacs-directory) load-path))

(defun add-subdirs-to-load-path (&rest _)
  "Add subdirectories to `load-path'."
  (let ((default-directory
          (expand-file-name "site-lisp" user-emacs-directory)))
    (normal-top-level-add-subdirs-to-load-path)))

(advice-add #'package-initialize :after #'update-load-path)
(advice-add #'package-initialize :after #'add-subdirs-to-load-path)

(update-load-path)

;; -----------------------------------------------------------------
;; Constant
(require 'init-const)
;; Customization
(require 'init-custom)
;; package
(require 'init-package)

;;;; Preferences
;; elementary
(require 'init-base)
(require 'init-funcs)

;; UI
(require 'init-hydra)
(require 'init-ui)

;; enhanced
(require 'init-edit)
(require 'init-ivy)
(require 'init-evil)
(require 'init-dired)

;; edit
(require 'init-company)
(require 'init-yasnippet)
(require 'init-highlight)

(require 'init-ibuffer)
(require 'init-utils)
(require 'init-vcs)
(require 'init-flycheck)
(require 'init-markdown)
(require 'init-org)

;; programming
(require 'init-lsp)
(require 'init-prog)
(require 'init-elisp)
(require 'init-shell)
(require 'init-eshell)
(require 'init-web)
(require 'init-ocaml)
(require 'init-scheme)

;;;;
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
