class Constants {
  Constants._();

  static const title = 'Q App';

  //local database
  static const tableComment = 'Comment';
  static const dbVersion = 1;
  static const dbName = 'Database';
  static const dbCommentsLimit = 50; // double.infinity for no limit

  //base urls
  static const devBaseUrl = 'https://jsonplaceholder.typicode.com/';
  static const stageBaseUrl = 'https://jsonplaceholder.typicode.com/';
  static const prodBaseUrl = 'https://jsonplaceholder.typicode.com/';

  //pagination
  static const pageSize = 15;
}
