<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\LoginRequest;

class AuthController extends Controller
{
    /**
     * create a new user and respond with API token
     *
     * @return \Illuminate\Http\Response
     */
    public function register(RegisterRequest $request)
    {
        $data=$request->validated();
        $data['password']=bcrypt($data['password']);
        $user = User::create($data);
        return $this->success([
            'token' => $user->createToken('API Token')->plainTextToken
        ]);
    }

    /**
     * login function 
     *
     * @return \Illuminate\Http\Response
     */
    public function login(LoginRequest $request)
    {
        
        if (!Auth::attempt($request->validated())) {
            return $this->error('Credentials not match', 401);
        }

        return $this->success([
            'token' => auth()->user()->createToken('API Token')->plainTextToken
        ]);
    }

     /**
     * logout  
     *
     */
    public function logout()
    {
        auth()->user()->tokens()->delete();

        return [
            'message' => 'Tokens Revoked'
        ];
    }



     /**
     * will return seesion id, we can call this methord at the very first request  
     * we can store that seesion_id in local stroage in broswer so that we can pass 
     * in next requests
     */
    public function generateSession()
    {
        return Session::getId();
    }


}
