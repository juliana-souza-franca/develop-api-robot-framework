from faker import Faker
import re

fake = Faker('pt_BR');


# Usando regex para substituir qualquer caractere que não seja um dígito por uma string vazia
def remove_pontuacao(numero):
    
    return re.sub(r'\D', '', numero)

def limpar_nome(nome):
    # Remove caracteres especiais e números, mantendo apenas letras e espaços
    nome_limpo = re.sub(r'[^a-zA-ZÀ-ÿ\s]', '', nome)
    # Remove espaços extras
    nome_limpo = ' '.join(nome_limpo.split())
    # Capitaliza as iniciais de cada palavra
    nome_limpo = nome_limpo.title()
    return nome_limpo

# Usando regex para substituir qualquer caractere que não seja um dígito por uma string vazia
def get_fake_account():
    primeiro_nome = fake.first_name()
    sobrenome = fake.last_name()
    nome_completo = f"{primeiro_nome} {sobrenome}"
    nome_formatado = limpar_nome(nome_completo)
    
    account = {
        "name": nome_formatado,
        "email": fake.email(),
        "cpf": remove_pontuacao(fake.cpf())
    }

    return account
## Gerador de Pessoas Debug
if __name__ == "__main__":
    user = get_fake_account()
    
    print('É um prazer conhecer você {}'.format(user['name']))
    print('Seu email para contato {}'.format(user['email']))
    print('Seu cadastro de pessoas físicas {}'.format(user['cpf']))
    
    

