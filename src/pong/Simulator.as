/**
 * Author:		Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
 * Date: 		10-29-13
 * Partner:		Georbec Ammon/ Conan Zhang
 * Course:		Computer Science 1410 - EAE
 **/
package pong
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.*;

	
	public class Simulator extends Sprite
	{
		private var ball: Ball;
		private var movers: Vector.<Mover>;
		private var colliders: Vector.<Collider>;
		private var walls: Vector.<Wall>;
		
		
		private var startStopButton: Button;
		private var gamePlaying: Boolean = false;
		private var scoreboard: Scoreboard;
		private var owner: DisplayObjectContainer;
		private var speedCounter: int = 0;
		private var leftScore: int = 0;
		private var rightScore: int = 0;
		private var gameOver: Boolean = false;
		
		//Constructor
		public function Simulator(ownerParameter: DisplayObjectContainer)
		{
			owner = ownerParameter;
			
			//add to stage
			this.x = owner.stage.stageWidth/2;
			this.y = owner.stage.stageHeight/2;	
			
			//Button
			startStopButton = new Button("PLY", 0, 100, 50, handleButton);
			startStopButton.x = owner.stage.stageWidth/2 - 10;
			startStopButton.y = owner.stage.stageHeight/16;
			startStopButton.scaleX = 0.5;
			startStopButton.scaleY = 0.5;
			owner.addChild(startStopButton);
			
			//Scoreboard
			scoreboard = new Scoreboard(owner);
			
			//Ball
			ball = new Ball(owner, 10, 0x00EE00);
			ball.reset();
			
			
			//vector of movers
			movers = new Vector.<Mover>(3);
			movers[0] = new MousePaddle(owner, 10, 50, 0x00EE00, true);
			movers[1] = new AIPaddle(owner, 10, 50, 0x00EE00, false,ball);
			movers[2] = ball;
			
			
			//vector of colliders
			colliders = new Vector.<Collider>(2);
			colliders[0] = (Collider)(movers[0]);  //aliasing to put the same paddles in both Vectors
			colliders[1] = (Collider)(movers[1]);
			
			//vector of walls
			walls = new Vector.<Wall>(4);
			walls[0] = new Wall(owner, owner.stage.stageWidth - 70, 4, 0x009900);
			walls[1] = new Wall(owner, owner.stage.stageWidth - 70, 4, 0x009900);
			walls[2] = new Wall(owner, Math.random()*20 + 100, 4, 0x009900);
			walls[3] = new Wall(owner, Math.random()*20 + 100, 4, 0x009900);
			
			//Top wall
			walls[0].x = owner.stage.stageWidth/2;
			walls[0].y = owner.stage.stageHeight - (owner.stage.stageHeight - 20);	
			
			//Bottom wall
			walls[1].x = owner.stage.stageWidth/2;
			walls[1].y = owner.stage.stageHeight - 20;	
			
			//random walls
			walls[2].x = owner.stage.stageWidth/2;
			walls[2].y = (owner.stage.stageHeight - owner.stage.stageHeight/4) + (Math.random()*50) - (Math.random() * 50);
			walls[3].x = owner.stage.stageWidth/2;
			walls[3].y = owner.stage.stageHeight/4 + (Math.random()*50) - (Math.random() * 50);


		}
		
		private function updateAll(e:Event):void
		{
			//check to see if game is over
			if(leftScore == 9 || rightScore == 9)
			{
				gameOver = true;
			}
			
			if(gameOver==false)
			{//---------------------------------------------------------------------------------
				
			
			//update score if ball goes off screen
			if(ball.x < 0)
			{
				ball.reset();
				rightScore++;
				scoreboard.updateScore(leftScore, rightScore);
				//movers[1].paddleHeight = movers[1].paddleHeight-1;
				
			}
			else if(ball.x > owner.stage.stageWidth)
			{
				ball.reset();
				leftScore++;
				scoreboard.updateScore(leftScore, rightScore);
				//movers[0].paddleHeight = movers[0].paddleHeight-1;

			}
			
			
			//move the Movers
			for(var i: int = 0; i < movers.length; i++)
			{
				movers[i].move();
			}
			
			//check the Colliders
			for(var j: int = 0; j < colliders.length; j++)
			{
				if( colliders[j].collide(ball) ) //if objects is colliding with ball
					{
					
					//counter used to increase difficulty after a certain number of bounces
						speedCounter++;
						if(speedCounter == 10)
							ball.setBallSpeed(6);
						else if(speedCounter == 15)
							ball.setBallSpeed(7);
						else if(speedCounter == 20)
							ball.setBallSpeed(8);
						else if(speedCounter == 25)
							ball.setBallSpeed(9);
						else if(speedCounter == 30)
							ball.setBallSpeed(10);
	
						ball.bounce(colliders[j].getNormal());  //bounce the ball by sending the collider's normal
					}
			}
			
			//check the Walls
			for(var m: int = 0; m < walls.length; m++)
			{
				if( walls[m].collide(ball) ) //if objects is colliding with ball
				{
					
					//counter used to increase difficulty after a certain number of bounces
					speedCounter++;
					if(speedCounter == 10)
						ball.setBallSpeed(6);
					else if(speedCounter == 15)
						ball.setBallSpeed(7);
					else if(speedCounter == 20)
						ball.setBallSpeed(8);
					else if(speedCounter == 25)
						ball.setBallSpeed(9);
					else if(speedCounter == 30)
						ball.setBallSpeed(10);
					
					ball.bounce(walls[m].getNormal());  //bounce the ball by sending the collider's normal
				}
			}
			
			//---------------------------------------------------------------------------------
			}//end if statement for gameOver==false
			
		}//end updateAll
	
		//function to handle ball then update all
		private function handleEvent(e:Event):void
		{
			//ball.move();
			updateAll(e);
		}
		
		//function to handle button press
		private function handleButton(e:Event):void
		{
			if(gamePlaying)
			{
				//pause game by removing listener
				ball.removeEventListener(Event.ENTER_FRAME, handleEvent);
				gamePlaying = !gamePlaying;
				//switch button state
				owner.removeChild(startStopButton);
				startStopButton = new Button("PLY", 0, 100, 50, handleButton);
				startStopButton.scaleX = 0.5;
				startStopButton.scaleY = 0.5;
				startStopButton.x = owner.stage.stageWidth/2 - 10;
				startStopButton.y = owner.stage.stageHeight/16;
				owner.addChild(startStopButton);
			}
			else
			{
				//continue game by adding listener
				ball.addEventListener(Event.ENTER_FRAME, handleEvent);
				gamePlaying = !gamePlaying;
				
				//switch button state
				owner.removeChild(startStopButton);
				startStopButton = new Button("PSE", 0, 100, 50, handleButton);
				startStopButton.scaleX = 0.5;
				startStopButton.scaleY = 0.5;
				startStopButton.x = owner.stage.stageWidth/2 - 10;
				startStopButton.y = owner.stage.stageHeight/16;
				owner.addChild(startStopButton);
			}
				
		}
		
	}//end class
}//end package