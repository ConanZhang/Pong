package pong
{
	import flash.display.DisplayObjectContainer;
	
	public class AIPaddle extends Paddle
	{
		//Class Member Variables//
		protected var ball:Ball;//take in ball to follow
		private var counter: int = 0;
		
		public function AIPaddle(owner:DisplayObjectContainer, 
								 paddleWidthParameter:int, 
								 paddleHeightParameter:int, 
								 paddleColorParameter:uint, 
								 isLeftPaddleParameter:Boolean,
								 ballParameter:Ball)
		{
			this.ball = ballParameter;
			
			this.paddleSpeed = this.paddleSpeed;
			
			//
			super(owner, paddleWidthParameter, paddleHeightParameter, paddleColorParameter, isLeftPaddleParameter);
		}
		
		/**
		 * The move function for the AI Pong Paddle toward the ball or toward the center
		 * if the ball is going away.
		 * 
		 * Here we must "steal" the move function from the parent class Pong Paddle to make sure we
		 * are updating ourselves properly but then we use the parent class move function to do the
		 * actual move. 
		 * 
		 */
		public override function move( ) : void
		{
			this.isMovingUp   = false; // default is not to do anything
			this.isMovingDown = false;
			
			if (this.y > this.ball.y)  // if we are below the ball, move upward
			{
				this.isMovingUp   = true;
				this.isMovingDown = false;
			}
			else
			{
				this.isMovingUp   = false;
				this.isMovingDown = true;
			}
			//increment counter
			counter++;
			
			//every 20 frames...
			if(counter == 2)
			{
				counter = 0;
				super.move();  // NOW we "really" move, using the code in our parent class.
			}
		}
	}
}