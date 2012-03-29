/**
 * 
 * ETH AI GAME LIBRARY
 * 
 * Author: Michael Jaworski
 * Copyright (c) Michael Jaworski 2010
 * http://code.google.com/p/eth/
 * 
 * Licence Agreement
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *	
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

package lib.gradiel.core.io.ui
{
	public class Keyboard
	{
		public function Keyboard()
		{
		}
	}
}

/*
 
private function keyDownListener(e:KeyboardEvent) {
//trace("down e.keyCode=" + e.keyCode);
aKeyPress[e.keyCode]=true;

}

private function keyUpListener(e:KeyboardEvent) {
//trace("up e.keyCode=" + e.keyCode);
aKeyPress[e.keyCode]=false;
}

private function checkKeys():void {
if (aKeyPress[38]){
//trace("up pressed");
playerObject.dx=aRotation[playerObject.arrayIndex].dx;
playerObject.dy=aRotation[playerObject.arrayIndex].dy;

var mxn:Number=playerObject.movex+playerObject.acceleration*(playerObject.dx);
var myn:Number=playerObject.movey+playerObject.acceleration*(playerObject.dy);

var currentSpeed:Number = Math.sqrt ((mxn*mxn) + (myn*myn));
if (currentSpeed < playerObject.maxVelocity) {
playerObject.movex=mxn;
playerObject.movey=myn;
} // end speed check


}
if (aKeyPress[37]){
playerObject.arrayIndex--;
if (playerObject.arrayIndex <0) playerObject.arrayIndex=shipAnimationArrayLength-1;
//added in part 4
playerObject.bitmapData=aShipAnimation[playerObject.arrayIndex];

}
if (aKeyPress[39]){
playerObject.arrayIndex++;
if (playerObject.arrayIndex ==shipAnimationArrayLength) playerObject.arrayIndex=0;
//added in part 4
playerObject.bitmapData=aShipAnimation[playerObject.arrayIndex];

}
//*** added for part 3
if (aKeyPress[90]){
fireMissile();

}


}



*/