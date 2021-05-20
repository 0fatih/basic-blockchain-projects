// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Election {
	string public candidate;

	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	mapping(uint => Candidate) public candidates;
	uint public candidatesCount;


	mapping(address => bool) public voters;

	event votedEvent(uint indexed _candidateId);

	function vote(uint _candidateId) public {
		require(!voters[msg.sender]); // Require that they haven't voted before
		require(_candidateId > 0 && _candidateId <= candidatesCount); // Require a valid candidate
		voters[msg.sender] = true; // Record that voter has voted
		candidates[_candidateId].voteCount++; // Update candidate vote count
		emit votedEvent(_candidateId);
	}


	constructor() {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}

	function addCandidate(string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}




}