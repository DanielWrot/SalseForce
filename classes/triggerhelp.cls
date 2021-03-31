public with sharing class triggerhelp {
    
    @future(callout = true)
            public static void generatePdf(Id setupid)
            {

            Id cId = setupid;

             Pagereference pg = new PageReference('/apex/Invoice?Id=' + cId );    

            Attachment d = new Attachment();
            Blob body = pg.getContent();
            d.body = body;
            d.name ='INVF'+ cId + '.pdf';
            d.IsPrivate = false;
            d.ParentID = cId;
            insert d;

            List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
             Messaging.EmailFileAttachment dd = new Messaging.EmailFileAttachment();

             dd.setContentType(d.contentType);
             dd.setFileName(d.name);
             dd.setInline(false);
             dd.Body = d.Body;


                      // Step 1: Create a new Email
          Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
          // Step 2: Set list of people who should get the email
          String dan = 'danielwrotkowski98@gmail.com';
          List<String> sendTo = new List<String>();
          sendTo.add(dan);
          mail.setToAddresses(sendTo);
        
          // Step 3: Set who the email is sent from
          mail.setReplyTo('danielwrotkowski98@gmail.com');
          mail.setSenderDisplayName('Submited Invoice');
        
    
          // Step 4. Set email contents - you can use variables!
          mail.setSubject('Submited Invoice');
          String bodyNew = ' This is for you,';
          bodyNew += 'PDF LINK';
          bodyNew += 'https://brave-impala-9hi4ud-dev-ed--c.visualforce.com//apex/Invoice?Id=' + cId;
  
          mail.setHtmlBody(bodyNew);
          mail.setFileAttachments(new Messaging.EmailFileAttachment[] { dd });
        
          // Step 5. Add your email to the master list
          mails.add(mail);
      // Step 6: Send all emails in the master list
      Messaging.sendEmail(mails);

      //invokeable 

            }
         @future(callout = true)
            public static void generatePdf2(Id setupid)
            {

            Id cId = setupid;

             Pagereference pg = new PageReference('/apex/ExpInvoice?Id=' + cId );    

            Attachment d = new Attachment();
            Blob body = pg.getContent();
            d.body = body;
            d.name ='EINVF'+ cId + '.pdf';
            d.IsPrivate = false;
            d.ParentID = cId;
            insert d;

            List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
             Messaging.EmailFileAttachment dd = new Messaging.EmailFileAttachment();

             dd.setContentType(d.contentType);
             dd.setFileName(d.name);
             dd.setInline(false);
             dd.Body = d.Body;


                      // Step 1: Create a new Email
          Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
          // Step 2: Set list of people who should get the email
          String dan = 'danielwrotkowski98@gmail.com';
          List<String> sendTo = new List<String>();
          sendTo.add(dan);
          mail.setToAddresses(sendTo);
        
          // Step 3: Set who the email is sent from
          mail.setReplyTo('danielwrotkowski98@gmail.com');
          mail.setSenderDisplayName('Submited ExpInvoice');
        
    
          // Step 4. Set email contents - you can use variables!
          mail.setSubject('Submited ExpInvoice');
          String bodyNew = ' This is for you,';
          bodyNew += 'PDF LINK';
          bodyNew += 'https://brave-impala-9hi4ud-dev-ed--c.visualforce.com//apex/ExpInvoice?Id=' + cId;
  
          mail.setHtmlBody(bodyNew);
          mail.setFileAttachments(new Messaging.EmailFileAttachment[] { dd });
        
          // Step 5. Add your email to the master list
          mails.add(mail);
      // Step 6: Send all emails in the master list
      Messaging.sendEmail(mails);


            }
        }