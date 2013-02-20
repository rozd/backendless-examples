/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:41 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.domain
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
    public var items:ArrayCollection = new ArrayCollection();

    [Bindable]
    [Publish(objectId="selectedItem")]
    public var selectedItem:Item;

    public function select(item:Item):void
    {
        this.selectedItem = item;
    }

    public function setList(list:IList):void
    {
        this.items.source = list.toArray();
    }
}
}
