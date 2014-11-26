;;======== load package files ========
(load-file "~/.emacs.d/boxquote.el")
(load-file "~/.emacs.d/external_scripts.el")
(load-file "~/.emacs.d/jump-lines.el")
(load-file "~/.emacs.d/hide-region.el")
(load-file "~/.emacs.d/go-mode.el")

(package-initialize)

(require 'indent-guide)
(require 'linum-relative)
(require 'misc)
(require 'yaml-mode)
(require 'paren)
(require 'ido)
(require 'ido-vertical-mode)

;; Minor Modes
(indent-guide-global-mode)
(column-number-mode)
(show-paren-mode 1)
(global-linum-mode)
(ido-mode 1)
(ido-vertical-mode 1)

;;======== configure package management ========
(require 'package)
(defvar gnu '("gnu" . "http://elpa.gnu.org/packages/"))
(defvar melpa '("melpa" . "http://melpa.org/packages/"))

;; Add third-party repos
(add-to-list 'package-archives melpa t)
