(require 'helm)
(require 'helm-config)
;(require 'helm-dash)

(helm-mode 1)
(helm-autoresize-mode 1)
;(setq helm-ff-auto-update-initial-value nil)    ; 禁止自动补全
;;(setq helm-full-frame t)

(defun helm-mini--use-full-frame (orig-fun &rest args)
  (let ((helm-full-frame t))
    (apply orig-fun args)))

(advice-add 'helm-mini :around #'helm-mini--use-full-frame)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c p") 'helm-projectile)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-M-x-fuzzy-match                  t   ; 模糊搜索
      helm-buffers-fuzzy-matching           t
      helm-locate-fuzzy-match               t
      helm-recentf-fuzzy-match              t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)

(provide 'init-helm)
