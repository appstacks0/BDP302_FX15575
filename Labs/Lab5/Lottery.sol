// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
    //declaring the state variables
    address public manager;
    address payable[] public players; //dynamic array of type address payable

    constructor() public {
        //initializing the owner to the address that deploys the contract
        manager = msg.sender;
    }

    receive() payable external{
        //each player sends exactly 0.1 ETH
        require (msg.value == 0.1 ether);
        //appending the player to the players array
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        //only the manager is allowed to call it
        require (msg.sender == manager);
        return address(this).balance;
    }

    function random() internal view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    function pickWinner() public {
        //only the manager is allowed to call it
        require (msg.sender == manager);
        require (players.length >= 3);

        uint r = random();
        address payable winner;

        //computing a random inxex of the contract
        uint index = r % players.length;

        //this is the winner
        winner = players[index];

        //transfering the entire contract's balance to the winner
        winner.transfer(address(this).balance);

        //reseting the lottery for the next round
        players = new address payable[](0);
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
}
