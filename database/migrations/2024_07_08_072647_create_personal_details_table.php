<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('personal_details', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('phone_no');
            $table->string('address');
            $table->date('date');
            $table->decimal('bust', 5, 1);
            $table->decimal('waist', 5, 1);
            $table->decimal('hips', 5, 1);
            $table->decimal('bicep', 5, 1);
            $table->decimal('thigh', 5, 1);
            $table->decimal('calf', 5, 1);
            $table->decimal('weight', 5, 1);
            $table->timestamps();
        });
     
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('personal_details');
    }
};
