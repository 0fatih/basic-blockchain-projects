// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;


contract Arrays {
    
    /*
        Array Members
        
            length  : The length of memory arrays is fixed (but dynamic, i.e. it can depend on runtime parameters) once they are created.
            push    : Dynamic storage arrays and bytes (not string) have a member function called push() that you can use to append a zero-initialised element at the end of the array. It returns a reference to the element, so that it can be used like x.push().t = 2 or x.push() = b.
            push(x) : Dynamic storage arrays and bytes (not string) have a member function called push(x) that you can use to append a given element at the end of the array. The function returns nothing.
            pop     : Dynamic storage arrays and bytes (not string) have a member function called pop that you can use to remove an element from the end of the array. This also implicitly calls delete on the removed element.
            
            
    */
    
    uint[2**20] m_aLotOfIntegers;
    bool[2][] m_pairsOfFlags;
    
    function setAllFlagPairs(bool[2][] memory newPairs) public {
        // Assignment  to a storage array performs a copy of 'newPairs' and replaces the complete array 'm_pairsOfFlags'
        m_pairsOfFlags = newPairs;
    }
    
    struct StructType {
        uint[] contents;
        uint moreInfo;
    }
    
    StructType s;
    
    function f(uint[] memory c) public {
        // Stores a reference to 's' in 'g'
        StructType storage g = s;
        
        // Also changes 's.moreInfo'
        g.moreInfo = 2;
        
        // Assigns a copy because 'g.contents' is not a local variable, but a member of a local variable
        g.contents = c;
    }
    
    function setFlagPair(uint index, bool flagA, bool flagB) public {
        // Access to a non-existing index will throw an exception
        m_pairsOfFlags[index][0] = flagA;
        m_pairsOfFlags[index][1] = flagB;
    }
    
    function changeFlagArraySize(uint newSize) public {
        // NOTE*: Using push and pop is the only way to change the length of an array
        if(newSize < m_pairsOfFlags.length) {
            while (m_pairsOfFlags.length > newSize) {
                m_pairsOfFlags.pop();
            }
        } else if (newSize > m_pairsOfFlags.length) {
            while (m_pairsOfFlags.length < newSize)
                m_pairsOfFlags.push();
        }
    }
    
    function clear() public {
        // these clear the arrays completely
        delete m_pairsOfFlags;
        delete m_aLotOfIntegers;
        
        // identical effect here 
        m_pairsOfFlags = new bool[2][](0);
    }
    
    bytes m_byteData;
    
    function byteArrays(bytes memory data) public {
        // Byte arrays ("bytes") are different as they are stored without padding, but can be treated identical to "uint8[]"
        m_byteData = data;
        for(uint i=0; i<7; i++)
            m_byteData.push();
        
        m_byteData[3] = 0x08;
        delete m_byteData[2];
    }
    
    function AddFlag(bool[2] memory flag) public returns(uint) {
        m_pairsOfFlags.push(flag);
        return m_pairsOfFlags.length;
    }
    
    function createMemoryArray(uint size) public pure returns (bytes memory) {
        // Dynamic memory arrays are created using 'new'
        uint[2][] memory arrayOfPairs = new uint[2][](size);
        
        // Inline arrays are always statically-sized and if you only use literals, you have to provide at least one type
        arrayOfPairs[0] = [uint(1), 2];
        
        // Create a dynamic byte array
        bytes memory b = new bytes(200);
        for(uint i=0; i<b.length; i++)
            b[i] = bytes1(uint8(i));
        return b;
        
    }
    
}
