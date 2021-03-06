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
 * Time: 8:16 PM
 * To change this template use File | Settings | File Templates.
 */
package com.backendless.examples.flex.gallery.application.commands
{
import com.backendless.Backendless;
import com.backendless.BackendlessDataQuery;
import com.backendless.data.IDataStore;
import com.backendless.examples.flex.gallery.application.enum.Destiantion;
import com.backendless.examples.flex.gallery.application.messages.GetGalleryMessage;
import com.backendless.examples.flex.gallery.application.messages.NavigateToMessage;
import com.backendless.examples.flex.gallery.domain.Gallery;
import com.backendless.examples.flex.gallery.domain.Item;
import com.backendless.examples.flex.gallery.domain.Model;

import mx.collections.ArrayCollection;

import mx.collections.ArrayList;
import mx.rpc.Responder;

import mx.rpc.events.FaultEvent;

import mx.rpc.events.ResultEvent;

public class GetGalleryCommand
{
    public function GetGalleryCommand()
    {
        super();
    }

    [MessageDispatcher]
    public var dispatcher:Function;

//    public var callback:Function;

    [Inject]
    public var gallery:Gallery;

    [Inject]
    public var model:Model;

    public function execute(msg:GetGalleryMessage):void
    {
        const db:IDataStore = Backendless.PersistenceService.of(Item);

        const query:BackendlessDataQuery = new BackendlessDataQuery();

        const urls:Array =
            [
                "http://www.helpexamples.com/flash/images/image1.jpg",
                "http://www.helpexamples.com/flash/images/image2.jpg",
                "http://www.helpexamples.com/flash/images/image3.jpg",
                "http://www.helpexamples.com/flash/images/image4.jpg",
//                "http://www.helpexamples.com/flash/images/gallery1/images/pic11.jpg",
//                "http://www.helpexamples.com/flash/images/gallery1/images/pic14.jpg",
//                "http://www.helpexamples.com/flash/images/gallery2/images/IMG_1592.jpg",
//                "http://www.helpexamples.com/images/montreal/images/IMG_5057.jpg",
            ];

//        const list:Array = []; // event.result as IList;
//
//        for each (var url:String in urls)
//        {
//            var item:Item = new Item();
//            item.fileURL = url;
//
//            list.push(item);
//        }

        gallery.setList(db.find(query));


//        db.find(query,
//            new Responder(
//                function(event:ResultEvent):void
//                {
//                    const list:Array = []; // event.result as IList;
//
//                    for each (var o:Object in event.result.data)
//                    {
//                        var todo:Item = new Item();
//                        todo.copy(o);
//
//                        list.push(todo);
//                    }
//
//                    gallery.setList(new ArrayList(list));
//
//                    dispatcher(new NavigateToMessage(Destiantion.GALLERY));
//
//                    callback(event.result);
//                },
//                function(event:FaultEvent):void
//                {
//                    callback(event.fault);
//                }
//            ));
    }
}
}
