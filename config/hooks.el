;;; hooks.el --- Define things triggered by modes, commands, etc -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; =======================================================================
;; Hooks

(add-hook    'before-save-hook 'delete-trailing-whitespace)
(add-hook    'python-mode-hook 'jedi:setup)
(add-hook    'c-mode-hook      'jsm-indent-setup)

(add-hook    'c-mode-hook      (lambda () (flycheck-mode)))
(add-hook    'rust-mode-hook   (lambda () (flycheck-mode)))
(add-hook    'c++-mode-hook    (lambda () (flycheck-mode)))
(add-hook    'python-mode-hook (lambda () (flycheck-mode)))
(add-hook    'python-mode-hook (lambda () (jedi-mode)))

(add-to-list 'auto-mode-alist '("\\.F90\\ '" . f90-mode))
(add-to-list 'auto-mode-alist '("\\.xsh\\ '" . python-mode))
(add-to-list 'auto-mode-alist '("\\.par\\ '" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.yml$"    . yaml-mode))


;; =======================================================================
;; Hook overrides

(defvar override-mode-map (make-keymap) "override-mode-map")

(define-minor-mode override-mode
  "A minor mode so that my key settings override annoying major modes."
  t " ovrrd " 'override-mode-map)

(override-mode 1)
(smart-tab-mode)

(defun my-minibuffer-setup-hook ()
  (override-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
