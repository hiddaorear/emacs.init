;; code UTF-8
(set-language-environment "UTF-8")
(set-locale-environment "UTF-8")
(setq current-language-environment "UTF-8") ;; set unicode environment
(setq locale-coding-system 'utf-8) ;; set unicode environment
(setq default-process-coding-system 'uft-8) ;; process coding
(setq file-name-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8) ;; terminal coding
(set-selection-coding-system 'utf-8) ;; selecion coding
(set-keyboard-coding-system 'utf-8) ;; keboard coding

;; close gun start and buffer words and reminder voice
(setq inhibit-startup-message t)
(setq guns-inhibit-startup-message t)
(setq inhibit-scratch-message "") ;; inhibit buffer words
(setq ring-bell-funcion 'ignore) ;; inhibit reminder voice

;; grammar highlight
(global-font-lock-mode t)

;; highlight parenthense
(show-paren-mode t)
(setq show-paren-style 'parenthesse)

(setq-default indent-tabs-mode nil) ;; forbidden tab retarct
(setq-default tab-width 4) ;; set tab 4
(setq c-default-style "linux" c-basic-offset 4) ;; parentheses not retarct
;;(setq c-default-style "ellemtel" c-basic-offset 4)
(setq tab-width 4 indent-tabs-mode nil)


(setq default-directory "~/Github/")

(global-auto-revert-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq undo-outer-limit 100000) ;; undo

(fset 'yes-or-no-p 'y-or-n-p)

(recentf-mode 1)			
(setq recentf-max-menu-items 25)


(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

;; ANSI color Shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

(provide 'init-better-defaults)
