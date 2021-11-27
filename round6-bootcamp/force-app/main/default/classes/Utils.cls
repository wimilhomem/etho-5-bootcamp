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


       return generateRandomNumber(x,y);
    }

    public static Integer generateRandomNumber(Integer min, Integer max) {
        
        return Math.floor(Math.random()*(max-min+1)+min).intValue();
    }

    public static Integer getD20() {

        return generateRandomNumber(1,20);
    }

    public static Integer getD10() {

        return generateRandomNumber(1,10);
    }


}