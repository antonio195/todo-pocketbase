#!/bin/bash

# Executa flutter clean e aguarda o término
echo "Rodando flutter clean..."
flutter clean
if [ $? -ne 0 ]; then
  echo "Erro ao rodar flutter clean. Abortando."
  exit 1
fi

# Executa flutter pub get e aguarda o término
echo "Rodando flutter pub get..."
flutter pub get
if [ $? -ne 0 ]; then
  echo "Erro ao rodar flutter pub get. Abortando."
  exit 1
fi

# Executa dart run build_runner build e aguarda o término
echo "Rodando dart run build_runner build..."
dart run build_runner build --delete-conflicting-outputs
if [ $? -ne 0 ]; then
  echo "Erro ao rodar dart run build_runner build. Abortando."
  exit 1
fi

echo "Todos os comandos foram executados com sucesso!"
