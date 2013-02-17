package com.backendless.examples.flex.login.application.commands
{
import com.backendless.examples.flex.login.application.messages.NavigateToMessage;
import com.backendless.examples.flex.login.domain.Model;

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