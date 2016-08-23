/**
 * Author:		Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
 * Date: 		10-29-13
 * Partner:		Georbec Ammon/ Conan Zhang
 * Course:		Computer Science 1410 - EAE
 **/
package pong
{
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;

	public class Wall extends Sprite implements Collider
	{
		/**Class Member Variables**/
		private var paddleWidth	: int = 5;//sets paddle (rectangle) width
		protected var paddleHeight: int = 20;//sets paddle (rectangle) height
		private var paddleColor	: uint = 0xFF0000;//sets paddle outline color
		
		public function Wall(owner					: DisplayObjectContainer, 
							 paddleWidthParameter	: int, 
							 paddleHeightParameter	: int, 
							 paddleColorParameter	: uint )
		{
			/**Assign Class Members to Parameters**/
			paddleWidth 	= paddleWidthParameter;
			paddleHeight 	= paddleHeightParameter;
			paddleColor		= paddleColorParameter;
			
			//Draw
			create_display_list();
			
			//Add to owner
			owner.addChild(this);
		}
		
		public function create_display_list():void
		{
			/**Set Up**/
			this.graphics.clear();//clear previous paddle
			this.graphics.lineStyle(.5, paddleColor);//set up outline size, color
			
			/**Draw**/
			this.graphics.beginFill(0x101010);//rectangle fill color
			this.graphics.drawRect(-paddleWidth/2, -paddleHeight/2, paddleWidth, paddleHeight);//draw a rectangle that is centered on its sprite with values given by class member variables
			this.graphics.endFill();
		}
		
		public function getNormal():GeometricVector
		{
			//Return horizontal vector
			return new GeometricVector(0,1);
		}
		
		public function collide(otherObject:Sprite):Boolean
		{
			return (this.hitTestObject(otherObject));
		}
	}
}