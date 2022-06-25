<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Http\Requests\StoreProductRequest;

class ProductController extends Controller
{
    

    /**
     * Display all Products.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        return $this->success([Product::with('category')->get()]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreProductRequest  $request
     * @return \Illuminate\Http\JsonResponse
     */
    
    public function store(StoreProductRequest $request)
    {
        $Product=Product::create($request->validated());

        if($request->hasfile('avatar')){
            $file_name = 'product' . '_' . $Product->id . '.' . $request->avatar->getClientOriginalExtension();
            $request->file('avatar')->storeAs('public/products/', $file_name);
            $Product->avatar=$file_name;
            $Product->save();
        }

        return  $this->success([$Product]); ;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Product $product)
    {
        return $this->success([$product]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy(Product $product)
    {
        $product->delete();
        return $this->success(null,null,204);
    }
}
