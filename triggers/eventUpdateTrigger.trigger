trigger eventUpdateTrigger on Course__c (After update) {
    List <Event> Eventlist = new List <Event> ();

     for (Course__c myEvent : Trigger.new) {

          if (myEvent.Stage__c  == 'Cancelled') {    
                 Event existoppList = [SELECT Id,WhatId FROM Event WHERE  WhatId =:myEvent.Id];
                 delete(existoppList);

                 List<Messaging.SingleEmailMessage> mails = 
                 new List<Messaging.SingleEmailMessage>();
                 Messaging.SingleEmailMessage mail = 
              new Messaging.SingleEmailMessage();
         
        String dan = 'danielwrotkowski98@gmail.com';
                  List<String> sendTo = new List<String>();
                  sendTo.add(dan);
                  mail.setToAddresses(sendTo);
          
         
                  mail.setReplyTo('danielwrotkowski98@gmail.com');
                  mail.setSenderDisplayName('New Course');
         
         
        // Specify the subject line for your email address.
        mail.setSubject(' Course Cancelled : ');
         
                  String body =  'one of your has been canceled. Check your Calandar.';
          
                  mail.setHtmlBody(body);
        
                  // Step 5. Add your email to the master list
                  mails.add(mail);
              // Step 6: Send all emails in the master list
              Messaging.sendEmail(mails);
              break;

          }
          Event existoppList = [SELECT Id ,WhatId FROM Event WHERE  WhatId =:myEvent.Id];
             delete(existoppList);

          Event  newEvent = new Event (
            OwnerId = myEvent.Instructor__c,
            StartDateTime = myEvent.Start_Date__c,
            EndDateTime = myEvent.End_Date__c,
            Subject =myEvent.Name + ' ' + myEvent.Start_Date__c + '-' + myEvent.End_Date__c,
            WhatId = myEvent.Id,
            Location = myEvent.Location__c
        );
        EventList.add(newEvent);
       insert(Eventlist);

  

 
     }

}
