JSONObject response;
String date; 
String url;
String[] dates;
String[] websites;
boolean good;
PFont f;
String[] yList1;
String[] yList2;
String[] yList3;
String[] yList4;
String[] yList5;
String[] yList6;
String[] yList7;
String[] yList8;
String[] yList9;
String[] yList10;
float rectX;
float rectY;
boolean overRect;

void setup() {
  
  size(1300, 800);
  background(0, 120, 0);
  stroke(255);
  strokeWeight(5);
  line(90, 0, 90, 800);
  line(1210, 0, 1210, 800);
  strokeWeight(2);
  line(202, 0, 202, 800);
  line(314, 0, 314, 800);
  line(426, 0, 426, 800);
  line(538, 0, 538, 800);
  line(650, 0, 650, 800);
  line(762, 0, 762, 800);
  line(874, 0, 874, 800);
  line(986, 0, 986, 800);
  line(1098, 0, 1098, 800);
  f = createFont("Arial", 16, true);
  textFont(f,36);
  fill(255);
  text("1 0", 178, 790);
  text("2 0", 290, 790);
  text("3 0", 402, 790);
  text("4 0", 514, 790);
  text("5 0", 626, 790);
  text("6 0", 738, 790);
  text("7 0", 850, 790);
  text("8 0", 962, 790);
  text("9 0", 1074, 790);
  translate(650, 400);
  rotate(80.1);
  text("1900", -30, -570);
  rotate(160.2);
  text("2000", -30, -570);
  
  /////////////////////////////////////////////////////////////////////////////
  
  dates = new String[0];
  websites = new String[0];
  yList1 = new String[0];
  yList2 = new String[0];
  yList3 = new String[0];
  yList4 = new String[0];
  yList5 = new String[0];
  yList6 = new String[0];
  yList7 = new String[0];
  yList8 = new String[0];
  yList9 = new String[0];
  yList10 = new String[0];
  rectX = 0;
  rectY = 0;
  good = true;
  overRect = false;
  
  ////////////////////////***********************Important: Some code taken from parseJSON in class examples****************************
  response = loadJSONObject("football.json.txt");
  
  JSONArray items = response.getJSONArray("docs");
  
  for(int i = 0; i < 222; i++) {
    if (i == 63 || i == 99 || i == 143 || i == 154 || i == 192) {
      good = false; 
      dates = append(dates, null);
      websites = append(websites, null);
    }
    if (good) {
      JSONObject first = items.getJSONObject(i);
  
      JSONObject snippet = first.getJSONObject("sourceResource");
      JSONObject snippet2 = snippet.getJSONObject("date");
  
      url = first.getString("isShownAt");
      websites = append(websites, url);
 
      date = snippet2.getString("displayDate");  
      dates = append(dates, date.substring(0,4));
      
    }
    good = true;
  }
  
  /////////////////////////////////////////////////////////////////////////////////
  
  for(int j = 0; j < 217; j++) {
    if (dates[j] != null) {
      int year = parseInt(dates[j]); 
      String website = websites[j]; 
      if (year >= 1900 && year < 1910) {
        yList1 = append(yList1, str(year));
        yList1 = append(yList1, website);
      } else if (year >= 1910 && year < 1920) {
        yList2 = append(yList2, str(year));
        yList2 = append(yList2, website);
      } else if (year >= 1920 && year < 1930) {
        yList3 = append(yList3, str(year));
        yList3 = append(yList3, website);
      } else if (year >= 1930 && year < 1940) {
        yList4 = append(yList4, str(year));
        yList4 = append(yList4, website);
      } else if (year >= 1940 && year < 1950) {
        yList5 = append(yList5, str(year));
        yList5 = append(yList5, website);
      } else if (year >= 1950 && year < 1960) {
        yList6 = append(yList6, str(year));
        yList6 = append(yList6, website);
      } else if (year >= 1960 && year < 1970) {
        yList7 = append(yList7, str(year));
        yList7 = append(yList7, website);
      } else if (year >= 1970 && year < 1980) {
        yList8 = append(yList8, str(year));
        yList8 = append(yList8, website);
      } else if (year >= 1980 && year < 1990) {
        yList9 = append(yList9, str(year));
        yList9 = append(yList9, website);
      } else if (year >= 1990 && year <= 2000) {
        yList10 = append(yList10, str(year));
        yList10 = append(yList10, website);
      }
    }
  }
  
  //////////////////////////////////////////////////////////////////////////////////
}

 void draw() {

   rectX = 101;
   rectY = 730;
  for(int i = 0; i < yList1.length; i = i+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList1[i+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 217) {
      rectX = 101;
      rectY = rectY + 30;
    }  
  }    
    
  rectX = 213;
  rectY = 730;
  for(int i2 = 0; i2 < yList2.length; i2 = i2+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList2[i2+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 329) {
      rectX = 213;
      rectY = rectY - 30;
    }  
  }
  
  rectX = 325;
  rectY = 730;
  for(int i3 = 0; i3 < yList3.length; i3 = i3+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList3[i3+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 441) {
      rectX = 325;
      rectY = rectY - 30;
    }  
  }
  
  rectX = 437;
  rectY = 730;
  for(int i4 = 0; i4 < yList4.length; i4 = i4+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList4[i4+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 553) {
      rectX = 437;
      rectY = rectY - 30;
    }  
  }
  
  rectX = 549;
  rectY = 730;
  for(int i5 = 0; i5 < yList5.length; i5 = i5+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList5[i5+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 665) {
      rectX = 549;
      rectY = rectY - 30;
    }  
  }
  
  rectX = 661;
  rectY = 730;
  for(int i6 = 0; i6 < yList6.length; i6 = i6+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList6[i6+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 777) {
      rectX = 661;
      rectY = rectY - 30;
    }  
  }
  
  rectX = 773;
  rectY = 730;
  for(int i7 = 0; i7 < yList7.length; i7 = i7+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList7[i7+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 889) {
      rectX = 773;
      rectY = rectY - 30;
    }  
  }
  
  rectX = 885;
  rectY = 730;
  for(int i8 = 0; i8 < yList8.length; i8 = i8+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList8[i8+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 1001) {
      rectX = 885;
      rectY = rectY - 30;
    }  
  }
  
  rectX = 997;
  rectY = 730;
  for(int i9 = 0; i9 < yList9.length; i9 = i9+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList9[i9+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 1113) {
      rectX = 997;
      rectY = rectY - 30;
    }  
  }
  
  rectX = 1109;
  rectY = 730;
  for(int i10 = 0; i10 < yList10.length; i10 = i10+2) {
    if(rectOver(rectX, rectY)) {
      fill(100);
      stroke(100);
    } else {
      fill(255);
      stroke(255);
    }
    rect(rectX, rectY, 5, 20);
    if(mouseX >= rectX && mouseX <= rectX + 5 &&
       mouseY >= rectY && mouseY <= rectY + 30 &&
       overRect) {
          try {
         java.awt.Desktop.getDesktop().browse(java.net.URI.create(yList10[i10+1]));
       }
       catch (java.io.IOException e) {
           System.out.println(e.getMessage());
       }
       overRect = false;
       }     
    rectX = rectX + 29;
    if (rectX >= 1225) {
      rectX = 1109;
      rectY = rectY - 30;
    }  
  }
  
  }
 
 boolean rectOver(float rectX, float rectY) {
   if (mouseX >= rectX && mouseX <= rectX + 5 &&
      mouseY >= rectY && mouseY <= rectY + 30) {
     return true;
   } else {
     return false;
   }
 }
 
 void mouseClicked() {
   overRect = true;
 }
 
  
 
  
 
