'use strict';

ExecuteOrDelayUntilScriptLoaded(initializePage, "sp.js");

function initializePage()
{
    
    
    var hostUrl = getQueryString("SPHostUrl");
    var ctx = new SP.ClientContext.get_current();
    var user = ctx.get_web().get_currentUser();
    var hostCtx = new SP.AppContextSite(ctx, hostUrl);


    function getQueryString(key) {
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

   
    $(document).ready(function () {
      
    });


    $('#submitNew').click(function () {

        $.when(createNew()).then(function (id) {
            alert('Item id is ' + id);
        }
        );
        readFile();
        
    });


    function createNew() {
        var dfd = $.Deferred();
        var olist = hostCtx.get_web().get_lists().getByTitle('Intake');
        var itemCreateInfo = new SP.ListItemCreationInformation();
        var oitem = olist.addItem(itemCreateInfo);
        oitem.set_item('Title','Tesatsda');
        oitem.set_item('GSD', $('#gsd').val());
        oitem.set_item('Date_Requested', $('#requestedDate').val());
        oitem.set_item('Brief_Description', $('#description').val());
        oitem.set_item('Project_Name', $('#projectName').val());
        oitem.set_item('Business_Owner', $('#businessOwner').val());
        oitem.set_item('Business_Requesting', $('#businessRequesting').val());
        oitem.set_item('Business_Commitment', $('#commitment').val());
        oitem.update();
        ctx.load(oitem,'Id');
        ctx.executeQueryAsync(function () {
            dfd.resolve(oitem.get_item('Id'));
        }, function (sender, args) {
            dfd.reject(args.get_message());
            });
    }

    var arrayBuffer; 

    function readFile() {

        //Get File Input Control and read th file name  
        var element = document.getElementById("attachment");
        var file = element.files[0];
        var parts = element.value.split("\\");
        var fileName = parts[parts.length - 1];

        //Read File contents using file reader  
        var reader = new FileReader();
        reader.onload = function (e) {
            uploadFile(e.target.result, fileName);
        }
        reader.onerror = function (e) {
            alert(e.target.error);
        }
        reader.readAsArrayBuffer(file);
    }
    var attachmentFiles;

    function uploadFile(arrayBuffer, fileName) {
        //Get Client Context,Web and List object.  
        var clientContext = new SP.ClientContext();
        var oWeb = clientContext.get_web();
        var oList = oWeb.get_lists().getByTitle('Documents');

        //Convert the file contents into base64 data  
        var bytes = new Uint8Array(arrayBuffer);
        var i, length, out = '';
        for (i = 0, length = bytes.length; i < length; i += 1) {
            out += String.fromCharCode(bytes[i]);
        }
        var base64 = btoa(out);
        //Create FileCreationInformation object using the read file data  
        var createInfo = new SP.FileCreationInformation();
        createInfo.set_content(base64);
        createInfo.set_url(fileName);

        //Add the file to the library  
        var uploadedDocument = oList.get_rootFolder().get_files().add(createInfo)
        //Load client context and execcute the batch  
        clientContext.load(uploadedDocument);
        clientContext.executeQueryAsync(function () { alert('fininsjed'); }, function () { });
    }  
    
}
