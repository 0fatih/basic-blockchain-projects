// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.4;


interface DataFeed { function getData(address token) external returns(uint value); }

contract FeedConsumer {
    
    /*
    
        A failure in an external call can be caught using a try/catch statement, as follows.
    
    */
    
    DataFeed feed;
    uint errorCount;
    
    function rate(address token) public returns (uint value, bool success) {
        // Permanently disable the mechanism if there are more than 10 errors.
        
        require(errorCount < 10);
        
        try feed.getData(token) returns (uint v) {
            return (v, true);
        
        } catch Error(string memory /* reason */) {
            // This is executed in case revert was called inside getData and a reson string was provided.
            errorCount++;
            return (0, false);
            
        } catch Panic(uint /* errorCode */) {
            // This is executed in case of a panic, i.e. a serious error like division by zero 
            // or overflow. The error code can be used to determine the kind of error.
            errorCount++;
            return (0, false);
            
        } catch (bytes memory /* lowLevelData */) {
            // This is executed in case revert() was used
            errorCount++;
            return (0, false);
        }
        
    }
    
    /*
    
        Solidity supports different kinds of catch blocks depending on the type of error:

        catch Error(string memory reason) { ... }: This catch clause is executed if 
        the error was caused by revert("reasonString") or require(false, "reasonString") 
        (or an internal error that causes such an exception).


        catch Panic(uint errorCode) { ... }: If the error was caused by a panic, 
        i.e. by a failing assert, division by zero, invalid array access, arithmetic 
        overflow and others, this catch clause will be run.


        catch (bytes memory lowLevelData) { ... }: This clause is executed if the 
        error signature does not match any other clause, if there was an error 
        while decoding the error message, or if no error data was provided with 
        the exception. The declared variable provides access to the low-level error data in that case.
    
        
        catch { ... }: If you are not interested in the error data, you can just use catch { ... } 
        (even as the only catch clause) instead of the previous clause.
    
    */
    
    
}
