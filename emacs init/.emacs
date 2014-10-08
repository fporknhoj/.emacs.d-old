(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-safe-themes (quote ("38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(line-number-mode nil)
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Bitstream Vera Sans Mono" :foundry "outline" :slant normal :weight normal :height 83 :width normal)))))











;;Mine

;;Set CxCb to full screen buffer menu
(global-set-key "\C-x\C-b" 'buffer-menu)

;;Remap esc to quit rather than meta 
;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;Set Color Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'ir-black t) ;(load-theme 'solarized-light t)  ;(load-theme 'wombat t) ;(load-theme 'adwaita t) ;(load-theme 'solarized-dark t)

;; Cursor Color
(set-cursor-color "green")
;(add-to-list 'default-frame-alist '(cursor-color . "palegoldenrod"))

;;No Splash
(setq inhibit-splash-screen t)

;;Toggle Truncate Lines off
(setq-default truncate-lines t)
 ;(setq-default global-visual-line-mode t)
 ;(setq longlines-mode t)

;;Turn on desktop save mode
(desktop-save-mode 1)

;;Stop progressively faster mouse scrolling
(setq mouse-wheel-progressive-speed nil)

;;Ess
(add-to-list 'load-path "C:\\Users\\John.Kropf\\AppData\\Roaming\\.emacs.d\\ess\\lisp")
(load "ess-site")

;;Multiple Cursors
(add-to-list 'load-path "C:\\Users\\John.Kropf\\AppData\\Roaming\\.emacs.d\\multiple-cursors")
(require 'multiple-cursors)


;;Comment Region 
(global-set-key (kbd "C-c C-c") 'comment-region)


















;; My Macros


;; Comment/Uncomment Line
(defun my-comment-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-set-key (kbd "C-c c") 'my-comment-line)

;; Fix fucking sql queries that are all on one line 
(defun fix-sql-format (start end)
  "make sql readable"
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)

    (goto-char (point-min))
    (while (search-forward "," nil t) (replace-match " ,\n" nil t))

    (goto-char (point-min))
    (while (search-forward "AND " nil t) (replace-match "\n AND " nil t))

    (goto-char (point-min))
    (while (search-forward "SELECT " nil t) (replace-match "SELECT \n" nil t))

    (goto-char (point-min))
    (while (search-forward "WHERE " nil t) (replace-match "WHERE \n" nil t))

    (goto-char (point-min))
    (while (search-forward "INNER JOIN" nil t) (replace-match "\nINNER JOIN \n" nil t))

    (goto-char (point-min))
    (while (search-forward "ON " nil t) (replace-match "\nON \n" nil t))

    (goto-char (point-min))
    (while (search-forward "FROM " nil t) (replace-match "FROM \n" nil t))

    (goto-char (point-min))
    (while (search-forward "LEFT JOIN " nil t) (replace-match "\nLEFT JOIN \n" nil t))

    (goto-char (point-min))
    (while (search-forward "HAVING " nil t) (replace-match "HAVING \n" nil t))

    (goto-char (point-min))
    (while (search-forward "INTO " nil t) (replace-match "\nINTO \n" nil t))

    (goto-char (point-min))
    (while (search-forward "GROUP BY " nil t) (replace-match "GROUP BY \n" nil t))

    (goto-char (point-min))
    (while (search-forward "ORDER BY" nil t) (replace-match "ORDER BY \n" nil t))
    ) )

(defun my-align-assignments ()

  (interactive)
  (save-excursion
    (let ((markers ())           ;retain all "=" positions here.
          (col-offsets ())       ;corresponding column offsets
          (longest-offset 0))
      (unwind-protect
          (flet
              ((examine-current-line ()
                 ;; Return the position of "=" if the current
                 ;; line looks like an assignment.  Otherwise,
                 ;; return nil.  Point is not moved.
                 (assert (bolp))
                 (when (looking-at "\\(?:\\s-\\|\\sw\\|\\s_\\|\\s.\\)*\\(=\\)")
                   (push (copy-marker (match-beginning 1)) markers)
                   (let ((col-offset (- (match-beginning 1) (point))))
                     (callf max longest-offset col-offset)
                     (push col-offset col-offsets)
                     t))))
            (forward-line 0)
            (examine-current-line)
            ;; if the first line did not match, it doesn't tell us anything: a
            ;; user can launch the command from the following line.
            (loop 
             do
             (when (= (forward-line -1) -1) (return)) ;reached (point-min)
             (unless (examine-current-line) (return)))
            ;; okay, now we have longest-offset and know how many spaces to put
            ;; at each marker
            (loop
             for marker in markers
             for col-offset in col-offsets
             do
             (goto-char marker)
             (insert-char ?\s (- longest-offset col-offset))))
        (dolist (m markers)
          (set-marker m nil))))))

(defun my-r-align-assignments ()

  (interactive)
  (save-excursion
    (let ((markers ())           ;retain all "=" positions here.
          (col-offsets ())       ;corresponding column offsets
          (longest-offset 0))
      (unwind-protect
          (flet
              ((examine-current-line ()
                 ;; Return the position of "=" if the current
                 ;; line looks like an assignment.  Otherwise,
                 ;; return nil.  Point is not moved.
                 (assert (bolp))
                 (when (looking-at "\\(?:\\s-\\|\\sw\\|\\s_\\|\\s.\\)*\\(<-\\)")
                   (push (copy-marker (match-beginning 1)) markers)
                   (let ((col-offset (- (match-beginning 1) (point))))
                     (callf max longest-offset col-offset)
                     (push col-offset col-offsets)
                     t))))
            (forward-line 0)
            (examine-current-line)
            ;; if the first line did not match, it doesn't tell us anything: a
            ;; user can launch the command from the following line.
            (loop 
             do
             (when (= (forward-line -1) -1) (return)) ;reached (point-min)
             (unless (examine-current-line) (return)))
            ;; okay, now we have longest-offset and know how many spaces to put
            ;; at each marker
            (loop
             for marker in markers
             for col-offset in col-offsets
             do
             (goto-char marker)
             (insert-char ?\s (- longest-offset col-offset))))
        (dolist (m markers)
          (set-marker m nil))))))


;; I know that string is in my Emacs somewhere!
(require 'cl)
(defcustom search-all-buffers-ignored-files (list (rx-to-string '(and bos (or ".bash_history" "TAGS") eos)))
  "Files to ignore when searching buffers via \\[search-all-buffers]."
  :type 'editable-list)

(require 'grep)
(defun search-all-buffers (regexp prefix)
  "Searches file-visiting buffers for occurence of REGEXP.  With
prefix > 1 (i.e., if you type C-u \\[search-all-buffers]),
searches all buffers."
  (interactive (list (grep-read-regexp)
                     current-prefix-arg))
  (message "Regexp is %s; prefix is %s" regexp prefix)
  (multi-occur
   (if (member prefix '(4 (4)))
       (buffer-list)
     (remove-if
      (lambda (b) (some (lambda (rx) (string-match rx  (file-name-nondirectory (buffer-file-name b)))) search-all-buffers-ignored-files))
      (remove-if-not 'buffer-file-name (buffer-list))))

   regexp))

(global-set-key [f7] 'search-all-buffers)


