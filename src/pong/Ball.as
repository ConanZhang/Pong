
package pong
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	/**
	 * 
	 * File:		Ball.as
	 *
	 * Author:		Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
	 * Date: 		10-29-13
	 * Partner:		Georbec Ammon/ Conan Zhang
	 * Course:		Computer Science 1410 - EAE
	 *
	 * Description:
	 *
	 * The Ball class contains code to draw the ball, reset it after a goal, move it, bounce it off an object, and set its coordinates.
	 *
	 * It is a Sprite and can move.
	 *  
	 **/
	public class Ball extends Sprite implements Mover
	{
		/**Class Member Variables**/
		private var ballColor	: uint = 0xFF0000;//set ball outline color
		private var ballRadius	: int = 20;//set ball size
		private var ballVector	: GeometricVector;//make the ball a VECTOR with VECTOR properties (CREATED IN CONSTRUCTOR)
		private var ballSpeed	: int;//set ball speed (x-pixels to move by)
		private var ballSpeedY	: int;//set ball speed (y-pixels to move by)
		private var owner		: DisplayObjectContainer;//make the owner a class member variable because we need to refer to it in the reset() function
		
		/**
		 * 
		 * Summary of the Ball constructor:
		 * The Ball constructor creates a ball that is a vector, then draws and adds it to the owner.
		 *
		 * Parameters:ownerParameter			: DisplayObjectContainer, 
		 *			  ballRadiusParameter		: int, 
		 *			  ballSpeedParameter		: int, 
		 *			  ballColorParameter		: uint
		 *
		 * Return Value: void
		 *
		 * Description: The constructor assigns members to parameters, creates the ball vector, draws it, and adds it to an owner.
		 * 
		 **/
		public function Ball(ownerParameter			: DisplayObjectContainer, 
							 ballRadiusParameter	: int, 
							 ballColorParameter		: uint)
		{
			/**Assign Class Members to Parameters**/
			owner	   = ownerParameter;
			ballRadius = ballRadiusParameter;
			ballColor  = ballColorParameter;
			
			//Default values set
			reset();
			
			//SETS BEGINNING VELOCITY
			ballVector = new GeometricVector(ballSpeed, ballSpeedY);//the ball's BEGINNING VELOCITY
			
			//Draw
			create_display_list();
			
			//Add to owner
			owner.addChild(this);			
		}
		
		/**
		 * 
		 * Summary of the create_display_list function:
		 * The create_display_list function draws a ball.
		 *
		 * Parameters: None
		 *
		 * Return Value: void
		 *
		 * Description: The function draws a circle with an outline. Properties are given through class member 
		 *			 variables and draw coordinates through getter functions.
		 * 
		 **/
		private function create_display_list():void
		{
			/**Set Up**/
			this.graphics.clear();//clear previous ball
			this.graphics.lineStyle(.5, ballColor);//set up outline size, color
			
			/**Draw**/
			this.graphics.beginFill(0x101010);//ball fill color
			this.graphics.drawCircle(0, 0, ballRadius);//draw a ball with the size from the member variable
			this.graphics.endFill();
		}
		
		/**
		 * 
		 * Summary of the reset function:
		 * The reset function resets ball properties. FOR USE AFTER SOMEONE HAS SCORED.
		 *
		 * Parameters: None
		 *
		 * Return Value: void
		 *
		 * Description: The function resets the balls speed and coordinates.
		 * 
		 **/
		public function reset():void
		{
			//Create new direction variable for use in creating postive or negative horizontal velocity
			var direction: int;
			
			if (Math.random() > 0.5)
			{
				direction = 1;//half of the time, horizontal velocity is positive
			}
			else
			{
				direction  = -1;//half of the time, horizontal velocity is negative
			}
			
			/**Make Values Default**/
			//Speed
			ballSpeed = direction*5;//set ball speed (pixels to move by)
			ballSpeedY = Math.random()*10-7;//random positive or negative vertical velocity
			
			//put speed in vector
			ballVector = new GeometricVector(ballSpeed, ballSpeedY);
		
			//Coordinates
			this.x = owner.stage.stageWidth/2;//ball default x-coordinate (centered)
			this.y = owner.stage.stageHeight/2;//ball default y-coordinate (centered)
			
			/**TEST CODE**/
			//trace("reset called, x/y is " + ballVector.get_X() + "/" + ballVector.get_Y());
		}
		
		/**
		 * 
		 * Summary of the move function:
		 * The move function "moves" the ball.
		 *
		 * Parameters: None
		 *
		 * Return Value: void
		 *
		 * Description: The function adds the ball speed set in the member variable to the coordinates of the ball and redraws it.
		 * 
		 **/
		public function move():void
		{
			/**Change Coordinates**/
			this.x += ballVector.get_X();//add ballSpeed value from getter function to current x-coordinate
			
			this.y += ballVector.get_Y();//add ballSpeed value from getter function to current y-coordinate
		}
		
		/**
		 * 
		 * Summary of the bounce function:
		 * The bounce function "bounces" the ball.
		 *
		 * Parameters: normal:GeometricVector
		 *
		 * Return Value: void
		 *
		 * Description: The bounce function scales a vector and uses that vector to calculate a new vector for the ball to follow.
		 * 
		 **/
		public function bounce(normal:GeometricVector):void
		{
			//Scale the vector for calculation
			ballVector.scaleVector(-1);//vector is now in opposite direction
			
			//Sets ball's vector equal to a new vector determined through calculations
			ballVector = ballVector.mirror_around(normal);
			
			move();
			
			/**TEST CODE**/
			//trace("I've bounced");
		}
		
		/**
		 * 
		 * Summary of the setBallSpeed function:
		 * The setBallSpeed function sets the speed of the ball.
		 *
		 * Parameters: speedParameter:int
		 *
		 * Return Value: void
		 *
		 * Description: Sets the speed of the ball.
		 * 
		 **/
		public function setBallSpeed(speedParameter: int):void
		{
			ballSpeed = speedParameter;
		}
	}
}