public class UnitExtension { 
    
    private class Unit {
        public String Name {get; set;}
        public Integer Quantity {get; set;}
        public Decimal Percentage {get; set;}
        
        public Unit(String unitName, Integer num, Decimal percent) {
            Name = Unitname;
            Quantity = num;
            Percentage = percent;
        }
    }
    
     public static List<Unit> Units {get; set;}
    
	 public static Decimal getTotal() {
        AggregateResult myResult = [SELECT SUM(Quantity__c) Total FROM Unit__c];
        return (Decimal) myResult.get('Total');
     }
    
    
 	public static List<Unit> getPercentages(){
        Decimal total = getTotal();
        Units =  new List<Unit>();
        List<Unit__c> U= [Select name,Quantity__c From Unit__c];
        System.debug(U);
        for(Unit__c u1 : U)
        {
            Units.add(new Unit(u1.name,(Integer) u1.Quantity__c,u1.Quantity__c/total));
        }
        return Units;
    } 
    
}