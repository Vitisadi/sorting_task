ArrayList <Contact> contacts;
String sortingBy = "Bubble Sort";
String sortingFor = "Last Name";
Boolean sortReverse = false;
String[] selectionTexts = {"Last Name", "First Name", "Address", "Phone", "Email", "Age", "Married", "Reverse"};

void setup() {
  size(1600, 1200);
  contacts = new ArrayList<Contact>();  
  createContacts();

  goSort(contacts, sortingBy, "Last Name", sortReverse);  
}

void draw(){
  background(255);
  textSize(70);
  textAlign(CENTER);
  fill(0);
  text("Sort the contacts!", width/2, 100);
  textSize(30);
  text("Press 'b' for 'Bubble Sort'", 300, 200);
  text("Currently Sorting by: " + sortingBy, width/2, 200);
  text("Press 's' for 'Selection Sort'", 1300, 200);

  textSize(50);
  for(int y = 0; y < 2; y++){
    for(int x = 0; x < 4; x++){
      if(selectionTexts[4 * y + x] == "Reverse" && sortReverse == true){
        fill(46, 210, 32);
      } else if(selectionTexts[4 * y + x] == "Reverse" && sortReverse == false){
        fill(147, 37, 37);
      } else if(selectionTexts[4 * y + x] == sortingFor){
        fill(90, 225, 225);
      } else {
        fill(255, 0, 0);
      }
      rect(100 + 366*x, 250 * y + 300, 300, 200);
      fill(0);
      text(selectionTexts[4 * y + x], 250 + 366*x, 250 * y + 400);  
    } 
  }
  
  printContacts(sortingFor);
}

void createContacts(){
  contacts.add(new Contact("Smith", "John", "27 Sunnyside Ln Westport, CT", "203-123-4567", "jsmith123@gmail.com", 21, false));
  contacts.add(new Contact("Virtue", "Trevor", "15 North S., Hartford CT", "860-343-4264", "tvirtue123@hotmail.com", 45, true));
  contacts.add(new Contact("Blair", "Verona", "333 Main St, Wethersfield, CT", "860-313-8874", "blvtop@gmail.com", 16, false));
  contacts.add(new Contact("Andrews", "Lisa", "8881 Madison Ave, Framingham MA", "508-909-5286", "andrewlisanator@gmail.com", 30, true));
  contacts.add(new Contact("Stanbridge", "Laura", "11 Meadowview Rd, Trumbull CT", "203-261-2991", "stan5laura8@optonline.net", 26, false));
  contacts.add(new Contact("Burch", "Brad", "1 Cove Rd, Greenwhich CT", "203-242-3528", "mybb323@gmail.com", 18, false));
}

//***** This is your function/procedure which must demonstrate selection, iteration, and sequencing; it currently features none of these
void goSort(ArrayList<Contact> list, String sortingBy, String sortingFor, boolean reverse) {
  if(sortingBy == "Bubble Sort"){
    bubbleSort(list, sortingFor);
  }
  else if(sortingBy == "Selection Sort"){
    selectionSort(list, sortingFor); 
  } 
  if(reverse){
    reverse(list); 
  }
  
  System.out.println("Sorting For: " + sortingFor + " | Reverse: " + sortReverse);
  for (Contact c: contacts) {
    System.out.printf("%-15s%-15s%-40s%-22s%-35s%-8d%-10b\n",c.lastName,c.firstName,c.address,c.phone,c.email,c.age,c.married);  //column format printing
  }
   System.out.printf("\n\n");
}

void printContacts(String field) {
  fill(0);
  textSize(30);
  text("SORTED FOR: " + field, width/2, 800);
  
  textSize(25);
  text("Last Name", 100, 850);
  text("First Name", 300, 850);
  text("Address", 550, 850);
  text("Phone Number", 800, 850);
  text("Email", 1050, 850);
  text("Age", 1250, 850);
  text("Is Married", 1400, 850);
  
  textSize(15);
    for(int i = 0; i < contacts.size(); i++){
        text(contacts.get(i).lastName, 100, 900 + 50 * i);
        text(contacts.get(i).firstName, 300, 900 + 50 * i);
        text(contacts.get(i).address, 550, 900 + 50 * i);
        text(contacts.get(i).phone, 800, 900 + 50 * i);
        text(contacts.get(i).email, 1050, 900 + 50 * i);
        text(contacts.get(i).age, 1250, 900 + 50 * i);
        text(String.valueOf(contacts.get(i).married), 1400, 900 + 50 * i);
    } 
}

void bubbleSort(ArrayList<Contact> list, String field) {
  int n = list.size();
  for (int i = 0; i < n-1; i++) {
    for (int j=1; j < (n-i); j++) {
      // if method Contact compare() => 1 item[j-1] > item[j] so we swap; see Contact class
      if (list.get(j-1).compare(list.get(j), field) == 1) {
        Contact temp = list.get(j-1);
        list.set(j-1, list.get(j));
        list.set(j, temp);
      }
    }
  }  
}

void selectionSort(ArrayList<Contact> list, String field) {
    for (int i = 0; i < list.size()-1; i++) {
      int smallestIndex = i;
      for (int j = i+1; j < list.size(); j++) {
        if (list.get(smallestIndex).compare(list.get(j), field) == 1) {
          smallestIndex = j;
        }
      }
      if (smallestIndex != i) {
        Contact temp = list.get(i);
        list.set(i, list.get(smallestIndex));
        list.set(smallestIndex, temp);
    }
  }
}

void reverse(ArrayList <Contact> list) { 
  ArrayList <Contact> tempList = new ArrayList<Contact>();
  for(int i = 0; i < list.size(); i++){
    tempList.add(list.get(i));
  }
    for(int i = 0; i < list.size(); i++){
      list.set(i, tempList.get(5 - i));
    }
} 

void mousePressed(){
  for(int y = 0; y < 2; y++){
    for(int x = 0; x < 4; x++){
      if(mouseX > 100 + 366*x && mouseX < 400 + 366*x && mouseY > 250 * y + 300 && mouseY < 250 * y + 500){
        String sortingVal = selectionTexts[4 * y + x];
        if(sortingVal == "Reverse"){
          sortReverse = !sortReverse;
          goSort(contacts, sortingBy, sortingFor, sortReverse);
        } else{
          sortingFor = sortingVal;
          goSort(contacts, sortingBy, sortingFor, sortReverse);
        }
      }
    }
  }
}

void keyPressed(){
  if(key == 'b') sortingBy = "Bubble Sort";
  if(key == 's') sortingBy = "Selection Sort";
}
