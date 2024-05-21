public class contactController {

    private String sortOrder='FirstName';
    
    public List<Contact> getContacts(){
        List<Contact> results= database.query(
        	'SELECT Id,FirstName,LastName,Email ' +
            'FROM Contact ' +
            'Order By ' + sortOrder + ' ASC '+
            'LIMIT 10 '
        );
        return results;
    }
    
    public void sortByLastName(){
        this.sortOrder='LastName';
    }
    
        public void sortByFirstName(){
        this.sortOrder='FirstName';
    }
}