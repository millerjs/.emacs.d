(require 'yasnippet)
(defvar yas-text)

(defun trello-url-to-name ()
  (nth 0 (last (split-string yas-text "/"))))

(defun jira-url-to-name ()
  (nth 0 (last (split-string yas-text "/"))))
