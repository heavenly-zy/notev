import re
import xlwt
import os
def txt2xls(file):
    wb=xlwt.Workbook()
    sheet=wb.add_sheet(file.replace('.txt','').replace('*',''))
    with open(file,'rb') as f:
        row=0
        for line in f:
            l=re.search(r'[\S\s]*(?P<point>\d\d\.\d%)[\S\s]*(?P<line>\d\d\.\d%)[\S\s]*',line.decode('gbk'))
            if l:
                row+=1
                sheet.write(row,0,eval(l.group('point').replace('%',''))/100)
                sheet.write(row,1,eval(l.group('line').replace('%',''))/100)
        wb.save(file.replace('txt','xls'))

def find_txt():
    names=[]
    for file in os.listdir():
        if file.split('.')[-1]=='txt':
            names.append(file)
    return names

def retxtname(file):
    res=['\\','/','"','|',':','*','?','<','>']
    newname=file
    for r in res:
        if r in file:
            newname=newname.replace(r,'')
    with open(file,'rb') as f:
        a=f.read()
        with open(newname,'wb') as f:
            f.write(a)


for file in find_txt():
    retxtname(file)

for file in find_txt():
    flag=True
    res=['\\','/','"','|',':','*','?','<','>']
    for r in res:
        if r in file:
            flag=False
    if flag:
        txt2xls(file)

