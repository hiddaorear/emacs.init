;;; Commentary:
;;
;; Customizations.
;;

;;; Code:

(eval-when-compile
  (require 'init-const))

(defgroup ginkgo nil
  "ginkgo Emacs customizations."
  :group 'convenience
  :link '(url-link :tag "Homepage" "https://github.com/hiddaorear/emacs.init"))

(defcustom ginkgo-logo (expand-file-name "logo.png" user-emacs-directory)
  "Set ginkgo logo. nil means official logo."
  :group 'ginkgo
  :type 'string)

(defcustom ginkgo-full-name "shixia ginkgo"
  "Set user full name."
  :group 'ginkgo
  :type 'string)

(defcustom ginkgo-mail-address "hiddaorear@outlook.com"
  "Set user email address."
  :group 'ginkgo
  :type 'string)

(defcustom ginkgo-proxy "127.0.0.1:1087"
  "Set network proxy."
  :group 'ginkgo
  :type 'string)

(defcustom ginkgo-package-archives 'melpa
  "Set package archives from which to fetch."
  :group 'ginkgo
  :type '(choice
          (const :tag "Melpa" melpa)
          (const :tag "Melpa Mirror" melpa-mirror)
          (const :tag "Emacs-China" emacs-china)
          (const :tag "Netease" netease)
          (const :tag "Tencent" tencent)
          (const :tag "Tuna" tuna)))

(defcustom ginkgo-theme 'default
  "Set color theme."
  :group 'ginkgo
  :type '(choice
          (const :tag "Default theme" default)
          (const :tag "Classic theme" classic)
          (const :tag "Dark theme" dark)
          (const :tag "Light theme" light)
          (const :tag "Daylight theme" daylight)
          symbol))

(defcustom ginkgo-dashboard t
  "Use dashboard at startup or not.
If Non-nil, use dashboard, otherwise will restore previous session."
  :group 'ginkgo
  :type 'boolean)

(defcustom ginkgo-lsp 'lsp-mode
  "Set language server."
  :group 'ginkgo
  :type '(choice
          (const :tag "LSP Mode" 'lsp-mode)
          (const :tag "eglot" 'eglot)
          nil))

(defcustom ginkgo-chinese-calendar t
  "Use Chinese calendar or not."
  :group 'ginkgo
  :type 'boolean)

(defcustom ginkgo-benchmark nil
  "Enable the init benchmark or not."
  :group 'ginkgo
  :type 'boolean)

;; Load `custom-file'
;; If it doesn't exist, copy from the template, then load it.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(let ((custom-template-file
       (expand-file-name "custom-template.el" user-emacs-directory)))
  (if (and (file-exists-p custom-template-file)
           (not (file-exists-p custom-file)))
      (copy-file custom-template-file custom-file)))

(if (file-exists-p custom-file)
    (load custom-file))

;; Load `custom-post.el'
;; Put personal configurations to override defaults here.
(add-hook 'after-init-hook
          (lambda ()
            (let ((file
                   (expand-file-name "custom-post.el" user-emacs-directory)))
              (if (file-exists-p file)
                  (load file)))))

(provide 'init-custom)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; custom.el ends here
