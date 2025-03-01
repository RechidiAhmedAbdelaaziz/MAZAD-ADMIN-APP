import 'package:mazad_app/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auction_api.g.dart';

@RestApi()
abstract class AuctionApi {
  factory AuctionApi(Dio dio, {String baseUrl}) = _AuctionApi;

  @GET('/auctions')
  Future<PaginatedDataResponse> getAuctions(
    @Queries() Map<String, dynamic> query,
  );

  @GET('/auctions/{id}')
  Future<SingleDataResponse> getAuction(@Path('id') String id);

  @POST('/auctions')
  Future<SingleDataResponse> createAuction(
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/auctions/{id}')
  Future<SingleDataResponse> updateAuction(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/auctions/{id}')
  Future<MessageResponse> deleteAuction(@Path('id') String id);
}
