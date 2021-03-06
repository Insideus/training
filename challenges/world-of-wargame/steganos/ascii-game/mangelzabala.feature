# language: es

Característica: Resolver reto ascii Game
  Del sitio world of wargame
  De la categoría Steganos
  Con mi usuario sterben

  Antecedentes:
    Dado estoy registrado en el sitio world of wargame
    Y tengo el sistema operativo Windows 10
    Y tengo acceso a internet

  Escenario: Primer intento fallido
    Dado una pagina web con caracteres ascii
    Y el dibujo no era claro
    Y no se entendia el texto en la parte inferior izquierda el mensaje
    Entonces intento adivinar la palabra
    Entonces no resuelvo el reto
    Pero concluyo que el enunciado indica una frase secreta
    Entonces concluyo no puede ser tan obvio

  Escenario: Solución exitosa
    Dado que no es clara el texto en la parte inferior izquierda
    Entonces analizo minuciosamente la imagen linea por linea
    Y encuentro caracteres con sentido en la linea 102
    Entonces resulvo el reto
