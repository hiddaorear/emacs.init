;; bookmark
(setq inhibit-splash-screen t)
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")

;; setq
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq recentf-max-menu-item 10)

;; theme
(load-theme 'solarized-light t)
;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)
;; Don't change the font for some headings and titles
(setq solarized-use-variable-pitch nil)
;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)
;; Use less bolding
(setq solarized-use-less-bold t)
;; Use more italics
(setq solarized-use-more-italic t)
;; Use less colors for indicators such as git:gutter, flycheck and similar
(setq solarized-emphasize-indicators nil)
;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; mode-line
(setq x-underline-at-descent-line t)
(setq x-use-underline-position-properties nil)
(setq underline-minimum-offset 4)


;; font
;; Setting English Font
(set-face-attribute 'default nil :font "Monaco 14")

(setq frame-title-format "Siegel emacs@%b")

;; line and column
(column-number-mode t) ;; column number on bar
(setq default-fill-column 80) ;; max column is 66
(global-linum-mode 1) ;; line number on margin
(line-number-mode t) ;; line number on bar

;; bar display funcion
(which-function-mode t)

;; time display
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")


(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(provide 'init-ui)
