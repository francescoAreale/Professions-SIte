<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreaAppuntamento.aspx.cs" Inherits="WebApplication1.CreaAppuntaento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />

    <asp:Label ID="Label4" style="margin-left:0; float:left"  runat="server" Font-Bold="True" Font-Size="15pt" Font-Strikeout="False" Text="Seleziona Professore"></asp:Label>

    <br />

<link href="<%= ResolveUrl("~/Content/fullcalendar.css") %>" rel="stylesheet" type="text/css" />
 <link href="<%= ResolveUrl("~/Content/fullcalendar.print.css") %>" rel="stylesheet" type="text/css" />
     <link href="<%= ResolveUrl("~/Content/bootstrap.min.css") %>" rel="stylesheet" type="text/css" />
     <link href="<%= ResolveUrl("~/Content/bootstrap-theme.min.css") %>" rel="stylesheet" type="text/css" />
    

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
              eventSources: [ {
                  url: '/api/Home/Get',
                  type: 'GET',
                  data: {
                      custom_param1: '<%= IdProfs %>'
                  },
                  error: function() {
                      alert('there was an error while fetching events!');
                  }
                  
              }],
              eventClick: function (calEvent, jsEvent, view) {
                  alert('You clicked on event id: ' + calEvent.id
                      + "\nSpecial ID: " + calEvent.someKey
                      + "\nAnd the title is: " + calEvent.title);

              },
              dayClick: function (date, allDay, jsEvent, view) {
                  $('#eventTitle').val("");
                  $('#eventDate').val($.fullCalendar.formatDate(date, 'dd/MM/yyyy'));
                  $('#eventTime').val($.fullCalendar.formatDate(date, 'HH:mm'));
                  ShowEventPopup(date);
              }

          });

          CalLoading = false;

    
    


      $('#btnPopupCancel').click(function () {
          ClearPopupFormValues();
          $('#popupEventForm').hide();
      });

      $('#btnPopupSave').click(function () {
         

          var dataRow = {
              'Title': $('#eventTitle').val(),
              'NewEventDate': $('#eventDate').val(),
              'NewEventTime': $('#eventTime').val(),
              'NeweventMessage': $('#eventMessage').val(),
              'NewNameProf': '<%= nameProfs %>',
              'NewIdProf': '<%= IdProfs%>'
          }
          
          ClearPopupFormValues();
         

        
          $.ajax({
              type: 'POST',
              url: "/api/Home/Post",
              data: dataRow,
              success: function (response) {                 
                      $('#calendar').fullCalendar('refetchEvents');
                      alert("Richiesta di appuntamento inviata.");
              }
          });

          
      });

      $('#btnInit').click(function () {
          $.getJSON("api/Home", function (data) {

              if (data == 'True') {
                  $('#calendar').fullCalendar('refetchEvents');
                  alert('Database populated! ');
              }
              else {
                  alert('Error, could not populate database!');
              }
              // alert(data);
          });

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
    <br />
    <br />

    <asp:Image ID="Image1" runat="server" align="middle" Height="150px" Width="150px"  />
    <br />
    <br />
    <div class="container">

   
    <div id='calendar' style="float:left ; width:70%" >
        
        </div>  

    <div id="popupEventForm" style="float:right ; width:30%"  >
   <div class="modal-header style="float:right"><h3 style="float:right">Request for Appointment</h3></div>
  <div class="modal-body"style="float:right">
    <form id="EventForm" class="well">
        <input type="hidden" id="eventID">
        <label>

        Event title</label>
        <input type="text" id="eventTitle" placeholder="Title here"><br />
        <label>Scheduled date</label>
        <input type="text" id="eventDate"><br />
        <label>Scheduled time</label>
        <input type="text" id="eventTime"><br />
        <label>Message</label>
        <textarea rows="4" cols="50"id="eventMessage" placeholder="write a reason for appointment"></textarea><br />
    </form>

    <button type="button" id="btnPopupCancel" data-dismiss="modal" class="btn">Cancel</button>
    <button type="button" id="btnPopupSave" data-dismiss="modal" class="btn btn-primary">Save event</button>
  </div>
</div>
        </div>
    
   
   
    <asp:SqlDataSource ID="DatabaseProject" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseProject %>" SelectCommand="SELECT U.UserName, U.UserId FROM Users AS U INNER JOIN UsersInRoles AS UR ON U.UserId = UR.UserId INNER JOIN Roles AS R ON UR.RoleId = R.RoleId WHERE (R.RoleName &lt;&gt; 'SimpleUser')"></asp:SqlDataSource>
    
     <br />
    <br />
  
    <br />
    <br />
    <br />
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
     <br />
    <br />
    <br />
    
    
    
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
