(define-module (alist))

(define-public (assoc-remove alist key)
  (delete (assoc key alist) alist))

(define-public (assoc-replace alist key value)
  (acons key value (assoc-remove alist key)))
