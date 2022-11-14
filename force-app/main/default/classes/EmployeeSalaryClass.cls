public with sharing class EmployeeSalaryClass {
    public  void employeeSalaryMethod() {
        Map<Integer, Integer> employeeMap = new Map<Integer, Integer>();
        
        employeeMap.put(1244, 20000);
        employeeMap.put(2885, 30000);
        employeeMap.put(34566, 24000);
        employeeMap.put(44345, 58000);
        employeeMap.put(434455, 28000);
        employeeMap.put(49334, 37000);
        employeeMap.put(88225, 80000);
        employeeMap.put(9377,40000);
        employeeMap.put(98898,27000);
        
        
        Map<Integer, Decimal> oddsalaryMap = new Map<Integer, Decimal>();
        Map<Integer, Decimal> evensalaryMap = new Map<Integer, Decimal>();
        
        for(Integer employeeId : employeeMap.keyset()){
            Decimal Salary;
            if(math.mod(employeeId,2)==0){ 
                
                Salary = employeeMap.get(employeeId) + (employeeMap.get(employeeId)*0.3);
                
                evensalaryMap.put(employeeId,Salary);
                
            }
            else if(math.mod(employeeId,2)!=0){
                
                Salary = employeeMap.get(employeeId) + (employeeMap.get(employeeId)*0.5);
                
                oddsalaryMap.put(employeeId,Salary);
                
            }
            
        }
        
        system.debug('oddsalaryMap===>'+oddsalaryMap.keyset());
        system.debug('oddsalaryMap===>'+oddsalaryMap.values());
        system.debug('evensalaryMap===>'+evensalaryMap.keyset());
        system.debug('evensalaryMap===>'+evensalaryMap.values());
    }
}