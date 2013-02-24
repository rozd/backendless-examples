package com.backendless.examples.flex.galery.application.commands
{
    import com.backendless.examples.flex.galery.application.messages.BrowseFileMessage;
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