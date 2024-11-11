# BBitesToken

BBitesToken es un contrato inteligente basado en el estándar ERC20, desarrollado para la red Ethereum. Este contrato permite la creación de un token personalizado llamado "BBites Token" (símbolo: BBTKN) con funciones adicionales de acuñación (minting) y pausa.

## Características

- **Token ERC20**: Compatible con el estándar ERC20 de Ethereum.
- **Minting**: Permite la creación de nuevos tokens por usuarios con el rol de `MINTER_ROLE`.
- **Pausa**: Permite pausar y reactivar las transacciones del contrato para mayor seguridad.
- **Roles de Acceso**: Utiliza `AccessControl` para gestionar permisos de minteo y pausa.

## Requisitos Previos

- **Node.js** y **npm**: Asegúrate de tener instalados Node.js y npm. Puedes descargarlo desde [Node.js](https://nodejs.org/).
- **Hardhat**: Framework de desarrollo para contratos inteligentes.
- **Infura**: Servicio para conectarse a la red Ethereum.
- **Etherscan API Key**: Para verificar el contrato en Sepolia Etherscan.

## Instalación

1. Clona el repositorio:

   ```bash
   git clone https://github.com/tuusuario/BBitesToken.git
   cd BBitesToken
   ```

2. Inicializa el proyecto e instala las dependencias:

   ```bash
   npm install
   ```

3. Instala las dependencias adicionales:

   ```bash
   npm install --save-dev hardhat @openzeppelin/contracts dotenv @nomiclabs/hardhat-etherscan @nomicfoundation/hardhat-ignition @nomicfoundation/hardhat-toolbox
   ```

   - **Hardhat**: Framework de desarrollo para Ethereum.
   - **OpenZeppelin Contracts**: Biblioteca de contratos inteligentes seguros y reutilizables.
   - **dotenv**: Para manejar variables de entorno de forma segura.
   - **Hardhat Etherscan**: Plugin para verificar el contrato en Etherscan.
   - **Hardhat Toolbox**: Plugin con utilidades adicionales para Hardhat.
   - **Hardhat Ignition**: Plugin para desplegar contratos en la red Sepolia de forma sencilla.

## Configuración

1. Crea un archivo `.env` en el directorio raíz y agrega las siguientes variables de entorno:

   ```plaintext
   PRIVATE_KEY=tu_clave_privada
   SEPOLIA_URL=https://sepolia.infura.io/v3/TU_API_KEY_INFURA
   ETHERSCAN_API_KEY=tu_api_key_de_etherscan
   ```

   - `PRIVATE_KEY`: La clave privada de tu cuenta de Ethereum (cuenta que desplegará el contrato).
   - `SEPOLIA_URL`: La URL de conexión de Infura para la red Sepolia.
   - `ETHERSCAN_API_KEY`: Tu clave de API de Etherscan para verificar el contrato.

    Puedes obtener el SEPOLIA_URL de diferentes proveedores, como Infura, Chainlink, Alchemy, etc., siempre que la URL sea válida para conectarse a la red Sepolia.

2. Configura `hardhat.config.js` para incluir la configuración de Sepolia y Etherscan:

   ```javascript
   require("@nomicfoundation/hardhat-toolbox");
   require("dotenv").config();

   module.exports = {
     solidity: "0.8.0",
     networks: {
       sepolia: {
         url: process.env.SEPOLIA_URL,
         accounts: [`0x${process.env.PRIVATE_KEY}`]
       }
     },
     etherscan: {
       apiKey: process.env.ETHERSCAN_API_KEY,
     },
   };
   ```

## Despliegue del Contrato

Para desplegar el contrato en la red Sepolia, ejecuta el siguiente comando:

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

Este comando desplegará el contrato `BBitesToken` y mostrará la dirección en la que ha sido desplegado.

## Verificación del Contrato

Una vez desplegado el contrato, puedes verificarlo en Etherscan con el siguiente comando:

```bash
npx hardhat verify --network sepolia DIRECCION_DEL_CONTRATO
```

Reemplaza `DIRECCION_DEL_CONTRATO` con la dirección del contrato obtenida en el despliegue.

Otra opción, como estamos usando el pluguin Ignition, es ejecutar el siguiente comando:

```bash
npx hardhat ignition deploy ignition/modules/BBitesTokenModule.js --network sepolia --verify
```

## Pruebas

Este proyecto incluye pruebas unitarias para verificar el comportamiento del contrato. Para ejecutar las pruebas, utiliza el siguiente comando:

```bash
npx hardhat test
```

Las pruebas cubren las siguientes funcionalidades:
- Acuñación de tokens (solo permitido a los usuarios con `MINTER_ROLE`).
- Pausar y despausar el contrato (solo permitido a los usuarios con `PAUSER_ROLE`).
- Validación de que el suministro inicial se acuña correctamente al deployer.

## Contribución

Si deseas contribuir a este proyecto, por favor, crea un "fork" del repositorio y abre un "pull request" con tus cambios.

## Licencia

Este proyecto está licenciado bajo la licencia MIT. Consulta el archivo `LICENSE` para obtener más detalles.
# ERC20-BBiteToken
