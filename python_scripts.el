(defun do-something-region (startPos endPos)
  "Do some text processing on region.
This command calls the external script “wc”."
(interactive "r")
  (let (scriptName)
    (setq scriptName "/usr/bin/wc") ; full path to your script
    (shell-command-on-region startPos endPos scriptName nil t nil t)
    ))