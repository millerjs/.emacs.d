;;; init.el --- Indirection.  Load and configure packages. -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:

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
   '(magit
     yasnippet
     jedi
     flycheck
     flycheck-pos-tip
     auto-complete
     indent-guide
     inline-crypt
     kill-ring-search
     linum-relative
     org
     osx-clipboard
     paren
     popwin
     s
     smart-tab
     smartparens
     whitespace
     yaml-mode
     expand-region
     linum-relative
     rust-mode
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


;; =======================================================================
;; Minor Modes

(ac-config-default)

(yas-global-mode            t)
(column-number-mode         t)
(global-auto-complete-mode  t)
(global-linum-mode          t)
(global-whitespace-mode     t)
(osx-clipboard-mode         t)
(show-paren-mode            t)
(smartparens-global-mode    t)

(menu-bar-mode              0)
(global-smart-tab-mode      0)

;; =======================================================================
;; Require eagerly

(require 's)
(require 'jsm-appearance)
(require 'jsm-bindings)
(require 'jsm-editing)
(require 'jsm-navigation)
(require 'jsm-languages)
(require 'jsm-variables)
(require 'relative-jump)
