<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mieiAppuntamenti.aspx.cs" Inherits="WebApplication1.mieiAppuntamenti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    </br>
    </br>
    <asp:Label ID="Label1" runat="server" Text="Label"><center><font color="orange">Orange=Pending</font> , <font color="red">Red=Confermed</font>, <font color="green">Green=Rejected </font></center></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">


<link href="<%= ResolveUrl("~/Content/fullcalendar.css") %>" rel="stylesheet" type="text/css" />
 <link href="<%= ResolveUrl("~/Content/fullcalendar.print.css") %>" rel="stylesheet" type="text/css" />
     
        <link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/Content/css/normalize.css") %>" />
		
		<!-- common styles -->
		<link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/Content/css/dialog.css") %>" />
		<!-- individual effect -->
		<link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/Content/css/dialog-henry.css") %>" />
		

<script type="text/javascript" 
src="<%= ResolveUrl("~/Scripts/lib/moment.min.js") %>">
</script>
<script type="text/javascript" 
src="<%= ResolveUrl("~/Scripts/lib/jquery.min.js") %>">
</script>
<script type="text/javascript" 
src="<%= ResolveUrl("~/Scripts/fullcalendar.min.js") %>">
</script>
    
    <script type="text/javascript" 
src="<%= ResolveUrl("~/Scripts/jquery-ui-1.8.24.js") %>">

</script>
 
  <script type="text/javascript" 
src="<%= ResolveUrl("~/Scripts/jquery-ui-1.8.24.min.js") %>">

</script>
    <script   src="<%= ResolveUrl("~/Content/js/snap.svg-min.js") %>"></script>
		<script   src="<%= ResolveUrl("~/Content/js/modernizr.custom.js") %>"></script>

  <script>




      $(document).ready(function () {



          $('#calendar').fullCalendar({
              header: {
                  left: 'prev,next today',
                  center: 'title',
                  right: 'month,agendaWeek,agendaDay'
              },
              defaultView: 'agendaDay',
              width: 200,
              height: 400,

              editable: true,
              allDaySlot: false,
              selectable: true,
              slotMinutes: 15,
              eventSources: [{
                  url: '/api/Home/Get2',
                  type: 'GET',
                  data: {
                      custom_param1: '<%= Membership.GetUser().ProviderUserKey.ToString() %>'
                  },
                  error: function () {
                      alert('there was an error while fetching events!');
                  }

              }],
              eventClick: function (calEvent, jsEvent, view) {
                  /*   alert('You clicked on event id: ' + calEvent.id
                   + "\nSpecial ID: " + calEvent.someKey
                     + "\nAnd the title is: " + calEvent.title);*/
                  ciao(calEvent);
              }

             ,
              dayClick: function (date, allDay, jsEvent, view) {
                  $('#eventTitle').val("");
                  $('#eventDate').val($.fullCalendar.formatDate(date, 'dd/MM/yyyy'));
                  $('#eventTime').val($.fullCalendar.formatDate(date, 'HH:mm'));
                  ShowEventPopup(date);



              }

          });



      });

      function ShowEventPopup(date) {
          ClearPopupFormValues();
          $('#popupEventForm').show();
          $('#eventTitle').focus();
      }

      function ClearPopupFormValues() {
          $('#eventID').val("");
          $('#eventTitle').val("");
          $('#eventDateTime').val("");
          $('#eventMessage').val("");
      }





      function UpdateEvent(EventID, EventStart, EventEnd) {

          var dataRow = {
              'ID': EventID,
              'NewEventStart': EventStart,
              'NewEventEnd': EventEnd
          }

          $.ajax({
              type: 'POST',
              url: "/api/Home",
              dataType: "json",
              contentType: "application/json",
              data: JSON.stringify(dataRow)
          });
      }
          </script>
     

  <div id='calendar' style="float:left ; width:70%" >
         
        </div>  


  

    <div id="somedialog" class="dialog">
					<div class="dialog__overlay"></div>
					<div class="dialog__content">
						<div class="morph-shape" data-morph-open="M0,0h80c0,0,0,9.977,0,29.834c0,19.945,0,30.249,0,30.249H0c0,0,0-10.055,0-30.332C0,8.219,0,0,0,0z" data-morph-close="M0,29.75h80c0,0-3.083,0.014-3.083,0.041c0,0.028,3.083,0.042,3.083,0.042H0c0,0,3.084-0.014,3.084-0.042
	C3.084,29.762,0,29.75,0,29.75z">
							<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 80 60" preserveAspectRatio="none">
								<path d="M0,29.75h80c0,0-3.083,0.014-3.083,0.041c0,0.028,3.083,0.042,3.083,0.042H0c0,0,3.084-0.014,3.084-0.042
	C3.084,29.762,0,29.75,0,29.75z"></path>
							</svg>
						</div>
						<div class="dialog-inner">
                                <h3 id="idapp"><b></b> </h3>
							    <h3 id="contenitore"><b></b>  </h3>
                                <h3 id="mex"><b></b>  </h3>
                                <h3 id="status"><b></b>  </h3>
                            </br>
                            
                            <div><button class="action" data-dialog-close>Close</button></div>
						</div>
					</div>
				</div>

    <script src="<%= ResolveUrl("~/Content/js/classie.js") %>"></script>
		  <script src="<%= ResolveUrl("~/Content/js/dialogFx.js") %>"></script>
		<script>
		    function ciao(calEvent) {

		        // var dlgtrigger = document.querySelector('[data-dialog]'),

		        somedialog = document.getElementById("somedialog"),
		        // svg..
                morphEl = somedialog.querySelector('.morph-shape'),
                s = Snap(morphEl.querySelector('svg')),
                path = s.select('path'),

                steps = {
                    open: morphEl.getAttribute('data-morph-open'),
                    close: morphEl.getAttribute('data-morph-close')
                },

                dlg = new DialogFx(somedialog, {
                    onOpenDialog: function (instance) {
                        // animate path
                        path.stop().animate({ 'path': steps.open }, 400, mina.easeinout);
                    },
                    onCloseDialog: function (instance) {
                        // animate path
                        path.stop().animate({ 'path': steps.close }, 400, mina.easeinout);
                    }
                });

		        var h1 = document.getElementById("idapp");
		        h1.innerHTML = "ID appuntamento: " + Number(calEvent.id).toString();
		        var h2 = document.getElementById("contenitore");
		        h2.innerHTML = "Appuntamento con: " + calEvent.nomeRichiedente;
		        var h3 = document.getElementById("mex");
		        h3.innerHTML = "Titolo:  " + calEvent.title;
		        var h4 = document.getElementById("status");
		        var stato = "suca";
		        if (calEvent.color2 == "Booked") stato = ": Pending";
		        if (calEvent.color2 == "Confirmed") stato = ": Confermed";
		        if (calEvent.color2 == "Enquiry") stato = ": Rejected";
		        h4.innerHTML = "Status:  " + stato;
		        this.addEventListener('click', dlg.toggle.bind(dlg));

		    };
		</script>
</asp:Content>
