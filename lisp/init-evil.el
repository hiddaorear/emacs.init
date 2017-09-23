(require 'evil-leader)
(global-evil-leader-mode)

(setq evil-mode-line-format nil)
(setq evil-leader/leader ","
      evil-leader/in-all-states t)
(setq evil-search-module 'evil-search)

(evil-leader/set-key "f" 'helm-find-files)
(evil-leader/set-key "b" 'helm-mini)
(with-eval-after-load 'evil
  (require 'evil-anzu))

(provide 'init-evil)
