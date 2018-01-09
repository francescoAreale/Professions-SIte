using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication1.Models;
namespace WebApplication1
{

    public class PostRequestEvent
    {
        public string Title { get; set; }
        public string NewEventDate { get; set; }
        public string NewEventTime { get; set; }
        public string NeweventMessage { get; set; }
        public string NewNameProf { get; set; }
        public string NewIdProf { get; set; }
    }



    public class HomeController : ApiController
    {
        // GET api/<controller>
        public string Get()
        {
            bool rslt = Utils.InitialiseDiary();
            return rslt.ToString();
        }

        // GET api/<controller>/5
        public Array Get(double start, double end, string custom_param1)
        {
            var ApptListForDate = DiaryEvent.LoadAllAppointmentsInDateRange(start, end,custom_param1);
            var eventList = from e in ApptListForDate
                            select new
                            {
                                id = e.ID,
                                title = e.Title,
                                start = e.StartDateString,
                                end = e.EndDateString,
                                color = e.StatusColor,
                                className = e.ClassName,
                               // someKey = e.SomeImportantKeyID,
                                allDay = false
                            };
            var rows = eventList.ToArray();
            return rows;

        }

        public Array Get2(double start, double end, string custom_param1)
        {
            var ApptListForDate = DiaryEvent.LoadAllAppointmentsInDateRange2(start, end, custom_param1);
            var eventList = from e in ApptListForDate
                            select new
                            {
                                id = e.ID,
                                title = e.Title,
                                start = e.StartDateString,
                                end = e.EndDateString,
                                color = e.StatusColor,
                                color2 = e.StatusString,
                                className = e.ClassName,
                               
                                nomeRichiedente = e.nomeRichiedente,
                                // someKey = e.SomeImportantKeyID,
                                allDay = false
                            };
            var rows = eventList.ToArray();
            return rows;

        }



        // POST api/<controller>
      
        public void Post(int id, string NewEventStart, string NewEventEnd)
        {
            DiaryEvent.UpdateDiaryEvent(id, NewEventStart, NewEventEnd);
        }
        /*
       [HttpPost]
        public bool Post(string Title,string NewEventDate,string NewEventTime,string NewEventDuration)
        {
            return DiaryEvent.CreateNewEvent(Title, NewEventDate, NewEventTime, NewEventDuration);
        }*/

        
        public bool Post([FromBody]PostRequestEvent json)
        {


            return DiaryEvent.CreateNewEvent(json.Title, json.NewEventDate, json.NewEventTime, json.NeweventMessage, json.NewNameProf,json.NewIdProf);
        
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}