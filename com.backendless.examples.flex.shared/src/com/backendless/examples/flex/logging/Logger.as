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
    private static const MAX_LOGS:int = 50;

    private static var instance:Logger = new Logger();

    public static function get get():Logger
    {
        return instance;
    }

    public static function print(msg:String, ...rest):void
    {
        msg = StringUtil.substitute(msg, rest);

        if (instance.logs.length >= MAX_LOGS)
            instance.logs.shift();

        instance.logs.push(msg);

        instance.dispatchEvent(new Event("logsChange"));
    }

    public static function info(msg:String):void
    {
        print("{0} {1}", "[INFO]", msg);
    }

    public static function error(msg:String):void
    {
        print("{0} {1}", "[ERROR]", msg);
    }

    public static function clear():void
    {
        get.logs = [];

        instance.dispatchEvent(new Event("logsChange"));
    }

    function Logger()
    {
        super();
    }

    private var logs:Array = [];

    [Bindable(event="logsChange")]
    public function get hasErrors():Boolean
    {
        for each (var log:String in logs)
        {
            if (log.indexOf("[ERROR]") != -1) {
                return true;
            }
        }

        return false;
    }

    [Bindable(event="logsChange")]
    public function get out():String
    {
        return logs.join("\n");
    }
}
}
