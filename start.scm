;; If you can see this file, then you haven't mounted your working directory
;; into the container. Use
;;
;; docker run -i -t -v /your/working/dir:/work apatil:docker-sicm
;;
;; For now, feel free to edit this file and play around, but bear in mind
;; that your changes will not be present next time you run the image.
;;
;; To start Scheme, do
;; M-x run-scheme-with-sicm
;; 
;; Then you can use the commands here: http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-user/GNU-Emacs-Interface.html
;; to interact with the Scheme repl.
;;
;; ** IMPORTANT NOTE **
;; You will often be prompted to type (RESTART 1) or somesuch. Use (restart 1)
;; (no caps) instead. I don't know why RESTART doesn't work.
;;
;; Here are the first few examples from the text:


(define ((L-free-particle mass) local)
  (let ((v (velocity local)))
    (* 1/2 mass (dot-product v v))))

(define q
  (up (literal-function 'x)
      (literal-function 'y)
      (literal-function 'z)))

;; Demonstrating the local tuple and the function S that gets
;; the Lagrantian for the coordinate path at any time t
(print-expression ((Gamma q) 't) )
(print-expression
 ((compose (L-free-particle 'm) (Gamma q)) 't))
(show-expression
 ((compose (L-free-particle 'm) (Gamma q)) 't))

(define (Lagrangian-action L q t1 t2)
  (definite-integral (compose L (Gamma q)) t1 t2))

(define (test-path t)
  (up (+ (* 4 t) 7)
      (+ (* 3 t) 5)
      (+ (* 2 t) 1)))

;; Compute the action for an example
(Lagrangian-action (L-free-particle 3.0) test-path 0.0 10.0)

;; A function that makes perturbations \nu that are zero at the
;; endpoints
(define ((make-eta nu t1 t2) t)
  (* (- t t1) (- t t2) (nu t)))

;; Compute the action for a perturbed test path
(define ((varied-free-particle-action mass q nu t1 t2) epsilon)
  (let ((eta (make-eta nu t1 t2)))
    (Lagrangian-action (L-free-particle mass)
		       (+ q (* epsilon eta))
		       t1
		       t2)))

;; Test the action for a perturbed test path
((varied-free-particle-action 3.0 test-path
			      (up sin cos square)
			      0.0 10.0) .001)
