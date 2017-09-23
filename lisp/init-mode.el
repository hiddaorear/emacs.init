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

(global-evil-leader-mode)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;; rjsx-mode
(defadvice js-jsx-indent-line (after js-jsx-indent-line-after-hack activate)
  "Workaround sgml-mode and follow airbnb component style."
  (save-excursion
    (beginning-of-line)
    (if (looking-at-p "^ +\/?> *$")
        (delete-char sgml-basic-offset))))

(provide 'init-mode)
