(setq command-line-default-directory "~" )

;; Recentf
(recentf-mode 1)
(setq recentf-max-saved-items 100)      ;最近打开文件的最大数量
(setq recentf-auto-cleanup 300)         ;自动清理最近打开文件列表中重复或其他文件的时间间隔 (秒)
(setq recentf-save-file "~/MyEmacs/Configure-File/Recentf/recentf-list") ;最近打开的文件列表
