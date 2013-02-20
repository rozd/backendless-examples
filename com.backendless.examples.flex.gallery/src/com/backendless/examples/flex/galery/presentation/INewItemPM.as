/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/20/13
 * Time: 5:26 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.presentation
{
import com.backendless.examples.flex.galery.domain.Item;

public interface INewItemPM
{
    function get item():Item;
    function set item(value:Item):void;

    function get fileName():String;

    function browse():void;

    function submit():void;

    function cancel():void;
}
}
