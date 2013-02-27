/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:40 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.application.commands
{
import com.backendless.examples.flex.gallery.application.enum.Destiantion;
import com.backendless.examples.flex.gallery.application.messages.NavigateToMessage;
import com.backendless.examples.flex.gallery.application.messages.SelectItemMessage;
import com.backendless.examples.flex.gallery.domain.Gallery;
import com.backendless.examples.flex.gallery.domain.Model;

public class SelectItemCommand
{
    public function SelectItemCommand()
    {
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var model:Model;

    [Inject]
    public var gallery:Gallery;

    public function execute(msg:SelectItemMessage):void
    {
        gallery.select(msg.item);

        if (msg.item)
            dispatcher(new NavigateToMessage(Destiantion.DETAILS));
        else
            dispatcher(new NavigateToMessage(Destiantion.GALLERY));
    }

}
}
