;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("user42" . "http://download.tuxfamily.org/user42/elpa/packages/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
(package-initialize)
;;(package-refresh-contents)

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
                      ;; --- Auto-completion ---
                      company
                      ;; --- Better Editor ---
                      helm
                      which-key
                      avy
                      dired+
                      hungry-delete
                      swiper
                      counsel
                      smartparens
                      flycheck
                      undo-tree
                      exec-path-from-shell
                      ;; --- Vim ---
                      evil-leader
                      evil-nerd-commenter
                      evil
                      evil-anzu
                      ;; --- Major Mode ---

                      ;; --- Web ---
                      ;;web-mode
                      js2-mode
                      less-css-mode
                      rjsx-mode
                      ;; --- Minor Mode ---
                      nodejs-repl
                      ;; --- Themes ---
                      solarized-theme
                      powerline
                      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'require-packages)
