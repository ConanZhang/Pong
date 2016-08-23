/**
 * Author:		Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
 * Date: 		10-29-13
 * Partner:		Georbec Ammon/ Conan Zhang
 * Course:		Computer Science 1410 - EAE
 **/
package pong
{
	import flash.display.DisplayObjectContainer;
	import flash.events.*;
	import flash.ui.Keyboard;
	
	public class KeyboardPaddle extends Paddle
	{
		public function KeyboardPaddle(owner:DisplayObjectContainer, 
									   paddleWidthParameter:int, 
									   paddleHeightParameter:int, 
									   paddleColorParameter:uint,
									   isLeftPaddleParameter:Boolean)
		{
			//Create default paddle
			super(owner, paddleWidthParameter, paddleHeightParameter, paddleColorParameter, isLeftPaddleParameter);
			
			//Add event listener to stage
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
		}
		
		private function handleKeyDown(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.W)//when user presses W
			{
				isMovingUp = true;//move up
				isMovingDown = false;//don't move down
				super.move();
			}
			else if(event.keyCode == Keyboard.S)//when user presses S
			{
				isMovingUp = false;//don't move up
				isMovingDown = true;//move down
				super.move();
			}
		}
		
		private function handleKeyUp(event:KeyboardEvent):void
		{
			//don't do anything
			isMovingUp = false;
			isMovingDown = false;
		}
	}
}