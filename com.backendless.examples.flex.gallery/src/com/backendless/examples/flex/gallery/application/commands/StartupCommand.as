/**
 * Created with IntelliJ IDEA.
 * User: Max
 * Date: 2/19/13
 * Time: 10:35 AM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.application.commands
{
import com.backendless.Backendless;
import com.backendless.examples.flex.AppSettings;
import com.backendless.examples.flex.gallery.application.messages.GetGalleryMessage;
import com.backendless.examples.flex.gallery.application.messages.StartupMessage;

public class StartupCommand
{
    public function StartupCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

    public function execute(msg:StartupMessage):void
    {
        Backendless.initApp(AppSettings.appId, AppSettings.devKey, AppSettings.version);

        dispatcher(new GetGalleryMessage());
    }
}
}
