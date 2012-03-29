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
package lib.gradiel.types.operators
{
	import lib.harachel.patterns.operators.ICompoundOperator;
	import lib.harachel.patterns.operators.IOperator;
	
	/** perform multiple operators */
	public class AbstractCompoundOperator implements ICompoundOperator
	{
		[ArrayElementType("IOperator")]
		protected var _aggregation:Array;
				
		/** @inheritDoc */		
		public function startup():void
		{ _aggregation = []; }
		
		/** @inheritDoc */
		public final function shutdown():void
		{
			const n:int = _aggregation.length;
			for (var i:int = 0; i < n; i++)
				_aggregation.pop();
			
			_aggregation = null;
		}		
		
		/** @inheritDoc */	
		[Override]
		public function undo():void
		{}
		
		/** @inheritDoc */
		[Override]
		public function perform():void
		{}
		
		/** @inheritDoc */
		public final function redo():void
		{ perform(); }
		
		/** @inheritDoc */
		public final function add(operator:IOperator):void
		{ _aggregation.push(operator); }
		
		/** @inheritDoc */
		public final function remove(operator:IOperator):void
		{ removeAt(_aggregation.indexOf(operator)); }
		
		/** @inheritDoc */
		public final function removeAt(index:int):void
		{ _aggregation.splice(index, 1); }
		
		/** @inheritDoc */
		public final function exists(operator:IOperator):Boolean
		{ return _aggregation.indexOf(operator) !== -1; }
		
		/** @inheritDoc */
		public final function get length():int
		{ return _aggregation.length; }		
	}
}