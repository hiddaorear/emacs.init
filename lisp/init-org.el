(require 'org)
(require 'org-install)
(require 'ob-tangle)
(eval-after-load "org"
  '(require 'ox-md nil t))
(setq org-src-fontify-natively t)

(setq org-hide-leading-stars t)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done 'time)

(setq org-tag-alist '(("紧急重要" . ?a) ("紧急不重要" . ?s) ("不紧急重要" . ?d) ("不紧急不重要" . ?f)))

(provide 'init-org)
