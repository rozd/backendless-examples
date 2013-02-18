/**
 * Created with IntelliJ IDEA.
 * User: max
 * Date: 17.02.13
 * Time: 17:19
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.todo.domain
{
import com.backendless.data.IBackendlessEntity;

[Bindable]
[RemoteClass(alias="com.backendless.examples.flex.todo.domain.Todo")]
public class Todo implements IBackendlessEntity
{
    public function Todo()
    {
        super();
    }

    public var objectId:String;

    public var label:String;

    public var done:Boolean;

    public var favorite:Boolean;

    public function copy(that:Object):void
    {
        this.objectId = that.objectId;
        this.label = that.label;
        this.done = that.done;
        this.favorite = that.favorite;
    }
}
}
