
# Desafio-Empréstimo

Bem-vindo ao projeto **Empréstimos**! Este é um serviço desenvolvido para determinar quais modalidades de empréstimo uma pessoa tem acesso com base em variáveis como idade, salário e localização. O objetivo é fornecer uma API simples e eficiente que analisa os dados de um cliente e retorna as opções de empréstimos disponíveis, incluindo tipos e taxas de juros.

## Visão Geral

O serviço implementa uma lógica de negócios que avalia três modalidades de empréstimo:
- **Empréstimo Pessoal**: Taxa de juros de 4%.
- **Empréstimo Consignado**: Taxa de juros de 2%.
- **Empréstimo com Garantia**: Taxa de juros de 3%.

A disponibilidade de cada modalidade depende de critérios específicos relacionados à **idade**, **salário** e **localização** do cliente.

## Endpoint da API

### **[POST] `/customer-loans`**

Este endpoint recebe os dados do cliente e retorna as modalidades de empréstimo disponíveis.

#### Requisição
```json
{
    "age": 26,
    "cpf": "275.484.389-23",
    "name": "Vuxaywua Zukiagou",
    "income": 7000.00,
    "location": "SP"
}
```

- **Parâmetros**:
  - `age` (integer) Idade do cliente.
  - `cpf` (string): CPF do cliente (formato livre).
  - `name` (string): Nome completo do cliente.
  - `income` (float): Salário mensal do cliente em reais.
  - `location` (string): Sigla do estado onde o cliente reside (ex.: "SP").

#### Resposta
**Status**: `200 OK`
```json
{
    "customer": "Vuxaywua Zukiagou",
    "loans": [
        {
            "type": "PERSONAL",
            "interest_rate": 4
        },
        {
            "type": "GUARANTEED",
            "interest_rate": 3
        },
        {
            "type": "CONSIGNMENT",
            "interest_rate": 2
        }
    ]
}
```

- **Campos**:
  - `customer`: Nome do cliente.
  - `loans`: Lista de empréstimos disponíveis, cada um com `type` (tipo do empréstimo em maiúsculas) e `interest_rate` (taxa de juros).

## Requisitos de Negócio

As regras para concessão de empréstimos são as seguintes:
- **Empréstimo Pessoal**:
  - Concedido se o salário for **≤ R$ 3.000**.
  - Concedido se o salário estiver entre **R$ 3.000 e R$ 5.000**, o cliente tiver **menos de 30 anos** e residir em **São Paulo (SP)**.
- **Empréstimo Consignado**:
  - Concedido se o salário for **≥ R$ 5.000**.
- **Empréstimo com Garantia**:
  - Concedido se o salário for **≤ R$ 3.000**.
  - Concedido se o salário estiver entre **R$ 3.000 e R$ 5.000**, o cliente tiver **menos de 30 anos** e residir em **São Paulo (SP)**.

## Pré-requisitos

Para rodar o projeto localmente, você precisará de:
- Ruby 3.x
- Rails 7.x
- PostgreSQL (ou outro banco de dados compatível)
- Gerenciador de dependências como Bundler

## Instalação

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu-usuario/emprestimos.git
   cd emprestimos
   ```

2. **Instale as dependências**:
   ```bash
   bundle install
   ```

3. **Configure o banco de dados**:
   - Edite `config/database.yml` com suas credenciais, se necessário.
   - Crie e migre o banco:
     ```bash
     rails db:create
     rails db:migrate
     ```

4. **Inicie o servidor**:
   ```bash
   rails server
   ```
   O serviço estará disponível em `http://localhost:3000`.

## Uso

Faça uma requisição POST para o endpoint `/customer-loans` usando ferramentas como `curl` ou Postman:

```bash
curl -X POST http://localhost:3000/customer-loans \
-H "Content-Type: application/json" \
-d '{"age": 26, "cpf": "275.484.389-23", "name": "Vuxaywua Zukiagou", "income": 7000.00, "location": "SP"}'
```

Você receberá uma resposta JSON com as modalidades de empréstimo disponíveis.

## Estrutura do Projeto

- `app/controllers/customers_controller.rb`: Controlador que processa as requisições.
- `app/models/customer.rb`: Modelo para clientes.
- `app/models/loan.rb`: Modelo para empréstimos.
- `app/serializers/*`: Serializers para formatar a saída JSON (se aplicável).

## Testes

Os testes estão localizados em `spec/` e podem ser executados com:
```bash
rspec
```

## Soluções da Comunidade

Consulte o arquivo [SOLUTIONS.md](SOLUTIONS.md) para ver implementações alternativas feitas por outros membros da comunidade.

## Contribuição

1. Faça um fork do repositório.
2. Crie uma branch para sua feature (`git checkout -b minha-feature`).
3. Commit suas mudanças (`git commit -m "Adiciona minha feature"`).
4. Envie para o repositório remoto (`git push origin minha-feature`).
5. Abra um Pull Request.

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

### Notas
- **Personalização**: Substitua `https://github.com/seu-usuario/emprestimos.git` pelo URL real do seu repositório.
- **Expansão**: Se você usar serializers (ex.: `jsonapi-serializer`) ou outras gems, adicione-as na seção de pré-requisitos.
- **Estilo**: O README segue o padrão Markdown e é claro para iniciantes e desenvolvedores experientes.

Se precisar de ajustes ou quiser incluir mais detalhes (ex.: exemplos de código ou instruções específicas), é só me avisar!