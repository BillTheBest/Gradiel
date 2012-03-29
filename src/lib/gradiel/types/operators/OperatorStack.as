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
	import lib.harachel.patterns.operators.IOperator;
	import lib.harachel.patterns.operators.IOperatorStack;
	
	/** @inheritDoc */
	public final class OperatorStack implements IOperatorStack
	{
		private var _stack:Vector.<IOperator>;
		private var _index:int;
		
		/** @inheritDoc */
		public function startup():void
		{
			_stack = new Vector.<IOperator>();
			_index = 0;
		}
		
		/** @inheritDoc */
		public function shutdown():void
		{
			clearHistoryAll();
			_stack = null;
			_index = 0;
		}
		
		/** @inheritDoc */
		public function push(operator:IOperator):void
		{
			_stack.push(operator);
			_index++;
		}
		
		/** @inheritDoc */
		public function clearHistoryAll():void
		{
			_stack.splice(0, _stack.length);
		}
		
		/** @inheritDoc */
		public function clearHistoryStartingFrom(operator:IOperator):void
		{
			var index:int = 0;
			
			for(;index < _stack.length; index++)
				if (_stack[index] === operator)
					break;
			
			clearHistoryStartingAt(index);
		}
		
		/** @inheritDoc */
		public function clearHistoryStartingAt(index:int):void
		{
			_stack.splice(index, (_stack.length - index));
			_index = _stack.length - 1;
		}
		
		/** @inheritDoc */
		public function callPerform():void
		{
			if (hasCurrentOperator())
				_stack[_index].perform();
		}
		
		/** @inheritDoc */
		public function callUndo():void
		{
			if (hasPreviousOperator())
				previous.undo();
		}
		
		/** @inheritDoc */
		public function callRedo():void
		{
			if (hasNextOperator())
				next.redo();
		}

		/** @inheritDoc */
		public function get current():IOperator
		{			
			return _stack[_index];
		}
		
		/** @inheritDoc */
		public function get previous():IOperator
		{			
			return _stack[--_index];
		}
		
		/** @inheritDoc */
		public function get next():IOperator
		{
			return _stack[_index++];
		}

		/** @inheritDoc */
		public function hasCurrentOperator():Boolean
		{
			return (_index > 0 && _index < _stack.length);
		}
		
		/** @inheritDoc */
		public function hasPreviousOperator():Boolean
		{
			return _index > 1;
		}
		
		/** @inheritDoc */
		public function hasNextOperator():Boolean
		{
			return _index < _stack.length;
		}
	}
}