(define-module (string))

;; Note that this only splits on the first occurrence of the substring, instead
;; of every occurrence like it probably should based on its name.
(define-public (string-substring-split str substr)
  ((lambda (substr-index)
     (if substr-index
         (list (substring str 0 substr-index)
               (substring str (+ substr-index (string-length substr))))
         #f))
   (string-contains str substr)))
