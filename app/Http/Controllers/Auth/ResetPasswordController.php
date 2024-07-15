<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;

class ResetPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
    */

    use ResetsPasswords;

    /**
     * Where to redirect users after resetting their password.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    public function index () {
        return view('auth.passwords.recover');
    }

    public function store(Request $request)
    {
        // Validate the input
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|string|min:8|confirmed'       
                      
        ]);

        // If validation fails, return with errors
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        // Check if the email exists in the database
        $user = DB::table('users')->where('email', $request->email)->first();

        if (!$user) {
            return redirect()->back()->withErrors(['email' => 'The entered email is invalid.'])->withInput();
        }

        // Check if the passwords match
        if ($request->password !== $request->password_confirmation) {
            return redirect()->back()->withErrors(['password' => 'The password confirmation does not match.'])->withInput();
        }

        // Hash the new password
        $hashedPassword = Hash::make($request->password);

        // Update the password in the database
        DB::table('users')
            ->where('email', $request->email)
            ->update(['password' => $hashedPassword]);

        // Redirect to login with success message
        return redirect()->route('login')->with('status', 'Password has been reset successfully.');
    }
}
