
(defvar mc-comp-list
  '(
    ;; C stataments
    ("if") ("if-else") ("if-check") ("for")
    ("errck") ("while") ("switch") ("case")
    ("default")
    ;; commonly used stats
    ("getopt") ("socket") ("malloc")
    )
  "Completion list")



(define-skeleton for-loop
      "Insert a C-style for loop"
      ""
      > "for(int " (setq i (skeleton-read "iterator: "))
      > " = 0; " i " < "  (setq n (skeleton-read "limit: ")) "; "
      > i "++){" \n)


