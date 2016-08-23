/**
 * Author:		Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
 * Date: 		10-29-13
 * Partner:		Georbec Ammon/ Conan Zhang
 * Course:		Computer Science 1410 - EAE
 **/
package pong
{
	import flash.display.DisplayObjectContainer;
	
	public class MousePaddle extends Paddle
	{
	
		public function MousePaddle(owner:DisplayObjectContainer,
									paddleWidthParameter:int, 
									paddleHeightParameter:int, 
									paddleColorParameter:uint, 
									isLeftPaddleParameter:Boolean)
		{
			//Create default paddle
			super(owner, paddleWidthParameter, paddleHeightParameter, paddleColorParameter, isLeftPaddleParameter);
		}
		
		//Different move function that relies on mouse input
		public override function move():void
		{
			//set paddle y-coordinate to mouse y-coordinate (instant change)
			this.y = stage.mouseY;
		}
	}
}