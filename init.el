;;; init.el --- Indirection.  Load and configure packages. -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:

(package-initialize)

(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir (expand-file-name "site-lisp" user-emacs-directory))
(setq settings-dir (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path settings-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))


;; ======================================================================
;; Packages

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(auto-complete
     browse-at-remote
     coffee-mode
     clean-buffers
     expand-region
     evil
     flycheck
     flycheck-pos-tip
     flx
     flx-ido
     indent-guide
     inline-crypt
     jedi
     haml-mode
     htmlize
     ido
     ido-vertical-mode
     kill-ring-search
     linum-relative
     linum-relative
     magit
     magit-filenotify
     markdown-mode
     neotree
     osx-clipboard
     paren
     popwin
     projectile
     rust-mode
     s
     smart-tab
     smartparens
     whitespace
     yaml-mode
     yasnippet
     mmm-mode)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


;; =======================================================================
;; Minor Modes

(ac-config-default)

(ido-vertical-mode             t)
(ido-everywhere                t)
(flx-ido-mode                  t)
(yas-global-mode               t)
(column-number-mode            t)
(global-auto-complete-mode     t)
(global-linum-mode             t)
(global-whitespace-mode        t)
(osx-clipboard-mode            t)
(show-paren-mode               t)
(projectile-mode               t)
;; (xclip-mode                    t)
(smartparens-global-mode       t)
(xterm-mouse-mode              t)

(menu-bar-mode              0)
(global-smart-tab-mode      0)

(setq server-use-tcp 0)

;; =======================================================================
;; Require eagerly

(require 's)
(require 'flx-ido)
(require 'jsm-appearance)
(require 'jsm-misc)
(require 'jsm-bindings)
(require 'jsm-editing)
(require 'jsm-navigation)
(require 'jsm-languages)
(require 'jsm-variables)
(require 'relative-jump)
(require 'neotree)


;; =======================================================================
;; Minor Modes

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-indent-like-python-mode t)
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (skewer-mode mmm-mode haskell-mode htmlize epresent itail evil sass-mode toml-mode toml magit-filenotify control-mode robe restclient flx-ido flx grizzl flymake-haml flymake-less flymake-sass scss-mode ido-vertical-mode ido-ubiquitous haml-mode projectile-ripgrep rg ripgrep ein neotree projectile rainbow-mode coffee-mode helm-gtags rtags cmake-ide pretty-symbols markdown-mode+ markdown-mode ac-racer racer yasnippet yaml-mode smartparens smart-tab s rust-mode popwin osx-clipboard magit linum-relative kill-ring-search jedi inline-crypt indent-guide flycheck-pos-tip expand-region))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(magit-diff-added ((((type tty)) (:foreground "green" :background "color-232"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "green" :background "color-232"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default" :background "color-232"))))
 '(magit-diff-file-heading ((((type tty)) (:background "color-232"))))
 '(magit-diff-file-heading-selection ((((type tty)) (:background "color-232"))))
 '(magit-diff-hunk-heading ((((type tty)) (:background "color-234"))))
 '(magit-diff-hunk-heading-highlight ((((type tty)) (:background "color-235"))))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed" :background "color-232"))))
 '(magit-section-highlight ((((type tty)) (:foreground "default" :background "color-232"))))
 '(neo-dir-link-face ((t (:foreground "color-21"))))
 '(neo-file-link-face ((t (:foreground "color-245"))))
 '(org-block-begin-line ((t (:foreground "color-245" :background "black" :bold nil))))
 '(org-document-info ((t (:foreground "magenta" :bold nil))))
 '(org-document-title ((t (:foreground "magenta" :bold nil))))
 '(whitespace-empty ((t (:foreground "black" :background "black"))))
 '(whitespace-space ((t (:foreground "gray75" :bold t))))
 '(whitespace-tab ((t (:foreground "grey" :background "color-233"))))
 '(whitespace-trailing ((t (:foreground "red" :background "color-234")))))
(put 'narrow-to-region 'disabled nil)
