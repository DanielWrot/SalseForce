trigger emailPDF2 on Expense_Invoice__c (after update) {

    for (Expense_Invoice__c myInv : Trigger.new) {
        ID setupid = myInv.Id;
      if (myInv.Inovice_Status__c  == 'Submitted') {
      triggerhelp.generatePdf2(setupid);
}

}}