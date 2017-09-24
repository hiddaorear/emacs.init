;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Yvan Wang
;; 18-08-2017

(setq user-full-name "Yvan")
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-mode)
(require 'init-helm)
(require 'init-dired)
(require 'init-evil)
(require 'init-occur)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-org)


