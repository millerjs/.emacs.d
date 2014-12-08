;; Default path
(setq root-path "~/.emacs.d/custom_lisp/")
(add-to-list 'load-path root-path)

;; load custom elisp
(load-file (concat root-path "packages.el"))
(load-file (concat root-path "parens.el"))
(load-file (concat root-path "hooks.el"))
(load-file (concat root-path "buffers.el"))
(load-file (concat root-path "comments.el"))
(load-file (concat root-path "formatting.el"))
(load-file (concat root-path "custom_ido.el"))
(load-file (concat root-path "custom_variables.el"))
(load-file (concat root-path "custom_bindings.el"))
(load-file (concat root-path "custom_colors.el"))
(load-file (concat root-path "custom_magit.el"))
(load-file (concat root-path "custom_org.el"))

;; After everythin, load custom hook overrides
(load-file (concat root-path "hook-overrides.el"))
(load-file (concat root-path "custom_flycheck.el"))
