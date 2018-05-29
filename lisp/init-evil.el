(require 'evil-leader)
(evil-mode 1)

(global-evil-leader-mode)
(setq evil-mode-line-format nil)
(setq evil-leader/leader "<SPC>"
      evil-leader/in-all-states t)
(setq evil-search-module 'evil-search)

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

(evil-leader/set-key "f" 'helm-find-files)
(evil-leader/set-key "b" 'helm-mini)
(evil-leader/set-key "o" 'my-occur)
(evil-leader/set-key "a" 'helm-ag)

(with-eval-after-load 'evil
  (require 'evil-anzu))

(provide 'init-evil)
