
(semantic-mode 1)

(add-to-list 'load-path "~/.emacs.d/")
 ;; (require 'load-directory)
 ;; (load-directory "~/.emacs.d/")
(load-file "~/.emacs.d/boxquote.el")
(load-file "~/.emacs.d/cscripts.el")

(load-file "~/.emacs.d/hooks.el")

(load-file "~/.emacs.d/title.el")
(load-file "~/.emacs.d/latex_macros.el")
(load-file "~/.emacs.d/rainbow-delimiters.el")
(load-file "~/.emacs.d/external_scripts.el")
(load-file "~/.emacs.d/jump-lines.el")
(load-file "~/.emacs.d/iswitch.el")
(add-to-list 'load-path "~/.emacs.d/rust-mode/")

(load-file "~/.emacs.d/header2.el")


(require 'rainbow-delimiters)
(require 'linum-relative)
(require 'misc)
(require 'rust-mode)


;; ----------- [ Hooks
(add-to-list 'auto-mode-alist '("\\.F90\\'" . f90-mode))
(add-to-list 'auto-mode-alist '("\\.par\\'" . makefile-mode))
(add-hook 'c-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'f90-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'java-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'python-mode-hook (lambda () (hs-minor-mode 1)))

(add-hook 'c-mode-hook (setq comment-multi-line nil))
(add-hook 'c-mode-hook (setq comment-start "/* "))
;; (add-hook 'c-mode-hook (setq comment-end "*\/")) **/


;; ###########################################################################
                           ;; Window settings
;; ###########################################################################

(require 'color-theme)
(tool-bar-mode -1)
(if  (window-system) (color-theme-jsc-dark))

(defun set-frame-alpha (arg &optional active)
  (interactive "nEnter alpha value (1-100): \np")
  (let* ((elt (assoc 'alpha default-frame-alist))
         (old (frame-parameter nil 'alpha))
         (new (cond ((atom old)     `(,arg ,arg))
                    ((eql 1 active) `(,arg ,(cadr old)))
                    (t              `(,(car old) ,arg)))))
    (if elt (setcdr elt new) (push `(alpha ,@new) default-frame-alist))
    (set-frame-parameter nil 'alpha new)))
(global-set-key (kbd "C-c C-t") 'set-frame-alpha)

;; set transparency
;; (set-frame-parameter (selected-frame) 'alpha '(85 85))
;; (add-to-list 'default-frame-alist '(alpha 85 85))
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))


;; ----------- [ Minor modes
(which-function-mode)
(column-number-mode)
(show-paren-mode 1)
(show-paren-function)
(global-linum-mode)


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

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(fset 'forward-centerify
   "\C-[xforward-paragraph\C-m\C-[xrecenterify\C-m")



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


;; ----------- [ Datecount
 (defun insert-current-date () (interactive)
    (insert (shell-command-to-string "echo -n $(date +%B\ %e,\ %Y)")))

;; ----------- [ Variables
(setq-default c-basic-offset 4)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")


;; ----------- [ Colors
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
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
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(comment-style (quote extra-line))
 '(inhibit-startup-screen t)
 '(org-mobile-checksum-binary "/usr/bin/shasum")
 '(org-mobile-force-id-on-agenda-items nil)
 '(org-mobile-index-file "~/text.org")
 '(recenter-positions (quote (0.33 middle 0.66))))
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
(global-set-key (kbd "C-c C-v") 'recenterify)
(global-set-key (kbd "C-c C-a") 'recenterify)

(fset 'recenterify
   "\C-u15\C-n\C-[xrecenter-top-bottom\C-m\C-u15\C-p")


(global-set-key (kbd "C-c C-r") 'compile)
(global-set-key (kbd "C-x ,") 'hs-hide-block)
(global-set-key (kbd "C-x .") 'hs-show-block)
(global-set-key (kbd "C-x <") 'hs-hide-level)
(global-set-key (kbd "C-x >") 'hs-show-all)
(global-set-key (kbd "C-x p") 'replace-string)


(defun Template-LaTex ()
  (interactive)
  (insert-file-contents "~/lab/templates/LaTeX/latex_template.tex"))


(defun Template-Matplotlib ()
  (interactive)
  (insert-file-contents "~/lab/plotting/plot.py"))



(defun java-insert-header ()
    (interactive) 
     (insert "   /*   \n    *   \n    *   \n    *   \n    *   \n    *   \n    */"))

;; ----------- [ General Headers
(global-set-key (kbd "C-x C-h") 'headerify) ; [Ctrl]-[x] [Ctrl]-[h]
(global-set-key (kbd "C-x h") 'headerify) ; [Ctrl]-[x] [Ctrl]-[h]


(defun emph ()
  (insert  "\\emph{"))

(defun bf ()
  (insert  "\\textbf{"))




(defun make-header ()
    (interactive) 
    (center-line) 
    (defvar beg (line-beginning-position))
    (goto-char (line-beginning-position))     
    (insert  "########################################################################\n")
    (goto-char (line-end-position))
    (insert "\n########################################################################\n")
    (defvar end (line-end-position)))
    ;; (comment-or-uncomment-region beg end))


(fset 'headerify
   "\C-a\C-u75#\C-j\C-p\C-x\C-m\C-n\C-[xcenter-line\C-m\C-xm\C-e\C-j\C-u75#\C-x\C-m\C-j")




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

;; (define-key global-map [menu-bar tools] nil)
;; (define-key global-map [menu-bar file] nil)
;; (define-key global-map [menu-bar edit] nil)
;; (define-key global-map [menu-bar options] nil)
;; (define-key global-map [menu-bar buffer] nil)

;; (define-key-after
;;   global-map
;;   [menu-bar mymenu]
;;   (cons
;;    "     a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p    q    r    s    t    u    v    w    x    y    z"
;;    (make-sparse-keymap "hoot hoot"))
;;   'tools )

(global-set-key (kbd "C-M-f") 'jump-forward-column)
(global-set-key (kbd "C-M-b") 'jump-backward-column)


(fset 'init
   "\C-[xload-file\C-m\C-a\C-k~/.emacs.d\C-iinit.el\C-m")


(setq-default indent-tabs-mode nil)

(global-set-key (kbd "C-M-n") 'jump-forward-column)
(global-set-key (kbd "C-M-p") 'jump-backward-column)
(global-set-key (kbd "C-c b") 'switch-to-buffer)

(load-file "~/.emacs.d/hook-overrides.el")

(setq c-default-style "linux" c-basic-offset 4)

