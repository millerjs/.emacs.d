(defun do-something-region (startPos endPos)
  "Do some text processing on region.
This command calls the external script “wc”."
(interactive "r")
  (let (scriptName)
    (setq scriptName "/usr/bin/wc") ; full path to your script
    (shell-command-on-region startPos endPos scriptName nil t nil t)
    ))

(transient-mark-mode 1)

(defun parse-jump-cmd (type cmd)
  (shell-command-to-string (concat  "~/.emacs.d/parse-jump " type " \"" cmd "\""))
)


(defun reverse-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position))
  (reverse-line2)
)

(defun reverse-line2 (&optional startPos endPos)
  (interactive "r")
  (let (scriptName)
    (setq scriptName "python ~/.emacs.d/binary_nav.py") 
    (shell-command-on-region (mark) (point) scriptName nil t nil t)
    (next-line)
    (kill-line)
    (next-line -1)
    ))

