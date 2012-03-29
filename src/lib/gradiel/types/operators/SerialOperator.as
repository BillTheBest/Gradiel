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
	
	/** perform all operations in sequence */
	public final class SerialOperator extends AbstractCompoundOperator implements ICompoundOperator
	{
		private var _index:int;
		
		/** start serial operation sequence at the first added */		
		public override function startup():void
		{ 
			super.startup();
			_index = 0;
		}
		
		/** call next undo from the most recent operator performed */
		public override final function undo():void
		{
			if (_index > 0)
			{
				const operator:IOperator = _aggregation[_index] as IOperator;
				
				operator.undo();				
				_index--;
			}			
		}
				
		/** perform the next available operator */
		public override final function perform():void
		{
			if (_index < this.length)
			{
				const operator:IOperator = _aggregation[_index] as IOperator;
				
				operator.perform();				
				_index++;
			}
		}
	}
}