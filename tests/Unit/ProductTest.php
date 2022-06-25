<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\UploadedFile;
use Ramsey\Collection\Collection;
use Illuminate\Support\Facades\Storage;
class ProductTest extends TestCase
{
    public function test_products_url_exist()
    {
        $response = $this->get(route('products.index'));
        $response->assertStatus(200);
    }

    public function test_showing_singel_product()
    {
        $product = Product::inRandomOrder()->first();
        $response = $this->json('get', route('products.show', $product->id))
            ->assertStatus(200);
        $this->assertEquals($response->json("data")[0], $product->toArray());
    }

    public function test_for_all_products_list()
    {
        $products = Product::with('category')->get();
        $response = $this->json('get', route('products.index'))
            ->assertStatus(200);
        $this->assertEquals(count($response->json("data")[0]), count($products));
    }

    public function test_for_storing_product()
    {
        $product = Product::factory(1)->make();

        $response = $this->json('post', route('products.store'), $product->toArray()[0])
                            ->assertStatus(200);
        $product[0]["avatar"] = 'product_' . $response->json("data")[0]['id'] . '.' . $product[0]["avatar"]->getClientOriginalExtension();
        $response = $response->json("data")[0];

        unset($response['id'], $response["updated_at"], $response["created_at"]);
        $this->assertEquals($response, $product[0]->toarray());
        $this->assertDatabaseHas('products', ['name' =>$product[0]['name'] , 'price' =>$product[0]['price'] ]);
    }

    public function test_for_product_store_valadation()
    {
        $product=[];
        $data=$this->send_post_request($product);
        $this->assertContains('Validation errors', $data);
        $this->assertContains('The name field is required.', $data) ;
        $this->assertContains('The price field is required.', $data) ;
        $this->assertContains('The category id field is required.', $data) ;
        $this->assertContains('The description field is required.', $data) ;
        $this->assertContains('The avatar field is required.', $data);

        $product=[
            'name'=>'test'
        ];
        $data=$this->send_post_request($product);
        $this->assertContains('Validation errors', $data);
        $this->assertNotContains('The name field is required.', $data) ;

    }

    public function test_for_price_valadation()
    {
        Storage::fake('local');
        $file = UploadedFile::fake()->image('file.png'); 
        $product=[
            'name'=>'test',
            'price'=>1,
            'category_id'=>function(){
                return Category::inRandomOrder()->first()->id;
            }, 
            "description"=>'diac',
           'avatar'=>$file,
        ];

        $response = $this->json('post', route('products.store'), $product)
        ->assertStatus(200);
        $response->assertSessionHasNoErrors();
        
    }


    private function send_post_request ($data){
        $response = $this->json('post', route('products.store'), $data)
        ->assertStatus(200);
        $response->assertSessionHasNoErrors();
        $response=collect($response->json());
        $response=$response->flatten();
        return $response;
    }

}
