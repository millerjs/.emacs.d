;; Turn menu off
(define-key global-map [menu-bar tools]   nil)
(define-key global-map [menu-bar file]    nil)
(define-key global-map [menu-bar edit]    nil)
(define-key global-map [menu-bar options] nil)
(define-key global-map [menu-bar buffer]  nil)

;; Set new menu
(define-key-after
  global-map
  [menu-bar mymenu]
  (cons
   "     0    5    10   15   20   25   30   35   40   45   50   55   60   65   70   75   80   85   90   95  100  105  110  115  120  125  120  135  140  145  150  155  160"
   (make-sparse-keymap "hoot hoot"))
  'tools )


(defun move-middle-line  () (interactive)
   (forward-word 1)
   (backward-word 1)

   (setq l (what-cursor-position))
   (setq l (replace-regexp-in-string ".+=" "" l))
   (setq m (string-to-number l))

   (move-end-of-line 1)
   (setq l (what-cursor-position))
   (setq l (replace-regexp-in-string ".+=" "" l))
   (setq n (/ (string-to-number l) 2))
   (move-to-column (+ n m))

)

(defun jump-forward-column (cmd)
  (interactive "s")
  (setq lines-str (-first-item (s-match "\\([a-z]\\)*" cmd)))
  (next-line
   (+ (* (- (length lines-str) 1) 26) (- (aref lines-str 0) 96)))
  (move-to-column
   (string-to-number (-last-item (s-match "\\([a-z]\\)*\\([0-9]*\\)" cmd))))
)

(defun jump-backward-column (cmd)
  (interactive "s")
  (setq lines-str (-first-item (s-match "\\([a-z]\\)*" cmd)))
  (previous-line
   (+ (* (- (length lines-str) 1) 26) (- (aref lines-str 0) 96)))
  (move-to-column
   (string-to-number (-last-item (s-match "\\([a-z]\\)*\\([0-9]*\\)" cmd))))
)
