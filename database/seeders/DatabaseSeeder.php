<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Categorie;
use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();
        // \App\Models\Produc::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'ahmad saeed',
        //     'email' => 'ahmadsaeed30462@gmail.com',
        // ]);
        $this->call(UserSeeder::class);
      
    }
}
