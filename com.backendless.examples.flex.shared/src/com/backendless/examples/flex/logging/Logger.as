/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/22/13
 * Time: 1:47 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.logging
{
import flash.events.Event;
import flash.events.EventDispatcher;

import mx.utils.StringUtil;

public class Logger extends EventDispatcher
{
    private static const MAX_LOGS:int = 5;

    private static var instance:Logger = new Logger();

    public static function get get():Logger
    {
        return instance;
    }

    function Logger()
    {
        super();
    }

    [Bindable(event="logsChange")]
    public function get out():String
    {
        return logs.join("\n");
    }

    private var logs:Array = [];

    public function print(msg:String, ...rest):void
    {
        msg = StringUtil.substitute(msg, rest);

        if (logs.length >= MAX_LOGS)
            logs.shift();

        logs.push(msg);

        dispatchEvent(new Event("logsChange"));
    }

    public function info(msg:String):void
    {
        print("{0} {1}", "[INFO]", msg);
    }

    public function error(msg:String):void
    {
        print("{0} {1}", "[ERROR]", msg);
    }
}
}
