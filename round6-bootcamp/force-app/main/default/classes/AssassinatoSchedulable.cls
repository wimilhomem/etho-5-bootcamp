public class AssassinatoSchedulable implements Schedulable {

    Integer addMinutes;

    public AssassinatoSchedulable(Integer addMinutes) {
        this.addMinutes = addMinutes;        
    }

    public void execute(SchedulableContext sc) {
        reschedule(sc);
        AssassinatosHandler.execute();
        System.debug('SchedulableContext chamou');
    }

    private void reschedule(SchedulableContext sc) {
        // Re-schedule ourself to run again in "intervalMinutes" time
            
        String cronString = Utils.cronString(addMinutes); 
        System.schedule(
            AssassinatoSchedulable.class.getName() + '-' + Datetime.now().format(),
            cronString,
            new AssassinatoSchedulable(Utils.generateRandomIntegerBetween(12,36) * 60)
        );

        // Abort the current job
        Id jobId = sc.getTriggerId();
        System.abortJob(jobId);
    }
}