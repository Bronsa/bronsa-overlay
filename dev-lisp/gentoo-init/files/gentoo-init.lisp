(in-package #:cl-user)

#+(or sbcl ecl allegro) (require :asdf)
#-(or sbcl ecl allegro)
(let ((*compile-print* nil)
      (*compile-verbose* nil)
      #+cmu (ext:*gc-verbose* nil))
  (handler-bind ((warning #'muffle-warning))
    (load #p"/usr/share/common-lisp/source/asdf/asdf.lisp"
          :print nil :verbose nil)))

(push #p"/usr/share/common-lisp/systems/" asdf:*central-registry*)

(let ((*compile-print* nil)
      (*compile-verbose* nil)
      #+cmu (ext:*gc-verbose* nil))
  (handler-bind ((warning #'muffle-warning))
    (asdf:oos 'asdf:load-op :asdf-binary-locations)))
(setf asdf:*centralize-lisp-binaries* t)
(setf asdf:*default-toplevel-directory* #P"/var/cache/fasls/")
         
;;; If a fasl was stale, try to recompile and load (once).
(defmethod asdf:perform :around ((o asdf:load-op)
                                 (c asdf:cl-source-file))
  (handler-case (call-next-method o c)
    ;; If a fasl was stale, try to recompile and load (once).
    (sb-ext:invalid-fasl ()
                         (asdf:perform (make-instance 'asdf:compile-op) c)
                         (call-next-method))))

