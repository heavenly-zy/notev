import zipfile #导入模块，它是做压缩和解压缩的

def unzip(inpath, outpath, password):
    zfile = zipfile.ZipFile(inpath)
    zfile.extractall(path=outpath, members=zfile.namelist(), pwd=password.encode('utf-8'))

def get_dict(l, mark_a=True, mark_A=True, mark_1=True, mark__=True):
    d = ''
    if mark_1:
        d += '0123456789'
    if mark_a:
        d += 'abcdefghigklmnopqrstuvwxyz'
    if mark_A:
        d += 'abcdefghigklmnopqrstuvwxyz'.upper()
    if mark__:
        d += '''!@#$%^&*()-_=+~`{}|[]\:";'<>?,./ '''
    dl = []
    for i in range(l):
        print('当前生成{}位密码'.format(i+1))
        dl.append(get_nlist(i+1, d))
    return dl

def get_nlist(n, d):
    if n == 1:
        return list(d)
    else:
        l = []
        for i in get_nlist(n-1, d):
            for j in d:
                l.append(i+j)
        return l

def main():
    inpath = 'heibao.zip'
    outpath = 'output/'
    dl = get_dict(16, mark_a=True, mark_A=False, mark_1=True, mark__=False)
    flag = False
    for num in range(len(dl)):
        if flag:
            break
        print()
        print('当前破解{}位密码'.format(num+1))
        for pswd in dl[num]:
            try:
                print('\r当前破解：'+pswd,end = '')
                unzip(inpath, outpath, pswd)
                print('密码为：'+pswd)
                break
            except:
                pass
        else:
            print('所有密码均已尝试，未找到密码')

if __name__ == '__main__':
    main()
    input('Press <Enter>')

        
