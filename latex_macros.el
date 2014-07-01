


(defun add-environ (env)
  (interactive "sEnvironment: ") 

  (insert 
   (concatenate 'string "\\begin{"  env "}\n\n\\end{" env "}\n" )
  )
   (previous-line 2)


)



(defun add-equation ()
  (interactive) 

  (insert 
   (concatenate 'string "$"  
		(read-from-minibuffer "Equation: " (format "%s" ""))"$ "))

  )

(defun add-verbatim ()
  (interactive) 

  (insert 
   (concatenate 'string "\\begin{Verbatim}
"
		(read-from-minibuffer "Verbatim text: " (format "%s" ""))"
\\end{Verbatim} "))
  (forward-line -1)
  )



(defun text-bf ()
  (interactive) 
  (insert 
   (concatenate 'string "\\textbf{"  
		(read-from-minibuffer "Bold face: " (format "%s" ""))"} "))

  )

(defun text-emph ()
  (interactive) 
  (insert 
   (concatenate 'string "\\emph{"  
		(read-from-minibuffer "Italic face: " (format "%s" ""))"} "))

  )


(add-hook 'minibuffer-setup-hook 'abbrev-mode)
(global-set-key (kbd "C-c e") 'add-equation)
(global-set-key (kbd "C-c d") 'insert-current-date)
;; (global-set-key (kbd "C-c b") 'text-bf)
(global-set-key (kbd "C-c i") 'text-emph)
(global-set-key (kbd "C-c v") 'add-verbatim)

;; ----------- [ Auto Correct
;; (define-abbrev-table 'global-abbrev-table '(
;;     ("alpha" "\\alpha" nil 0)
;;     ("beta" "\\beta" nil 0)
;;     ("gamma" "\\gamma" nil 0)
;;     ("delta" "\\delta" nil 0)
;;     ("epsilon" "\\epsilon" nil 0)
;;     ("int" "\\int" nil 0)
;;     ("frac" "\\frac" nil 0)
    

;; ))
