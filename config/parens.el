(fset 'my-wrap-with-paren "\C-](")
;; C-] is my binding for `sp-select-next-thing-exchange'
(define-key smartparens-mode-map (kbd "C-(") 'my-wrap-with-paren)

;; or you can define it as a function. But then undoing the wrapping
;; pair with backspace doesn't work because this interactive command
;; overrides the "last action" SP recognizes. BUT you get the added
;; benefit of numeric argument, so now you can wrap any number of items.
(defun my-wrap-with-paren (&optional arg)
  (interactive "p")
  (sp-select-next-thing-exchange arg)
  (execute-kbd-macro (kbd "(")))
(define-key smartparens-mode-map (kbd "C-(") 'my-wrap-with-paren)
