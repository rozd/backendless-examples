/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 7:59 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.application.commands
{
import com.backendless.examples.flex.gallery.application.enum.Destiantion;
import com.backendless.examples.flex.gallery.application.messages.AddNewItemMessage;
import com.backendless.examples.flex.gallery.application.messages.NavigateToMessage;
import com.backendless.examples.flex.gallery.domain.Gallery;
import com.backendless.examples.flex.gallery.domain.Item;

public class AddNewItemCommand
{
    public function AddNewItemCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var gallery:Gallery;

    public function execute(msg:AddNewItemMessage):void
    {
        const item:Item = new Item();

        gallery.select(item);

        dispatcher(new NavigateToMessage(Destiantion.NEWITEM));
    }

}
}
