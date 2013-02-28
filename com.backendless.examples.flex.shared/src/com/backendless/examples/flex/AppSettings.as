/*
 * Copyright (C) 2013 max.rozdobudko@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

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