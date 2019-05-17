#Intsall Packages
library(kohonen)
?kohonen

#Data Iris1 Tanpa Kolom ke 5
iris1<-as.matrix(iris[,-5])
iris1

#Membaca data
data(iris1)
head(iris1)

#proses standarisasi 
head(scale(iris1))

#dimensi Iris1
dim(iris1)

#Struktur Data Iris1
str(iris1)

#classifikasi dengan 4 dimensi x 4 dimensi
grid<- somgrid(xdim=4, ydim=4, topo="hexagonal")

#SOM
som.iris1<- som(iris1, grid= somgrid(xdim=4, ydim=4,"hexagonal"))

#Struktur SOM
str(som.iris1)

plot (som.iris, type="mapping")

#merupakan center dari setiap kisi-kisi
som.iris$grid$pts

#mengetahui objek no 1 berada dimana 
som.iris$unit.classif

#Plot Keseluruhan
plot (som.iris)

#Nilai dari masing-masing objek
text(som.iris$grid$pts, labels = som.iris$unit.classif, cex=1.5)

som.iris$codes[[1]]
dist(som.iris$codes[[1]])
hclust(dist(som.iris$codes[[1]]))

##CARA BUAT CLUSTER dengan 2 kelompok
peta<-cutree(hclust(dist(som.iris$codes[[1]])), 2)  
peta
plot(peta)
#Plot
plot(som.iris, type="codes", bgcol=rainbow(2) [peta])  
add.cluster.boundaries(som.iris, peta)

