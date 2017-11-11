(define-module (hlwm)
  #:use-module (ice-9 match)
  #:use-module (ice-9 optargs)
  #:use-module (scripting)
  #:use-module (pipe))

(define-public (hlwm-attr attr)
  (-> (system-output (string-append "herbstclient attr " attr))
      (string-trim-right #\newline)))

(define-public (hlwm-tags)
  (->> (string-split (system-output "herbstclient tag_status") char-whitespace?)
       (filter (lambda (s) (not (string-null? s))))))

(define*-public (hlwm-tag-status
                 tag
                 #:optional (curtag-clients
                             (-> (hlwm-attr "tags.focus.client_count")
                                 (string->number))))
  (match (string (string-ref tag 0))
         ("!" 'urgent)
         ("#" (if (zero? curtag-clients) 'free 'occupied))
         (":" 'occupied)
         ("." 'free)))

(define-public (hlwm-curtag-name)
  (hlwm-attr "tags.focus.name"))

(define-public (hlwm-tag-name tag)
  (string (string-ref tag 1)))

(define-public (hlwm-curtag? tag)
  (equal? (hlwm-tag-name tag) (hlwm-curtag-name)))

(define-public (hlwm-tag-name->index tag)
  (-> (hlwm-attr (string-append "tags.by-name." (hlwm-tag-name tag) ".index"))
      (string->number)))
