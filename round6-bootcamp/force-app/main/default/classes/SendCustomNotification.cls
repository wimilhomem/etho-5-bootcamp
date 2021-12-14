public inherited sharing class SendCustomNotification {
    
    
    public static void sendNotifications(String strBody, String strSenderId, String strTargetId, String strTitle, String strNotificationId, set<String> setUserIds) {
       
        Messaging.CustomNotification obj = new Messaging.CustomNotification();
        
        // Custom notification type Id
        obj.setNotificationTypeId('0ML5f000000042QGAQ');
        
        // when we click on the notification it will redirect to the specified targetId
        obj.setTargetId(strTargetId);
        
        // Notification Title
        obj.setTitle(strTitle);
        
        // Notification Body
        obj.setBody(strBody);
        
        // send used to send the notification, pass the set of user ids , Group or Queue member
        obj.send(setUserIds);
    }
}