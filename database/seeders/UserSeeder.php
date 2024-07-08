<?php

namespace Database\Seeders;

use App\Models\Contact;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->delete();

        DB::table('users')->insert(array(
            0 =>
            array(
                'id' => 1,
                'name' => 'System',
                'email' => 'ahmadsaeed@gmail.com',
                'email_verified_at' => '2024-01-01 20:00:31',
                'password' => '$2y$12$dbqjyr7vqnK4qZH7qx/AteLihYv2MPqDJ5XQjwOFbozFn3TEp.nLW',
               
                'two_factor_secret' => NULL,
                'two_factor_recovery_codes' => NULL,
                // 'two_factor_confirmed_at' => NULL,
                'remember_token' => '$2y$12$R1d0/WS7EpoxPtQHXGxMeuI1t7nV7XI55GPx23mv1jEZLEmOl3nyK',
                'current_team_id' => NULL,
                'user_type' => -1,
              
            ),
            1 =>
            array(
                'id' => 2,
                'name' => 'Admin',
                'email' => 'admin@admin.com',
                'email_verified_at' => NULL,
                'password' => '$2y$12$dbqjyr7vqnK4qZH7qx/AteLihYv2MPqDJ5XQjwOFbozFn3TEp.nLW',
                'two_factor_secret' => NULL,
                'two_factor_recovery_codes' => NULL,
                // 'two_factor_confirmed_at' => NULL,
                'remember_token' => NULL,
                'current_team_id' => NULL,
                'user_type' => 0,

            ),
        ));
    }
}
