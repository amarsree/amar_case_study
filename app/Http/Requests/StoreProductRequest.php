<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Traits\ApiResponser;

class StoreProductRequest extends FormRequest
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
            'name' => ['required', 'string'],
            'price' => ['required','integer'],
            'category_id' => ['required','exists:categories,id','integer'],
            'description' => ['required','string'],
            'avatar' => ['required','image',
             'mimes:jpg,bmp,png,jpeg', 'max:1024', 'dimensions:ratio=1/1'
             ]
        ];
    }

     /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'dimensions'=>'image should me in 1:1 ration (square shape)'
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
