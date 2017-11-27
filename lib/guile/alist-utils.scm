(define-module (alist-utils)
  #:use-module (srfi srfi-1))

;; Quite useless to use compared to just acons, as assoc and assoc-ref return
;; the first pair from pairs with the same key anyway, but using this does
;; remove stateful cruft, which is useful for example when storing data to disk.
(define-public (assoc-replace key value alist)
  (acons key value (alist-delete key alist)))
