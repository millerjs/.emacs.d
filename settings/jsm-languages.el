;;; hooks.el --- Language specific config -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:


;; =======================================================================
;; Go
(add-hook
 'go-mode-hook
 '(lambda ()
    (add-hook 'before-save-hook #'gofmt-before-save)))

;; ======================================================================
;; Ruby


 ;; ruby-mode has keybinding [C-c C-s] for `inf-ruby'.
  ;; auto start robe `robe-start' after start `inf-ruby'.
  (defun my-robe-start ()
    (interactive)
    (unless robe-running
      (robe-start)))

  (defadvice inf-ruby-console-auto (after inf-ruby-console-auto activate)
    "Run `robe-start' after `inf-ruby-console-auto' started."
    (my-robe-start))

  (with-eval-after-load 'projectile-rails
    (define-key projectile-rails-mode-map
      [remap inf-ruby] 'inf-ruby-console-auto))

  (defadvice inf-ruby (after inf-ruby activate)
    "Run `robe-start' after `inf-ruby' started."
    (my-robe-start))

  ;; (define-key enh-ruby-mode-map (kbd "C-c C-s") 'inf-ruby)

  ;; auto start robe process for completing
  (defun my-robe-auto-start ()
    (unless robe-running
      (call-interactively 'inf-ruby)))

(add-hook 'enh-ruby-mode-hook #'my-robe-auto-start)

;; (add-hook 'ruby-mode-hook (lambda () (robe-mode) (robe-start)))
;; (add-hook 'robe-mode-hook 'ac-robe-setup)

;; =======================================================================
;; Rust

;; (require 'rust-mode)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . flyspell-mode))

(setq racer-cmd "racer")
(setq racer-rust-src-path "~/src/rust/src")

;; borrowed from
;; https://github.com/chrisbarrett/spacemacs-layers/blob/master/cb-yasnippet/funcs.el
(defun jsm-yas-rust-fmt-println-args (text)
  "Format the contents of a call to `println!' based on the given format string."
  (let ((n (s-count-matches "{" text)))
    (s-repeat n ", ")))

;; borrowed from
;; https://github.com/chrisbarrett/spacemacs-layers/blob/master/cb-yasnippet/funcs.el
(defun yas/rust-previous-struct-def ()
  "Search backward for the name of the last struct defined in this file."
  (save-match-data
    (if (search-backward-regexp (rx (or "enum" "struct") (+ space)
                                    (group (+ (not (any "{")))))
                                nil t)
        (s-trim (match-string 1))
      "Name")))

(defun yas/bol? ()
  "Non-nil if point is on an empty line or at the first word.
The rest of the line must be blank."
  (s-matches? (rx bol (* space) (* word) (* space) eol)
              (buffer-substring (line-beginning-position) (line-end-position))))


(add-hook
 'rust-mode-hook
 '(lambda ()
    ;; (rustfmt-enable-on-save)

    ;; Setup autocompletion
    (racer-mode)
    (ac-racer-setup)
    (setq ac-delay             1.0)
    (setq ac-quick-help-delay  1.0)

    ;; Defintiion lookup
    (local-set-key (kbd "M-.") 'racer-find-definition)

    ;; Don't autocomplete single quotes (it's annoying for lifetimes!)
    (sp-pair "'" nil :actions :rem)

    ;; Auto complete angle brackets
    (sp-pair "<" ">")

    ;; Hook in racer with eldoc to provide documentation
    (eldoc-mode)
    (racer-turn-on-eldoc)

    ;; Use flycheck-rust in rust-mode
    (flycheck-rust-setup)

    ;; Use company-racer in rust mode
    (set (make-local-variable 'company-backends) '(company-racer))

    ;; Key binding to jump to method definition
    (local-set-key (kbd "M-.") #'racer-find-definition)))


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

;; To expand region around paragraphs
(add-hook 'python-mode-hook 'er/jsm-python-mode-expansions)

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook (lambda () (flycheck-select-checker 'python-pylint)))
(add-hook 'python-mode-hook (lambda () (jedi:setup)))
(add-hook 'python-mode-hook (lambda () (setq jedi:complete-on-dot 1)))
(add-hook 'python-mode-hook (lambda () (local-set-key (kbd "M-.") #'jedi:goto-definition)))


;; =======================================================================
;; Org
p
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(defun org-complete-and-archive ()
  (interactive)
  (org-todo) (org-archive-subtree-default))

(setq org-log-done t)


;; ======================================================================
;; Other

(add-hook    'c-mode-hook      (lambda () (flycheck-mode)))
(add-hook    'rust-mode-hook   (lambda () (flycheck-mode)))
(add-hook    'c++-mode-hook    (lambda () (flycheck-mode)))
(add-hook    'python-mode-hook (lambda () (flycheck-mode)))

(add-hook    'c-mode-hook      'jsm-indent-setup)

(add-to-list 'auto-mode-alist '("\\.F90\\ '" . f90-mode))
(add-to-list 'auto-mode-alist '("\\.xsh\\ '" . python-mode))
(add-to-list 'auto-mode-alist '("\\.par\\ '" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.yml$"    . yaml-mode))

(provide 'jsm-languages)
;;; jsm-languages.el ends here