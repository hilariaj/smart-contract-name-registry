// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract NameRegistry {
    string private name;
    address public owner;

    // Event to record name changes
    event NameChanged(string oldName, string newName);

    // Defines the owner of the contract by deploying it
    constructor(){
        owner = msg.sender;
        name = "Alice"; // Initial name
    }

    // Modifier to restrict functions to the contract owner
    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can change the name.");
        _;
    }

    // Function to define a new name (owner only)
    function setName(string memory _name) public onlyOwner  {
        emit NameChanged(name, _name); // Records event
        name = _name;
    }

    // Function to obtain the current name
    function getName() public view returns (string memory) {
        return name;
    }

    // Function to redefine the name for the initial value
    function resetName() public onlyOwner {
        emit NameChanged(name, "Alice");
        name = "Alice";
    }

}
