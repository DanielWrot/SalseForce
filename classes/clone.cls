public with sharing class clone {
    public String idOfRec {get;set;}
    public String idOfInv {get;set;}

    /**
    *  This controller is used by both the SearchCoursesPage and ListCourseDeliveriesPage
    *  VF pages. Users will select courses using the checkboxes and then click
    *  to see the upcoming course deliveries for those courses.
    */

   // Represents the main course list
   public List<InvoiceWrapper> eInvoiceList {
       get {
           if (eInvoiceList == null) {
               eInvoiceList = new List<InvoiceWrapper>();
               for (Expense_Invoice__c invoive : [SELECT Name,  Inovice_Date__c
                                          FROM Expense_Invoice__c]) {
                   eInvoiceList.add(new InvoiceWrapper(invoive));
               }
           }
           return eInvoiceList;
       }
       set;
   }

   // Contains only the course selected
   public Map<Id, InvoiceWrapper> selectedInvoice {
       get {
           if (selectedInvoice == null) {
               selectedInvoice = new Map<Id, InvoiceWrapper>();
           }
           return selectedInvoice;
       }
       private set;
   }

   // Action that is triggered from the "See Upcoming Course Deliveries" button
   public PageReference listDeliveries() {

       // First clear out any previously selected courses
       selectedInvoice.clear();

       // Add the newly selected courses to the map
       for (InvoiceWrapper cw : eInvoiceList) {
           if (cw.checked) {
               selectedInvoice.put(cw.invoive.Id, cw);
           }
       }

       if (selectedInvoice.size() > 0) {
           return Page.itemlist;
       } else {
           ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please select at least one Expanse Invoice'));
           return null;
       }		
   }

   public List<Expense_Invoice_Line_Item__c> deliveries {
       get {
           if (deliveries == null) {
               deliveries = new List<Expense_Invoice_Line_Item__c>([
                                    SELECT Name,Expense_Invoice__c, Expense_Type__c,Description__c,  Date__c, Total_Amount__c,Expense_Invoice__r.ID
                                      FROM Expense_Invoice_Line_Item__c
                                     WHERE Expense_Invoice__c IN :selectedInvoice.keySet()
                                  ORDER BY Name	]);
           }
           return deliveries;
       }
       private set;
   }
 
   public PageReference newSearch() {
       deliveries.clear();
       PageReference newPage = Page.ExpanseItems;
       newPage.setRedirect(true);
       return newPage;
   }

   public class InvoiceWrapper {
       public Expense_Invoice__c invoive {get; set;}
       public Boolean checked {get; set;}

       public InvoiceWrapper(Expense_Invoice__c c) {
        invoive = c;
           checked = false;
       }
   }


public PageReference cloneButton() {
    

    // First clear out any previously selected courses
    selectedInvoice.clear();
    
    for (InvoiceWrapper cw : eInvoiceList) {
        if (cw.checked) {
            selectedInvoice.put(cw.invoive.Id, cw);
        }
    }

    if (selectedInvoice.size() > 0) {
        method1();

     return null;

    } else {
        ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please select at least one Expanse Invoice'));
        return null;
    }		
}

Public String method1(){
  Expense_Invoice_Line_Item__c con = [SELECT  ID,Name,Date__c,Expense_Invoice__c,Amount__c,Description__c  FROM Expense_Invoice_Line_Item__c WHERE Name = : idOfRec];
Expense_Invoice_Line_Item__c can = con.clone(false,true);


    Expense_Invoice_Line_Item__c conCopy = new Expense_Invoice_Line_Item__c(
                                       Expense_Invoice__c =  idOfInv,
                                         Date__c = can.Date__c,
                                         Amount__c = can.Amount__c ,
                                         Description__c = can.Description__c );
  
ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Expanse Invoice has been cloned'));
insert conCopy;
return null;

}


}