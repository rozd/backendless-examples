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
