;;======== custom bindings ========
(global-set-key (kbd "<f2>")        'toggle-truncate-lines)
(global-set-key (kbd "C-x 9")       'kmacro-insert-counter)
(global-set-key (kbd "C-^")         'yank-pop)
(global-set-key (kbd "<backtab>")   'dabbrev-expand)
(global-set-key (kbd "C-x m")       'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-m")     'comment-or-uncomment-region-or-line)(
global-set-key (kbd "C-x s")       'save-buffer)
(global-set-key (kbd "C-c s")       'ispell)
(global-set-key (kbd "C-x f")       'find-file)
(global-set-key (kbd "C-x w")       'just-one-space)
(global-set-key (kbd "C-x g")       'replace-string)
(global-set-key (kbd "C-c a")       'org-agenda)
(global-set-key (kbd "C-S-c")       'clipboard-kill-ring-save)
(global-set-key (kbd "C-S-v")       'clipboard-yank)
(global-set-key (kbd "C-x <right>") 'next-non-emacs-buffer)
(global-set-key (kbd "C-x <left>")  'previous-non-emacs-buffer)
(global-set-key (kbd "C-x n")       'next-non-emacs-buffer)
(global-set-key (kbd "C-x p")       'previous-non-emacs-buffer)
(global-set-key (kbd "C-M-f")       'forward-list)
(global-set-key (kbd "C-M-b")       'backward-list)
(global-set-key (kbd "C-c l")       'linum-mode)
(global-set-key (kbd "C-x l")       'next-non-emacs-buffer)
(global-set-key (kbd "C-x j")       'previous-non-emacs-buffer)
(global-set-key (kbd "C-c w")       'count-words-region)
(global-set-key (kbd "C-x C-v")     'org-mobile-push)
(global-set-key (kbd "M-n")         'forward-paragraph)
(global-set-key (kbd "M-p")         'backward-paragraph)
(global-set-key (kbd "C-d")         'backward-kill-word)
(global-set-key (kbd "C-c m")       'move-middle-line)
(global-set-key (kbd "C-c C-m")     'move-middle-line)
(global-set-key (kbd "C-M-l")       'move-middle-line)
(global-set-key (kbd "C-M-b")       'jump-backward-column)
(global-set-key (kbd "C-M-n")       'jump-forward-column)
(global-set-key (kbd "C-M-p")       'jump-backward-column)
(global-set-key (kbd "C-c b")       'switch-to-buffer)
(global-set-key (kbd "<C-f6>")      'shrink-window-horizontally)
(global-set-key (kbd "<C-f8>")      'enlarge-window-horizontally)
(global-set-key (kbd "<f7>")        'ispell-word)
(global-set-key (kbd "C-S-<f7>")    'flyspell-mode)
(global-set-key (kbd "C-M-<f7>")    'flyspell-buffer)
(global-set-key (kbd "C-<f7>")      'flyspell-check-previous-highlighted-word)
(global-set-key (kbd "C-c C-a")     'recenter-top-bottom)
(global-set-key (kbd "C-c C-v")     'recenter-top-bottom)
(global-set-key (kbd "C-c C-r")     'compile)
(global-set-key (kbd "C-x ,")       'hs-hide-block)
(global-set-key (kbd "C-x .")       'hs-show-block)
(global-set-key (kbd "C-x <")       'hs-hide-level)
(global-set-key (kbd "C-x >")       'hs-show-all)
(global-set-key (kbd "C-x p")       'replace-string)
(global-set-key (kbd "M-t")         'indent-guide-mode)
(global-set-key (kbd "M-z")         'repeat)
(global-set-key (kbd "C-x C-a")     'align-repeat)
(global-set-key (kbd "C-x t")       'indent-region)
(global-set-key (kbd "C-c f n")     'flycheck-next-error)
(global-set-key (kbd "C-c f p")     'flycheck-previous-error)
(define-key global-map "\C-c l"     'org-store-link)
(define-key global-map "\C-c a"     'org-agenda)
(global-set-key (kbd "C-c C-x a")   'org-archive-done-tasks)
(global-set-key (kbd "C-c t")       'org-complete-and-archive)
(global-set-key (kbd "C-c d")       'insert-current-date-time)
(global-set-key (kbd "C-v")         'scroll-up-partial)
(global-set-key (kbd "M-v")         'scroll-down-partial)
(global-set-key (kbd "<mouse-5>")   'scroll-up)
(global-set-key (kbd "<mouse-4>")   'scroll-down)
(global-set-key (kbd "M-<right>")   'forward-word)
(global-set-key (kbd "M-<left>")    'backward-word)
(global-set-key (kbd "M-<up>")      'backward-paragraph)
(global-set-key (kbd "M-<down>")    'forward-paragraph)
(global-set-key (kbd "C-x C-j")     'jedi:show-doc)
(global-set-key (kbd "C-M-m")       'xterm-mouse-mode)
(define-key dired-mode-map "\C-i"   'dired-subtree-insert)
(define-key dired-mode-map "\C-k"   'dired-subtree-remove)
(global-set-key [f5]                'neotree-toggle)
(global-set-key (kbd "C-l")         'recenter-top-bottom)
