;;; hooks.el --- Language specific config -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; =======================================================================
;; Go

(add-hook 'before-save-hook #'gofmt-before-save)


;; =======================================================================
;; Rust

(setq racer-cmd "/Users/jmiller/.cargo/bin/racer")
(setq racer-rust-src-path "/Users/jmiller/rust/rust/src/")
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(setq company-tooltip-align-annotations t)

(eval-after-load "rust-mode"
  '(progn
     (global-set-key (kbd "M-.")         'racer-find-definition)
     (sp-pair "'" nil :actions :rem)
     (sp-pair "<" ">")))


;; =======================================================================
;; Emacs Lisp

(eval-after-load "emacs-lisp-mode"
  '(progn (sp-pair "'" nil :actions :rem)))


;; =======================================================================
;; C/C++

(eval-after-load "c++-mode"
  '(progn
     (define-key c++-mode-map (kbd "C-d") 'backward-kill-word)
     (define-key c++-mode-map (kbd "M-d") 'kill-word)))

;; =======================================================================
;; Python

(setq jedi:complete-on-dot 1)
(eval-after-load "python-mode"
  '(progn (global-set-key (kbd "M-.") 'jedi:goto-definition)))


;; =======================================================================
;; Org

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(defun org-complete-and-archive ()
  (interactive)
  (org-todo) (org-archive-subtree-default))

(setq org-log-done t)
