package com.backendless.examples.flex.galery.application.messages
{
	import flash.net.FileReference;

	public class BrowseFileMessage
	{
		public function BrowseFileMessage(file:FileReference)
		{
			super();
			
			this.file = file;
		}
		
		public var file:FileReference;
	}
}