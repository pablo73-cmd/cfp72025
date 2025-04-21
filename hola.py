print("Hola mundo")

nombre = "Pablo"

print("Hola ", nombre )

numero1= 1
numero2 = 4
resultado = numero1 + numero2

print("El resultado es ", resultado)

a = int(input("Escriba el primer número "))
# con input puedo ingresar valores pero son de texto y los tengo que convertir a entero
b = int(input("Escriba el segundo número "))
"""
todo lo que escriba aca 
es comentario de multilinea 
"""
res = a + b

print ("El resultado es" , res)

if(res>20):
    print("El número es mayor a 20")    
elif(res==20):
    print("El número es igual a 20")
else:
    print("El numero es menor a 20")

print("----------------------------")

if(res>20 and res<100):
    print("el número está entre 21 y 99 ")
else:
    print("Está fuera del rango previsto")

if(res>20 or res<100):
    print("el número está entre 21 y 99 ")
else:
    print("Está fuera del rango previsto")


for i in range(0,6):
    print ("El numero es ", i)

#listas, vectores, arrays 
lista = ["manzanas", "peras", "bananas"]
#mostrar todo el vector
print(lista)
#mostrar un elemento del vector
print(lista[0])

for i in range(0,3):
    print(lista[i])
    print("------")









