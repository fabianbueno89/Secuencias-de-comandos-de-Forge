# Proyecto de Foundry - Contrato Bank

Este proyecto utiliza Foundry para compilar, probar y desplegar un contrato inteligente simple de un banco.

## Pruebas de Fuzzing

Las pruebas de fuzzing generan entradas aleatorias para probar la robustez del contrato frente a diferentes escenarios. Esto garantiza que el contrato pueda manejar casos imprevistos y ayuda a identificar posibles fallas de seguridad. En `BankTest.t.sol`, hemos incorporado fuzzing para probar depósitos y retiros con cantidades aleatorias.

### Ejecución de pruebas

Para ejecutar las pruebas, usa el siguiente comando:

```bash
forge test
```

### Despliegue

Hemos creado un script de despliegue en `DeployBank.s.sol` que permite implementar el contrato en cualquier red soportada por Foundry. Puedes desplegar el contrato usando:

```bash
forge script script/DeployBank.s.sol --rpc-url <URL_RPC> --private-key <CLAVE_PRIVADA> --broadcast
```

Este comando despliega el contrato usando la red configurada en el parámetro `--rpc-url`. Asegúrate de incluir tu clave privada para el despliegue.
