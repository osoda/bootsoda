Process, Priority,, High
F12:: reload
;Procesos

; ------------------------------------------------- ------------------------------
; Verifica que Dofus este abierto y con el foco
; ------------------------------------------------- ------------------------------
#IfWinActive Dofus
{
	; ------------------------------------------------- ------------------------------
	; Espera la ejecucion de la tecla Fin
	; ------------------------------------------------- ------------------------------
	~End::
	{
		;==================== Inico del script ====================
		
		; Las variables se inicializan globalmente para qur puedan mantener su valor en todas las funciones:
		Global 	Cordenadas := {base: {addr: Func("ArrayGrupos_Addr"), __Set: Func("ArrayGrupos_Setter")}} ; Creamos una matriz que tendra dos dimensiones para almacenar las cordenadas del recurso inferior
		
		Global Contador ; Se crea un contador para almacenar el numero de veces que se envía el comando de cortar recurso.
		
		Global ContadorPods ; Igual que el anterior, pero esta vez para guardar los los pods que almacena por recurso ###Editarcomentario##
		
		;Global Frases ; Inicializa la variable y luego se le asigna un valor aleatorio.
		
		Contador := 0 ; Se inicaliza el contador en  0.
		
		; ------------------------------------------------- ------------------------------
		; Se encarga de la siega
		; ------------------------------------------------- ------------------------------
		Segar()
		;Frases()
	}
	
	Segar() ;Declaracion de la funcion que se encarga de segar
	{
		Global Contador
		Global Frases
		Global Cordenadas
		Random, SleepTime, 12000, 14000 ; Tomamos un valor al azar del tiempo de inactividad de la siega y lo guardamos en la variable SleepTime
		If (Contador = 50) ; Si el ya se ha segado 50 veces entonces se escribira una frase al azar, para despistar ue no sea un boot
			Frases() ; Ejecutamos la funcion que lanza frases al azar
		
		PixelSearch, X, Y, -1280, 0, -1, 1016, 0x880015, 0, Fast RGB ; Buscamos el pixel que define el trigo desde la posicion x=-1280 (por las dos pantallas del pc), despues del color definimos la variacion a 0, y una busqueda rapida de colores RGB
		If ErrrorLever = 0 ; Comprobamos si el colo se ha encontrado
		{
			Cordenas[1] := X ; Asigamos la cordenadas X a la variable global de Cordenadas
			Cordenas[2] := Y ; Hacemos lo mismo pero con Y
			
			Contador++ ; Le añadimos uno al contador de Segadas
			ContadorPods++ ; Le añadimos 1 item
			
			MouseMove, Cordenadas[1], Cordenadas[2] 
			MsgBox % "No hubo Errrores" . Y
		}
		
		MsgBox % X . " - " . Y
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 1366, 768, *115 C:\Users\user\Desktop\Autohotkey\Dofus\MazCampo\xCopiados\Screen_20160729164247.png
		If ErrorLevel = 0
		{
			MsgBox % FoundX . " - " . FoundY
		}
		
		MsgBox, Nada No sirver
	}
	
	Frases() ;Creamos una funcion con frases aleatorias
	{
		Global Contador
		
		CoordChatX := -13666 ; Cordenada en el eje X del Chat
		CoordChatY := 724 ; Cordenada en el eje Y del Chat
		Random, Frases, 1, 5 ; Sirve para esoger una de las frases al azar
		;Frases := 1
		MouseClick, left, CoordChatX, CoordChatY ;Clickeamos en el chat para que podemas escibir sobre el
		
		If Frases = 1 
			Send "tu est lvl combien ?"
		If Frases = 2 
			Send "je suis lvl 100 paysan"
		If Frases = 3 
			Send "paysans c'est facile"
		If Frases = 4 
			Send "je suis aussi boulanger 100"
		If Frases = 5 
			Send "ZZZzzzZZZzzzZZZzzzZZZzzzZZZzzz...ZZZ!"
		
		Sleep, 1300 ; Espamos un poquito mas de un segundo 
		Send {Enter} ; Y presionamos enter
		Contador := 0 ; Reinicializamos el contador
	}
	return
}