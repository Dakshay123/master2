public class demoLwc {
    @auraEnabled
    public static string demo(String nav, Integer i){
        system.debug('hello world');
        System.debug('nav---'+nav);
        System.debug('int---'+i);
        return '';
    }
}