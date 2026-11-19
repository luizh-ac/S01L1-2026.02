(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (make-garota-magica :nome      (garota-magica-nome g)
                      :escuridao (if (>= quantidade (garota-magica-escuridao g))
                                     0
                                     (- (garota-magica-escuridao g) quantidade))
                      :bruxas    (garota-magica-bruxas g)))

(defun main ()
  (let* ((madoka (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 3))
         (homura (make-garota-magica :nome "Homura" :escuridao 70 :bruxas 25))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 85 :bruxas 8))
         (grupo (list madoka homura sayaka))
         (kyoko (make-garota-magica :nome "Kyoko" :escuridao 40 :bruxas 15))
         (grupo-novo (cons kyoko grupo)))
    (format t "--- Joias da Alma ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (format t "--- Novo Contrato: ~a ---~%" (garota-magica-nome kyoko))
    (format t "Escuridao total do grupo novo: ~a~%" (escuridao-total grupo-novo))
    (format t "Escuridao total do grupo anterior: ~a~%" (escuridao-total grupo))

    (let ((sayaka-purificada (purifica sayaka 50)))
      (format t "--- Semente da Aflicao ---~%")
      (format t "~a original: ~a~%"
              (garota-magica-nome sayaka) (garota-magica-escuridao sayaka))
      (format t "~a purificada: ~a~%"
              (garota-magica-nome sayaka-purificada)
              (garota-magica-escuridao sayaka-purificada)))))

(main)