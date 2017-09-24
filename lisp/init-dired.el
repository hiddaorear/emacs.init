;; dirc
(require 'dired)
(require 'dired+)

;; copy to another window with C
(setq dired-dwim-target t)
(setq dired-listing-switches "-alh")
(defun dired-directory-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))
(add-hook 'dired-after-readin-hook 'dired-directory-sort)

(defun my-dired-backward ()
  "Go back to the parent directory (..), and the cursor will be moved to where
          the previous directory."
  (interactive)
  (let* ((DIR (buffer-name)))
    (if (equal DIR "*Find*")
        (quit-window t)
      (progn (find-alternate-file "..")
             (re-search-forward DIR nil :no-error)
             (revert-buffer)))))
(define-key dired-mode-map (kbd "q") 'my-dired-backward)

;; 使用 f 搜尋目前目錄
(define-key dired-mode-map "f" 'dired-find-name-in-current-directory)
(defun dired-find-name-in-current-directory ()
  (interactive)
  (find-name-dired default-directory
                   (format "*%s*" (read-from-minibuffer "Pattern: ")))
  (set-buffer-multibyte t))
(setq find-name-arg "-iname")
;; 修正*Find*裡的中文亂碼問題
(setq find-ls-option '("-print0 | xargs -0 ls -ald" . ""))

;; 按 s 排序檔案，會先問你要根據什麼屬性排序，而且紀錄下排序狀態，不會
;; 跨 buffer 就不見了。
(defun dired-sort-size ()
  "Dired sort by size."
  (interactive) (dired-sort-other (concat dired-listing-switches "S")))
(defun dired-sort-extension ()
  "Dired sort by extension."
  (interactive) (dired-sort-other (concat dired-listing-switches "X")))
(defun dired-sort-ctime ()
  "Dired sort by create time."
  (interactive) (dired-sort-other (concat dired-listing-switches "ct")))
(defun dired-sort-utime ()
  "Dired sort by access time."
  (interactive) (dired-sort-other (concat dired-listing-switches "ut")))
(defun dired-sort-time ()
  "Dired sort by time."
  (interactive) (dired-sort-other (concat dired-listing-switches "t")))
(defun dired-sort-name ()
  "Dired sort by name."
  (interactive) (dired-sort-other (concat dired-listing-switches "")))
(defvar v-dired-sort 'name)
(defun dired-sort-and-remember ()
  ""
  (interactive)
  (setq v-dired-sort
        (intern
         (completing-read "Sort by: " '(name size extension ctime utime time) nil t
                          (cond ((eq v-dired-sort 'name) "time")
                                ((eq v-dired-sort 'time) "name")
                                ((eq v-dired-sort 'size) "name")
                                (t nil)))))
  (dired-sort-auto-apply))
(defun dired-sort-auto-apply ()
  (cond ((eq v-dired-sort 'name) (dired-sort-name))
        ((eq v-dired-sort 'size) (dired-sort-size))
        ((eq v-dired-sort 'extenstion) (dired-sort-extenstion))
        ((eq v-dired-sort 'ctime) (dired-sort-ctime))
        ((eq v-dired-sort 'utime) (dired-sort-utime))
        ((eq v-dired-sort 'time) (dired-sort-time))))
(add-hook 'dired-mode-hook 'dired-sort-auto-apply)
(define-key dired-mode-map "s" 'dired-sort-and-remember)


(provide 'init-dired)
