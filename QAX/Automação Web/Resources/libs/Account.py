
from faker import Faker  # Da biblioteca faker, importe a classe Faker

fake = Faker('pt_BR')

def get_fake_account():  # Esse arquivo é uma biblioteca que você criou em Python
    account1 = {
        "name": fake.name(),
        "email": fake.email(),
        "cpf": fake.cpf()  # Antes os dados eram fixos, agora eles são variáveis e aleatórios
    }  # Agora temos uma biblioteca em Python que vai gerar dados dinâmicos.
    
    return account1  # O return deve estar indentado corretamente dentro da função
