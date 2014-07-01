(add-to-list 'load-path "~/.emacs.d/")

 ;; (require 'load-directory)
 ;; (load-directory "~/.emacs.d/")
(load-file "~/.emacs.d/boxquote.el")
(load-file "~/.emacs.d/title.el")
(load-file "~/.emacs.d/latex_macros.el")
(load-file "~/.emacs.d/rainbow-delimiters.el")
(load-file "~/.emacs.d/external_scripts.el")
(load-file "~/.emacs.d/jump-lines.el")
(load-file "~/.emacs.d/iswitch.el")
;; (load-file "~/.emacs.d/indent-guide.el")
(add-to-list 'load-path "~/.emacs.d/rust-mode/")

(require 'indent-guide)
(require 'rainbow-delimiters)
(require 'linum-relative)
(require 'misc)
(require 'rust-mode)

;; ----------- [ Minor modes
(indent-guide-global-mode)
(which-function-mode)
(column-number-mode)
(show-paren-mode 1)
;; (ido-mode 1)
(show-paren-function)
(global-linum-mode)

;; Indent options
;;(set-face-background 'indent-guide-face "dimgray")

;; ----------- [ Hooks
(add-to-list 'auto-mode-alist '("\\.F90\\'" . f90-mode))
(add-to-list 'auto-mode-alist '("\\.par\\'" . makefile-mode))
(add-hook 'c-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'f90-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'java-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'python-mode-hook (lambda () (hs-minor-mode 1)))



;; ----------- [ Bindings

(global-set-key (kbd "<f2>") 'toggle-truncate-lines)
(global-set-key (kbd "C-x 9") 'kmacro-insert-counter)
(global-set-key (kbd "<C-tab>") 'dabbrev-expand)
(global-set-key (kbd "C-^") 'yank-pop)
(global-set-key (kbd "<backtab>") 'dabbrev-expand)
(global-set-key (kbd "C-x m") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-m") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "C-c s") 'ispell)
(global-set-key (kbd "C-c f") 'add-environ)
(global-set-key (kbd "C-x f") 'find-file)


(global-set-key (kbd "C-x w") 'just-one-space) 
(global-set-key (kbd "C-x g") 'replace-string)
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-S-v") 'clipboard-yank)
(global-set-key (kbd "C-x <right>") 'next-non-emacs-buffer)
(global-set-key (kbd "C-x <left>") 'previous-non-emacs-buffer)

(global-set-key (kbd "C-x n") 'next-non-emacs-buffer)
(global-set-key (kbd "C-x p") 'previous-non-emacs-buffer)


(global-set-key (kbd "C-M-f") 'forward-list)
(global-set-key (kbd "C-M-b") 'backward-list)

(global-set-key (kbd "C-M-l") 'linum-mode)

(global-set-key (kbd "C-x l") 'next-non-emacs-buffer)
(global-set-key (kbd "C-x j") 'previous-non-emacs-buffer)

(global-set-key (kbd "C-c w") 'count-words-region)
(global-set-key (kbd "C-x C-v") 'org-mobile-push)
(global-set-key (kbd "C-c t") 'add-title)

;; (global-set-key (kbd "C-o") 'kill-line)
;; (global-set-key (kbd "C-h") 'kill-line)
;; (global-set-key (kbd "C-c C-k") 'kill-line)
;; (global-set-key (kbd "C-c k") 'kill-line)

;; (global-set-key (kbd "C-j") 'backward-word)
;; (global-set-key (kbd "C-l") 'forward-word)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

;; (global-set-key (kbd "M-b") 'backward-char)
;; (global-set-key (kbd "M-f") 'forward-char)
;; (global-set-key (kbd "C-b") 'backward-word)
;; (global-set-key (kbd "C-f") 'forward-word)
;; (global-set-key (kbd "M-k") 'next-line)
;; (global-set-key (kbd "M-i") 'previous-line)


;; (global-set-key (kbd "C-j") 'move-to-column)
(global-set-key (kbd "C-l") 'goto-line) 
(global-set-key (kbd "C-d") 'backward-kill-word)


(eval-after-load "cc-mode"
  '(progn
     (define-key c++-mode-map (kbd "C-d") 'backward-kill-word)
     (define-key c++-mode-map (kbd "M-d") 'kill-word)))


(global-set-key (kbd "<right>") 'ignore)
(global-set-key (kbd "<up>") 'ignore)
(global-set-key (kbd "<down>") 'ignore)
(global-set-key (kbd "<left>") 'ignore)

(global-set-key (kbd "C-<right>") 'ignore)
(global-set-key (kbd "C-<up>") 'ignore)
(global-set-key (kbd "C-<down>") 'ignore)
(global-set-key (kbd "C-<left>") 'ignore)



(global-set-key (kbd "C-c m") 'move-middle-line)
(global-set-key (kbd "C-c C-m") 'move-middle-line)

(global-set-key (kbd "C-x C-l") 'move-middle-line)


;; ----------- [ Datecount
 (defun insert-current-date () (interactive)
    (insert (shell-command-to-string "echo -n $(date +%B\ %e,\ %Y)")))

;; ----------- [ Variables
(setq-default c-basic-offset 4)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")


;; ----------- [ Colors
(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))
(set-face-foreground 'font-lock-comment-face "magenta")
(set-face-foreground 'font-lock-keyword-face "green")


;; ----------- [ Ignore emacs buffers
(defun emacs-buffer-p (name)
  (string-match-p "\\*.*\\*" name))

(defun next-non-emacs-buffer (&optional original)
  "Similar to next-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (next-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (next-non-emacs-buffer tmp-orig))))

(defun previous-non-emacs-buffer (&optional original)
  "Similar to previous-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (previous-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (previous-non-emacs-buffer tmp-orig))))

(setq 
  ido-save-directory-list-file "~/.emacs.d/cache/ido.last"
  
  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"

     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
  ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
  ido-case-fold  t                 ; be case-insensitive
  
  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)

  ;; ido-enable-flex-matching nil     ; don't try to be too smart
  ido-max-prospects 8              ; don't spam my minibuffer
  ;; ido-confirm-unique-completion t
  ) ; wait for RET, even with unique completion

;; when using ido, the confirmation is rather annoying...
 (setq confirm-nonexistent-file-or-buffer nil)

;; ----------- [ Org mode optinos
(setq org-directory "~/Dropbox")
(setq org-mobile-inbox-for-pull "~/Dropbox/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg/")
(custom-set-variables
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Dropbox/index.org")))
 '(org-mobile-checksum-binary "/usr/bin/shasum")
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg")
 '(org-mobile-force-id-on-agenda-items nil)
 '(org-mobile-inbox-for-pull "~/Dropbox/from-mobile.org")
 '(org-mobile-index-file "~/text.org"))
(setq org-blank-before-new-entry t)


;; ----------- [ Parenthasis matching
(setq show-paren-delay 0)
(require 'paren)
(set-face-background 'show-paren-match-face (face-background 'default))
;; (set-face-foreground 'show-paren-match-face "#def")
(set-face-foreground 'show-paren-match-face "blue")
(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

(defadvice show-paren-function
  (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
	 (matching-text (and cb
			     (char-equal (char-syntax cb) ?\) )
			     (blink-matching-open))))
    (when matching-text (message matching-text))))
 

;; ----------- [ Alignment
(defun align-repeat (start end regexp)
    "Repeat alignment with respect to 
     the given regular expression."
    (interactive "r\nsAlign regexp: ")
    (align-regexp start end 
        (concat "\\(\\s-*\\)" regexp) 1 1 t))

(global-set-key (kbd "C-x C-a") 'align-repeat)
(global-set-key (kbd "C-x t") 'indent-region)

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))


(global-set-key (kbd "C-x C-j C-h") 'java-insert-header)

;; ----------- [ Folding
(global-set-key (kbd "C-c C-a") 'recenter-top-bottom)
(global-set-key (kbd "C-c C-v") 'recenter-top-bottom)
(global-set-key (kbd "C-c C-r") 'compile)
(global-set-key (kbd "C-x ,") 'hs-hide-block)
(global-set-key (kbd "C-x .") 'hs-show-block)
(global-set-key (kbd "C-x <") 'hs-hide-level)
(global-set-key (kbd "C-x >") 'hs-show-all)
(global-set-key (kbd "C-x p") 'replace-string)

;; (global-set-key (kbd "C-j") 'backward-char)
;; (global-set-key (kbd "C-l") 'forward-char)


;; ----------- [ Java headers

(defun Template-LaTex ()
  (interactive)
  (insert-file-contents "~/templates/latex_template.tex"))


(defun Template-Matplotlib ()
  (interactive)
  (insert-file-contents "~/Public/Templates/matplotTEMPLATE.py"))

(defun Template-C ()
  (interactive)
  (insert-file-contents "~/Public/Templates/c.c"))


(defun java-insert-header ()
    (interactive) 
     (insert "   /*   \n    *   \n    *   \n    *   \n    *   \n    *   \n    */"))

;; ----------- [ General Headers
(global-set-key (kbd "C-x C-h") 'make-header) ; [Ctrl]-[x] [Ctrl]-[h]
(global-set-key (kbd "C-x h") 'make-header) ; [Ctrl]-[x] [Ctrl]-[h]


(defun emph ()
  (insert  "\\emph{"))

(defun bf ()
  (insert  "\\textbf{"))




(defun make-header ()
    (interactive) 
    (center-line) 
    (defvar beg (line-beginning-position))
    (goto-char (line-beginning-position))     
    (insert  "------------------------------------------------------------------------\n")
    (goto-char (line-end-position))
    (insert "\n------------------------------------------------------------------------\n")
    (defvar end (line-end-position)))
    ;; (comment-or-uncomment-region beg end))



;; ----------- [ Misc
    (defun count-words-region (start end)
       (interactive "r")
       (save-excursion
          (let ((n 0))
           (goto-char start)
           (while (< (point) end)
             (if (forward-word 1)
                 (setq n (1+ n))))
           (message "Region has %d words" n)
           n)))


(setq default-frame-alist (append (list 
  '(width  . 81)  ; Width set to 81 characters 
  '(height . 40)) ; Height set to 60 lines 
  default-frame-alist)) 

(setq inhibit-startup-message   t)   ; Don't want any startup message 
(setq make-backup-files         nil) ; Don't want any backup files 
(setq auto-save-list-file-name  nil) ; Don't want any .saves files 
(setq auto-save-default         nil) ; Don't want any auto saving 

(setq search-highlight           t) ; Highlight search object 
(setq query-replace-highlight    t) ; Highlight query object 
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening 

(defun my-select-current-line ()
  (interactive)
  (move-beginning-of-line nil)
  (set-mark-command nil)
  (move-end-of-line nil)
  (setq deactivate-mark nil))
 
(global-set-key (kbd "<C-f6>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-f8>") 'enlarge-window-horizontally)
(global-set-key (kbd "<f7>") 'ispell-word)
(global-set-key (kbd "C-S-<f7>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f7>") 'flyspell-buffer)
(global-set-key (kbd "C-<f7>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f7>") 'flyspell-check-next-highlighted-word)

(global-set-key (kbd "<f2>") 'toggle-truncate-lines)


(fset 'date
   "\C-u\C-[!date -\C-?+%D\C-m[\C-[[1;5C\C-[[1;5C\C-[[1;5C]\C-x")

 
;; (define-key map (kbd "C-j") 'backward-word)
;; (define-key map (kbd "C-k") 'forward-paragraph)
;; (define-key map (kbd "C-l") 'forward-word)
;; (define-key map (kbd "C-i") 'backward-paragraph)


;; (global-set-key (kbd "C-f") 'nav-mode)


;; Creating a new menu pane in the menu bar to the right of “Tools” menu

(define-key global-map [menu-bar tools] nil)
(define-key global-map [menu-bar file] nil)
(define-key global-map [menu-bar edit] nil)
(define-key global-map [menu-bar options] nil)
(define-key global-map [menu-bar buffer] nil)

(define-key-after
  global-map
  [menu-bar mymenu]
  (cons
   "     a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p    q    r    s    t    u    v    w    x    y    z"
   (make-sparse-keymap "hoot hoot"))
  'tools )

(global-set-key (kbd "C-M-f") 'jump-forward-column)
(global-set-key (kbd "C-M-b") 'jump-backward-column)



(global-set-key (kbd "C-M-n") 'jump-forward-column)
(global-set-key (kbd "C-M-p") 'jump-backward-column)
(global-set-key (kbd "C-c b") 'switch-to-buffer)

(load-file "~/.emacs.d/hook-overrides.el")


(fset 'org-log
   "\C-j\C-p**** \C-u\C-c!\C-m ")

(global-set-key (kbd "C-c n") 'org-log)
