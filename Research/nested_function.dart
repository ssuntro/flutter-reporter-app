void main() {
  aa();
}

void aa() {
  late String title;
  void getTitle() {
    title = 'Default';
    print('Title is $title');
  }

  getTitle();
}
