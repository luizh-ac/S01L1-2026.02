(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro  1.5)
    (:hydro    1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d) (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((possiveis (remove-if-not (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                                   lista))
         (textos (mapcar (lambda (d)
                           (format nil "~a - ~,1f mora" (dominio-nome d) (recompensa-final d)))
                         possiveis)))
    textos))

(defun main ()
  (let ((dominios (list
                   (make-dominio :nome "Cecilia Garden" :elemento :anemo
                                 :dificuldade 2 :mora 1000)
                   (make-dominio :nome "Midsummer Courtyard" :elemento :electro
                                 :dificuldade 3 :mora 1200)
                   (make-dominio :nome "Domain of Guyun" :elemento :hydro
                                 :dificuldade 4 :mora 1500)
                   (make-dominio :nome "Hidden Palace of Zhou Formula" :elemento :pyro
                                 :dificuldade 5 :mora 2000)
                   (make-dominio :nome "Peak of Vindagnyr" :elemento :cryo
                                 :dificuldade 1 :mora 800))))
    (format t "--- Rota ate dificuldade 3 ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~a~%" texto))

    (format t "--- Total de Mora ---~%")
    (format t "~,1f mora~%" (reduce #'+ (mapcar #'recompensa-final dominios)))

    (let ((copia (copy-dominio (car dominios))))
      (setf (dominio-mora copia) 5000)
      (format t "--- O Lisp permite alterar (setf) ---~%")
      (format t "Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora (car dominios))))))

(main)