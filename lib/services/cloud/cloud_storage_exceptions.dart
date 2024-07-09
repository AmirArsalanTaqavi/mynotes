class CloudStorageException implements Exception {
  const CloudStorageException();
}

// C in CRUD
class CouldNotCreateNoteException implements CloudStorageException {}

// R in CRUD
class CouldNotGetAllNoteException implements CloudStorageException {}

// U in CRUD
class CouldNotUpdateAllNoteExceptions implements CloudStorageException {}

// D in CRUD
class CouldNotDeleteNoteExceptions implements CloudStorageException {}
