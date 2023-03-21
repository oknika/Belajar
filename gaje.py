#luas segitiga dengan rumus heron
a=int(input("Masukkan a:"))
b=int(input("Masukkan b:"))
c=int(input("Masukkan c:"))

s=(a+b+c)/2

L=(s*(s-a)*(s-b)*(s-c))**0.5
print("Luas segitiga adalah "+str(L))

#deret fibonacci
qty=int(input("Masukkan jumlah bilangan: "))
x1=0
x2=1
x=0

bilfib=[]
while x < qty:
    bilfib.append(x1)
    xlast = x1+x2
    x1=x2
    x2=xlast
    x+=1
    
print("Deret fibonacci: "+str(bilfib))

#bilangan prima menggunakan Eratothenes filter
#Saringan Eratosthenes adalah cara mencari bilangan prima yang dilakukan dengan menandai semua kelipatan bilangan bulat (khususnya bilangan prima) mulai dari bilangan prima terkecil yaitu 2.
#Algoritma Eratosthenes bisa diakhiri saat kita sudah menandai kelipatan dari akar kuadrat bilangan tertinggi yang diperiksa.
#Misalnya akar 100 akar kuadratnya adalah 10, sehingga kita cukup menandai kelipatan dari 2 hingga 10.
from math import sqrt

n=int(input("Masukkan batas atas bilangan: "))
bilangan_prima=[]

akarn=sqrt(n)

for i in range(2,n+1):
    bilangan_prima.append(i)

for i in range(2,round(akarn)):
    j=i*i
    while j<=n:
        if j in bilangan_prima:
            bilangan_prima.remove(j)
        #print(j)
        j+=i
        
print("Bilangan prima: ")
print(bilangan_prima)

#bilangan ganjil genap
n=int(input("Masukkan batas atas bilangan: "))
bilangan_ganjil=[]
bilangan_genap=[]

for i in range(1,n+1):
    if i%2==0:
        bilangan_genap.append(i)
    else:
        bilangan_ganjil.append(i)
        
print("Bilangan ganjil: "+str(bilangan_ganjil))
print("Bilangan genap: "+str(bilangan_genap))

#pangkat perkalian dengan fungsi rekursif
def pangkat(x,y):
    if y==0:
        return 1
    else:
        return x*pangkat(x,y-1)
        
x=int(input("Masukkan x:"))
y=int(input("Masukkan y:"))

print("Hasil dari x^y= "+str(pangkat(x,y)))

#bilangan random trus diurutin
import random

jmlbil=int(input("Masukkan jumlah bilangan: "))

randomlist = random.sample(range(1, 100), jmlbil)
print("Daftar angka random antara 1 sampai 100:")
print(randomlist)

print("Daftar angka random antara 1 sampai 100 setelah diurutkan ascending:")
randomlist.sort()
print(randomlist)
print("Daftar angka random antara 1 sampai 100 setelah diurutkan descending:")
randomlist.sort(reverse=True)
print(randomlist)

#ngitung karakter dalam kalimat
#manual
def count_chars(txt):
    count={}
    for i in txt:
        if i in count:
            count[i]+=1
        else:
            count[i]=1
    print(count)
    
word=input("Masukkan kata atau kalimat: ")
print(count_chars(word))

#ngitung karakter dalam kalimat
#lebih g manual wkwkw
hashmap={}
def count(txt):
    for ch in set(txt):
        hashmap[ch]=txt.count(ch)
    return hashmap

word=input("Masukkan kata atau kalimat: ")
print(count(word))

####belom selese.. bikin case base reasoning sederhana
def cekkamus(txtcek,kamus):
    if txtcek in kamus:
        return kamus[txtcek]
    else:
        return 0

thisdict1 =	{
  "a": 0.5,
  "b": 0.75,
  "c": 0.9,
  "d": 0.75,
  "e": 0.75
}

thisdict2 =	{
  "f": 0.5,
  "a": 0.75,
  "b": 0.9,
  "e": 0.75
}

thisdict3 =	{
  "a": 0.9,
  "c": 0.75,
  "d": 0.5,
  "f": 0.5
}

inputan=[]
txt=input("Masukkan kata di kamus: ")
while txt != "":
    try:
        inputan.append(txt)
        txt=input("Masukkan kata di kamus: ")
    except EOFError:
        break

tot1=0
for x in thisdict1:
    tot1+=thisdict1[x]

tot2=0
for x in thisdict2:
    tot2+=thisdict2[x]

tot3=0
for x in thisdict3:
    tot3+=thisdict3[x]
    
for txt in inputan:
    