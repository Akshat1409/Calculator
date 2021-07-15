class Calculate {
  String calc(String st) {
    String s = st.substring(0, st.length - 1);
    for (int i = 0; i < s.length; i++) {
      if (s.substring(i, i + 1) == '=') {
        s = s.substring(0, i) + s.substring(i + 1);
      }
    }

    for (int i = 0; i < s.length; i++) {
      if (s.substring(i, i + 1) == '%') {
        if (i < s.length - 1 &&
            (s.substring(i + 1, i + 2) == '+' ||
                s.substring(i + 1, i + 2) == 'x' ||
                s.substring(i + 1, i + 2) == '-' ||
                s.substring(i + 1, i + 2) == '%' ||
                s.substring(i + 1, i + 2) == '/')) {
          s = s.substring(0, i) + "/100" + s.substring(i + 1);
        } else if (i == s.length - 1) {
          s = s.substring(0, i) + "/100" + s.substring(i + 1);
        } else
          s = s.substring(0, i) + "/100x" + s.substring(i + 1);
      }
    }
    print(s + "helo");
    String s1 = "", s2;
    var m, j;
    var r = 1;
    for (int i = 0; i < s.length; i++) {
      if (s.substring(i, i + 1) == '+' ||
          s.substring(i, i + 1) == 'x' ||
          s.substring(i, i + 1) == '-' ||
          s.substring(i, i + 1) == '/') {
        if (s.substring(i, i + 1) != '/') {
          s1 = "";
          continue;
        }
        m = i - s1.length;
        while (i < s.length && s.substring(i, i + 1) == '/') {
          s2 = "";
          for (j = i + 1; j < s.length; j++) {
            if (s.substring(j, j + 1) == '+' ||
                s.substring(j, j + 1) == 'x' ||
                s.substring(j, j + 1) == '-' ||
                s.substring(i + 1, i + 2) == '%' ||
                s.substring(j, j + 1) == '/') break;
            s2 = s2 + s.substring(j, j + 1);
          }
          i = j;
          if (s2 == "0") {
            r = 2;
            break;
          }
          //out.println(Float.parseFloat(s1)/Float.parseFloat(s2));
          s1 = (double.parse(s1) / double.parse(s2)).toString();
        }
        if (i < s.length) {
          if (m >= 0)
            s = s.substring(0, m) + s1 + s.substring(i);
          else
            s = s1 + s.substring(i);
        } else {
          if (m >= 0)
            s = s.substring(0, m) + s1;
          else
            s = s1 + s.substring(i);
        }
        i = m + s1.length;
        s1 = "";
      } else {
        s1 = s1 + s.substring(i, i + 1);
      }
    }

    s1 = "";
    s2 = "";
    for (int i = 0; i < s.length; i++) {
      if (s.substring(i, i + 1) == '+' ||
          s.substring(i, i + 1) == 'x' ||
          s.substring(i, i + 1) == '-' ||
          s.substring(i, i + 1) == '/') {
        if (s.substring(i, i + 1) != 'x') {
          s1 = "";
          continue;
        }
        m = i - s1.length;
        while (i < s.length && s.substring(i, i + 1) == 'x') {
          s2 = "";
          for (j = i + 1; j < s.length; j++) {
            if (s.substring(j, j + 1) == '+' ||
                s.substring(j, j + 1) == 'x' ||
                s.substring(j, j + 1) == '-' ||
                s.substring(j, j + 1) == '/') break;
            s2 = s2 + s.substring(j, j + 1);
          }
          i = j;
          //out.println(Float.parseFloat(s1)/Float.parseFloat(s2));
          s1 = (double.parse(s1) * double.parse(s2)).toString();
        }
        if (i < s.length) {
          if (m >= 0)
            s = s.substring(0, m) + s1 + s.substring(i);
          else
            s = s1 + s.substring(i);
        } else {
          if (m >= 0)
            s = s.substring(0, m) + s1;
          else
            s = s1 + s.substring(i);
        }
        i = m + s1.length;
        s1 = "";
      } else {
        s1 = s1 + s.substring(i, i + 1);
      }
    }
    s1 = "";
    s2 = "";
    // print(s);
    bool f = false;
    bool a1 = true;
    while (a1 == true) {
      for (int i = 0; i < s.length; i++) {
        if (s.substring(i, i + 1) == '+' ||
            s.substring(i, i + 1) == 'x' ||
            s.substring(i, i + 1) == '-' ||
            s.substring(i, i + 1) == '/') {
          if (s.substring(i, i + 1) == '-') {
            s1 = "-";
            continue;
          }
          if (s.substring(i, i + 1) != '+') {
            s1 = "";
            continue;
          }
          if (s1.substring(0, 0 + 1) == '-') {
            f = true;
          }
          m = i - s1.length;
          while (i < s.length && s.substring(i, i + 1) == '+') {
            s2 = "";
            for (j = i + 1; j < s.length; j++) {
              if (s.substring(j, j + 1) == '+' ||
                  s.substring(j, j + 1) == 'x' ||
                  s.substring(j, j + 1) == '-' ||
                  s.substring(j, j + 1) == '/') break;
              s2 = s2 + s.substring(j, j + 1);
            }
            i = j;
            //out.println(Float.parseFloat(s1)/Float.parseFloat(s2));
            s1 = (double.parse(s1) + double.parse(s2)).toString();
          }
          if (f) {
            if (s1.substring(0, 0 + 1) != '-') {
              s1 = "+" + s1;
            }
          }
          if (i < s.length) {
            if (m >= 0)
              s = s.substring(0, m) + s1 + s.substring(i);
            else
              s = s1 + s.substring(i);
          } else {
            if (m >= 0)
              s = s.substring(0, m) + s1;
            else
              s = s1 + s.substring(i);
          }
          i = m + s1.length;
          s1 = "";
        } else {
          s1 = s1 + s.substring(i, i + 1);
        }
      }
      a1 = false;
      if (s.substring(0, 0 + 1) == '+') {
        s = s.substring(1);
        break;
      }
      for (int i = 0; i < s.length; i++) {
        if (s.substring(i, i + 1) == '+') {
          a1 = true;
          break;
        }
      }
      //print(a1);
    }
    //print(s);
    s1 = "";
    s2 = "";
    f = false;
    for (int i = 0; i < s.length; i++) {
      if (s.substring(i, i + 1) == '+' ||
          s.substring(i, i + 1) == 'x' ||
          s.substring(i, i + 1) == '-' ||
          s.substring(i, i + 1) == '/') {
        if (s.substring(i, i + 1) == '-') {
          s1 = "-";
          continue;
        }
        if (s.substring(i, i + 1) != '+') {
          s1 = "";
          continue;
        }
        if (s1.substring(0, 0 + 1) == '-') {
          f = true;
        }
        m = i - s1.length;
        while (i < s.length && s.substring(i, i + 1) == '+') {
          s2 = "";
          for (j = i + 1; j < s.length; j++) {
            if (s.substring(j, j + 1) == '+' ||
                s.substring(j, j + 1) == 'x' ||
                s.substring(j, j + 1) == '-' ||
                s.substring(j, j + 1) == '/') break;
            s2 = s2 + s.substring(j, j + 1);
          }
          i = j;
          //out.println(Float.parseFloat(s1)/Float.parseFloat(s2));
          s1 = (double.parse(s1) + double.parse(s2)).toString();
        }
        if (f) {
          if (s1.substring(0, 0 + 1) != '-') {
            s1 = "+" + s1;
          }
        }
        if (i < s.length) {
          if (m >= 0)
            s = s.substring(0, m) + s1 + s.substring(i);
          else
            s = s1 + s.substring(i);
        } else {
          if (m >= 0)
            s = s.substring(0, m) + s1;
          else
            s = s1 + s.substring(i);
        }
        i = m + s1.length;
        s1 = "";
      } else {
        s1 = s1 + s.substring(i, i + 1);
      }
    }
    // print(s + " fin");
    s1 = "";
    s2 = "";
    a1 = true;
    while (a1 == true) {
      for (int i = 0; i < s.length; i++) {
        if (s.substring(i, i + 1) == '+' ||
            s.substring(i, i + 1) == 'x' ||
            s.substring(i, i + 1) == '-' ||
            s.substring(i, i + 1) == '/') {
          if (s.substring(i, i + 1) == '-' && s1.length == 0) {
            s1 = "-";
            continue;
          }

          if (s1.substring(0, 0 + 1) == '-') {
            f = true;
          }
          m = i - s1.length;
          while (i < s.length && s.substring(i, i + 1) == '-') {
            s2 = "";
            for (j = i + 1; j < s.length; j++) {
              if (s.substring(j, j + 1) == '+' ||
                  s.substring(j, j + 1) == 'x' ||
                  s.substring(j, j + 1) == '-' ||
                  s.substring(j, j + 1) == '/') break;
              s2 = s2 + s.substring(j, j + 1);
            }
            i = j;
            //out.println(Float.parseFloat(s1)/Float.parseFloat(s2));
            s1 = (double.parse(s1) - double.parse(s2)).toString();
          }
          if (f) {
            if (s1.substring(0, 0 + 1) != '-') {
              s1 = "+" + s1;
            }
          }
          if (i < s.length) {
            if (m >= 0)
              s = s.substring(0, m) + s1 + s.substring(i);
            else
              s = s1 + s.substring(i);
          } else {
            if (m >= 0)
              s = s.substring(0, m) + s1;
            else
              s = s1 + s.substring(i);
          }
          i = m + s1.length;
          s1 = "";
        } else {
          s1 = s1 + s.substring(i, i + 1);
        }
      }
      a1 = false;
      //print(s + "hi");
      if (s.substring(0, 0 + 1) == '+') {
        s = s.substring(1);
      }
      for (int i = 1; i < s.length; i++) {
        if (s.substring(i, i + 1) == '-') {
          a1 = true;
          break;
        }
      }
      //print(a1);
    }
    /*
  for (int i = 0; i < s.length; i++) {

        		if(s.substring(i,i+1)=='+' ||s.substring(i,i+1)=='x' ||s.substring(i,i+1)=='-' ||s.substring(i,i+1)=='/')
        		{

        			m=i-s1.length;
        			while(i<s.length &&s.substring(i,i+1)=='-') {
        				s2="";
        				for(j=i+1;j<s.length;j++)
        				{
        					if(s.substring(j,j+1)=='+' ||s.substring(j,j+1)=='x' ||s.substring(j,j+1)=='-' ||s.substring(j,j+1)=='/')
        						break;
        					s2=s2+s.substring(j,j+1);
        				}
        				i=j;
        				//out.println(Float.parseFloat(s1)/Float.parseFloat(s2));
                //print(s1+" "+s2);
        				s1=(double.parse(s1)-double.parse(s2)).toString();

        			}
        			if(i<s.length)
        			{
        				if(m>=0)
        				s=s.substring(0,m)+s1+s.substring(i);
        				else
        					s=s1+s.substring(i);
        			}
        			else
        			{
        				if(m>=0)
        					s=s.substring(0,m)+s1;
        				else
        					s=s1+s.substring(i);

        			}
        			i=m+s1.length;
        			s1="";
        		}
        		else
        		{
        			s1=s1+s.substring(i,i+1);
        		}

  }*/
    double d = double.parse(s);
    return (d.toStringAsFixed(4));
  }
}
