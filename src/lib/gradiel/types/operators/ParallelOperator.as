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
	
	/** perform all operations simultaneously */
	public class ParallelOperator extends AbstractCompoundOperator implements ICompoundOperator
	{
		/** all undos in reverse order of performed, last is first to undo */
		public override final function undo():void
		{
			const start:int = _aggregation.length - 1; 
			for(var i:int = start; i >= 0; i--)
				(_aggregation[i] as IOperator).undo();
		}
		
		/** all performs in order, index 0 is performed first */
		public override final function perform():void
		{
			const n:int = _aggregation.length;
			for(var i:int = 0; i < n; i++)
				(_aggregation[i] as IOperator).perform();
		}
		
	}
}