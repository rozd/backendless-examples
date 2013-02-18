package
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.core.mx_internal;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	use namespace mx_internal;

	public class ServiceStub
	{
		public static function result(data:Object, delay:uint=1000):AsyncToken
		{
			return stub(false, data, delay);
		}
		
		public static function fault(data:Object, delay:uint=1000):AsyncToken
		{
			return stub(true, data, delay);
		}
		
		private static function stub(fault:Boolean, data:Object, delay:uint):AsyncToken
		{
			const token:AsyncToken = new AsyncToken();
			
			const completeHandler:Function = function(event:TimerEvent):void
			{
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
				
				if (fault)
					token.applyFault(FaultEvent.createEvent(data as Fault, token));
				else
					token.applyResult(ResultEvent.createEvent(data, token));
			};
			
			const timer:Timer = new Timer(delay, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, completeHandler);
			timer.start();
			
			return token;
		}
		
		public function ServiceStub()
		{
		}
	}
}