class Contact {
  String lastName, firstName, address, phone, email;
  int age;
  boolean married;
  
  Contact(String ln, String fn, String ad, String ph, String em, int ag, boolean ma) {
    lastName = ln;
    firstName = fn;
    address = ad;
    phone = ph;
    email = em;
    age = ag;
    married = ma;  
  }
 
 
  int compare(Contact con, String field) {   
    String s1, s2;
    int i1, i2;
    boolean b1, b2;
    int result;
    
    switch (field) {
      case "Last Name":
        s1 = this.lastName;
        s2 = con.lastName;
        result = cmp(s1, s2);
        break;
      case "First Name":
        s1 = this.firstName;
        s2 = con.firstName;
        result = cmp(s1, s2);
        break;
      case "Address":
        s1 = this.address;
        s2 = con.address;
        result = cmp(s1, s2);
        break;
      case "Phone":
        s1 = this.phone;
        s2 = con.phone;
        result = cmp(s1, s2);
        break;
      case "Email":
        s1 = this.email;
        s2 = con.email;
        result = cmp(s1, s2);
        break;
      case "Age":
        i1 = this.age;
        i2 = con.age;
        result = cmp(i1, i2);
        break;
      case "Married":
        b1 = this.married;
        b2 = con.married;
        result = cmp(b1, b2);
        break;
      default:
        throw new IllegalArgumentException("Invalid sort field: " + field);     
    }
    return result;  //this returns -1, 0, 1 
  }
  
  
  int cmp (String s1, String s2) {
    if (s1.compareToIgnoreCase(s2) < 0) return -1;
    else if (s1.compareToIgnoreCase(s2) > 0) return 1;  //return 1 if the first argument is lexicographically greater than the second argument
    else return 0;  
  }
  
  int cmp (int i1, int i2) {
    if (i1 < i2) return -1;
    else if (i1 > i2) return 1;  //return 1 if the first argument is mathematically greater than the second argument
    else return 0;
  }
  
  int cmp (boolean b1, boolean b2) {
    if (!b1 && b2) return -1;
    else if (b1 && !b2) return 1;  //return 1 if the first argument is mathematically greater than the second argument
    else return 0;
  }
}
