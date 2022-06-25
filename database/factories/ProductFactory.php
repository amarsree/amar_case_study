<?php

namespace Database\Factories;
use Storage;
use Illuminate\Http\File;
use Illuminate\Http\UploadedFile;
use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Category;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ProductFactory extends Factory
{
    use RefreshDatabase;
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {  
        Storage::fake('local');
        $file = UploadedFile::fake()->image('file.png'); 
        return [
            'name'=>$this->faker->unique()->name(),
            'price'=>3.3,
            'category_id'=>function(){
                return Category::inRandomOrder()->first()->id;
            }, 
            "description"=>$this->faker->text,
           'avatar'=>$file,
        ];
    }
}
