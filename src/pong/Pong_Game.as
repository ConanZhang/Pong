/**
 * Author:		Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
 * Date: 		10-29-13
 * Partner:		Georbec Ammon/ Conan Zhang
 * Course:		Computer Science 1410 - EAE
 **/
package pong
{
	import flash.display.Sprite;
	
	//Set screen size, background color, and frame rate
	[SWF(width='800',height='800',backgroundColor='#101010',frameRate='55')]

	public class Pong_Game extends Sprite
	{
		
		//public var backgroundColor: uint = 0x101010;
		
		public function Pong_Game()
		{
			//Add simulator to stage
			var sim: Simulator = new Simulator(this);
			
		}//end constructor
		
		
	}//end class
}//end package