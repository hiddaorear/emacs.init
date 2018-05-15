;; require
(require 'recentf)

;; mode
(setq default-major-mode 'text-mode)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(recentf-mode -1)

(global-hl-line-mode t)
(delete-selection-mode 1)
(global-company-mode 1)
(global-hl-line-mode 1)

;; which-key
(which-key-mode 1)
(which-key-setup-side-window-bottom)
(which-key-setup-minibuffer)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; Emacs minor mode that keeps your code always indented. More reliable than electric-indent-mode.
;; aggressive-indent
;;(global-aggressive-indent-mode 1)

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)
;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)
;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'init-mode)
