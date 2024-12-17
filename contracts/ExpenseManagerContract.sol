// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

contract ExpenseManagerContract {


    address public owner;


    struct Transaction {
        address user;
        uint amount;
        string reason;
        uint timestamp;
    }

    // array of transactions
    Transaction[] public transactions;

    constructor () {
        owner = msg.sender;
    }

    // like Map<String, double> in dart
    mapping(address => uint) public balances;


    event Deposit(address indexed from, uint amount, string reason, uint timestamp);

    event Withdraw(address indexed to, uint amount, string reason, uint timestamp);

    function deposit(uint amount, string memory reason) public payable {
        require(amount > 0, "Deposit amount should be greater than 0");
        balances[msg.sender] += amount;
        transactions.push(Transaction(msg.sender, amount, reason, block.timestamp));
        emit Deposit(msg.sender, amount, reason, block.timestamp);
    }

    function withdraw(uint amount, string memory reason) public {
        require(balances[msg.sender] >= amount, "No balance");
        balances[msg.sender] -= amount; // decrease amount of balance
        transactions.push(Transaction(msg.sender, amount, reason, block.timestamp));
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount, reason, block.timestamp);
    }

    // functions just returns something that is why as "view"
    function getBalance(address account) public view returns (uint){
        return balances[account];
    }

    function getTransactionsCount() public view returns (uint) {
        return transactions.length;
    }

    function getTransaction(uint index) public view returns (address, uint, string memory, uint) {
        require(index < transactions.length, "Index is out of bounds");
        Transaction memory transaction = transactions[index];
        return (transaction.user, transaction.amount, transaction.reason, transaction.timestamp);
    }

    // you can't return big list in solidity
    function getAllTransactions() public view returns (address[] memory, uint[] memory, string[] memory, uint[] memory) {
        address[] memory users = new address[](transactions.length);
        uint[] memory amounts = new uint[](transactions.length);
        string[] memory reasons = new string[](transactions.length);
        uint[] memory times = new uint[](transactions.length);

        for (uint i = 0; i < transactions.length; i++) {
            users[i] = transactions[i].user;
            amounts[i] = transactions[i].amount;
            reasons[i] = transactions[i].reason;
            times[i] = transactions[i].timestamp;
        }

        return (users, amounts, reasons, times);
    }

    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner execute this function");
        _;
    }
}
