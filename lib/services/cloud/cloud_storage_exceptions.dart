class CloudStorageException implements Exception {
  const CloudStorageException();
}

// C in CRUD
class CouldNotCreateNoteException implements CloudStorageException {}

// R in CRUD
class CouldNotGetAllNotesException implements CloudStorageException {}

// U in CRUD
class CouldNotUpdateNoteException implements CloudStorageException {}

// D in CRUD
class CouldNotDeleteNoteException implements CloudStorageException {}
