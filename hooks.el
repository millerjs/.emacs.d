
;; ======== Hooks ========
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-to-list 'auto-mode-alist '("\\.F90\\ '" . f90-mode))
(add-to-list 'auto-mode-alist '("\\.par\\ '" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook    'c-mode-hook      (lambda () (hs-minor-mode 1) (flycheck-mode)))
(add-hook    'c++-mode-hook    (lambda () (hs-minor-mode 1) (flycheck-mode)))
(add-hook    'f90-mode-hook    (lambda () (hs-minor-mode 1)))
(add-hook    'java-mode-hook   (lambda () (hs-minor-mode 1)))
(add-hook    'python-mode-hook (lambda () (hs-minor-mode 1) (flycheck-mode)))
(add-hook    'yaml-mode-hook ' (lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
