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

;; grammar highlight
(global-font-lock-mode t)

;; highlight parenthense
(show-paren-mode t)
(setq show-paren-style 'parenthesse)

(setq-default                   ; 使用空格缩进
        indent-tabs-mode nil    ; t 使用 TAB 作格式化字符  nil 使用空格作格式化字符
        tab-always-indent nil
        tab-width 4)
(setq c-default-style "linux" c-basic-offset 4) ;; parentheses not retarct
;;(setq c-default-style "ellemtel" c-basic-offset 4)
(setq tab-width 4 indent-tabs-mode nil)


(setq default-directory "~")

(global-auto-revert-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(recentf-mode 1)
(setq recentf-max-menu-items 25)


(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

;; ANSI color Shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;; * max
(setq max-lisp-eval-depth   1000        ;lisp最大执行深度   500
      max-specpdl-size      10000       ;最大容量           1000
      kill-ring-max         1024        ;kill ring          60
      undo-outer-limit      5000000     ;撤销限制           12000000
      ark-ring-max          1024        ;mark ring          16
)


;; * Common
(setq message-log-max         t        ;完整的 message-log
      inhibit-startup-message t        ;关闭起动时闪屏
      initial-scratch-message          ;初始内容
      (purecopy "
;; In sandbox "))

;; make backup to a designated dir, mirroring the full path
(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
  If the new path's directories does not exist, create them."
  (let* (
         (backupRootDir "~/.emacs.d/emacs-backup/")
         (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath ))
         ; remove Windows driver letter in path, for example, “C:”
         (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
         )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
    )
  )

  (message "Deleting old backup files...")
  (let ((week (* 60 60 24 7))
        (current (float-time (current-time))))
    (dolist (file (directory-files temporary-file-directory t))
      (when (and (backup-file-name-p file)
                 (> (- current (float-time (fifth (file-attributes file))))
                    week))
        (message "%s" file)
        (delete-file file))))

  (setq make-backup-file-name-function 'my-backup-file-name)

  ;; Save all tempfiles in $TMPDIR/emacs$UID/
  (defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
  (setq backup-directory-alist
        `((".*" . ,emacs-tmp-dir)))
  (setq auto-save-file-name-transforms
        `((".*" ,emacs-tmp-dir t)))
  (setq auto-save-list-file-prefix
        emacs-tmp-dir)

  (setq create-lockfiles nil)

;; Uniquify
(setq uniquify-buffer-name-style 'post-forward-angle-brackets) ;反方向的显示重复的Buffer名字
(setq uniquify-separator "/")                                  ;分隔符
(setq uniquify-after-kill-buffer-p t)                          ;删除重复名字的Buffer后重命名

(set-face-attribute 'fringe nil :foreground (background-color-at-point))


;; bookmark
(defadvice bookmark-jump (after bookmark-jump activate)
  (let ((latest (bookmark-get-bookmark bookmark)))
    (setq bookmark-alist (delq latest bookmark-alist))
    (add-to-list 'bookmark-alist latest)))

(defun bookmark-to-abbrevs ()
   "Create abbrevs based on `bookmark-alist'."
   (dolist (bookmark bookmark-alist)
   (let* ((name (car bookmark))
          (file (bookmark-get-filename name)))
     (define-abbrev global-abbrev-table name file))))

(setq bookmark-save-flag 1) ; everytime bookmark is changed, automatically save it
(setq bookmark-save-flag t) ; save bookmark when emacs quits
(setq bookmark-save-flag nil) ; never auto save.


(provide 'init-better-defaults)
