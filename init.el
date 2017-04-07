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
     coffee-mode
     clean-buffers
     expand-region
     flycheck
     flycheck-pos-tip
     flx
     flx-ido
     indent-guide
     inline-crypt
     jedi
     haml-mode
     ido
     ido-vertical-mode
     kill-ring-search
     linum-relative
     linum-relative
     magit
     markdown-mode
     neotree
     org
     osx-clipboard
     paren
     popwin
     projectile
     robe
     rust-mode
     s
     smart-tab
     smartparens
     whitespace
     xclip
     yaml-mode
     yasnippet)))

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
(xclip-mode                    t)
(smartparens-global-mode       t)
(xterm-mouse-mode              t)

(menu-bar-mode              0)
(global-smart-tab-mode      0)


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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (restclient flx-ido flx grizzl flymake-haml flymake-less flymake-sass scss-mode ido-vertical-mode ido-ubiquitous haml-mode projectile-ripgrep rg ripgrep ein neotree projectile robe rainbow-mode coffee-mode helm-gtags rtags cmake-ide pretty-symbols markdown-mode+ markdown-mode ac-racer racer yasnippet yaml-mode xclip smartparens smart-tab s rust-mode popwin osx-clipboard magit linum-relative kill-ring-search jedi inline-crypt indent-guide flycheck-pos-tip expand-region))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:background "color-233"))))
 '(hl-line ((t (:background "color-233"))))
 '(lazy-highlight ((t (:background "black" :foreground "white" :underline t))))
 '(magit-diff-added ((((type tty)) (:foreground "green"))))
 '(magit-diff-added-highlight ((((type tty)) (:foreground "green" :background "color-234"))))
 '(magit-diff-context-highlight ((((type tty)) (:foreground "default" :background "color-234"))))
 '(magit-diff-file-heading ((((type tty)) (:background "color-234"))))
 '(magit-diff-removed ((((type tty)) (:foreground "red"))))
 '(magit-diff-removed-highlight ((((type tty)) (:foreground "IndianRed"))))
 '(magit-section-highlight ((((type tty)) (:foreground "brightwhite" :background "color-234"))))
 '(neo-dir-link-face ((t (:foreground "color-21"))))
 '(neo-file-link-face ((t (:foreground "color-245"))))
 '(whitespace-empty ((t (:foreground "black" :background "black"))))
 '(whitespace-space ((t (:foreground "gray75" :bold t))))
 '(whitespace-tab ((t (:foreground "grey" :background "color-233"))))
 '(whitespace-trailing ((t (:foreground "red" :background "color-234")))))
