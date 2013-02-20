/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 8:48 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.presentation
{
import com.backendless.examples.flex.galery.application.messages.AddNewItemMessage;
import com.backendless.examples.flex.galery.application.messages.RemoveItemMessage;
import com.backendless.examples.flex.galery.application.messages.SelectItemMessage;
import com.backendless.examples.flex.galery.domain.Item;

import mx.collections.IList;

public class GalleryPM implements IGalleryPM
{
    public function GalleryPM()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    [Subscribe(objectId="galleryList")]
    public var gallery:IList;

    [Bindable]
    [Subscribe(objectId="selectedItem")]
    public var selectedItem:Item;

    public function addNew():void
    {
        dispatcher(new AddNewItemMessage());
    }

    public function remove():void
    {
        dispatcher(new RemoveItemMessage(selectedItem));
    }

    public function select(item:Item):void
    {
        dispatcher(new SelectItemMessage(item));
    }
}
}
