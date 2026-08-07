class AppFont {
  static double title(double width) { //header login only
    if (width < 600) {
      return 28; // Mobile
    } else if (width < 1024) {
      return 36; // Tablet
    } else {
      return 44; // Desktop
    }
  }

  static double header(double width) {
    if (width < 600) {
      return 24;
    } else if (width < 1024) {
      return 32;
    } else {
      return 40;
    }
  }

  static double subtitle(double width) {
    if (width < 600) {
      return 18;
    } else if (width < 1024) {
      return 22;
    } else {
      return 26;
    }
  }

  static double body(double width) {  
    if (width < 600) {
      return 16;
    } else if (width < 1024) {
      return 18;
    } else {
      return 20;
    }
  }

  static double caption(double width) {
    if (width < 600) {
      return 12;
    } else if (width < 1024) {
      return 14;
    } else {
      return 16;
    }
  }

  static double button(double width) {
    if (width < 600) {
      return 15;
    } else if (width < 1024) {
      return 17;
    } else {
      return 19;
    }
  }
}