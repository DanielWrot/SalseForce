
    @isTest(SeeAlldata=True)
    public class ClassTest 
    {
        static testMethod void testMethod1() 
        {
            Invoice__c newEvent = new Invoice__c();
            newEvent.Course__c = 'a044L0000033GmuQAE';
        insert newEvent;
            
            Test.StartTest(); 

            
            PageReference pageRef = Page.ExpanseItems;
    
            pageRef.getParameters().put('id', String.valueOf(newEvent.Id));
            Test.setCurrentPage(pageRef);

            clone testAccPlan = new clone();
            testAccPlan.listDeliveries();
    
            Test.StopTest();
        }
        static testMethod void testMethod2() 
        {
            Invoice__c newEvent = new Invoice__c();
            newEvent.Course__c = 'a044L0000033TZjQAM';
            newEvent.Submitted_Date__c= date.parse('05/11/2020');
        insert newEvent;
            
            Test.StartTest(); 

            
            PageReference pageRef = Page.itemlist;
    
            pageRef.getParameters().put('id', String.valueOf(newEvent.Id));
            Test.setCurrentPage(pageRef);

            clone testAccPlan = new clone();
            testAccPlan.cloneButton();
            testAccPlan.newSearch();

            
    
            Test.StopTest();
        }

        static testMethod void testMethod3() 
        {
            Expense_Invoice__c newEvent = new Expense_Invoice__c();
            newEvent.Course__c = 'a044L0000033TYvQAM';

        insert newEvent;

        Invoice__c newEvent2 = new Invoice__c();
        newEvent2.Course__c = 'a044L0000033TYvQAM';
        insert newEvent2;            
            Test.StartTest(); 

            
            PageReference pageRef = Page.itemlist;
    
            pageRef.getParameters().put('id', String.valueOf(newEvent.Id));

         
            Test.setCurrentPage(pageRef);
            

            clone testAccPlan = new clone();
            testAccPlan.idOfRec='E-Item-0044';
            testAccPlan.idOfInv='a074L000000FH2j';
            System.assertEquals(testAccPlan.idOfRec, 'E-Item-0044');
            System.assertEquals(testAccPlan.idOfInv, 'a074L000000FH2j');
            testAccPlan.method1();


            Test.StopTest();
        }

        static testMethod void myTest() {
       
            Course__c newEvent = new Course__c(
                name='TestAccount',
                Location__c = 'London',
                Start_Date__c = date.parse('05/11/2012'),
                 Duration__c = 4,
                  Course_Code__c ='a0A4L000003OIo2UAG',
                   Account__c = '0014L000006sFedQAE',
                   Instructor__c = '0054L000000FrEHQA0' 
    
    
            );
            insert(newEvent);
    
             List<event> lstEvent =[SELECT location FROM event WHERE location=:'London'];
             System.assertEquals(1,lstEvent.size());
         }
         static testMethod void myTest2() {
           
            Course__c newEvent = new Course__c(
                name='TestAccount',
                Location__c = 'London',
                Start_Date__c = date.parse('05/11/2012'),
                 Duration__c = 4,
                  Course_Code__c ='a0A4L000003OIo2UAG',
                   Account__c = '0014L000006sFedQAE',
                   Instructor__c = '0054L000000FrEHQA0',
                   Stage__c = 'Scheduled'
    
            );
            insert newEvent;
    
            Course__c myAcct = [SELECT Id, Name, Stage__c FROM Course__c WHERE Id = :newEvent.Id];
    
            myAcct.Stage__c = 'Cancelled';
    
            try {
                update myAcct;
            } catch (DmlException e) {
                // Process exception here
            }
    
    
    
            List<Course__c> lstCur =[SELECT name FROM Course__c WHERE name=:'TestAccount'];
            System.assertEquals(1,lstCur.size());
         }
         static testMethod void testMethod4() 
            {
                Invoice__c newEvent = new Invoice__c();
                newEvent.Course__c = 'a044L0000033GmuQAE';
                  newEvent.Course__c = 'a044L0000033GmuQAE';
    
                 insert newEvent;
            
    
            Invoice__c myAcct = [SELECT Id, Name, Invoice_Status__c FROM Invoice__c WHERE Id = :newEvent.Id];
            Test.startTest();
           myAcct.Invoice_Status__c = 'Submitted';
          
    
    
            try {
                update myAcct;
            } catch (DmlException e) {
                // Process exception here
            }
            Test.stopTest();
        }

        


    }