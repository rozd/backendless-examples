/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:41 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.domain
{
import mx.collections.ArrayCollection;
import mx.collections.ArrayList;
import mx.collections.IList;

public class Gallery
{
    public function Gallery()
    {
        super();
    }

    [Bindable]
    [Publish(objectId="galleryList")]
    public var items:IList;

    [Bindable]
    [Publish(objectId="selectedItem")]
    public var selectedItem:Item;

    public function select(item:Item):void
    {
        this.selectedItem = item;
    }

    public function setList(list:IList):void
    {
        this.items = list;
    }

    public function addItem(item:Item):void
    {
        if (items)
            items.addItem(item);
    }

    public function removeItem(item:Item):void
    {
        if (items)
            items.removeItemAt(items.getItemIndex(item));
    }

    public function removeItemById(id:String):void
    {
        if (!items) return;

        const n:int = items.length;
        for (var i:int = 0; i < n; i++)
        {
            if (Item(items.getItemAt(i)).objectId == id)
            {
                items.removeItemAt(i);
                return;
            }
        }
    }
}
}
