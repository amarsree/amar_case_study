<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/* Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
 */

Route::post('/auth/register', [AuthController::class, 'register']);

Route::post('/auth/login', [AuthController::class, 'login']);
Route::get('/generate-session', [AuthController::class, 'generateSession']);

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('aaaa/me', function(Request $request) {
        return auth()->user();
    });
    Route::post('/auth/logout', [AuthController::class, 'logout']);
});

Route::Resource('cart', CartController::class)->except('create','show','edit');
Route::apiResource('products', ProductController::class)->except('update');

