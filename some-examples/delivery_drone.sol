contract DeliveryDroneControl {
    address drone;

    struct Delivery { string from; string to; }
    Delivery[] public requestQueue;

    enum Status { Idle, Delivering, ToNextDelivery }
    Status public status;

    event DeliveryRequested(string from, string to);

    function DeliveryDroneControl(address _drone) {
        drone = _drone;
    }
    
    function requestDelivery(string from, string to) {
        var queue = requestQueue; // stores reference to storage
        queue[queue.length++] = Delivery(from, to);
        DeliveryRequested(from, to);
    }

    modifier onlyCalledByDrone() { if (msg.sender == drone) _ }

    function getNextLocation() onlyCalledByDrone returns (string) {
        if (requestQueue.length == 0) return "";
        if (status == Status.Delivering)
            return requestQueue[0].to;
        else
            return requestQueue[0].from;
    }

    function delivered() calledByDrone {
    }
    
}
