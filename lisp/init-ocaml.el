;; company instead of ac-complete
;; I specifically do not use autocomplete so no (setq merlin-ac-setup 'easy)

;; reason setup
(defun shell-cmd (cmd)
  "Returns the stdout output of a shell command or nil if the command returned
   an error"
  (car (ignore-errors (apply 'process-lines (split-string cmd)))))

(let* ((refmt-bin (shell-cmd "which refmt"))
       (merlin-bin (shell-cmd "which ocamlmerlin"))
       (merlin-base-dir (when merlin-bin
                          (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))

  (when refmt-bin
    (setq refmt-command refmt-bin))

  (add-hook
   'reason-mode-hook
   (lambda ()
     (add-hook 'before-save-hook 'refmt-before-save nil t)
     (merlin-mode))))

(use-package merlin
  :config
  (setq merlin-command (shell-cmd "which ocamlmerlin"))
  (setq merlin-completion-with-doc t)

  ;; Make company aware of merlin
  (with-eval-after-load 'company
    (add-hook 'merlin-mode-hook 'company-mode)
    (add-to-list 'company-backends 'merlin-company-backend))

  :bind (:map merlin-mode-map
         ("M-." . merlin-locate)
         ("M-," . merlin-pop-stack)
         ("M-m" . merlin-error-next)
         ("M-n" . merlin-error-prev)
         ("C-c C-o" . merlin-occurrences)
         ("C-c C-j" . merlin-jump)
         ("C-c i" . merlin-locate-ident)
         ("C-c C-e" . merlin-iedit-occurrences))
  :hook
  ;; Start merlin on ml files
  (reason-mode . merlin-mode)
  (tuareg-mode . merlin-mode)
  (caml-mode-hook . merlin-mode))

(use-package reason-mode
  :config
  (with-eval-after-load 'utop
    (setq utop-command "rtop -emacs")))

(use-package utop
  :hook
  (tuareg-mode . utop-minor-mode)
  (reason-mode . utop-minor-mode))


(provide 'init-ocaml)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ocaml.el ends here
