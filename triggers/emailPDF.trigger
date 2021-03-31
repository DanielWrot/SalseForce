
trigger emailPDF on Invoice__c  (after update) {

    for (Invoice__c myInv : Trigger.new) {
        ID setupid = myInv.Id;
      if (myInv.Invoice_Status__c  == 'Submitted') {
       triggerhelp.generatePdf(setupid);
}
    }
    

}