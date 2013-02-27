/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 10:48 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.presentation
{
import com.backendless.examples.flex.gallery.domain.Item;

import mx.collections.IList;

public interface IGalleryPM
{
    function get gallery():IList;
    function set gallery(value:IList):void;

    function get selectedItem():Item;
    function set selectedItem(value:Item):void;

    function addNew():void;

    function remove():void;

    function select(item:Item):void;
}
}
