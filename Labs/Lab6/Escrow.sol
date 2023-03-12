// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Escrow {
    //Declaring the state variables
    address payable public buyer;
    address payable public seller;
    address payable public arbiter;
    mapping(address => uint256) totalAmount;
    //Defining a enumerator 'State'
    enum State {
        //Following are the data members
        AWATE_PAYMENT,
        AWATE_DELIVERY,
        COMPLETE
    }
    //Declaring the object of the enumerator
    State public state;

    constructor(address payable _buyer, address payable _sender) public {
        //Assigning the values of the state variables
        arbiter = msg.sender;
        buyer = _buyer;
        seller = _sender;
        state = State.AWATE_PAYMENT;
    }

    //Defining function modifier 'instate'
    modifier instate(State expectedState) {
        require(state == expectedState);
        _;
    }

    //Defining function modifier 'only Buyer'
    modifier onlyBuyer() {
        require(msg.sender == buyer || msg.sender == arbiter);
        _;
    }

    //Defining function modifier 'onlySeller'
    modifier onlySeller() {
        require(msg.sender == seller || msg.sender == arbiter);
        _;
    }

    function confirmPayment()
        public
        payable
        onlyBuyer
        instate(State.AWATE_PAYMENT)
    {
        state = State.AWATE_DELIVERY;
    }

    function confirmDelivery() public onlyBuyer instate(State.AWATE_DELIVERY) {
        seller.transfer(address(this).balance);
        state = State.COMPLETE;
    }

    function returnPayment() public onlySeller instate(State.AWATE_DELIVERY) {
        buyer.transfer(address(this).balance);
    }
}
