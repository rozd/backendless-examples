package com.backendless.examples.flex.galery.application.commands
{
    import com.backendless.examples.flex.galery.application.messages.BrowseFileMessage;

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
			msg.file.addEventListener(Event.SELECT, iconFile_selectHandler);
			msg.file.addEventListener(Event.CANCEL, iconFile_cancelHandler);
			
			const filter:FileFilter = new FileFilter("Images", ".gif;*.jpeg;*.jpg;*.png");
			msg.file.browse([filter]);
		}
		
		private function iconFile_selectHandler(event:Event):void
		{
			const file:FileReference = event.target as FileReference;
			
			file.removeEventListener(Event.SELECT, iconFile_selectHandler);
			file.removeEventListener(Event.CANCEL, iconFile_cancelHandler);
			
			file.addEventListener(Event.COMPLETE, completeHandler);
			file.load();
		}
		
		private function completeHandler(event:Event):void
		{
			event.target.removeEventListener(Event.COMPLETE, completeHandler);
			
			callback(event.target);
		}
		
		private function iconFile_cancelHandler(event:Event):void
		{
			event.target.removeEventListener(Event.SELECT, iconFile_selectHandler);
			event.target.removeEventListener(Event.CANCEL, iconFile_cancelHandler);
			
			callback(false);
		}
	}
}