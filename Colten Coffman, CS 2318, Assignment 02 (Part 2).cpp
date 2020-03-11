/* Colten Coffman, CS2318-253, Assignment 02 (Part 2)
 This program was written with combinations of if/else statements and 
 loops. The goal was to translate all of them into conditional and
 unconditional goto statements */
#include <iostream>
using namespace std;

int a1[12],
    a2[12],
    a3[12];
char einStr[]    = "Enter integer #";
char moStr[]     = "Max of ";
char ieStr[]     = " ints entered...";
char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
char begA1Str[]  = "beginning a1: ";
char am1dA1Str[] = "a1 (dups<=1): ";
char procA1Str[] = "processed a1: ";
char procA2Str[] = "          a2: ";
char procA3Str[] = "          a3: ";
char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
char dlStr[]     = "================================";
char byeStr[]    = "bye...";

int main()
{
               char reply;
               int used1,
                   used2,
                   used3,
                   truncAvg,
                   found,
                   sum,
                   *hopPtr1,
                   *hopPtr11,
                   *hopPtr2,
                   *hopPtr3,
                   *endPtr1,
                   *endPtr11,
                   *endPtr2,
                   *endPtr3;

               reply = 'y';
begW1:
                  used1 = 0;
                  hopPtr1 = a1;
begW2:
                     cout << einStr;
                     cout << (used1 + 1);
                     cout << ':' << ' ';
                     cin >> *hopPtr1;
                     ++used1;
                     ++hopPtr1;
                     if(used1 >= 12) goto I1else;
                     if(used1 < 12) goto I1good;
I1good:                
                        cout << emiStr;
                        cin >> reply;
                        goto I1end;
                  
I1else:                    
                     
                        cout << moStr << 12 << ieStr << endl;
                        reply = 'n';
I1end:;   
endW2:
W2test:           if(reply != 'n' && reply != 'N') goto begW2;
                  cout << begA1Str;
                  if (used1 <= 0) goto I2end;

                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
begDW1: 
                        cout << *hopPtr1 << ' ' << ' ';
                        ++hopPtr1;
endDW1:
DW1test:                    if(hopPtr1 < endPtr1) goto begDW1;
I2end:
                  cout << endl;

                  if (used1 <= 1) goto elseI3;
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1 - 1;
                     goto W3test;
begW3:
                        found = 0;
                        hopPtr2 = hopPtr1 + 1, endPtr2 = a1 + used1;
                        goto F1test;
begF1:
                           if (*hopPtr2 != *hopPtr1) goto endI4;
                              if (found != 1) goto elseI5;
                                 hopPtr3 = hopPtr2 + 1, endPtr3 = a1 + used1;
                                 goto F2test;
begF2:
                                    *(hopPtr3 - 1) = *hopPtr3;
                                    ++hopPtr3;
F2test:                          if(hopPtr3 < endPtr3) goto begF2;
endF2:
                                 --used1;
                                 --endPtr1;
                                 --endPtr2;
                                 --endPtr3;
                                 --hopPtr2;
                              goto endI5;
elseI5:
                                ++found;
endI5:;         
endI4:;
                        ++hopPtr2;
F1test:                 if(hopPtr2 < endPtr2) goto begF1;
endF1:;                        
                        ++hopPtr1;
W3test:                 if(hopPtr1 < endPtr1) goto begW3;
endW3:;

                     cout << am1dA1Str;
                     if (used1 <= 0) goto endI6;
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
begDW2:
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
endDW2:
DW2test:                   if(hopPtr1 < endPtr1) goto begDW2;
endI6:
                     cout << endl;

                     if (used1 <= 0) goto endI7;
                        sum = 0;
                        hopPtr1 = a1 + used1 - 1;
                        endPtr1 = a1;
begDW3:
                           sum += *hopPtr1;
                           --hopPtr1;
endDW3:
DW3test:                   if(hopPtr1 >= endPtr1) goto begDW3;
                        truncAvg = sum / used1;

                        used2 = 0;
                        used3 = 0;
                        hopPtr2 = a2;
                        hopPtr3 = a3;
                        hopPtr1 = a1, endPtr1 = a1 + used1;
begF3:
                           if (*hopPtr1 == truncAvg) goto endI8;
                              if (*hopPtr1 >= truncAvg) goto elseI9;
                                 *hopPtr2 = *hopPtr1;
                                 ++used2;
                                 ++hopPtr2;
                                 goto endI9;
elseI9:
                                 *hopPtr3 = *hopPtr1;
                                 ++used3;
                                 ++hopPtr3;
endI9:;
                              hopPtr11 = hopPtr1 + 1, endPtr11 = a1 + used1;
                              goto F4test;
begF4:
                                 *(hopPtr11 - 1) = *hopPtr11;
                                 ++hopPtr11;
F4test:                          if(hopPtr11 < endPtr11) goto begF4;
endF4:
                              --used1;
                              --endPtr1;
                              --hopPtr1;
endI8:;
                        ++hopPtr1;
                        if(hopPtr1 < endPtr1) goto begF3;
endF3:;
                        if (used1 != 0) goto endI10;
                           *(a1+ 0) = truncAvg;
                           ++used1;
endI10:;
endI7:;
                   goto endI3;
elseI3: 
                     hopPtr1 = a1;
                     cout << am1dA1Str;
                     cout << *hopPtr1;
                     cout << endl;
                     used2 = 0;
                     used3 = 0;
endI3:

                  cout << procA1Str;
                  if (used1 <= 0) goto endI11;
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
begDW4:
                        cout << *hopPtr1 << ' ' << ' ';
                        ++hopPtr1;
endDW4:
DW4test:                if(hopPtr1 < endPtr1) goto begDW4;
endI11:;
                  cout << endl;

                  cout << procA2Str;
                  if (used2 <= 0) goto endI12;
                     hopPtr2 = a2;
                     endPtr2 = a2 + used2;
begDW5:
                        cout << *hopPtr2 << ' ' << ' ';
                        ++hopPtr2;
endDW5:
DW5test:                 if(hopPtr2 < endPtr2) goto begDW5;
endI12:;
                  cout << endl;

                  cout << procA3Str;
                  if (used3 <= 0) goto endI13;
                     hopPtr3 = a3;
                     endPtr3 = a3 + used3;
begDW6: 
                        cout << *hopPtr3 << ' ' << ' ';
                        ++hopPtr3;
endDW6:
DW6test:                if(hopPtr3 < endPtr3) goto begDW6;
endI13:
                  cout << endl;

                  cout << dacStr;
                  cin >> reply;
endW1:
W1Test:        if(reply != 'n' && reply != 'N') goto begW1;
               cout << dlStr << '\n';
               cout << byeStr << '\n';
               cout << dlStr << '\n';

               return 0;
}
