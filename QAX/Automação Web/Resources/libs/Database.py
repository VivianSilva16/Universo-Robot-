

#ESSA É UMA BIBLOTECA CRIADA USANDO PSYCOPG2 
#PSYCOPG2 É UMA BIBLIOTECA DO PYTHON E NÃO DO ROBOT 
#TODAS AS BIBLIOTECAS DO ROBOT TEM O NOME "ROBOTFRAMEWORK" NA FRENTE 

import  psycopg2

db_conn = """host= 'seu banco de dados'
        dbname= 'bancodavivian'                    
        user='vivian'
        password='suasenhamascarada')"""   #Essas 3 aspas em python vira comando multilinha 

     #Quando voce for passar a variavel para string, troque o database para dbname

     
#função que conecta com o seu banco de dados 
      #as variáveis que você setou lá em cima são QUERY e CONN: uma guarda a query para ser executada no banco de dados e a outra qual banco de dados vai conectar. 

#Uma função que executa a consulta no DB

def execute(query):
   
    conn =  psycopg2.connect (db_conn)
    
          
        #SETANDO A VARIÁVEL CURSOR           
    cursor= conn.cursor()  #função
    cursor.execute(query)   #a variável query
    cursor.commit()
    conn.close()  #IMPORTANTE ISSO ESTAR ALINHADO JUNTO COM A VARIÁVEL CONN


def insert_membership(data):
   
   account = data["account"]
   plan = data ["plan"]
   credit_card = data ["credit_card"]["number"][-4]


   
   query = f"""BEGIN; -- Inicia uma transação
       
       -- Remove o registro pelo email
       DELETE FROM accounts
       WHERE email = '{account["email"]}';      
      
      -- Insere uma nova conta e obtém o ID da conta recém-inserida
       WITH new_account AS (
       INSERT INTO accounts (name, email, cpf)
       VALUES ('{account["name"]}'; ', '{account["email"]}'; ', '{account["cpf"]} ')
       RETURNING id
        )
     
     -- Insere um registro na tabela memberships com o ID da conta
      INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
      SELECT id, {plan["id"]}, {credit_card}, {plan["price"]}, true
      FROM new_account;
      COMMIT; -- Confirma a transação"""

def insert_account(account):

  query = f"INSERT INTO accounts (name,email,cpf) VALUES ('{account["name"]}', '{account["email"]}', '{account["cpf"]}');"      # Esse F roxinho que está aí serve para interpolar a string. A interpolação faz com que você possa deletar qualquer e-mail em formato string dentro da tabela, sem ser uma string fixa, mas sim uma variável dela. 
     
  execute(query)
        



#OUTRA FUNCÇÃO ALI EMBAIXO 



def delete_account_by_email(email):  #Você crisou uma função que conecta com o banco de dados 
    query = f"DELETE FROM accounts WHERE email = '{email}';"      # Esse F roxinho que está aí serve para interpolar a string. A interpolação faz com que você possa deletar qualquer e-mail em formato string dentro da tabela, sem ser uma string fixa, mas sim uma variável dela. 
     
    execute(query)
   

#ESSA FUNÇÃO É UTIL PORQUE CONFORME VOCÊ VAI USANDO A MASSA DE DADOS E APAGANDO A CADA TESTE, VOCÊ NÃO ENTOPE O BANCO DE DADOS 
