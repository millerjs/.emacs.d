;;; hooks.el --- Define things triggered by modes, commands, etc -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; =======================================================================
;; Hooks

(require 'flycheck)

(add-hook    'before-save-hook 'delete-trailing-whitespace)
(add-hook    'after-save-hook 'flycheck-buffer)
(add-hook    'after-init-hook  #'global-flycheck-mode)
;; (with-eval-after-load 'flycheck (flycheck-pos-tip-mode))


;; =======================================================================
;; Hook overrides

(defvar override-mode-map (make-keymap) "override-mode-map")

(define-minor-mode override-mode
  "A minor mode so that my key settings override annoying major modes."
  t " ovrrd " 'override-mode-map)

(override-mode 1)


(defun my-minibuffer-setup-hook ()
  (override-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)


(provide 'jsm-hooks)
;;; jsm-hooks.el ends here
