
(iswitchb-mode 1)
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "*Shell Command Output*"
               "*Messages*" "Async Shell Command"))



 (defun iswitchb-local-keys ()
   (mapc (lambda (K) 
	   (let* ((key (car K)) (fun (cdr K)))
	     (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	 '(("M-f" . iswitchb-next-match)
	   ("M-b"  . iswitchb-prev-match)
	   ("C-f"    . iswitchb-next-match     )
	   ("C-f"  . iswitchb-prev-match             ))))
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

