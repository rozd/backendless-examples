/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 2:05 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.application.messages
{
import com.backendless.examples.flex.gallery.domain.Item;

public class SaveItemMessage
{
    public function SaveItemMessage(item:Item)
    {
        super();

        this.item = item;
    }
    public var item:Item;
}
}
