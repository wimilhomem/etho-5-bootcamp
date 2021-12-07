public with sharing class Utils {
    public static void setValue(SObject record, Schema.SObjectField field, Object value) {
   
        record.put(field, value);

        
    }
    public static Set<Id> getSetIds(List<SObject> sObjs, Schema.SObjectField field) {
        Set<Id> ids = new Set<Id>();

        for (SObject sObj : sObjs) {
            ids.add(Id.valueOf(String.valueOf(sObj.get(field))));
        }

        return ids;
    }
    public static integer generateRandomIntegerBetween(Integer x, Integer y) {


       return generateRandomNumber(x,y).intValue();
    }

    public static Decimal generateRandomNumber(Integer min, Integer max) {
        
        return Math.floor(Math.random()*(max-min+1)+min);
    }

    public static String cronString(Integer addMinutes) {
        Datetime now  = Datetime.now();
        Datetime nextRunTime = now.addMinutes(addMinutes);
        return 
            '' + nextRunTime.second() + ' ' + nextRunTime.minute() + ' ' + 
            nextRunTime.hour() + ' ' + nextRunTime.day() + ' ' + 
            nextRunTime.month() + ' ? ' + nextRunTime.year();
    }


}