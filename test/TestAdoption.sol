pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
	Adoption adoption = Adoption(DeployedAddresses.Adoption());

	//testing the adopt() function
	function testUserCanAdoptPet() public {
		uint returnedId = adoption.adopt(8);

		uint expected = 8;

		Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded");
	}

	//testing retrieval of a single pet's owner
	function testGetAdopterAddressByPetId() public {
		//expected owner is this contract
		address expected = this;

		address adopter = adoption.adopters(8);

		Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded");
	}

	//testing retrieval of all pet owners
	function testGetAdoptersAddressBytPetIdInArray() public {
		//expected owner is this contract
		address expected = this;

		//store adopters in memory rather than contract's storage
		address[16] memory adopters = adoption.getAdopters();

		Assert.equal(adopters[8], expected, "owner of pet ID 8 should be recorded");
	}
}