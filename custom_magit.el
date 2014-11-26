;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green")
     (set-face-foreground 'magit-diff-del "red")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "blue")
       (set-face-foreground 'magit-item-highlight "green")
       (set-face-foreground 'magit-diff-file-header "black")
       )
  )
  )

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "black")
     (set-face-foreground 'diff-removed "black")
     (set-face-background 'diff-added "black")
     (set-face-background 'diff-removed "black")))
