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
	import flash.utils.getTimer;
	
	
	/**
	 * 
	 * calculates the real game time. useful for physics based calculations or
	 * any time of server integration. 
	 * 
	 * @version 0.1
	 * 
	 */ 
	public final class RealTime implements ITime
	{
		/** current real-world time */
		private var _realTime:int;
		
		/** current simulation start time */
		private var _startTime:int;
		
		/** last time difference between game updates */
		private var _deltaTime:int;

		/**
		 * resets the clock so that the time will be zero and count
		 * from the point the game started
		 */ 		
		public function RealTime()
		{ reset (); }
		
		/** @inheritDoc */
		public function get time():int		
		{ return _realTime; }		
		
		/** @inheritDoc */		
		public function get start():int		
		{ return _startTime; }
		
		/** @inheritDoc */		
		public function get delta():int		
		{ return _deltaTime; }
		
		/** @inheritDoc */ 
		public function reset():void
		{			
			_startTime = getTimer ();
			_realTime = _startTime;
			_deltaTime = 0;			
		}		
				
		/** @inheritDoc */		
		public function update():
			void
		{
			var currentTime:int = getTimer();
			
			_deltaTime = currentTime - _realTime;			
			_realTime = currentTime;
		}		
	}
}