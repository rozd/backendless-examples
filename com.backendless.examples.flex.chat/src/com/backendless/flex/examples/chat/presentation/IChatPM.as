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

public interface IChatPM
{
    function get messages():IList;
    function set messages(value:IList):void;

    function get message():String;
    function set message(value:String):void;

    function send():void;

    function leave():void;
}
}
