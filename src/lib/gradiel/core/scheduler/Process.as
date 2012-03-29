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
	import lib.harachel.patterns.memory.IVolatile;
	
	/**
	 * 
	 * 
	 * 
	 */
	public class Process implements IVolatile
	{
		
		/**
		 * 
		 */
		public static var processor:Processor;
		
		/**
		 * 
		 */
		protected var _on:Boolean;
		
		/**
		 * 
		 */ 
		protected var _id:int;
		private static var _nextId:int = 1;
		
		/**
		 * 
		 */ 
		internal var _frequency:int;
		
		/**
		 * 
		 */
		internal var _startTime:int;

		/**
		 * 
		 */
		internal var _stopTime:int;
		
		/**
		 * 
		 */
		internal var _averageDuration:int;
		
		/**
		 * 
		 */ 
		public function Process ()
		{
			// initalize all internal data
			_on = true;
			
			_id = _nextId;
			_nextId++;
			
			//processor = ETH.processor;
		}

		public function startup():void
		{}
		
		public function shutdown():void
		{}
		
		/** 
		 * @return the running status of the process
		 */
		public function get on () : Boolean
		{
			return _on;
		}
		
		/**
		 * @param onIn turn the process off and remove from
		 * the processor
		 */ 
		public function set on (onIn:Boolean) : void
		{
			_on = onIn;
		}
		
		/**
		 * forces the procss to execute immediately
		 */ 
		public function immediate () : void
		{}
		
		
		
		/**
		 * 
		 */
		[Override]
		public function update () : void
		{
			
		}		
		
		/**
		 * run the process in the processor with all process
		 * data calculation; calls update
		 */ 
		internal function execute () : void
		{
			_startTime = processor.real.time;
			
			update ();
			
			_stopTime = processor.real.time;
			
			var _duration:int = _stopTime - _startTime;
			
			_averageDuration = (_averageDuration + _duration) >> 1;
		}
		
		/**  */
		public function wake():void
		{
			
		}
		
		/**  */
		public function sleep():void
		{
			
		}
	}
}