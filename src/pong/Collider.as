/**
 * Author:		Georbec Ammon (u0552984@utah.edu)& Conan Zhang (conan.zhang@utah.edu)
 * Date: 		10-29-13
 * Partner:		Georbec Ammon/ Conan Zhang
 * Course:		Computer Science 1410 - EAE
 **/
package pong
{
	import flash.display.Sprite;
	
	//ALL COLLIDERS MUST HAVE A COLLIDE FUNCTION (check Sprite overlap) AND RETURN A NORMAL ON COLLISION
	public interface Collider
	{
			function collide(otherObject: Sprite):Boolean;
			function getNormal():GeometricVector;		
	}
}