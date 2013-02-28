/*
 * Copyright (C) 2013 max.rozdobudko@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

package com.backendless.examples.flex.gallery.application.commands
{
    import com.backendless.examples.flex.gallery.application.messages.BrowseFileMessage;
import com.backendless.examples.flex.logging.Logger;

import flash.events.Event;
	import flash.net.FileFilter;
	import flash.net.FileReference;

	public class BrowseFileCommand
	{
		public function BrowseFileCommand()
		{
			super();
		}
		
		public var callback:Function;
		
		public function execute(msg:BrowseFileMessage):void
		{
			msg.file.addEventListener(Event.SELECT, file_selectHandler);
			msg.file.addEventListener(Event.CANCEL, file_cancelHandler);
			
			const filter:FileFilter = new FileFilter("Images", ".gif;*.jpeg;*.jpg;*.png");
			msg.file.browse([filter]);
		}
		
		private function file_selectHandler(event:Event):void
		{
            Logger.info("File selected");

			const file:FileReference = event.target as FileReference;
			
			file.removeEventListener(Event.SELECT, file_selectHandler);
			file.removeEventListener(Event.CANCEL, file_cancelHandler);
			
			file.addEventListener(Event.COMPLETE, completeHandler);
			file.load();
		}
		
		private function completeHandler(event:Event):void
		{
            Logger.info("File loaded into memory.");

			event.target.removeEventListener(Event.COMPLETE, completeHandler);
			
			callback(event.target);
		}
		
		private function file_cancelHandler(event:Event):void
		{
			event.target.removeEventListener(Event.SELECT, file_selectHandler);
			event.target.removeEventListener(Event.CANCEL, file_cancelHandler);
			
			callback(false);
		}
	}
}