;; Default path
(setq server-use-tcp t)
(setq root-path "~/.emacs.d/")
(setq lisp-path   (concat root-path "custom_lisp/"))
(setq config-path (concat root-path "config/"))
(add-to-list 'load-path lisp-path)
(add-to-list 'load-path config-path)

;; load packagss
(load-file (concat root-path "packages.el"))

;; load custom elisp
(load-file (concat lisp-path "parens.el"))

;; config
(load-file (concat config-path "config_hooks.el"))
(load-file (concat config-path "config_buffers.el"))
(load-file (concat config-path "config_comments.el"))
(load-file (concat config-path "config_formatting.el"))
(load-file (concat config-path "config_variables.el"))
(load-file (concat config-path "config_bindings.el"))
(load-file (concat config-path "config_colors.el"))
(load-file (concat config-path "config_magit.el"))
(load-file (concat config-path "config_org.el"))
(load-file (concat config-path "config_window.el"))

;; After everythin, load custom hook overrides
(load-file (concat config-path "config_hook-overrides.el"))
(load-file (concat config-path "config_flycheck.el"))
