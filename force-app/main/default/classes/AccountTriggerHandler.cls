public class AccountTriggerHandler {
    public static void updateInfo(Map<Id, Account> newAccounts, Map<Id, Account> oldAccounts){
        List<Contact> existingContact = [Select Id,Name from Contact where AccountId =: newAccounts.keySet()];
        List<Contact> conList = new List<Contact>();
        for(Account acc : newAccounts.values()){
            if(existingContact.isEmpty()){
                if(oldAccounts.get(acc.Id).Active__c == False){
                    if(acc.Type == 'Customer - Direct' && acc.Active__c == True){
                        Contact con = new Contact();
                        con.FirstName = acc.Name;
                        con.LastName = 'Customer Representative';
                        con.AccountId = acc.Id;
                        con.Email = acc.Company_Email__c;
                        con.Phone = acc.Phone;
                        conList.add(con);
                    }
                }
            }
        }
        insert conList;
    }
}