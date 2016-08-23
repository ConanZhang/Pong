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
	
	public class Scoreboard extends Sprite
	{
		private var leftScore:  int = 0;
		private var rightScore: int = 0;
		private var leftDigit:DigitShadow;
		private var rightDigit:DigitShadow;
		
		public function Scoreboard(owner: DisplayObjectContainer)
		{
			leftDigit = new DigitShadow(owner, 150, 35, 0, 0x101010, 0x00EE00, 0x00CC00);
			leftDigit.scaleX = 0.5;
			leftDigit.scaleY = 0.5;
			rightDigit = new DigitShadow(owner, owner.stage.stageWidth - 150, 35, 0, 0x101010, 0x00EE00, 0x00CC00);
			rightDigit.scaleX = 0.5;
			rightDigit.scaleY = 0.5;
		}
		
		public function updateScore(leftScoreParameter: int, rightScoreParameter: int) : void
		{
			leftScore = leftScoreParameter;
			rightScore = rightScoreParameter;
			
			
			leftDigit.createDisplayList(leftScore);
			leftDigit.scaleX = 0.5;
			leftDigit.scaleY = 0.5;
			
			rightDigit.createDisplayList(rightScore);
			rightDigit.scaleX = 0.5;
			rightDigit.scaleY = 0.5;
		}
	}
}