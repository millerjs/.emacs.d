;;; jsm-bindings.el --- Lots of custom key bindings -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:

(require 'jsm-hooks)
(require 'jsm-navigation)

;; ======================================================================
;; Selection

(global-set-key (kbd "M-SPC")       'er/expand-region)

;; =======================================================================
;; View

(global-set-key (kbd "<f2>")        'toggle-truncate-lines)
(global-set-key (kbd "C-x ,")       'hs-hide-block)
(global-set-key (kbd "C-x .")       'hs-show-block)
(global-set-key (kbd "C-x <")       'hs-hide-level)
(global-set-key (kbd "C-x >")       'hs-show-all)

;; =======================================================================
;; Magit

(global-set-key (kbd "C-c m d")   'magit-diff-dwim)
(global-set-key (kbd "C-c m b")   'magit-blame)
(global-set-key (kbd "C-c m l")   'magit-log-all)
(global-set-key (kbd "C-c m f")   'magit-fetch-all)
(global-set-key (kbd "C-c m s")   'magit-status)

;; =======================================================================
;; Editing

(global-set-key (kbd "C-x m")       'jsm-comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-m")     'jsm-comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x p")       'replace-string)
(global-set-key (kbd "C-c C-s")     'sort-lines)

;; Transpose stuff with M-t (https://github.com/magnars/.emacs.d/)
(global-unset-key (kbd "M-t")) ;; which used to be transpose-words
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

;; =======================================================================
;; Whitespace

(global-set-key (kbd "C-x C-a")     'jsm-align-repeat)
(global-set-key (kbd "C-x t")       'indent-region)
(global-set-key (kbd "C-x w")       'just-one-space)

(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))


;; =======================================================================
;; Navigation

(global-set-key (kbd "C-x f")       'jsm-find-file)
(global-set-key (kbd "C-x g")       'projectile-ripgrep)
(global-set-key (kbd "C-c g")       'magit-status)
(global-set-key (kbd "C-c n")       'neotree-toggle)
(global-set-key (kbd "M-n")         'forward-paragraph)
(global-set-key (kbd "M-p")         'backward-paragraph)
(global-set-key (kbd "C-M-f")       'forward-midpoint)
(global-set-key (kbd "C-M-b")       'backward-midpoint)
(global-set-key (kbd "C-M-l")       'goto-line)
(global-set-key (kbd "C-M-n")       'relative-jump-forward)
(global-set-key (kbd "C-M-p")       'relative-jump-backward)
(global-set-key (kbd "M-m")         'move-middle-line)
(global-set-key (kbd "C-x l")       'next-non-emacs-buffer)
(global-set-key (kbd "C-x j")       'previous-non-emacs-buffer)
(global-set-key (kbd "C-v")         'scroll-up-partial)
(global-set-key (kbd "M-v")         'scroll-down-partial)
(global-set-key (kbd "<mouse-5>")   'scroll-up-partial)
(global-set-key (kbd "<mouse-4>")   'scroll-down-partial)

;; ======================================================================
;; Window Management

(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <down>")  'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "M--")         'shrink-window-horizontally)
(global-set-key (kbd "M-=")         'enlarge-window-horizontally)
(global-set-key (kbd "M-_")         'shrink-window)
(global-set-key (kbd "M-+")         'enlarge-window)
(global-set-key (kbd "C-c d")       'toggle-window-dedicated)


;; =======================================================================
;; Util

;; Org
(global-set-key (kbd "C-c t")       'org-complete-and-archive)

;; Spelling
(global-set-key (kbd "C-c s")       'ispell)
(global-set-key (kbd "<f7>")        'ispell-word)

;; Flycheck
(global-set-key (kbd "C-c C-n")     'flycheck-next-error)
(global-set-key (kbd "C-c C-l")     'flycheck-list-errors)
(global-set-key (kbd "C-M-y")       'kill-ring-search)

;; Documentation
(global-set-key (kbd "C-c w")       'webjump)

;; Yas
(define-key yas-keymap (kbd "`")    'yas-next-field)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

;; ido
(defun ido-define-keys ()
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "M-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "M-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; ======================================================================
;; Minor Modes

(global-set-key (kbd "C-c m t")       'indent-guide-mode)
(global-set-key (kbd "C-c m l")       'linum-mode)


;; =======================================================================
;; Decoration

(global-set-key (kbd "C-x h")       'jsm-insert-divider)

;; =======================================================================
;; Binding overrides

(define-key override-mode-map (kbd "C-d")      'backward-kill-word)
(define-key override-mode-map (kbd "C-M-n")    'relative-jump-forward)
(define-key override-mode-map (kbd "C-M-p")    'relative-jump-backward)
(define-key override-mode-map (kbd "M-b")      'backward-word)
(define-key override-mode-map (kbd "C-h")      'backward-delete-char)
(define-key override-mode-map (kbd "C-c C-l")  'flycheck-list-errors)


;; =======================================================================
;; Auto complete

(define-key ac-completing-map  "\r"      nil)
(define-key ac-menu-map        "\M-n"    'ac-next)
(define-key ac-menu-map        "\M-p"    'ac-previous)
(define-key ac-menu-map        "\C-n"    'next-line)
(define-key ac-menu-map        "\C-p"    'previous-line)
(define-key ac-completing-map  "\t"      'ac-complete)
(define-key ac-completing-map  "\C-j"    'ac-complete)
(define-key ac-completing-map  "\M-/"    'ac-stop)
(define-key ac-mode-map (kbd   "M-TAB")  'auto-complete)

(provide 'jsm-bindings)
;;; jsm-bindings.el ends here
