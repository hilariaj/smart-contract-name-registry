// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract NameRegistry {
    string private name;
    address public owner;

    // Evento para registrar mudanças de nome
    event NameChanged(string oldName, string newName);

    // Define o dono do contrato ao implantá-lo
    constructor(){
        owner = msg.sender;
        name = "Alice"; // Nome inicial
    }

    // Modificador para restringir funções ao dono do contrato
    modifier onlyOwner(){
        require(msg.sender == owner, "Apenas o dono pode alterar o nome.");
        _;
    }

    // Função para definir um novo nome (somente pelo dono)
    function setName(string memory _name) public onlyOwner  {
        emit NameChanged(name, _name); // Registra evento
        name = _name;
    }

    // Função para obter o nome atual
    function getName() public view returns (string memory) {
        return name;
    }

    // Função para redefinir o nome para o valor inicial
    function resetName() public onlyOwner {
        emit NameChanged(name, "Alice");
        name = "Alice";
    }

}
