// This trigger is used for Account for the insert and update operation
trigger openCageAccountHandler on Account (after insert,after update) {

    // If the trigger is inserted or updated
    if(Trigger.isAfter && Trigger.isInsert){

        // The data will be stored on the Account object
        Account acc=Trigger.new.get(0);

        // Here we are adding the class and the method to it and also passed the ID parameter
        openCageDemo.forwardGeoCoding(acc.Id);
    }
}