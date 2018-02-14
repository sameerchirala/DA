<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

    <script src="https://code.jquery.com/jquery-3.2.1.min.js" ></script>
    <!-- Bootstrap CDN -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
    <link href="../Content/nav.css" rel="stylesheet" />


    <!-- Add your JavaScript to the following file -->
  
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Page Title
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <%--Navigation Part--%>

      <section class="menu menu--circle">
        <input type="checkbox" id="menu__active" />
        <label for="menu__active" class="menu__active">
            <div class="menu__toggle">
                <div class="icon">
                    <div class="hamburger"></div>
                </div>
            </div>
            <input type="radio" name="arrow--up" id="degree--up-0" />
            <input type="radio" name="arrow--up" id="degree--up-1" />
            <input type="radio" name="arrow--up" id="degree--up-2" />
            <div class="menu__listings">
                <ul class="circle">
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="https://codepen.io/logrithumn" class="button"><i class="fa fa-user"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button nav-links" data-id="req"><span class="glyphicon glyphicon-tasks" title="My Requests"></span></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#">&nbsp</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button nav-links" data-id="IntakeForm"><span class="glyphicon-list-alt glyphicon"></span></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button"><i class="fa fa-trash"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button"><i class="fa fa-battery-4" title="battery"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button"><i class="fa fa-calendar"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button"><i class="fa fa-cloud"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button"><i class="fa fa-wifi"></i></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="placeholder">
                            <div class="upside">
                                <a href="#" class="button"><i class="fa fa-envelope-o"></i></a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="menu__arrow menu__arrow--top">
                <ul>
                    <li>
                        <label for="degree--up-0"><div class="arrow"></div></label>
                        <label for="degree--up-1"><div class="arrow"></div></label>
                        <label for="degree--up-2"><div class="arrow"></div></label>
                    </li>
                </ul>
            </div>
        </label>
    </section>

    <%--Navigation Part Ends--%>


    <div class="container" id="simpleReqForm">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                <h2>Easy Intake Form</h2>
                <form>
                    <div class="form-group">
                        <label for="gsd">Is it GSD?</label>
                        <select class="form-control" id="gsd">
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="requestedDate">Date Requested</label>
                        <input type="date" id="requestedDate" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="projectName">ProjectName</label>
                        <input type="text" id="projectName" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="description">Brief Description</label>
                        <textarea class="form-control" id="description" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="email">Request Contact</label>
                        <input type="email" class="form-control" id="email" required>
                    </div>
                    <div class="form-group">
                        <label for="businessOwner">Business Owner</label>
                        <input type="text" id="businessOwner" class="form-control" required/>
                    </div>
                    <div class="form-group">
                        <label for="businessRequesting">Business Requesting</label>
                        <input type="text" id="businessRequesting" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="commitment">Business Commitment</label>
                        <textarea class="form-control" id="commitment" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="attachment">Attachment</label>
                        <input type="file" class="form-control-file" id="attachment">
                    </div>

                    <button type="submit" class="btn btn-default" id="submitNew">Submit</button>
                </form>
                </div>
            </div>
        </div>


    <div class="container-fluid" id="assesForm">
        <div class="row">
            <div class="col-md-4 col-md-offset-1 col-sm-12">
                <h2>Request Form</h2>
                    <div class="form-group">
                        <label for="gsd">Is it GSD?</label>
                        <select class="form-control" id="gsd" disabled >
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="requestedDate">Date Requested</label>
                        <input type="date" id="requestedDate" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="projectName">ProjectName</label>
                        <input type="text" id="projectName" class="form-control" readonly />
                    </div>
                    <div class="form-group">
                        <label for="description">Brief Description</label>
                        <textarea class="form-control" id="description" rows="3" readonly></textarea>
                    </div>
                    <div class="form-group">
                        <label for="email">Request Contact</label>
                        <input type="email" class="form-control" id="email" readonly>
                    </div>
                    <div class="form-group">
                        <label for="businessOwner">Business Owner</label>
                        <input type="text" id="businessOwner" class="form-control" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="businessRequesting">Business Requesting</label>
                        <input type="text" id="businessRequesting" class="form-control" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="commitment">Business Commitment</label>
                        <textarea class="form-control" id="commitment" rows="3" readonly></textarea>
                    </div>
                    <div class="form-group">
                        <label for="attachment">Attachment</label>
                        <span id="attachment">dsadas</span>
                    </div>

                   
                
                </div>

            <div class="col-md-4 col-md-offset-2 col-sm-12">
                <h2>Assess Form</h2>
                <form>
                    <div class="form-group">
                        <label for="competenciesNeeded">Competencies Needed</label>
                        <textarea class="form-control" id="competenciesNeeded" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="resourcesNeeded">Resources Needed</label>
                        <input type="number" id="resourcesNeeded" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="priority">Priority</label>
                        <select class="form-control" id="priority">
                            <option value="Reputation Driver">Reputation Driver</option>
                            <option value="Urgent">Urgent</option>
                            <option value="Normal">Normal</option>
                            <option value="Slow Burn">Slow Burn</option>
                            <option value="No Go">No Go</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="priorityAlignment">Priority Allignment</label>
                        <select class="form-control" id="priorityAlignment">
                            <option value="Ad hoc">Ad hoc</option>
                            <option value="Base Business / Recurring">Base Business / Recurring</option>
                            <option value="DACI Brand Builder">DACI Brand Builder</option>
                            <option value="Exploratory">Exploratory</option>
                            <option value="Strategic Enabler">Strategic Enabler</option>                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="daciPillar">DACI Pillar</label>
                        <select class="form-control" id="daciPillar">                            
                            <option value="ADE">ADE</option>
                            <option value="CI&A">CI&A</option>
                            <option value="CI&A (CSCB)">CI&A (CSCB)</option>
                            <option value="DO">DO</option>
                            <option value="DS">DS</option>
                            <option value="FA">FA</option>
                            <option value="M&EI">M&EI</option>                                                       
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="daciContact">DACI Contact</label>
                        <input type="email" class="form-control" id="daciContact">
                    </div>
                    <div class="form-group">
                        <label for="estStartDate">Estimated Start Date</label>
                        <input type="date" id="estStartDate" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="dueDate">Due Date</label>
                        <input type="date" id="dueDate" class="form-control" />
                    </div>
                    </form>
</div>
            </div>
        </div>

   

</asp:Content>
