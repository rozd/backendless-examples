package com.backendless.examples.flex
{
import flash.net.SharedObject;

public class AppSettings
{
    private static const APP_ID:String = "validApp-Ids0-0000-0000-000000000000";

    private static const DEV_KEY:String = "validSec-retK-eys0-0000-000000000004";

    private static const VERSION:String = "v1";

    private static var _so:SharedObject;

    private static function get so():SharedObject
    {
        return _so  || (_so = SharedObject.getLocal("com.backendless.examples.flex.AppSettings"));
    }

    public static function get appId():String
    {
        return so.data.appId || APP_ID;
    }

    public static function set appId(value:String):void
    {
        so.data.appId = value;
        so.flush();
    }

    public static function get devKey():String
    {
        return so.data.devKey || DEV_KEY;
    }

    public static function set devKey(value:String):void
    {
        so.data.devKey = value;
        so.flush();
    }

    public static function get version():String
    {
        return so.data.version || VERSION;
    }

    public static function set version(value:String):void
    {
        so.data.version = value;
        so.flush();
    }
}
}