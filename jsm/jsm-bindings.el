;;; appearance.el --- Lots of custom key bindings -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; =======================================================================
;; View

(global-set-key (kbd "<f2>")        'toggle-truncate-lines)
(global-set-key (kbd "C-c l")       'linum-mode)
(global-set-key (kbd "C-x ,")       'hs-hide-block)
(global-set-key (kbd "C-x .")       'hs-show-block)
(global-set-key (kbd "C-x <")       'hs-hide-level)
(global-set-key (kbd "C-x >")       'hs-show-all)

;; =======================================================================
;; Editing

(global-set-key (kbd "C-x 9")       'kmacro-insert-counter)
(global-set-key (kbd "C-x m")       'jsm-comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-m")     'jsm-comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-d")         'backward-kill-word)
(global-set-key (kbd "C-x p")       'replace-string)
(global-set-key (kbd "C-9")         'jsm-parens-wrap)

;; =======================================================================
;; Whitespace

(global-set-key (kbd "C-x t")       'indent-region)
(global-set-key (kbd "C-x w")       'just-one-space)
(global-set-key (kbd "C-x C-a")     'jsm-align-repeat)

;; =======================================================================
;; Navigation

(global-set-key (kbd "M-o")         'ace-jump-mode)
(global-set-key (kbd "C-M-o")       'ace-jump-mode)
(global-set-key (kbd "M-p")         'backward-paragraph)
(global-set-key (kbd "M-n")         'forward-paragraph)
(global-set-key (kbd "C-M-l")       'goto-line)
(global-set-key (kbd "C-M-n")       'jump-forward)
(global-set-key (kbd "C-M-p")       'jump-backward)
(global-set-key (kbd "C-M-m")       'move-middle-line)
(global-set-key (kbd "C-x <right>") 'next-non-emacs-buffer)
(global-set-key (kbd "C-x l")       'next-non-emacs-buffer)
(global-set-key (kbd "C-x <left>")  'previous-non-emacs-buffer)
(global-set-key (kbd "C-x j")       'previous-non-emacs-buffer)
(global-set-key (kbd "C-v")         'scroll-up-partial)
(global-set-key (kbd "M-v")         'scroll-down-partial)
(global-set-key (kbd "<mouse-5>")   'scroll-up-partial)
(global-set-key (kbd "<mouse-4>")   'scroll-down-partial)

;; =======================================================================
;; Util

(global-set-key (kbd "C-c t")       'org-complete-and-archive)
(global-set-key (kbd "M-z")         'repeat)
(global-set-key (kbd "C-c s")       'ispell)
(global-set-key (kbd "<f7>")        'ispell-word)
(global-set-key (kbd "M-t")         'indent-guide-mode)
(global-set-key (kbd "C-c C-n")     'flycheck-next-error)
(global-set-key (kbd "C-c C-l")     'flycheck-list-errors)
(global-set-key (kbd "C-M-y")       'kill-ring-search)
(global-set-key (kbd "C-x g")       'google-this-mode-submap)

(define-key yas-keymap (kbd "`")    'yas-next-field)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)


;; =======================================================================
;; Decoration

(global-set-key (kbd "C-x h")       'jsm-insert-divider)

;; =======================================================================
;; Binding overrides

(define-key override-mode-map (kbd "C-d")      'backward-kill-word)
(define-key override-mode-map (kbd "C-M-n")    'jump-forward)
(define-key override-mode-map (kbd "C-M-p")    'jump-backward)
(define-key override-mode-map (kbd "C-c C-v")  'recenter-top-bottom)
(define-key override-mode-map (kbd "M-b")      'backward-word)
(define-key override-mode-map (kbd "C-h")      'backward-delete-char)
(define-key override-mode-map (kbd "C-c C-l")  'flycheck-list-errors)


;; =======================================================================
;; Auto complete

(define-key ac-completing-map  "\r"      nil)
(define-key ac-menu-map        "\M-n"    'ac-next)
(define-key ac-menu-map        "\M-p"    'ac-previous)
(define-key ac-menu-map        "\C-n"    'next-line)
(define-key ac-menu-map        "\C-p"    'previous-line)
(define-key ac-completing-map  "\t"      'ac-complete)
(define-key ac-completing-map  "\C-j"    'ac-complete)
(define-key ac-completing-map  "\M-/"    'ac-stop)
(define-key ac-mode-map (kbd   "M-TAB")  'auto-complete)

(provide 'jsm-bindings)
;;; jsm-bindings.el ends here
