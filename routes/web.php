<?php

use App\Livewire\ProfessorSchedule\ProfessorSchedule;
use Illuminate\Support\Facades\Route;

use App\Livewire\RegisterForm;


use App\Livewire\PersonalDetails;


// Route::get('/timetable', Timetable::class)->name('timetable');

// use App\Http\Controllers\CheckoutController;
// use App\Livewire\AdminOrders;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::middleware([
//     'auth:sanctum',
//     config('jetstream.auth_session'),
//     'verified',
// ])->group(function () {
//     Route::get('/', function () {
//         return view('welcome');
//     })->name('welcome');
    
// });

    
    // Add other admin routes here

// Route::get('/checkout-form', CheckoutForm::class)->name('checkout-form');;
// Route::get('/checkout/confirmation/{orderId}', [CheckoutController::class, 'confirmation']);
// // Route::get('/checkout/confirmation', [CheckoutController::class, 'confirmation'])->name('checkout.confirmation');
// Route::middleware(['auth', 'admin'])->group(function () {
//     Route::get('/admin/orders', AdminOrders::class)->name('admin.orders');
// });


// Route::get('/test', [TestController::class, 'index']);


// User Student 
// Route::get('/user-profile', UserProfile::class)->name('user.profile');

// // Route::get('/user-student', UserStudentComponent::class)->name('user-student-component');
// Route::get('/register-form', RegisterForm::class)->name('register-form');
// Route::middleware(['auth', 'check.user_type:-1,0'])->group(function () {
// Route::get('/time-slots', TimeSlots::class)->name('time-slots');
// Route::get('/dashboard', Dashboard::class)->name('dashboard');
// Route::get('/rooms', Rooms::class)->name('rooms');
// Route::get('/subjects', Subjects::class)->name('subjects');
// Route::get('/teachers', Teachers::class)->name('teachers');
// Route::get('/schedules', Schedules::class)->name('schedules');
// Route::get('/semesters', Semesters::class)->name('semesters');
// // Route::get('/departments', Departments::class)->name('departments');
// Route::get('/departments', Departments::class)->name('departments');
// });
// Route::get('/features', Features::class)->name('features');
// Route::get('/contact', Contact::class)->name('contact');
// Route::get('/payment', Payment::class)->name('payment');
// Route::get('/pricing', Pricing::class)->name('pricing');
// Route::get('/institute', InstituteCrud::class)->name('institute-crud');


// // Route::get('/teacher-timetable', TimetableTimetable::class)->name('timetable');
// Route::get('/teacher-timetable', Timetable::class)->name('teacher-timetable');


// Route::get('/student-timetable', StudentTimetable::class)->name('student-timetable');
// Route::get('/professor-schedule', ProfessorSchedule::class)->name('professor-schedule');
Route::get('/', PersonalDetails::class)->name('personal-details');
