package  {
	import flash.events.MouseEvent;
	
	public class numeros {
		var num:Array =  new Array();
		var pares:int = 0;
		var impar:int = 0;
		var negativo:int = 0;
		var resultado:Number = 0;
		var suma:Number = 0;
		var promedio:Number;

		public function numeros() {
			
			empezar_btn.addEventListener(MouseEvent.CLICK, empezar);
		}
		
		public function empezar(event:MouseEvent):void{
			
			gotoAndStop(2);
			resultado_btn.visible = false;
			guardar_btn.addEventListener(MouseEvent.CLICK, guardar);
			resultado_btn.addEventListener(MouseEvent.CLICK, resultados);
			reiniciar_btn.addEventListener(MouseEvent.CLICK, reiniciar);
		}
		
		public function guardar(event:MouseEvent):void{
			if(!isNaN(Number(numero_txt.text)) && numero_txt.text != ""){
				num.push(Number(numero_txt.text));
				numero_txt.text = "";
				if(num.length == 4){
					guardar_btn.visible =  false;
					resultado_btn.visible = true;
				}
			}
		}
		
		public function resultados(event:MouseEvent):void{
			for(var i:int = 0; i < 4; i++){
				if(num[i] > 0 && num[i] % 2 == 0){
					pares += 1;
				} else if(num[i] > 0 && num[i] % 2 != 0){
					impar += 1;
				} else if(num[i] < 0){
					negativo += 1;
				}
			}
			
			if(negativo > 0){
				for(var i:int = 0; i < 4; i++){
					resultado -= num[i];
				}
			} else if(impar > 0){
				for(var i:int = 0; i < 4; i++){
					suma += num[i];
				}
				promedio = suma / 4;
				resultado = promedio;
			} else if(pares > 0){
				for(var i:int = 0; i < 4; i++){
					suma += num[i];
				}
				resultado = suma;
			}
			
			resultados_txt.text = String(resultado);
		}
		
		public function reiniciar(event:MouseEvent):void{
			num = new Array();
			pares = 0;
			negativo = 0;
			impar = 0;
			resultado = 0;
			promedio = 0;
			suma = 0;
			
			guardar_btn.visible = true;
			
		}

	}
	
}
