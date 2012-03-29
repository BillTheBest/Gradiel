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
	import flash.events.Event;
	import flash.utils.getTimer;

	/**
	 * 
	 * calculates the frame time, the number of frames that have passed since this class
	 * was made or the reset method was called.
	 * 
	 * @version 0.1
	 * 
	 */ 
	public final class FrameTime implements ITime
	{
		/** frames per second  */
		private var _fps:int;	
		
		/** current frame number */
		private var _frame:int;
		
		/**
		 * set the frame count to zero
		 */ 
		public function FrameTime ()
		{ reset (); }
		
		/** @inheritDoc */
		public final function get time():int 		
		{ return _frame; }

		/** @inheritDoc */
		public function get start():int		
		{ return 0; }
		
		/** @inheritDoc */
		public function get delta():int		
		{ return 1; }
		
		/** @inheritDoc */ 
		public function reset():void
		{ _frame = 0; }

		/** @inheritDoc */		
		public function update():void
		{ _frame = _frame + 1; }
	}
}

