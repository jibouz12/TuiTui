pragma solidity ^0.8.2;

contract TuiTui {
    mapping (address => uint) public balances;
    mapping (address => mapping(address => uint)) public allowance;
    uint public TotalSupply = 100000 * 10 ** 18;
    string public name = "TuiTui Token";
    string public symbol = "TUI";
    uint public decimals = 18;
    
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    
    constructor (){
        balances[msg.sender] = TotalSupply;
    }
    
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }
    
    
    function transfer(address to, uint value) public returns(bool) {
        require(balanceOf(msg.sender) >= value, 'solde TuiTui insuffisant');
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool){
        require(balanceOf(from) >= value, 'solde TuiTui insuffisant');
        require(allowance[from][msg.sender] >= value, 'franchise trop faible');
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }
    
    function approve(address spender, uint value) public returns(bool){
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
}