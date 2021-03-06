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
	
	/** 
	 * a fully-functioning command stack that plugs directly into Omniel 
	 * @see lib.harachel.operators
	 **/
	public class AbstractOperator implements IOperator
	{
		/** @inheritDoc */
		[Override]
		public function startup():void
		{}

		/** @inheritDoc */
		[Override]
		public function shutdown():void
		{}
		
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
	}
}