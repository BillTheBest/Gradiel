/**
 * This software is distributed under the MIT License.
 * 
 * Copyright (c) 2011 Michael Jaworski (http://www.omniel.net)
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
 */
package lib.gradiel.core.scheduler
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	/**
	 * do-not-use-yet (untested)
	 */ 
	public class Scheduler
	{
		private var _timer:Timer;
		
		private var on:Boolean = false;
		
		public static const FRAME_RATE:int = 30;
		private var _period:Number = 1000 / FRAME_RATE;
		private var _beforeTime:int = 0;
		private var _afterTime:int = 0;
		private var _timeDiff:int = 0;
		private var _sleepTime:int = 0;
		private var _overSleepTime:int = 0;
		private var _excess:int = 0;		
		
		/**
		 * 
		 * 
		 * 
		 */
		public function Scheduler ()
		{
		}
		
		/**
		 * 
		 */
		internal function startup () : void
		{
			on = true;
			
			_timer = new Timer (_period, 1);			
			_timer.addEventListener (TimerEvent.TIMER, update);
		}
		
		/**
		 * 
		 */
		internal function shutdown () : void
		{
			_timer.stop ();
			_timer.addEventListener (TimerEvent.TIMER, update);			
			_timer = null;
			
			on = false;			
		}
		
		
		/**
		 * 
		 */
		public function play () : void
		{
			on = true;
		}
		
		/**
		 * 
		 */
		public function pause () : void
		{
			on = false;
		}
		
		/**
		 * 
		 * 
		 * 
		 */
		internal function update (event:TimerEvent) : void
		{
			// if paused, then do not run anything - maybe we want to 
			// do something more sophisticated - like run the updates
			// but not the renders, or vice versa
			if (!on)
				return;
			
			_beforeTime = getTimer();
			_overSleepTime = (_beforeTime - _afterTime) - _sleepTime;
			
			// massive game update (internals - not render)
			// do game update ()
			
			_afterTime = getTimer();
			_timeDiff = _afterTime - _beforeTime;
			_sleepTime = (_period - _timeDiff) - _overSleepTime;   
			
			if (_sleepTime <= 0) 
			{
				_excess -= _sleepTime
				_sleepTime = 2;
			}
			
			_timer.reset ();
			_timer.delay = _sleepTime;
			_timer.start ();
			
			while (_excess > _period) 
			{
				/*
				DO UPDATE to catch up
				
				checkKeys();
				updatePlayer();
				updateRocks();
				updateMissiles();
				checkCollisions();
				*/
				
				_excess -= _period;
			}
			
			// 
			event.updateAfterEvent ();			
		}
	}
}