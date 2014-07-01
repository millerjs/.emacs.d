
;; ----------- [ Binary navigation
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

(defun move-column (lines)
  "Jump forward n lines"
  (interactive "s")
  (move-beginning-of-line 0)
  (move-to-column (* 5 (search lines    "abcdefghijklmnopqrstuvwxyz" )))
)



;; (defun jump-backward-column (lines col)
;;   "Jump forward n lines"
;;   (interactive "s\ns")
;;   (previous-logical-line (+ -1 (/ (search lines "     a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z aa bb cc dd ee ff gg hh ii jj kk ll mm nn oo pp qq rr ss tt uu vv ww xx yy zzaaabbbcccdddeeefffhhhgggiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz") 3)))
;;   (move-column col)
;; )

;; (defun jump-backward-column (s)
;;   (interactive "sGO? :")
;;   (let* ((move 'previous-line)
;;          (char-to-pos (lambda (c) (- c 96)))
;;          (nums (string-to-list s))
;;          (first (car nums))
;;          (count (apply '+ (mapcar (lambda (c) (if (equalp first c) 1 0)) nums))))
;;     ;; (ignore-errors
;;       (progn
;;         (funcall move (+ (funcall char-to-pos first) (* 26 (- count 1))))
;;         (when (> count 1) 
;;           (move-to-column (* (funcall char-to-pos (car (last nums))) 5))))))


;; (defun jump-forward-column (s)
;;   (interactive "sGO? :")
;;   (let* ((move 'next-line)
;;          (char-to-pos (lambda (c) (- c 96)))
;;          (nums (string-to-list s))
;;          (first (car nums))
;;          (count (apply '+ (mapcar (lambda (c) (if (equalp first c) 1 0)) nums))))
;;     ;; (ignore-errors
;;       (progn
;;         (funcall move (+ (funcall char-to-pos first) (* 26 (- count 1))))
;;         (when (> count 1) 
;;           (move-to-column (* (funcall char-to-pos (car (last nums))) 5))))))

(defun jump-forward-column (cmd)
  (interactive "s")
  (next-line (string-to-number (parse-jump-cmd "0" cmd)))
  (if (string= (parse-jump-cmd "1" cmd) "0") nil 
    (move-to-column (string-to-number (parse-jump-cmd "1" cmd))))
  ;; (recenter-top-bottom)
)

(defun jump-backward-column (cmd)
  (interactive "s")
  (previous-line (string-to-number (parse-jump-cmd "0" cmd)))
  (if (string= (parse-jump-cmd "1" cmd) "0") nil 
    (move-to-column (string-to-number (parse-jump-cmd "1" cmd))))
  ;; (recenter-top-bottom)
)


;; (defun jump-forward-column (lines col)
;;   "Jump forward n lines"
;;   (interactive "s\ns")
;;   (next-logical-line (+ 1 (/ (search lines "     a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z aa bb cc dd ee ff gg hh ii jj kk ll mm nn oo pp qq rr ss tt uu vv ww xx yy zzaaabbbcccdddeeefffhhhgggiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz") 3)))
;;   (move-column col)
;; )


(defun jump-forward (lines)
  "Jump forward n lines"
  (interactive "s")
  (next-logical-line (/ (search lines "     a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z aa bb cc dd ee ff gg hh ii jj kk ll mm nn oo pp qq rr ss tt uu vv ww xx yy zzaaabbbcccdddeeefffhhhgggiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz") 3)))


(defun jump-backward (lines)
  "Jump backward n lines"
  (interactive "s")
  (previous-logical-line (/ (search lines "     a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z aa bb cc dd ee ff gg hh ii jj kk ll mm nn oo pp qq rr ss tt uu vv ww xx yy zzaaabbbcccdddeeefffhhhgggiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz") 3)))


;; (defun jump-relative (line)
;;   "Special goto-line for rel."
;;   (interactive "s")
;;   (yow t)
;;   (if (string-match "^\\+\\|-" line)
;;       (next-line (string-to-int line))
;;     (goto-line (string-to-int line)))
;;   (move-middle-line)

;; )

;; (defun jump-forward (lines)
;;   "Jump forward n lines"
;;   (interactive "s")
;;   (next-line (string-to-int lines)))

;; (defun jump-backward (lines)
;;   "Jump backward n lines"
;;   (interactive "s")
;;   (next-line (* -1 (string-to-int lines)))
;; )

