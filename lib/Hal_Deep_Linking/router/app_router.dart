import 'package:go_router/go_router.dart';
import 'package:latihan_provider/Hal_Deep_Linking/screens/detail_product_screen.dart';
import 'package:latihan_provider/Hal_Deep_Linking/screens/home_screen.dart';
import 'package:latihan_provider/Hal_Deep_Linking/screens/not_found_screen.dart';
import 'package:latihan_provider/Hal_Deep_Linking/screens/product_screen.dart';
import 'package:latihan_provider/Hal_Deep_Linking/screens/profile_screen.dart';
import 'package:path/path.dart';

class AppRouter {
  static GoRouter getRouter(){
    return GoRouter(
      initialLocation: '/',
      errorBuilder: (context, state)=> NotFoundScreen(),
      routes: [
        //route home
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => HomeScreen(),
          ),

          //profile
          GoRoute(
          path: '/profile',
          name: 'profile',
          builder: (context, state) => ProfileScreen(),
          ),

          GoRoute(
          path: '/produk',
          name: 'produk',
          builder: (context, state){
            final queryParams = state.uri.queryParameters;

            return ProductScreen(
              keyword: queryParams['keyword'],
              category: queryParams['category'],
              sortBy: queryParams['sortBy'],
            );
          },

          routes: [
            GoRoute(
              path: ':id',
              name: 'detail-produk',
              builder: (context, state){
                final id = state.pathParameters['id'] ?? '0';
                return DetailProductScreen(id: id);
              }
              )
          ]
          ),
      ]

    );
  }
}