// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract BBitesToken is ERC20, AccessControl, ERC20Pausable, ERC20Burnable {
    // Definición de roles
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    constructor() ERC20("BBites Token", "BBTKN") {
        // Asigna el rol de administrador al deployer
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        
        // Asigna el rol de minter y pauser al deployer
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);

        // Acuñar el suministro inicial al deployer
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Función para acuñar nuevos tokens (solo para el rol MINTER_ROLE)
    function mint(address to, uint256 amount) public {
        require(hasRole(MINTER_ROLE, msg.sender), "No tienes el rol de Minter");
        _mint(to, amount);
    }

    // Función para pausar el contrato (solo para el rol PAUSER_ROLE)
    function pause() public {
        require(hasRole(PAUSER_ROLE, msg.sender), "No tienes el rol de Pauser");
        _pause();
    }

    // Función para despausar el contrato (solo para el rol PAUSER_ROLE)
    function unpause() public {
        require(hasRole(PAUSER_ROLE, msg.sender), "No tienes el rol de Pauser");
        _unpause();
    }

    function _update(address from, address to, uint256 value)
        internal
        override
        (ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }
}
