;; ======== Hooks ========
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-to-list 'auto-mode-alist '("\\.F90\\ '" . f90-mode))
(add-to-list 'auto-mode-alist '("\\.xsh\\ '" . python-mode))
(add-to-list 'auto-mode-alist '("\\.par\\ '" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook    'c-mode-hook      (lambda () (hs-minor-mode 1) (flycheck-mode)))
(add-hook    'rust-mode-hook      (lambda () (hs-minor-mode 1) (flycheck-mode)))
(add-hook    'c++-mode-hook    (lambda () (hs-minor-mode 1) (flycheck-mode)))
(add-hook    'f90-mode-hook    (lambda () (hs-minor-mode 1)))
(add-hook    'java-mode-hook   (lambda () (hs-minor-mode 1)))
(add-hook    'python-mode-hook (lambda () (hs-minor-mode 1) (flycheck-mode)))
(add-hook    'python-mode-hook (lambda () (hs-minor-mode 1) (jedi-mode)))
(add-hook    'python-mode-hook 'jedi:setup)
(add-hook    'yaml-mode-hook ' (lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; ======== Hook overrides ========
(defvar override-mode-map (make-keymap) "override-mode-map")

(eval-after-load "cc-mode"
  '(progn
     (define-key c++-mode-map (kbd "C-d") 'backward-kill-word)
     (define-key c++-mode-map (kbd "M-d") 'kill-word)))


(eval-after-load "python-mode"
  '(progn
     (global-set-key (kbd "M-.")         'jedi:goto-definition))


(eval-after-load "rust-mode"
  '(progn
     (global-set-key (kbd "M-.")         'racer-find-definition))

;; Turn off line wrapping
(set-default 'truncate-lines t)


;; backword word kill
(define-key override-mode-map (kbd "C-d") 'backward-kill-word)

;; cutsom relative line jumping
(define-key override-mode-map (kbd "C-M-n")   'jump-forward)
(define-key override-mode-map (kbd "C-M-p")   'jump-backward)
(define-key override-mode-map (kbd "C-c C-v") 'recenter-top-bottom)
(define-key override-mode-map (kbd "M-b")     'backward-word)
(define-key override-mode-map (kbd "C-h")     'backward-delete-char)


(define-minor-mode override-mode
  "A minor mode so that my key settings override annoying major modes."
  t " ovrrd " 'override-mode-map)

(override-mode 1)
(smart-tab-mode)

(defun my-minibuffer-setup-hook ()
  (override-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(global-set-key (kbd "C-c j f") 'for-loop)
(define-key global-map [menu-bar tools]   nil)
(global-auto-complete-mode 1)
