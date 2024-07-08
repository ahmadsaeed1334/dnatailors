<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class CheckUserType
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, $userType)
    {
        // Check if the authenticated user has the specified user type
        if (Auth::check() && Auth::user()->user_type == $userType) {
            return $next($request);
        }

        // Redirect or return a response indicating unauthorized access
        return redirect()->route('welcome')->with('error', 'Unauthorized access.');
    }
}
