(use-package tuareg
        :ensure t
        :config
        (add-hook 'tuareg-mode-hook #'electric-pair-local-mode)
        ;; (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
        (setq auto-mode-alist
              (append '(("\\.ml[ily]?$" . tuareg-mode)
                        ("\\.topml$" . tuareg-mode))
                      auto-mode-alist)))
(use-package merlin
  ;; note: git clone https://github.com/ocaml/merlin to ~/.emacs.d/bootleg
  :load-path "~/.emacs.d/bootleg/merlin/emacs/"
  :config
  (setq merlin-completion-with-doc t)

  ;; Make company aware of merlin
  (with-eval-after-load 'company
    (add-hook 'merlin-mode-hook 'company-mode)
    (add-to-list 'company-backends 'merlin-company-backend))
   ;; Enable auto-complete
   (setq merlin-use-auto-complete-mode 'easy)
   ;; Use opam switch to lookup ocamlmerlin binary
   (setq merlin-command 'opam)
   (setq merlin-error-after-save nil)
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
  ;; note: git clone https://github.com/diml/utop to ~/.emacs.d/bootleg
  :load-path "~/.emacs.d/bootleg/utop/src/top"
  :hook
  (tuareg-mode . utop-minor-mode)
  (reason-mode . utop-minor-mode))


(provide 'init-ocaml)
