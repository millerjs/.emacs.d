;;======== Loadpack package files ========
(load-file (concat root-path "boxquote.el"))
(load-file (concat root-path "external_scripts.el"))
(load-file (concat root-path "jump-lines.el"))
(load-file (concat root-path "hide-region.el"))
(load-file (concat root-path "go-mode.el"))
(load-file (concat root-path "custom_lisp.el"))
(load-file (concat root-path "popup.el"))

;;======== configure package management ========
(require 'package)
(defvar melpa '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
(require 'indent-guide)
(require 'linum-relative)
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
(require 'autopair)
(require 'smooth-scrolling)
(require 'zone-matrix)
(require 'popwin)

(setq zone-programs [zone-pgm-paragraph-spaz])

;; Minor Modes
(column-number-mode)
(show-paren-mode 1)
(global-linum-mode)
(global-smart-tab-mode t)
(autopair-global-mode t)
(defun track-mouse (e))
(xterm-mouse-mode t)
;; (indent-guide-global-mode)

(setq smooth-scroll-margin 0)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(setq linum-delay t)

;; Autocompletion
(add-to-list 'load-path (concat root-path "custom_lisp"))
(require 'auto-complete-config)
(setq ac-user-dictionary-files
      '((concat root-path "custom_lisp/dict/custom")))
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
(set-face-background 'ac-candidate-face "color-23")
;; (set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")

;; Add third-party repos
(add-to-list 'package-archives melpa t)

;; ======== Jedi mode ========
(setq jedi:complete-on-dot 1)
