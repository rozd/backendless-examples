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
 * Time: 2:33 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.presentation
{
import com.backendless.examples.flex.gallery.application.enum.Destiantion;
import com.backendless.examples.flex.gallery.application.messages.NavigateToMessage;
import com.backendless.examples.flex.gallery.application.messages.SaveItemMessage;
import com.backendless.examples.flex.gallery.application.messages.SelectItemMessage;
import com.backendless.examples.flex.gallery.application.messages.UploadFileMessage;
import com.backendless.examples.flex.gallery.application.messages.BrowseFileMessage;
import com.backendless.examples.flex.gallery.domain.Item;

import flash.net.FileReference;

public class DetailsPM implements IDetailsPM
{
    public function DetailsPM()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Bindable]
    [Subscribe(objectId="selectedItem")]
    public var item:Item;

    public function back():void
    {
        dispatcher(new SelectItemMessage(null));
    }

    public function remove():void
    {
    }

    public function browse():void
    {
        if (!item.fileREF)
            item.fileREF = new FileReference();

        dispatcher(new BrowseFileMessage(item.fileREF));
    }

    public function submit():void
    {
        dispatcher(new SaveItemMessage(item));
    }
}
}
