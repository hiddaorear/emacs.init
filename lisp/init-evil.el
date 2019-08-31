;;; Commentary:
;;
;; Ivy configurations.
;;

;;; Code:

(eval-when-compile
  (require 'init-custom))

(use-package evil
  :ensure t
  :defer .1 ;; don't block emacs when starting, load evil immediately after startup
  :init
  (progn
    ;; if we don't have this evil overwrites the cursor color
    (setq evil-default-cursor t)
    (setq evil-want-integration nil) ;; required by evil-collection
    (setq evil-search-module 'evil-search)
    (setq evil-ex-complete-emacs-commands nil)
    (setq evil-vsplit-window-right t) ;; like vim's 'splitright'
    (setq evil-split-window-below t) ;; like vim's 'splitbelow'
    (setq evil-shift-round nil)
    (setq evil-want-C-u-scroll t)

    ;; cursor
    (setq evil-move-cursor-back nil)
    (setq evil-emacs-state-cursor '("#92c48f" box))
    (setq evil-normal-state-cursor '("orange" box))
    (setq evil-visual-state-cursor '("green" box))
    (setq evil-insert-state-cursor '("#6785c5" bar))
    (setq evil-replace-state-cursor '("#be369c" bar))
    (setq evil-operator-state-cursor '("#d9ca65" hollow))

    ;; leader shortcuts
    ;; This has to be before we invoke evil-mode due to:
    ;; https://github.com/cofi/evil-leader/issues/10
    (use-package evil-leader
      :init (global-evil-leader-mode)
      :config
      (progn
        (evil-leader/set-leader "<SPC>")
        (setq evil-leader/in-all-states t)
        ;; keyboard shortcuts
        (evil-leader/set-key
          "r" 'counsel-rg
          "a" 'avy-goto-char-2
          "b" 'ibuffer
          "k" 'kill-this-buffer
          "w" 'save-buffer
          )))

    ;; boot evil by default
    (evil-mode 1))
  :config
  (evil-mode)
  ;; vim-like keybindings everywhere in emacs
  (use-package evil-collection
    :after evil
    :ensure t
    :config
    (evil-collection-init))
  )

(provide 'init-evil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-evil.el ends here
