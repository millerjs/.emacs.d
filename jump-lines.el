
;; ----------- [ Binary navigation
 (defun move-middle-line  () (interactive)
   (move-end-of-line 1)
   (setq l (what-cursor-position))
   (setq l (replace-regexp-in-string ".+=" "" l))
   (setq n (/ (string-to-number l) 2))
   (move-to-column n)

)


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


(defun jump-forward (lines)
  "Jump forward n lines"
  (interactive "s")
  (next-line (/ (search lines "     a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z aa bb cc dd ee ff gg hh ii jj kk ll mm nn oo pp qq rr ss tt uu vv ww xx yy zzaaabbbcccdddeeefffhhhgggiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz") 3)))


(defun jump-backward (lines)
  "Jump backward n lines"
  (interactive "s")
  (previous-line (/ (search lines "     a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z aa bb cc dd ee ff gg hh ii jj kk ll mm nn oo pp qq rr ss tt uu vv ww xx yy zzaaabbbcccdddeeefffhhhgggiiijjjkkklllmmmnnnooopppqqqrrrssstttuuuvvvwwwxxxyyyzzz") 3)))



