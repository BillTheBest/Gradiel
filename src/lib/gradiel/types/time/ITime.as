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

package lib.gradiel.types.time
{

	/**
	 * 
	 * there are two classes that implement this interface. one tracks frame-based
	 * time and the other real time. 
	 * 
	 * @version 0.1
	 */ 
	public interface ITime
	{	
		/**
		 * set when the object is instantiated or the reset method is called
		 * 
		 * @return the time the clock was started   
		 */		
		function get start():int;
		
		/**
		 * @return the difference between the current time of the last frame and the current frame in milliseconds
		 */		
		function get delta():int;
		
		/**
		 * the current frame count
		 */		
		function get time():int;
		
		/**
		 * sets the current frame count to zero 
		 */ 
		function reset():void;
		
		/**
		 * update the frame count by one
		 */		
		function update():void;		
	}
}