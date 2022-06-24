<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Traits\ApiResponser;

class RegisterRequest extends FormRequest
{
    Use ApiResponser;
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users,email',
            'password' => 'required|string|min:6|confirmed'
        ];
    }

      /**
     * Return  error messages when valadationo faild
     *
     * @return array
     */
    protected function failedValidation(Validator $validator)
    {
         throw new HttpResponseException(response()->json([
            'status' => 'faild',
            'message' => 'Validation errors',
            'data'    => $validator->errors(),
        ])); 
        
    }

}
