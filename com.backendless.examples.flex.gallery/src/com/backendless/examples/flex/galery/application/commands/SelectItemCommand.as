/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:40 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.application.commands
{
import com.backendless.examples.flex.galery.application.enum.Destiantion;
import com.backendless.examples.flex.galery.application.messages.SelectItemMessage;
import com.backendless.examples.flex.galery.domain.Gallery;
import com.backendless.examples.flex.galery.domain.Model;

public class SelectItemCommand
{
    public function SelectItemCommand()
    {
    }

    [Inject]
    public var model:Model;

    [Inject]
    public var gallery:Gallery;

    public function execute(msg:SelectItemMessage):void
    {
        gallery.select(msg.item);

        model.destination = msg.item ? Destiantion.DETAILS : Destiantion.GALLERY;
    }

}
}
