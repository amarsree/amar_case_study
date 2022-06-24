<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;
use App\Http\Requests\StoreCartRequest;
use App\Http\Requests\UpdateCartRequest;

class CartController extends Controller
{
    /**
     * Display a listing of cart items.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if(!$request->has('session_id')){
            return  $this->error('Please pass session_id in request',200,null);
        }

        $user_id=auth('sanctum')->user()? auth('sanctum')->user()->id : 0;
        $Cartitems=Cart:: where('session_id',$request->session_id)
                        ->orWhere('user_id',$user_id)
                        ->get();
        return $this->success([$Cartitems]);
    }


    /**
     * Store a newly created cart item in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCartRequest $request)
    {
        $data= $request->validated();
        $data['user_id']=auth('sanctum')->user()? auth('sanctum')->user()->id : null;
        return Cart::create($data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCartRequest $request, Cart $cart)
    {
        return $request;
        $cart->update($request->only('qty','session_id','product_id','user_id'));
        return $cart;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cart  $cart
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cart $cart)
    {
        return $this->success(null,null,204);
    }
}
