package com.backendless.examples.flex.login.application.messages
{
	public class NavigateToMessage 
	{
		public function NavigateToMessage(destination:String)
		{
			super();
			
			_destination = destination;
		}
		
		private var _destination:String;
		
		public function get destination():String
		{
			return _destination;
		}
	}
}