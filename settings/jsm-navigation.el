;;; jsm-navigation.el --- Custom ways to get around -*-lexical-binding: t-*-

;; Version: 0.0.0
;; Author: Joshua Miller <jsmiller@uchicago.edu>

;;; Commentary:
;;

;;; Code:



;; ======================================================================
;; Project Management

(defun jsm-is-projectile-project ()
  "Retrieves the root directory of a project if available.
The current directory is assumed to be the project's root otherwise."
  (let ((dir default-directory))
    (or (cl-some
         (lambda (func)
           (let* ((cache-key (format "%s-%s" func dir))
                  (cache-value (gethash cache-key projectile-project-root-cache)))
             (if (and cache-value (file-exists-p cache-value))
                 cache-value
               (let ((value (funcall func (file-truename dir))))
                 (puthash cache-key value projectile-project-root-cache)
                 value))))
         projectile-project-root-files-functions)
        nil)))

(defun jsm-find-file ()
  "Find file using projectile if in project."
  (interactive)
  (if (jsm-is-projectile-project)
      (call-interactively 'projectile-find-file)
    (call-interactively 'find-file)))

(require 'neotree)
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq projectile-globally-ignored-file-suffixes '(".log"))
(setq neo-smart-open t)


;; ======================================================================
;; ido

;; (defvar ido-enable-replace-completing-read t
;;   "If t, use ido-completing-read instead of completing-read if possible.

;;     Set it to nil using let in around-advice for functions where the
;;     original completing-read is required.  For example, if a function
;;     foo absolutely must use the original completing-read, define some
;;     advice like this:

;;     (defadvice foo (around original-completing-read-only activate)
;;       (let (ido-enable-replace-completing-read) ad-do-it))")

;; ;; Replace completing-read wherever possible, unless directed otherwise
;; (defadvice completing-read
;;     (around use-ido-when-possible activate)
;;   (if (or (not ido-enable-replace-completing-read) ; Manual override disable ido
;;           (and (boundp 'ido-cur-list)
;;                ido-cur-list)) ; Avoid infinite loop from ido calling this
;;       ad-do-it
;;     (let ((allcomp (all-completions "" collection predicate)))
;;       (if allcomp
;;           (setq ad-return-value
;;                 (ido-completing-read prompt
;;                                      allcomp
;;                                      nil require-match initial-input hist def))
;;         ad-do-it))))

;; (setq ido-enable-replace-completing-read t)

;; =======================================================================
;; Navigation related options

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)


;; ======================================================================
;; Searching

(fset 'jsm-ruby-def-grep-goto "\C-[xprojectile-ripgrep\C-m\C-a(def (self\\.)|class )\C-m\C-xo\C-[:(sleep-for 0.2)\C-mn\C-m")
(fset 'jsm-lookup-coffee "\C-xg:\C-m\C-[:(sleep-for .\C-?0.2)\C-mn\C-xon\C-m\C-l")


;; =======================================================================
;; Inter-buffer navigation

(defun close-all-buffers ()
  (interactive)
    (mapc 'kill-buffer (buffer-list)))

(defun emacs-buffer-p (name)
  (string-match-p "\\*.*" name))


(defun next-non-emacs-buffer (&optional original)
  "Similar to next-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (next-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (next-non-emacs-buffer tmp-orig))))


(defun previous-non-emacs-buffer (&optional original)
  "Similar to previous-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (previous-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (previous-non-emacs-buffer tmp-orig))))


;; ======================================================================
;; Intra-buffer navigation

(defun move-middle-line  ()
  "Move to middle of current line."
  (interactive)
  (move-beginning-of-line 1)
  (forward-midpoint))

(defun backward-midpoint ( )
  "Move backward to midpoint between current position and beginning of line."
  (interactive)
  (backward-char (/ (- (point) (line-beginning-position)) 2)))

(defun forward-midpoint ( )
  "Move forward to midpoint between current position and end of line."
  (interactive)
  (forward-char (/ (- (line-end-position) (point)) 2)))


(defun length-of-line ()
  "Returns the length of the line"
  (setq start (what-cursor-position))
  (setq start (string-to-number (replace-regexp-in-string ".+=" "" start)))
  (move-end-of-line 1)
  (setq end (what-cursor-position))
  (setq end (replace-regexp-in-string ".+=" "" end))
  (move-to-column start)
  (string-to-number end)
)


(defun jump-forward (cmd)
  "Jumps forward lines as noted by line numbering. a2 goes forward 27 lines"
  (interactive "s")
  (setq parsed (s-match "\\([a-z0-9]\\)*" cmd))
  (setq lines-n (- (aref (-first-item parsed) 0) 96))
  (setq lines-mult (- (max (string-to-number (nth 1 parsed)) 1) 1))
  (next-line (+ lines-n (* lines-mult 26)))
  (move-middle-line))


(defun jump-backward (cmd)
  "Jumps backward lines as noted by line numbering. a2 goes backward 27 lines"
  (interactive "s")
  (setq parsed (s-match "\\([a-z0-9]\\)*" cmd))
  (setq lines-n (- (aref (-first-item parsed) 0) 96))
  (setq lines-mult (- (max (string-to-number (nth 1 parsed)) 1) 1))
  (previous-line (+ lines-n (* lines-mult 26)))
  (move-middle-line))


(defun window-partial ()
  "Get partial size of window for partial scrolls"
  (max 1 (/ (1- (window-height (selected-window))) 4)))


(defun scroll-up-partial ()
  "Scroll partially up the current buffer"
  (interactive)
  (scroll-up (window-partial)))


(defun scroll-down-partial ()
  "Scroll partially down the current buffer"
  (interactive)
  (scroll-down (window-partial)))


;; ======================================================================
;; YASnippet

(require 'yasnippet)
(define-key yas-keymap (kbd "TAB") 'yas-next-field)
(define-key yas-keymap (kbd "<tab>") 'yas-next-field)


;; ======================================================================

(provide 'jsm-navigation)
;;; jsm-navigation.el ends here
