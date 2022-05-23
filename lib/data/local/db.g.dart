// ignore_for_file: type=lint
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DbBuilder databaseBuilder(String name) => _$DbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DbBuilder inMemoryDatabaseBuilder() => _$DbBuilder(null);
}

class _$DbBuilder {
  _$DbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<Db> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$Db();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$Db extends Db {
  _$Db([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CommentDao? _commentsDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Comment` (`id` INTEGER NOT NULL, `postId` INTEGER NOT NULL, `name` TEXT NOT NULL, `email` TEXT NOT NULL, `body` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CommentDao get commentsDao {
    return _commentsDaoInstance ??= _$CommentDao(database, changeListener);
  }
}

class _$CommentDao extends CommentDao {
  _$CommentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _commentInsertionAdapter = InsertionAdapter(
            database,
            'Comment',
            (Comment item) => <String, Object?>{
                  'id': item.id,
                  'postId': item.postId,
                  'name': item.name,
                  'email': item.email,
                  'body': item.body
                },
            changeListener),
        _commentUpdateAdapter = UpdateAdapter(
            database,
            'Comment',
            ['id'],
            (Comment item) => <String, Object?>{
                  'id': item.id,
                  'postId': item.postId,
                  'name': item.name,
                  'email': item.email,
                  'body': item.body
                },
            changeListener),
        _commentDeletionAdapter = DeletionAdapter(
            database,
            'Comment',
            ['id'],
            (Comment item) => <String, Object?>{
                  'id': item.id,
                  'postId': item.postId,
                  'name': item.name,
                  'email': item.email,
                  'body': item.body
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Comment> _commentInsertionAdapter;

  final UpdateAdapter<Comment> _commentUpdateAdapter;

  final DeletionAdapter<Comment> _commentDeletionAdapter;

  @override
  Stream<List<Comment>> getCommentsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Comment',
        mapper: (Map<String, Object?> row) => Comment(
            postId: row['postId'] as int,
            id: row['id'] as int,
            name: row['name'] as String,
            email: row['email'] as String,
            body: row['body'] as String),
        queryableName: 'Comment',
        isView: false);
  }

  @override
  Future<List<Comment>> getCommentsAsync() async {
    return _queryAdapter.queryList('SELECT * FROM Comment',
        mapper: (Map<String, Object?> row) => Comment(
            postId: row['postId'] as int,
            id: row['id'] as int,
            name: row['name'] as String,
            email: row['email'] as String,
            body: row['body'] as String));
  }

  @override
  Future<void> deleteAllComments() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Comment');
  }

  @override
  Future<void> insert(Comment model) async {
    await _commentInsertionAdapter.insert(model, OnConflictStrategy.replace);
  }

  @override
  Future<List<int>> insertMultiple(List<Comment> models) {
    return _commentInsertionAdapter.insertListAndReturnIds(
        models, OnConflictStrategy.replace);
  }

  @override
  Future<void> update(Comment model) async {
    await _commentUpdateAdapter.update(model, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateMultiple(List<Comment> models) {
    return _commentUpdateAdapter.updateListAndReturnChangedRows(
        models, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteModel(Comment model) async {
    await _commentDeletionAdapter.delete(model);
  }

  @override
  Future<int> deleteMultiple(List<Comment> models) {
    return _commentDeletionAdapter.deleteListAndReturnChangedRows(models);
  }
}
