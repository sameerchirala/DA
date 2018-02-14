'use strict';

var hostUrl = getQueryString("SPHostUrl");
var ctx = new SP.ClientContext.get_current();
var hostCtx = new SP.AppContextSite(ctx, hostUrl);


function getQueryString(key)
{
   return decodeURIComponent(getQueryStringParameter(key));

}

function getQueryStringParameter(paramToRetrieve) {
    var params =
    document.URL.split("?")[1].split("&");
    var strParams = "";
    for (var i = 0; i < params.length; i = i + 1) {
        var singleParam = params[i].split("=");
        if (singleParam[0] == paramToRetrieve)
            return singleParam[1];
    }
}

function getListItems(listName,query,fieldNames){

    var dfd=$.Deferred();
    var olist = hostCtx.get_web().get_lists().getByTitle(listName);
    var camlQuery = new SP.CamlQuery();
    camlQuery.set_viewXml(query);
    var items = olist.getItems(query);
    for (i = 0; i < fieldNames.length; i++)
    {
        ctx.load();
    }

        

    ctx.executeQueryAsync(
        function(){
            dfd.resolve(items);
        }
        , function(sender,args){
            dfd.reject(args.get_message());
        });
        return dfd.promise();
}

function createListItem(listName,data)
{
    var olist = hostCtx.get_web().get_lists().getByTitle(listName);
    var itemCreateInfo = new SP.ListItemCreationInformation();
    var oListItem = olist.addItem(itemCreateInfo);
    for (i = 0; i < data.length; i++)
    {
        var column  = data[i];
        if (column.tye == "")
        {

        }
        else
        {
            olist.set_item(column.name, column.value);
        }
    }
    oListItem.update();
    ctx.load(oListItem);
    ctx.executeQueryAsync(itemCreated, itemNotCreated);

}

