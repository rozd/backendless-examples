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
