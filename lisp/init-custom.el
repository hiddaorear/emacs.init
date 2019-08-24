;;; Commentary:
;;
;; Customizations.
;;

;;; Code:

(eval-when-compile
  (require 'init-const))

(defgroup shixia nil
  "shixia Emacs customizations."
  :group 'convenience
  :link '(url-link :tag "Homepage" "https://github.com/seagle0128/.emacs.d"))

(defcustom shixia-logo (expand-file-name "logo.png" user-emacs-directory)
  "Set shixia logo. nil means official logo."
  :group 'shixia
  :type 'string)

(defcustom shixia-full-name "Vincent Zhang"
  "Set user full name."
  :group 'shixia
  :type 'string)

(defcustom shixia-mail-address "seagle0128@gmail.com"
  "Set user email address."
  :group 'shixia
  :type 'string)

(defcustom shixia-proxy "127.0.0.1:1087"
  "Set network proxy."
  :group 'shixia
  :type 'string)

(defcustom shixia-package-archives 'melpa
  "Set package archives from which to fetch."
  :group 'shixia
  :type '(choice
          (const :tag "Melpa" melpa)
          (const :tag "Melpa Mirror" melpa-mirror)
          (const :tag "Emacs-China" emacs-china)
          (const :tag "Netease" netease)
          (const :tag "Tencent" tencent)
          (const :tag "Tuna" tuna)))

(defcustom shixia-theme 'default
  "Set color theme."
  :group 'shixia
  :type '(choice
          (const :tag "Default theme" default)
          (const :tag "Classic theme" classic)
          (const :tag "Dark theme" dark)
          (const :tag "Light theme" light)
          (const :tag "Daylight theme" daylight)
          symbol))

(defcustom shixia-dashboard t
  "Use dashboard at startup or not.
If Non-nil, use dashboard, otherwise will restore previous session."
  :group 'shixia
  :type 'boolean)

(defcustom shixia-lsp 'lsp-mode
  "Set language server."
  :group 'shixia
  :type '(choice
          (const :tag "LSP Mode" 'lsp-mode)
          (const :tag "eglot" 'eglot)
          nil))

(defcustom shixia-chinese-calendar t
  "Use Chinese calendar or not."
  :group 'shixia
  :type 'boolean)

(defcustom shixia-benchmark nil
  "Enable the init benchmark or not."
  :group 'shixia
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
