;;; packages.el --- Indirection.  Load and configure packages. -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; =======================================================================
;; Package management

(require 'package)

(add-to-list
 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list
 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

;; =======================================================================
;; Requires

(require 'yasnippet)
(require 'jedi)
(require 'flycheck)
(require 'flycheck-pos-tip)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'dired-subtree)
(require 'indent-guide)
(require 'inline-crypt)
(require 'kill-ring-search)
(require 'linum-relative)
(require 'misc)
(require 'mouse)
(require 'neotree)
(require 'org)
(require 'osx-clipboard)
(require 'paren)
(require 'popwin)
(require 's)
(require 'smart-tab)
(require 'smartparens)
(require 'whitespace)
(require 'yaml-mode)
(require 'relative-jump)

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


(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support

(load-file (concat config-path  "languages.el"))

(setq venv-location "/Users/jmiller/.venvs")
