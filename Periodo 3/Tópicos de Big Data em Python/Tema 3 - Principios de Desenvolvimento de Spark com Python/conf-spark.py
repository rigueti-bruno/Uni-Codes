from pyspark import SparkContext

# Teste básico
sc = SparkContext(master="local[2]", appName="MyTestApp")
print("SparkContext inicializado com sucesso!")