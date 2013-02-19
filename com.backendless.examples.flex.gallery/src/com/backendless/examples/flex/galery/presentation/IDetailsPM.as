/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:13 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.presentation
{
import com.backendless.examples.flex.galery.domain.Item;

public interface IDetailsPM
{
    function get item():Item;
    function set item(value:Item):void;

    function back():void;

    function browse():void;

    function submit():void;

    function remove():void;
}
}
