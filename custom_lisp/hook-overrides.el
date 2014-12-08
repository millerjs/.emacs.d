(eval-after-load "cc-mode" '(progn (define-key c++-mode-map (kbd "C-d") 'backward-kill-word)
                                   (define-key c++-mode-map (kbd "M-d") 'kill-word)))


;; Turn off line wrapping
(set-default 'truncate-lines t)

(defvar override-mode-map (make-keymap) "override-mode-map")

;; backword word kill
(define-key override-mode-map (kbd "C-d") 'backward-kill-word)

;; cutsom relative line jumping
(define-key override-mode-map (kbd "C-M-n") 'jump-forward-column)
(define-key override-mode-map (kbd "C-M-p") 'jump-backward-column)

;; view commands
(define-key override-mode-map (kbd "C-c C-v") 'recenter-top-bottom)

;; custom word jumps

(fset 'move-beginning-next-word
   "\C-[f\C-[f\C-[b")


(fset 'move-end-previous-word
;;   "\C-[\C-b\C-[\C-b\C-[f")
   "\C-[b\C-[b\C-[f")

(define-key override-mode-map (kbd "C-M-f") 'move-beginning-next-word)
(define-key override-mode-map (kbd "C-M-b") 'move-end-previous-word)
(define-key override-mode-map (kbd "M-b") 'backward-word)
(define-key override-mode-map (kbd "C-h") 'backward-delete-char)


(define-minor-mode override-mode
  "A minor mode so that my key settings override annoying major modes."
  t " ovrrd " 'override-mode-map)

(override-mode 1)
(smart-tab-mode)

(defun my-minibuffer-setup-hook ()
  (override-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)


(global-set-key (kbd "C-c j f") 'for-loop)
