const MyToken = artifacts.require("MyToken")
const FarmToken = artifacts.require("FarmToken")

module.exports = async function (callback) {
	const accounts = await new web3.eth.getAccounts()
	const myToken = await MyToken.deployed()
	const farmToken = await FarmToken.deployed()

	// Returns the remaining number of tokens that spender will be allowed to spend
	// on behalf of owner through trasferFrom. This is zero by default.
	const allowanceBefore = await myToken.allowance(accounts[0], farmToken.address)
	console.log("Amount of MyToken FarmToken is allowed to transfer on our behafl Before " + 
		allowanceBefore.toString())


	// In order to allow the Smart Contract to transfer to MyToken (ERC-20) on the accounts[0]
	// behalf, we must explicitly allow it. We allow farmToken to transfer x amount of MyToken on our behalf
	await myToken.approve(farmToken.address, web3.utils.toWei("100", "ether"))

	// Validate that the farmToken can now move x amount of MyToken on our behalf
	const allowanceAfter = await myToken.allowance(accounts[0], farmToken.address)
	console.log("Amount of MyToken FarmToken is allowed to transfer on our behalf after: " +
		web3.utils.fromWei(allowanceAfter.toString()))

	// Verify accounts[0] and farmToken balance of MyToken before and after the transfer
	balanceMyTokenBeforeAccounts0 = await myToken.balanceOf(accounts[0])
	balanceMyTokenBeforeFarmToken = await myToken.balanceOf(farmToken.address)
	console.log("\n*** My Token ***")
	console.log("Balance MyToken Before accounts[0] " + web3.utils.fromWei(balanceMyTokenBeforeAccounts0.toString()))
	console.log("Balance MyToken Before FarmToken " + web3.utils.fromWei(balanceMyTokenBeforeFarmToken.toString()))
	console.log("\n*** Farm Token ***")
	balanceFarmTokenBeforeAccounts0 = await farmToken.balanceOf(accounts[0])
	balanceFarmTokenBeforeFarmToken = await farmToken.balanceOf(farmToken.address)
	console.log("Balance FarmToken Before accounts[0] " + web3.utils.fromWei(balanceFarmTokenBeforeAccounts0.toString()))
	console.log("Balance FarmToken Before FarmToken " + web3.utils.fromWei(balanceFarmTokenBeforeFarmToken.toString()))

	// Call Deposit function from FarmToken
	console.log("\n\nCall Deposit Function")
	await farmToken.deposit(web3.utils.toWei("100", "ether"))


	console.log("\n\n\n*** My Token ***")
	balanceMyTokenAfterAccount0 = await myToken.balanceOf(accounts[0])
	balanceMyTokenAfterFarmToken = await myToken.balanceOf(farmToken.address)
	console.log("Balance MyToken After Acoounts[0] " + web3.utils.fromWei(balanceMyTokenAfterAccount0.toString()))
	console.log("Balance MyToken After FarmToken " + web3.utils.fromWei(balanceMyTokenAfterFarmToken.toString()))
	console.log("*** Farm Token ***")
	balanceFarmTokenAfterAccounts0 = await farmToken.balanceOf(accounts[0])
	balanceFarmTokenAfterFarmToken = await farmToken.balanceOf(farmToken.address)
	console.log("Balance FarmToken After accounts[0] " + web3.utils.fromWei(balanceFarmTokenAfterAccounts0.toString()))
	console.log("Balance FarmToken After FarmToken " + web3.utils.fromWei(balanceFarmTokenAfterFarmToken.toString()))
	callback()

}