(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-safe-themes (quote ("6cf0e8d082a890e94e4423fc9e222beefdbacee6210602524b7c84d207a5dfb5" "7ed4054a1312e46f96022831bbe031cf1a8597a2acba36af39d60fa9d14bec6b" "7f14fad67d7ac8d0555bd5a1fd1a429ce2dd37162c4e2dc7ae501f54bad1273a" "12dd37432bb454355047c967db886769a6c60e638839405dad603176e2da366b" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "1989847d22966b1403bab8c674354b4a2adf6e03e0ffebe097a6bd8a32be1e19" "9bcb8ee9ea34ec21272bb6a2044016902ad18646bd09fdd65abae1264d258d89" "3c9d994e18db86ae397d077b6324bfdc445ecc7dc81bb9d528cd9bba08c1dac1" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "bf648fd77561aae6722f3d53965a9eb29b08658ed045207fe32ffed90433eb52" "53c542b560d232436e14619d058f81434d6bbcdc42e00a4db53d2667d841702e" "ce79400f46bd76bebeba655465f9eadf60c477bd671cbcd091fe871d58002a88" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" "38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(python-indent-offset 2)
 '(save-place t nil (saveplace))
 '(sql-connection-alist (quote (("PROS" (sql-product (quote ms)) (sql-user "") (sql-server "HUBDWPROD20") (sql-database "PROS")))))
 '(tool-bar-mode nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;  Mine  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(scroll-bar-mode -1)

;;Title Bar
(setq frame-title-format "%b")

;;Make able to overwrite selection
(delete-selection-mode 1)

;;server-start
;(server-start)

;;ELPA

;(add-to-list 'package-archives '("melpa" , "http://melpa.milkbox.net/packages/"))

;;Random
;http://stackoverflow.com/questions/21880950/what-combination-of-python-mode-ipython-ipython-el-versions-releases-and-ini
(windmove-default-keybindings 'shift)

;;Set CxCb to full screen buffer menu
(global-set-key "\C-x\C-b" 'buffer-menu)

;;Remap esc to quit rather than meta 
;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Cursor Color
;(set-cursor-color "green")
;(add-to-list 'default-frame-alist '(cursor-color . "palegoldenrod"))

;;No Splash
(setq inhibit-splash-screen t)

;;Toggle Truncate Lines off
(setq-default truncate-lines t)
 ;(setq-default global-visual-line-mode t)
 ;(setq longlines-mode t)

;;Turn on desktop save mode
;(desktop-save-mode 1)
(desktop-save-mode 1)
(setq desktop-save t)
(setq desktop-load-locked-desktop t)
(setq desktop-base-lock-name
(convert-standard-filename (format ".emacs.desktop.lock-%d" (emacs-pid))))
(setq desktop-dirname user-emacs-directory)

;;Stop progressively faster mouse scrolling
(setq mouse-wheel-progressive-speed nil)

;;Ess & iPython
(add-to-list 'load-path "C:\\Users\\John.Kropf\\AppData\\Roaming\\.emacs.d\\installed_packages\\ess\\lisp")
(setq ess-use-auto-complete t)
(load "ess-site")

;; trying ipython tab completion: that works :)
(setq
 python-shell-interpreter "c:\\python\\wp2\\python-2.7.6\\python.exe"
 python-shell-interpreter-args "-i c:\\python\\wp2\\python-2.7.6\\Scripts\\ipython-script.py"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
  python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
  python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
     )

;(setq ipython-command "C:\\Python\\wp2\\python-2.7.6\\Scripts\\ipython.exe")
;(require 'ipython)

;;Multiple Cursors
(add-to-list 'load-path "C:\\Users\\John.Kropf\\AppData\\Roaming\\.emacs.d\\installed_packages\\multiple-cursors")
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/mark-next-word-like-this)
(global-set-key (kbd "C-,") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-,") 'mc/mark-all-like-this)
(global-set-key (kbd "C-.") 'mc/mark-more-like-this-extended) 

;;Powerline
(add-to-list 'load-path "C:\\Users\\John.Kropf\\AppData\\Roaming\\.emacs.d\\installed_packages")
(require 'powerline)

;;SQL Indent
(add-to-list 'load-path "C:\\Users\\John.Kropf\\AppData\\Roaming\\.emacs.d\\installed_packages")
(require 'sql-indent)
(require 'sql-transform)
(require 'tsql-indent)
(require 'plsql)

;; SQL setup
(setq sql-ms-program "osql")

;;Aspell
(add-to-list 'exec-path "c:\\Program Files\\Aspell\\bin\\")
(setq ispell-program-name "aspell")
;(setq ispell-personal-dictionary "C:\\Program Files\\Aspell\\dict")
(require 'ispell)
(global-set-key (kbd "<f8>") 'flyspell-mode)
(global-set-key (kbd "C-<f8>") 'ispell-word)

;;Comment Region 
(global-set-key (kbd "C-c C-c") 'comment-region)

;; autopair perens
;(electric-pair-mode 1)

;; show perens mode 
;(show-paren-mode 1)
;(setq show-paren-delay 25)
 (show-paren-mode 0)

;;move backup file storage to temporary directory in the OS 
; from http://emacsredux.com/blog/2013/05/09/keep-backup-and-auto-save-files-out-of-the-way/
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; new files open in new window
;(setq pop-up-frames t)

;;font 
;(set-face-attribute 'default t :font  "Nitti Light WM2")
;(set-face-attribute 'default t :height 120)
;(set-default-font "Nitti Light WM2 10")
;(set-default-font "ProFontWindows 10")
;(set-default-font "M+ 1mn Regular 9")
;(set-default-font "Everson Mono 12")
;(set-default-font "Consolas 11")
;(set-default-font "Anonymous Pro Minus 10")
;(set-default-font "Prestige Becker 11")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "ProggyCleanTT CE" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(mode-line ((t (:foreground "#333333" :background "#ffbbee" :box nil)))))
; '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))








;;Set Color Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'charcoal-black t)(load-theme 'dark-font-lock t);(load-theme 'tango);(load-theme 'phoenix-dark-pink t);(load-theme 'spacegray t);(load-theme 'dichromacy t);(load-theme 'firebelly t);(load-theme 'tango t);(load-theme 'zenburn t);(load-theme 'brin t);(load-theme 'dichromacy t);(load-theme 'solarized-dark t);(load-theme 'mccarthy t);(load-theme 'ir-black t) ;(load-theme 'solarized-light t)  ;(load-theme 'wombat t) ;(load-theme 'adwaita t) ;(load-theme 'solarized-dark t)

;key bindings
(global-set-key  [f7] 'search-all-buffers)
(global-set-key  [f5] 'replace-string)
(global-set-key  [f6] 'replace-regexp)
(global-set-key  [f9] 'execute-extended-command)
(global-set-key [f12] 'keyboard-escape-quit)
(global-set-key "\C-x\C-z" 'repeat-complex-command)

;;Indents
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(add-hook 'python-mode-hook
	  (function (lambda ()
		      (setq indent-tabs-mode nil
			    tab-width 2))))

;;Python Newline and indent
(add-hook 'python-mode-hook '(lambda ()
    (local-set-key (kbd "RET") 'newline-and-indent)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;ELPA Package Management;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; My Macros

(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the inverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000)) ; 90002000 is just random. you can use `most-positive-fixnum'
    (fill-paragraph nil)))

(defun unfill-region (start end)
  "Replace newline chars in region by single spaces.
This command does the inverse of `fill-region'."
  (interactive "r")
  (let ((fill-column 90002000))
    (fill-region start end)))

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
    (while (search-forward "," nil t) (replace-match ",\n" nil t))

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

(defun fix-trend-analysis ()
  (interactive)
  (replace-string "$" "")
  (beginning-of-buffer)
  (replace-string "`" "")
  (beginning-of-buffer)
  (replace-string "\ntau = " "\t")
  (beginning-of-buffer)
  (replace-string ", 2-sided pvalue =" "\t")
  (beginning-of-buffer)
  (replace-string "\n\n" "\n")
  (beginning-of-buffer)
)






