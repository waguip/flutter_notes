# App de Notas

Um projeto em flutter que contém uma tela de autentificação e uma tela de captura de informações

## Tela de autentificação
Uma tela de autentificação onde o usuário é obrigado a digitar seu login e senha.

![LoginScreen](https://github.com/waguip/flutter_target_sistemas/assets/51832038/f3477fc2-1907-4d09-ab40-fc0026e53bb6) 

- Verifica e alerta se ambos os campos de usúario e senha estão preenchidos corretamente.
- Critérios:
  - O campo senha não pode ter menos que dois caracteres. 
  - O campo senha não pode ter caracteres especiais, sendo apenas possível 
informar 'a' até 'Z' e '0' até '9'. 
  - Ambos os campos não podem ultrapassar 20 caracteres. 
  - Ambos os campos não podem terminar com o caractere de espaço no final. 
- Se ambas as informações estiveram preenchidas avança para a próxima tela. 
- Ao tocar no label "Política de privacidade" uma página web direciona para o google.

## Tela de captura de informações
Salva as informações digitadas pelo usuário em um card, listando-as e dando a opção de editar ou excluir. Essas informações não são perdidas ao fechar o app.

![InfoCaptureScreen](https://github.com/waguip/flutter_target_sistemas/assets/51832038/af62cf87-4b90-4e3c-abdc-394b1d387092)

- O foco da digitação está o tempo todo no campo de "Digite seu texto" e não é perdido ao interagir com a tela. 
- Ao acionar o "enter" o campo verifica se a informação foi preenchida. 
- O Card principal recebe a informação digitada do campo. 
- As informações são salvas e lidas utilizando a biblioteca [shared_ preferences](https://pub.dev/packages/shared_preferences)
- O ícone de excluir abre um pop-up confirmando a ação.
- Utiliza a biblioteca de gerenciamento de estado [Mobx](https://pub.dev/packages/mobx) para a construção da tela.
