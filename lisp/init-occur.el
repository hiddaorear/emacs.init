(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)


(defun occurs (&optional arg)
    "Switch to *Occur* buffer, or run `occur'.
  Without a prefix argument, switch to the buffer.
  With a universal prefix argument, run occur again.
  With a numeric prefix argument, run occur with NLINES
  set to that number."
    (interactive "P")
    (if (and (not arg) (get-buffer "*Occur*"))
        (switch-to-buffer "*Occur*")
      (occur (read-from-minibuffer "Regexp: ")
             (if (listp arg) 0 arg))))

(defadvice occur (before occur-before)
   "Allow mutliple calls to occur..."
   (if (string-match "\*Occur\*" (buffer-name))
       (rename-buffer (buffer-name) t)))
(ad-activate 'occur)

(defun occur-mode-clean-buffer ()
   "Removes all commentary from the *Occur* buffer, leaving the unadorned lines."
   (interactive)
   (if (get-buffer "*Occur*")
       (save-excursion
         (set-buffer (get-buffer "*Occur*"))
         (goto-char (point-min))
         (toggle-read-only 0)
         (if (looking-at "^[0-9]+ lines matching \"")
             (kill-line 1))
         (while (re-search-forward "^[ \t]*[0-9]+:"
                                   (point-max)
                                   t)
           (replace-match "")
           (forward-line 1)))
     (message "There is no buffer named \"*Occur*\".")))

(defun my-occur (&optional arg)
 "Make sure to always put occur in a vertical split, into a narrower buffer at the side.
    I didn't like the default horizontal split, 
    nor the way it messes up the arrangement of windows in the frame or 
    the way in which the standard way uses a neighbor window."
  (interactive "P")
  (window-configuration-to-register ?y) ; store whatever frame configuratin we are currently in
  (occur (read-from-minibuffer "Regexp: "))
  (if (occur-check-existence)
      (progn
        (delete-other-windows)
        (split-window-horizontally)
        (enlarge-window-horizontally -10)
        (set-cursor-color "green")))
  (occur-procede-accordingly))

(defun occur-procede-accordingly ()
  "Switch to occur buffer or prevent opening of the occur window if no matches occured."
  (interactive "P")
  (if (not(get-buffer "*Occur*"))
      (message "There are no results.")
    (switch-to-buffer "*Occur*")))

(defun occur-check-existence()
  "Signal the existance of an occur buffer depending on the number of matches."
  (interactive)
  (if (not(get-buffer "*Occur*"))
      nil
    t))

(global-set-key (kbd "C-c o") 'my-occur)

(defun occur-mode-quit ()
  "Quit and close occur window. I want to press 'q' and leave things as they were before in regard of the split of windows in the frame.
This is the equivalent of pressing C-x 0 and reset windows in the frame, in whatever way they were,
plus jumping to the latest position of the cursor which might have been changed by using the links out
of any of the matches found in occur."
  (interactive)
  (switch-to-buffer "*Occur*")
  ;; in order to know where we put the cursor thay might have jumped from qoccur
  (other-window 1)                  ;; go to the main window
  (point-to-register ?1)            ;; store the latest cursor position
  (switch-to-buffer "*Occur*")      ;; go back to the occur window
  (kill-buffer "*Occur*")           ;; delete it
  (jump-to-register ?y)             ;; reset the original frame state
  (set-cursor-color "rgb:ff/fb/53") ;; reset cursor color
  (register-to-point ?1))           ;; re-position cursor

;; some key bindings defined below. Use "p" ans "n" as in dired mode (without Cntrl key) for previous and next line;
;; just show occurrence without leaving the "occur" buffer; use RET to display the line of the given occurrence,
;; instead of jumping to i,t which you do clicking instead;  also quit mode with Ctrl-g.
(define-key occur-mode-map (kbd "q") 'occur-mode-quit)
(define-key occur-mode-map (kbd "C-q") 'occur-mode-quit)
(define-key occur-mode-map (kbd "C-g") 'occur-mode-quit)
(define-key occur-mode-map (kbd "C-RET") 'occur-mode-goto-occurrence-other-window)
(define-key occur-mode-map (kbd "C-<up>") 'occur-mode-goto-occurrence-other-window)
(define-key occur-mode-map (kbd "RET") 'occur-mode-display-occurrence)
(define-key occur-mode-map (kbd "p") 'previous-line)
(define-key occur-mode-map (kbd "n") 'next-line)

(provide 'init-occur)
