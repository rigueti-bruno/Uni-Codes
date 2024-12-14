from cassandra.cluster import Cluster

# Use o IP do WSL obtido anteriormente
cluster = Cluster(['172.24.32.80'])  # Substitua <IP_do_WSL> pelo IP do WSL
session = cluster.connect()

# Defina o keyspace para se conectar
session.set_keyspace('your_keyspace')  # Substitua pelo seu keyspace

# Execute uma consulta
rows = session.execute('SELECT * FROM your_table')  # Substitua pela sua tabela

for row in rows:
    print(row)
