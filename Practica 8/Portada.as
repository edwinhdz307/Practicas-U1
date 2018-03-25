package  {

import flash.display.MovieClip;
import fl.transitions.Tween;
import fl.transitions.easing.*;


	
	public class Portada extends MovieClip{

		public function Portada() {

		//instancias para llamar los tweens en la portada
		var poli_mcc:Tween = new Tween(poli_mc, "x", Bounce.easeOut, -100, 80.95, 4, true);
		var nombre_mcc:Tween = new Tween(nombre_mc, "x", None.easeOut, -300, 17, 3, true);
		var pra_mcc:Tween = new Tween(pra_mc, "x", None.easeOut, 550, 190.9, 3, true);
		var hm_mcc:Tween = new Tween(hm_mc,"x",None.easeOut,-300,67.95,3,true);
		var siguiente_mcc:Tween  = new Tween(siguiente_btn, "x", Regular.easeInOut, -500, 240, 3, true);
		var logo_mcc:Tween  = new Tween(logo_mc, "y", Bounce.easeInOut, 500, 262, 3, true);
		
		}

	}
	
}
