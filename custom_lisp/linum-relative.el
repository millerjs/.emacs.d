;;; linum-relative.el --- display relative line number in the left margin

;; Copyright 2012 Yen-Chin,Lee
;;
;; Author: coldnew <coldnew.tw@gmail.com>
;; Keywords: converience
;; X-URL: http://www.emacswiki.org/cgi-bin/wiki/download/linum-relative.el
;; Version: 0.2

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;;
;; Display relative line numbers for the current buffer.
;;

;;; Usage:
;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'linum-relative)

;;; Changelog
;;
;; 2012/09/05
;; Added linum-relative-toggle command.
;;
;; 2012/09/03 merge patch from Raffaele Ricciardi
;; Added linum-relative-plusp-offset.
;; Made linum-relative-current-symbol optional.
;; Minor refactorings.

;;; Code:

(eval-when-compile (require 'cl))
(require 'linum)

;;;; Faces
(defface linum-relative-current-face
  '((t :inherit linum :foreground "#CAE682" :background "#444444" :weight bold))
  "Face for displaying current line."
  :group 'linum)

;;;; Local vars

(defvar linum-relative-last-pos 0
  "Store last position.")

(defvar linum-relative-current-symbol "0"
  "The symbol you want to show on the current line, by default it is 0.
   You can use any string like \"->\". ")

(defvar linum-relative-plusp-offset 0
  "Offset to use for positive relative line numbers.")

(defvar linum-relative-format "%3s› "
  "Format for each line. Good for adding spaces/paddings like so: \" %3s \"")

;;;; Advices
(defadvice linum-update (before relative-linum-update activate)
  "This advice get the last position of linum."
  (setq linum-relative-last-pos (line-number-at-pos)))

;;;; Functions
(defun linum-relative (line-number)
  (let* ((diff1 (abs (- line-number linum-relative-last-pos)))
      (diff (if (minusp diff1)
               diff1
           (+ diff1 linum-relative-plusp-offset)))
       (current-p (= diff linum-relative-plusp-offset))
        (current-symbol (if (and linum-relative-current-symbol current-p)
                     linum-relative-current-symbol
                     (number-to-string diff)))
         (face (if current-p 'linum-relative-current-face 'linum)))
    (propertize (format linum-relative-format current-symbol) 'face face)))




(defun decode-hex-string (hex-string)
  (let ((res nil))
    (dotimes (i (/ (length hex-string) 2) (apply #'concat (reverse res)))
      (let ((hex-byte (substring hex-string (* 2 i) (* 2 (+ i 1)))))
        (push (format "%c" (string-to-number hex-byte 16)) res)))))


(defun linum-relative2 (line-number)
  (let* ((diff1 (abs (- line-number linum-relative-last-pos)))
      (diff (if (minusp diff1)
               diff1
           (+ diff1 linum-relative-plusp-offset)))
       (current-p (= diff linum-relative-plusp-offset))
        (current-symbol (if (and linum-relative-current-symbol current-p)
                     linum-relative-current-symbol
                     (number-to-string diff)))
         (face (if current-p 'linum-relative-current-face 'linum)))


    (propertize (format linum-relative-format
            (if (< (string-to-number current-symbol) 131)
            (substring "  a b c d e f g h i j k l m n o p q r s t u v w x y z a2b2c2d2e2f2g2h2i2j2k2l2m2n2o2p2q2r2s2t2u2v2w2x2y2z2a3b3c3d3e3f3g3h3i3j3k3l3m3n3o3p3q3r3s3t3u3v3w3x3y3z3a4b4c4d4e4f4g4h4i4j4k4l4m4n4o4p4q4r4s4t4u4v4w4x4y4z4a4b4c4d4e4f4g4h4i4j4k4l4m4n4o4p4q4r4s4t4u4v4w4x4y4z4a5b5c5d5e5f5g5h5i5j5k5l5m5n5o5p5q5r5s5t5u5v5w5x5y5z5"
                   (* 2 (string-to-number current-symbol))
                   (+ (* 2 (string-to-number current-symbol)) 2)) "-" ))
        'face face)))



(defun linum-relative-toggle ()
  "Toggle between linum-relative and linum."
  (interactive)
  (if (eq linum-format 'dynamic)
      (setq linum-format 'linum-relative)
    (setq linum-format 'dynamic)))

(setq linum-format 'linum-relative2)

(provide 'linum-relative)
;;; linum-relative.el ends here.
