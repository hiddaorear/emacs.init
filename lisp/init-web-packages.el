;;; web-packages --- init web packages

;;; init js2
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
(setq js2-bounce-indent-p t)


(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil) ;;Use space instead of tab
            (setq js-indent-level 2) ;;space width is 2 (default is 2)
            (setq js2-strict-missing-semi-warning nil))) ;;disable the semicolon warning



(provide 'init-web-packages)
