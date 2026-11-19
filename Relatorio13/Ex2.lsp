(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva  "Agressiva")
    (:leviata    "Leviata: mantenha distancia")
    (otherwise   "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a (~a, ~am) - ~a"
          (criatura-nome c) (criatura-bioma c) (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Recifes Rasos"
                  :profundidade 20 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Floresta de Algas"
                  :profundidade 60 :perigo :agressiva)
   (make-criatura :nome "Crabsnake" :bioma "Cavernas de Cogumelos"
                  :profundidade 300 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Ilha Flutuante"
                  :profundidade 150 :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan" :bioma "Vazio"
                  :profundidade 500 :perigo :leviata)))

(defun main ()
  (format t "--- Scanner de 4546B ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  (let ((fundas (abaixo-de 100 *catalogo*)))
    (format t "--- Abaixo de 100m ---~%")
    (dolist (texto (mapcar #'descreve-criatura fundas))
      (format t "~a~%" texto))
    (format t "Total abaixo de 100m: ~a~%" (length fundas))))

(main)