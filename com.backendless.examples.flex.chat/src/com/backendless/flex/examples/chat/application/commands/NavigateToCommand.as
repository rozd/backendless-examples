package com.backendless.flex.examples.chat.application.commands
{
import com.backendless.flex.examples.chat.application.Model;
import com.backendless.flex.examples.chat.application.messages.NavigateToMessage;

public class NavigateToCommand
	{
		public function NavigateToCommand()
		{
			super();
		}
	
		[Inject]
		public var model:Model;
		
		public function execute(msg:NavigateToMessage):void
		{
			this.model.destination = msg.destination;
		}
	}
}