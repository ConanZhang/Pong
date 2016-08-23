package pong
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	/**
	 * 
	 * File:		Paddle.as
	 *
	 * Author:	Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
	 * Date: 	10-29-13
	 * Partner: Georbec Ammon/ Conan Zhang
	 * Course:	Computer Science 1410 - EAE
	 *
	 * Description:
	 *
	 * The Paddle class contains code to...
	 * 
	 **/
	public class Paddle extends Sprite implements Mover, Collider
	{
		/**Class Member Variables**/
		private var paddleWidth	: int = 5;//sets paddle (rectangle) width
		protected var paddleHeight: int = 20;//sets paddle (rectangle) height
		private var paddleColor	: uint = 0xFF0000;//sets paddle outline color
		private var isLeftPaddle: Boolean = true;//determines which side to place paddle
		
		//Movement
		protected var paddleSpeed: int = 7;//sets paddle speed
		protected var isMovingUp: Boolean;//used for movement in MOVE function
		protected var isMovingDown: Boolean;//used for movement in MOVE function
		
		
		/**
		 * 
		 * Summary of the Paddle constructor:
		 * The Paddle constructor draws paddles and adds them to an owner.
		 *
		 * Parameters:    owner					: DisplayObjectContainer, 
		 *				  paddleWidthParameter	: int, 
		 *				  paddleHeightParameter	: int, 
		 *				  paddleColorParameter	: uint, 
		 *				  isLeftPaddleParameter	: Boolean
		 *
		 * Return Value: void
		 *
		 * Description: The constructor assigns members to parameters, draws paddles, places them depending on which paddle they are, and adds them to the owner.
		 * 
		 **/
		public function Paddle(owner				: DisplayObjectContainer, 
							   paddleWidthParameter	: int, 
							   paddleHeightParameter: int, 
							   paddleColorParameter	: uint, 
							   isLeftPaddleParameter: Boolean)
		{
			/**Assign Class Members to Parameters**/
			paddleWidth 	= paddleWidthParameter;
			paddleHeight 	= paddleHeightParameter;
			paddleColor		= paddleColorParameter;
			isLeftPaddle 	= isLeftPaddleParameter;
			
			//Draw
			create_display_list();
			
			/**Paddle Locations**/
			//Place paddles at different default x-coordinates
			if(isLeftPaddle)
			{
				this.x = 25;//place left paddle here
			}
			else
			{
				this.x = owner.stage.stageWidth - 25;//place right paddle here
			}
			
			//Place paddles at SAME default y-coordinates
			this.y = owner.stage.stageHeight/2;
			
			//Add to owner
			owner.addChild(this);
		}
		
		/**
		 * 
		 * Summary of the create_display_list function:
		 * The create_display_list function draws a paddle.
		 *
		 * Parameters: None
		 *
		 * Return Value: void
		 *
		 * Description: The function draws a rectangle with an outline. 
		 * 			    Properties are given through class member variables.
		 * 
		 **/
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
		
		/**
		 * 
		 * Summary of the move function:
		 * The move function contains code to move a paddle.
		 *
		 * Parameters: None
		 *
		 * Return Value: void
		 *
		 * Description:
		 * The paddle will constantly move up or down until the Booleans
		 * isMovingUp and isMovingDown are false.
		 * 
		 **/
		public function move():void
		{
			if(isMovingUp && this.y > (5 + (paddleHeight/2) ) )//if the paddle is moving up and isn't past the top of the screen
			{
				this.y -= paddleSpeed;//subtract paddleSpeed (pixels moved) from paddle y-coordinate (moves up)
			}
			else if(isMovingDown && this.y < (stage.stageHeight - (paddleHeight/2) - 5 ))//if the paddle is moving down and isn't past the bottom of the screen
			{
				this.y += paddleSpeed;//add paddleSpeed (pixels moved) to paddle y-coordinate (moves down)
			}
		}
		
		/**
		 * 
		 * Summary of the getNormal function:
		 * The getNormal function returns a horizontal vector.
		 *
		 * Parameters: None
		 *
		 * Return Value: GeometricVector
		 *
		 * Description:
		 * The getNormal function returns a horizontal vector.
		 * 
		 **/
		public function getNormal():GeometricVector
		{
			//Return horizontal vector
			return new GeometricVector(1,0);
		}
		
		/**
		 * 
		 * Summary of the setPaddleHeight function:
		 * The setPaddleHeight function sets the paddle's height.
		 *
		 * Parameters: heightParameter: int
		 *
		 * Return Value: void
		 *
		 * Description:
		 * The function sets the paddle height so another class can change the
		 * paddle's size.
		 * 
		 **/
		public function setPaddleHeight(heightParameter: int):void
		{
			//Set paddleHeight to a height given by the parameter
			paddleHeight = heightParameter;
			
			//Redraw
			create_display_list();//clears previous paddle as well
		}
		
		/**
		 * 
		 * Summary of the collide function:
		 * The collide function checks to see if the paddle is colliding with something.
		 *
		 * Parameters: otherObject:Sprite
		 *
		 * Return Value: Boolean
		 *
		 * Description:
		 * The function takes in a possible object to collide with and checks if the
		 * paddle Sprite is overlapping it (colliding with it). It then returns a Boolean.
		 * 
		 **/
		public function collide(otherObject:Sprite):Boolean
		{
			return (this.hitTestObject(otherObject)); //check to see if the paddle Sprite is overlapping (colliding)
													  //with another object and return true or false
		}
		
		
	}
}