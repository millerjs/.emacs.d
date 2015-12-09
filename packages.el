;;======== Load package files ========
(load-file (concat lisp-path "jump-lines.el"))
(load-file (concat lisp-path "go-mode.el"))
(load-file (concat lisp-path "popup.el"))

;;======== configure package management ========
(require 'package)
(defvar melpa '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; =======================================================================
;; Required packages
;; =======================================================================

(package-initialize)
(require 'dired-subtree)
(require 'indent-guide)
(require 'linum-relative)
(require 'smartparens)
(require 'misc)
(require 'yaml-mode)
(require 'paren)
(require 'smart-tab)
(require 's)
(require 'dash)
(require 'inline-crypt)
(require 'popup)
(require 'auto-complete)
(require 'mouse)
(require 'popwin)
(require 'neotree)
(require 'ace-jump-mode)

(setq zone-programs [zone-pgm-paragraph-spaz])

;; =======================================================================
;; Minor Modes
;; =======================================================================

(column-number-mode)
(smartparens-global-mode 1)
(show-paren-mode 1)
(global-linum-mode)
(global-smart-tab-mode t)
(defun track-mouse (e))

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq linum-delay t)

;; ======== kill-ring-search ========
(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer."
  (interactive))

;; =======================================================================
;; Package configuration
;; =======================================================================

;; ======== Parens matching ========
(setq show-paren-delay .1)
(set-face-background 'show-paren-match-face (face-background 'default))
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

;; =======================================================================
;; Auto complete
;; =======================================================================

(add-to-list 'load-path (concat root-path "custom_lisp"))
(require 'auto-complete-config)
(setq ac-user-dictionary-files '((concat root-path "custom_lisp/dict/custom")))
(ac-config-default)
(setq ac-ignore-case 'smart)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\M-n" 'ac-next)
(define-key ac-menu-map "\M-p" 'ac-previous)
(define-key ac-menu-map "\C-n" 'next-line)
(define-key ac-menu-map "\C-p" 'previous-line)
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\C-j" 'ac-complete)
(define-key ac-completing-map "\r" nil)
(setq ac-auto-show-menu 0.1)
(define-key ac-completing-map "\M-/" 'ac-stop)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(set-face-background 'ac-candidate-face "color-234")
(set-face-foreground 'ac-candidate-face "color-243")
(set-face-background 'ac-selection-face "color-18")

(set-face-background 'popup-tip-face "color-232")
(set-face-foreground 'popup-tip-face "color-243")

;; =======================================================================
;; Language specifics
;; =======================================================================

;; ======== Rust ========
(setq racer-cmd "/Users/jmiller/.cargo/bin/racer")
(setq racer-rust-src-path "/Users/jmiller/rust/rust/src/")
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(setq company-tooltip-align-annotations t)


;; ======== Python ========
(setq jedi:complete-on-dot 1)

;; Add third-party repos
(add-to-list 'package-archives melpa t)
