/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:28 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.galery.application.messages
{
import com.backendless.examples.flex.galery.domain.Item;

public class UploadFileMessage
{
    public function UploadFileMessage(item:Item)
    {
        super();

        this.item = item;
    }

    public var item:Item;

}
}
