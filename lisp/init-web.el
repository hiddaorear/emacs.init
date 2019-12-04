;;; Commentary:
;;
;; Web configurations.
;;

;;; Code:

(eval-when-compile
  (require 'init-custom))

(use-package css-mode
  :ensure nil
  :init (setq css-indent-offset 2))

;; SCSS mode
(use-package scss-mode
  :init
  ;; Disable complilation on save
  (setq scss-compile-at-save nil))

;; New `less-css-mde' in Emacs 26
(unless (fboundp 'less-css-mode)
  (use-package less-css-mode))

;; CSS eldoc
(use-package css-eldoc
  :commands turn-on-css-eldoc
  :hook ((css-mode scss-mode less-css-mode) . turn-on-css-eldoc))

;; JSON mode
(use-package json-mode
             :mode(("\\.json\\'" . json-mode)))

;; JavaScript
(use-package js2-mode
  :defines flycheck-javascript-eslint-executable
  :mode (("\\.js\\'" . js2-mode))
  :interpreter (("node" . js2-mode))
  :hook ((js2-mode . js2-imenu-extras-mode)
        (js2-mode . js2-highlight-unused-variables-mode))
  :config
  (setq js2-strict-missing-semi-warning nil)
  ;; Use default keybindings for lsp
  (when ginkgo-lsp
    (unbind-key "M-." js2-mode-map))

  (with-eval-after-load 'flycheck
    (when (or (executable-find "eslint_d")
              (executable-find "eslint")
              (executable-find "jshint"))
      (setq js2-mode-show-strict-warnings nil))
    (when (executable-find "eslint_d")
      ;; https://github.com/mantoni/eslint_d.js
      ;; npm -i -g eslint_d
      (setq flycheck-javascript-eslint-executable "eslint_d")))

  (use-package js2-refactor
    :diminish
    :hook (js2-mode . js2-refactor-mode)
    :config (js2r-add-keybindings-with-prefix "C-c C-m")))

(use-package rjsx-mode
  :ensure t
  :mode(("\\.jsx\\'" . rjsx-mode))
  :init
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  )

(use-package tide
  :ensure t
  :mode(("\\.ts\\'" . typescript-mode))
  :init
  (add-hook 'typescript-mode-hook 'tide-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode)
  :config
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save-mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; Major mode for editing web templates
(use-package web-mode
  :mode "\\.\\(phtml\\|php|[gj]sp\\|as[cp]x\\|erb\\|djhtml\\|html?\\|hbs\\|ejs\\|jade\\|swig\\|tm?pl\\|vue\\)$"
  :config
  (setq web-mode-css-indent-offset 2))

;; Format HTML, CSS and JavaScript/JSON
;; Install: npm -g install prettier
(use-package prettier-js
             :ensure t
             :config
             (flycheck-mode +1)
             (setq flycheck-check-syntax-automatically '(save-mode-enabled))

             (setq prettier-js-args '(
                                      "--trailing-comma" "es5"
                                      "--single-quote" "true"
                                      "--print-width" "120"
                                      "--tab-width" "4"
                                      "--use-tabs" "false"
                                      "--jsx-bracket-same-line" "false"
                                      "--stylelint-integration" "true"
                                      "--semi" "false"
                                      ))
  )

(setq tab-always-indent 'complete)

(provide 'init-web)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-web.el ends here
