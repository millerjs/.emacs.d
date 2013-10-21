

(defun add-title ()
  (interactive) 
  (goto-char (line-beginning-position))

  (insert 
   (concatenate 'string "  ----------- [ "  
		(read-from-minibuffer "Title: " (format "%s" ""))"\n"))

  (forward-line -1)
  (indent-according-to-mode)
  (comment-or-uncomment-region-or-line)
  (forward-line 1)
  (indent-according-to-mode)

  )
