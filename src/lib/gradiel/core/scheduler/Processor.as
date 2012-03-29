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
	import flash.utils.Dictionary;
	
	import lib.gradiel.types.time.RealTime;

	/**
	 * do-not-use-yet (untested)
	 */ 
	public class Processor
	{
		internal static const MAX_BUCKETS:int = 10;
		
		/**
		 * 
		 */ 
		internal var real:RealTime; 
		
		/**
		 * 
		 */
		private var _buckets:Vector.<Array>;
		
		/**
		 * 
		 */
		private var _immediateQueue:Array;
		
		/**
		 * 
		 */
		private var _forced:Boolean;
		
		/**
		 * 
		 */
		private var _maxWorkUnits:int;
		
		
		/**
		 * 
		 */ 
		public function Processor (realTime:RealTime)
		{
			// setup the timer
			real = realTime;
			
			// make bucket structure
			_buckets = new Vector.<Array> (MAX_BUCKETS, true);
					
			// make all buckets
			for (var i:int = 0; i < MAX_BUCKETS; i++)
				_buckets[i] = new Array ();
			
			_immediateQueue = new Array ();
		}
		
		/**
		 * 
		 */ 
		internal function add (processIn:Process) : void
		{
			
		}
		
		/**
		 * 
		 */ 
		internal function remove (processIn:Process) : void
		{
			
		}
		
		/**
		 * 
		 */
		internal function makeImmediate (processIn:Process) : void
		{
			
		}
		
		/**
		 * 
		 */ 
		public function update () : void
		{
			// iterate over all of the buckets
			// NOTE : need to cut out if low on time
			for (var i:int = 0; i < MAX_BUCKETS; i++)
			{
				var processes:Array = _buckets[i] as Array;
				var workload:int = processes.length / (i + 1);
				
				for (var j:int = 0; j < workload; j++)
				{
					var process:Process = processes[j] as Process;
					
					process.execute ();
				}
			}
		}
	}
}