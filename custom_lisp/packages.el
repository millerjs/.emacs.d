;;======== load package files ========
(load-file (concat root-path "boxquote.el"))
(load-file (concat root-path "external_scripts.el"))
(load-file (concat root-path "jump-lines.el"))
(load-file (concat root-path "hide-region.el"))
(load-file (concat root-path "go-mode.el"))
(load-file (concat root-path "custom_lisp.el"))

(package-initialize)

(require 'indent-guide)
(require 'linum-relative)
(require 'misc)
(require 'yaml-mode)
(require 'paren)
(require 'ido)
(require 'ido-vertical-mode)
(require 'dropdown-list)
(require 'smart-tab)
(require 'smex)
(require 's)
(require 'dash)
(require 'inline-crypt)

;; ======== Loading ========

;; smex
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

;; Minor Modes
;; (indent-guide-global-mode)
(column-number-mode)
(show-paren-mode 1)
(global-linum-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(global-smart-tab-mode 1)

;;======== configure package management ========
(require 'package)
(defvar gnu '("gnu" . "http://elpa.gnu.org/packages/"))
(defvar melpa '("melpa" . "http://melpa.org/packages/"))

;; Add third-party repos
(add-to-list 'package-archives melpa t)
