/*
 * Copyright (C) 2013 max.rozdobudko@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/27/13
 * Time: 2:10 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.flex.examples.chat.presentation
{
import mx.collections.IList;
import mx.core.IFactory;

public interface IChatPM
{
    function get messages():IList;
    function set messages(value:IList):void;

    function get calls():IList;
    function set calls(value:IList):void;

    function get message():String;
    function set message(value:String):void;

    function get isCamMuted():Boolean;
    function set isCamMuted(value:Boolean):void;

    function get isMicMuted():Boolean;
    function set isMicMuted(value:Boolean):void;

    function messageRendererFunction(item:Object):IFactory;

    function cam():void;

    function mic():void;

    function call():void;

    function clear():void;

    function send():void;

    function leave():void;
}
}
