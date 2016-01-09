;;; init.el --- Load the tree of emacs customization -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; Server use TCP
(setq server-use-tcp t)

;; Set load paths
(setq root-path "~/.emacs.d/")
(setq lisp-path   (concat root-path "custom_lisp/"))
(setq config-path (concat root-path "jsm/"))
(add-to-list 'load-path lisp-path)
(add-to-list 'load-path config-path)

;; load packagss
(load-file (concat config-path  "variables.el"))
(load-file (concat root-path    "packages.el"))

;; load custom elisp
(load-file (concat config-path  "hooks.el"))
(load-file (concat lisp-path    "parens.el"))

;; config
(load-file (concat config-path  "editing.el"))
(load-file (concat config-path  "navigation.el"))
(load-file (concat config-path  "bindings.el"))
(load-file (concat config-path  "appearance.el"))
(load-file (concat config-path  "languages.el"))
(load-file (concat config-path  "load_last.el"))

;; Load auth info
(if (file-exists-p "~/.authinfo") (load-file "~/.authinfo"))
