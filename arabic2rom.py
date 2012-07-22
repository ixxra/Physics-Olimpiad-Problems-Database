#!/usr/bin/env python2
# Por Luis Mex
# funciones sencillas para numeros arabicos a romanos y viceversa

import sys 
 
def arab2rom(val):
       
        rabc=['I','II','III','IV','V','VI','VII','VIII','IX',
                  'X','XX','XXX','XL','L','XC','C','CC','CCC'
              ,'CD','D','CM','M','MM','MMM','MV_','V_']
 
        abc=[1,2,3,4,5,6,7,8,9,10,20,30,40,50,90,100,200,300,400,
        500,900,1000,2000,3000,4000,5000]
       
        string=''
        i=0
        val_act=val
        if val_act > 5000 :
                print " el valor supera la gramtica"
                exit()
        while True:
                if (val_act == 0):
                        break
                else:
                        for j in range(0,len(abc)):
                                if (val_act < abc[j]):
                                        val_tmp=-abc[j-1]+val_act
                                        val_act=val_tmp
                                        i=j
                                        string+=rabc[j-1]
                                        break
                                elif (val_act >= abc[len(abc)-1]):
                                                #print "True"
                                                val_tmp=-abc[j-1]+val_act
                                                val_act=val_tmp
                                                i=j
                                                string+=rabc[j-1]
                                                break
        return string
 
def rom2arab(string):
       
        rabc=['I','II','III','IV','V','VI','VII','VIII','IX',
                          'X','XX','XXX','XL','L','XC','C','CC','CCC'
                          ,'CD','D','CM','M','MM','MMM','MV_','V_']
 
        abc=[1,2,3,4,5,6,7,8,9,10,20,30,40,50,90,100,200,300,400,
                500,900,1000,2000,3000,4000,5000]
               
        num=[]
       
        for i in range(0,len(string)):
                for j in range(0,len(abc)):
                        if string[i]==rabc[j]:
                                num.append(abc[j])
                               
        for j in range(0,len(num)-1):
                for i in range(j,j+1):
                        if num[i] < num[i+1]:
                                num[i]=-num[i]
                               
        return sum(num)
       
 

for val in sys.argv[1:]:
    if val.isalpha ():
        print rom2arab (val.upper())
    elif val.isdigit ():
        print arab2rom (int(val))
    else:
        print val + " doesn't look like a roman nor arabic numeral!"
#val=45
#val_r='XLV'
#f=arab2rom(val)
#g=rom2arab(val_r)
#print f,g

