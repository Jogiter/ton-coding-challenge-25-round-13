import "stdlib";

struct Storage {
    registrations: dict<Address, int32>;
}

fun Storage.load(): Storage {
    return Storage.fromCell(contract.getData());
}

fun Storage.save(storage: Storage) impure {
    contract.setData(storage.toCell());
}

fun onInternalMessage(in: InMessage) impure {
    let storage = Storage.load();
    storage.registrations[in.sender] = 1;  // Simple value to store
    storage.save(storage);
}
