package  {
	import flash.display.MovieClip;
	public class Codigo extends MovieClip {
		//Creamos dos variables para almacenar las areas de las figuras
			private var areaCirculo:Number;
			private var areaTriangulo:Number;
			
		public function AreaCirculo(val:Number) {
			//Se recibe el parametro que es el radio del circulo para con este sacar el area
			var radio:Number = val;
			areaCirculo = 3.1416 * (radio * radio);
			
		}
		//Retornamos el valor areaCirculo para mostrarlo en el texto dinamico
		public function Circulo():String{
			return areaCirculo.toString();
			
		}
		public function AreaTriangulo(val2:Number, val3:Number) {
			//Se reciben 2 valores de parametro que son la base y la altura
			var basee:Number = val2;
			var alturaa:Number = val3;
			//Se saca el area del triángulo
			areaTriangulo = (basee*alturaa)/2;
			
		}
		//Con esta funcion retornamos el area del triangulo para mostrarla en el texto dinamico
		public function Triangulo():String{
			return areaTriangulo.toString();
			
		}

	}
	
}
