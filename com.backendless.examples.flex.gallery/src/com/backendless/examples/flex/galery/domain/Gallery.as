/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:41 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.domain
{
import mx.collections.IList;

[Bindable]
public class Gallery
{
    public function Gallery()
    {
        super();
    }

    [Publish(objectId="items")]
    public var items:IList;

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
}
}
