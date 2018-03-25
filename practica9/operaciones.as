package  {
	//Importamos las librerias que se van a utilizar
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.events.MouseEvent;
	
	public class operaciones extends MovieClip{
		//Declaramos las variables que se van a utilizar
		private var nombre:Array = new Array();
		private var calificaciones:Array =  new Array();
		private var num:Array = new Array();
		private var suma:Number = 0;
		private var prom:Number;
		private var nulos:Array = new Array();
		private var volt:Number;
		private var aux:Number;
		
		public function operaciones() {
			//Aninamos los datos del alumno
			var practica:Tween = new Tween(practica_txt, "x", Bounce.easeInOut, 900, 216, 2, true);
			var uni:Tween = new Tween(uni_txt, "x", Bounce.easeInOut, -900, 59, 2, true);
			var nombre:Tween = new Tween(alumno_txt, "x", Bounce.easeInOut, 900, 81, 2, true);
			var maestro:Tween = new Tween(maestro_txt, "x", Bounce.easeInOut, -900, 9, 2, true);
			var materia:Tween = new Tween(materia_txt, "x", Bounce.easeInOut, 900, 90, 2, true);
			var e1:Tween = new Tween(e1_btn, "x", Bounce.easeInOut, -900, 59, 2, true);
			var e2:Tween = new Tween(e2_btn, "x", Bounce.easeInOut, 900, 439, 2, true);
			
			//Asignamos las funciones para pasar a los fotogramas de los ejercicios
			e1_btn.addEventListener(MouseEvent.CLICK, e11);
			e2_btn.addEventListener(MouseEvent.CLICK, e22);
			
		}
		//Funciones para pasar al primer ejercicio
		function e11(event:MouseEvent):void{
			gotoAndStop(2);
			//Le asignamos las funciones a nuestros botones
			guardar_btn.addEventListener(MouseEvent.CLICK, guardar);
			mostrar_btn.addEventListener(MouseEvent.CLICK, promedio);
			portada_btn.addEventListener(MouseEvent.CLICK, portada);
		}
		//Funcion para pasar al ejercicio 2
		function e22(event:MouseEvent):void{
			gotoAndStop(3);
			//Le asignamos las funciones a nuestros botones
			guardar2_btn.addEventListener(MouseEvent.CLICK, guardar2);
			calcular_btn.addEventListener(MouseEvent.CLICK, cal);
			portada2_btn.addEventListener(MouseEvent.CLICK, portada);
		}
		
		//Funcion para el primer ejercicio
		function guardar(event:MouseEvent):void{
			//Si el nombre no es un numero guardamos lo que este ahi y la calificacion
			if(isNaN(Number(nombre_txt.text))){
				nombre.push(nombre_txt.text);
				calificaciones.push(Number(calificacion_txt.text));
				resultados_txt.text = "";
				nombre_txt.text = "";
				calificacion_txt.text = "";
			//De lo contrario mostramos un mensaje de error
			} else {
				resultados_txt.text = "Error en nombre";
			}
		}
		
		//Funcion para sacar el promedio
		function promedio(event:MouseEvent):void{
			//Sumamos las calificaciones
			for(var i:Number = 0; i < calificaciones.length; i++){
				suma += Number(calificaciones[i]);
			}
			//Lo dividimos entre el numero de alumnos
			prom = suma / nombre.length;
			//Mostramos el promedio
			promedio_txt.text = String(prom);
			
			//Mostramos el nombre con las calificaciones
			for(var j = 0; j < calificaciones.length; j++){
				resultados_txt.text += nombre[j] + " " + calificaciones[j] + "\n";
			}
		}
		
		//Funcion para regresar a la portada
		function portada(event:MouseEvent):void{
			gotoAndStop(1);
			//Le asignamos las funciones para ir a los ejercicios a nuestros botones
			e1_btn.addEventListener(MouseEvent.CLICK, e11);
			e2_btn.addEventListener(MouseEvent.CLICK, e22);
			//Reinicializamos todos nuestros areglos
			for(var a:Number = 0; a < nombre.length; a++){
				nombre.pop();
				calificaciones.pop();
			}
			
			for(var a:Number; a < num.length; a++){
				num.pop();
			}
			for(var a:Number; a < nulos.length; a++){
				nulos.pop();
			}
			
		}
		
		//Funcion para guardar los numeros
		function guardar2(event:MouseEvent):void{
			//Si no es un numero mostramos un mensaje de error
			if(isNaN(Number(numer_txt.text))){
				numer_txt.text = "Error";
			//Si es un numero o esta vacio guardamos lo que este en la caja
			} else {
				num.push(Number(numer_txt.text));
				numer_txt.text = "";
			}
		}
		
		function cal(event:MouseEvent):void{
			//Mostramos nuestro arreglo
			for(var j:Number = 0; j < num.length; j++){
				resultados2_txt.text += num[j] + " ";
			}
			//Buscamos las posiciones nulas
			for(var i:Number = 0; i < num.length; i++){
				if(num[i] == 0){
					nulos.push(i);
				}
			}
			//Si existe algun nulo mostramos el mensaje
			if(nulos.length > 0){
				resultados2_txt.text += "\n" + "Posiciones nulas en: "
			}
			
			//Mostramos las posiciones nulas
			for(var j:Number = 0; j < nulos.length; j++){
				resultados2_txt.text += nulos[j] + "  ";
			}
			resultados2_txt.text += "\n";
			//Usamos un auxiliar para voltear el arreglo
			aux = num.length - 1;
			//Volteamos el arreglo
			trace(num.length);
			for(var l:Number = 0; l < num.length; l++){
				trace(l);
				volt = num[l];
				trace(volt);
				num[l] = num[aux];
				trace(num[l]);
				num[aux] = volt;
				trace(num[aux]);
				aux -= 1;
				if(aux > (num.length / 2)){
					break;
				}
			}
			trace(num);
			//Sacamos los valores que tenemos en nulos
			for(var i:Number = 0; i < nulos.length; i++){
				nulos.pop();
			}
			//Mostramos nuestro arreglo ordenado
			for(var j:Number = 0; j < num.length; j++){
				resultados2_txt.text += num[j] + " ";
			}
			
			resultados2_txt.text += "\n";
			//Buscamos las posiciones nulas
			for(var i:Number = 0; i < num.length; i++){
				if(num[i] == 0){
					nulos.push(i);
				}
			}
			//Si existe algun nulo mostramos ese mensaje
			if(nulos.length > 0){
				resultados2_txt.text += "\n" + "Posiciones nulas en: "
			}
			
			//Despues del mensaje mostramos las posiciones nulas
			for(var j:Number = 0; j < nulos.length; j++){
				resultados2_txt.text += nulos[j] + "  ";
			}
			resultados2_txt.text += "\n";
		}
	
	}
	
}
