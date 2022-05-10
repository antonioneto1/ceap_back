Informacoes importantes: 
O campo de email é para informar para pessoa quando o processo for finalizado e alertar caso aconteca algum erro na leitura do arquivo.

Ao tentar deployar o projeto no heroku, tive problemas com a versao do bootstrap, perdi bastante tempo tentando copilar o projeto, troquei versao do ruby, troquei configuracoes, tentei mudar versao de outras gens e nada resolveu, no final, nao conseguia copilar o arquivo em prod. Logo resolvi entregar para nao passar do prazo. 

optei por usar o rank dos maiores gastos com os 3 maiores gastos e suas porcentagens mediante ao gasto total, mara melhor visualizar.

Alguns erros apareciam na leitura do aquivo, errors relacionados aos caracteres em alguns campos, entao nao estou impedindo o carregamento do aquivo, mas deixo claro para quem fizer o upload do aquivo que ele foi carregado, porem com tem errors. 



# Ranking dos gastos dos Deputados

Estamos muito felizes que você tenha chegado nessa etapa do nosso processo seletivo, para essa fase, desejamos que você resolva um desafio. Nosso desafio consiste em analisar alguns dados disponibilizados pelo Câmara dos Deputados relativos aos gastos dos parlamentares. A ideia é descobrir quem, do seu estado, está gastando mais e exibir de forma resumida esses principais gastos.

## Descrição do desafio

Você já ouviu falar da CEAP? A Cota para o Exercício da Atividade Parlamentar, custeia as despesas do mandato, como passagens aéreas e conta de celular. Algumas são reembolsadas, como as com os Correios, e outras são pagas por débito automático, como a compra de passagens. Nos casos de reembolso, os deputados têm três meses para apresentar os recibos. O valor mensal não utilizado fica acumulado ao longo do ano. Por esse motivo, em alguns meses o valor gasto pode ser maior que a média mensal. (Fonte: [Portal da Câmara dos Deputados](https://www2.camara.leg.br/transparencia/acesso-a-informacao/copy_of_perguntas-frequentes/cota-para-o-exercicio-da-atividade-parlamentar)). Através do portal da transparência, nós temos acesso a essas despesas e podemos saber como e onde os políticos estão gastando.

## Base de dados e explicações complementares

- [Fonte de dados (pegar o referente ao ano 2021 em formato CSV)](https://dadosabertos.camara.leg.br/swagger/api.html#staticfile)
- [Explicação dos campos do arquivo CSV](https://www2.camara.leg.br/transparencia/cota-para-exercicio-da-atividade-parlamentar/explicacoes-sobre-o-formato-dos-arquivos-xml)
- Ignorar linhas que não tenham no campo `sgUF` o estado que você mora. O objetivo do trabalho é focar apenas no seu estado;
- Considerar para fins de cálculos de despesa, o campo `vlrLiquido`. Esse é o valor que de fato foi debitado da cota do candidato;
- Dica para pegar a foto do político: **http://www.camara.leg.br/internet/deputado/bandep/{ideCadastro}.jpg**


## Requisitos Obrigatórios
- Possibilitar o upload do arquivo;
- Organizar os dados extraidos do arquivo em tabelas no banco de dados;
- Listagem dos deputados do seu estado;
- Mostrar o somatório dos seus gastos;
- Listar as despesas, mostrando a data(`datEmissao`), estabelecimento(`txtFornecedor`), valor(`vlrLiquido`), e link para a nota(`urlDocumento`);
- Destacar a maior despesa do candidato;
- Usar o framework Rails (utilize esse repositório como base);
- Ter uma cobertura de código;

# Requisitos bônus
Esses requisitos não são obrigatórios, mas serão levados em consideração como pontos extras no momento da avaliação.

- Exibir gráficos para melhorar a visualização dos gastos;
- Aplicação hospedada no Heroku, AWS ou similares;
- Evitar N + 1 nas queries;
- Organizar estrutura do projeto utilizando padrões de projetos;

# Critérios de avaliação

- Organização do projeto: Avalia a estrutura do projeto, documentação e uso de controle de versão;
- Coerência: Avalia se os requisitos foram atendidos;
- Boas práticas: Avalia se o projeto segue boas práticas de desenvolvimento, incluindo segurança e otimização;
- Criatividade: Avalia o quanto você "pensou fora da caixa", levando em conta soluções criativas para os problemas levantados;

O desafio deve ser entregue nos passando a URL de seu repositório. Fique a vontade caso queira incrementar o projeto com outras features não listadas aqui, iremos levar em consideração também!

Qualquer dúvida em relação ao desafio, responderemos por e-mail.

Bom trabalho!
