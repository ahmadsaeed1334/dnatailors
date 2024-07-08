<x-app-layout>
    <section class="main">
       
        <div class=" container-fluid">
        <img src="{{asset('assets/images/hill2.png')}}" id="hill2">
        <img src="{{asset('assets/images/hill3.png')}}" id="hill3">
        <img src="{{asset('assets/images/hill4.png')}}" id="hill4">
        <img src="{{asset('assets/images/hill5.png')}}" id="hill5">
        <img src="{{asset('assets/images/tree.png')}}" id="tree">
        <h1 id="text">TimelyGenius</h1>
        <img src="{{asset('assets/images/leaf.png')}}" id="leaf">
        <img src="{{asset('assets/images/plant1.png')}}" id="plant">
    </div>
    </section>
    
    <section class="mediaQ" style="margin-top: 160px; background: #359381;">
    <h1>What's We Provide</h1>
    
    <div class="slider">
        <div class="card-image">
            <div class="image">
                <img src="{{ asset('assets/images/automate.png') }}" alt="Automatic Timetable">
            </div>
            <div class="content">
                <h2>Automatic Timetable</h2>
                <p>Automated timetable generation that optimizes class schedules based on teacher availability, room allocation, and student course selections.</p>
            </div>
        </div>
    
        <div class="card-image">
            <div class="image">
                <img src="{{ asset('assets/images/panels.png') }}" alt="Multiple Panels">
            </div>
            <div class="content1">
                <h2>Multiple Panels</h2>
                <p>Comprehensive platform featuring admin, teacher, and student panels for efficient management and scheduling.</p>
            </div>
        </div>
    
        <div class="card-image">
            <div class="image">
                <img src="{{ asset('assets/images/pgres.png') }}" alt="Progress Notification">
            </div>
            <div class="content2">
                <h2>Progress Notification</h2>
                <p>Real-time updates and notifications on timetable creation progress.</p>
            </div>
        </div>
    
        <div class="card-image">
            <div class="image">
                <img src="{{ asset('assets/images/constraints.png') }}" alt="Customizable Constraints">
            </div>
            <div class="content3">
                <h2>Customizable Constraints</h2>
                <p>Enable users to define specific constraints like class size and teacher preferences.</p>
            </div>
        </div>
    
        <div class="card-image">
            <div class="image">
                <img src="{{ asset('assets/images/conflict-resolution.webp') }}" alt="Automatic Conflict Resolution">
            </div>
            <div class="content4">
                <h2>Automatic Conflict Resolution</h2>
                <p>Implement automated conflict detection and resolution features.</p>
            </div>
        </div>
    
        <div class="card-image">
            <div class="image">
                <img src="{{ asset('assets/images/user friendly.png') }}" alt="User-Friendly Design">
            </div>
            <div class="content5">
                <h2>User-Friendly Design</h2>
                <p>Ensure accessibility and usability across various devices.</p>
            </div>
        </div>
    </div>
    <style>
        .about {
            width: 80%;
            margin: auto;
            text-align: center;
        }
        .about h1 {
            margin-bottom: 20px;
        }
        .about-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            margin-bottom: 40px;
        }
        .about-section:nth-child(even) {
            grid-template-columns: 1fr 1fr;
            direction: rtl;
        }
        .about-section:nth-child(even) .text-box {
            direction: ltr;
        }
        .about img {
            width: 100%;
            max-width: 400px;
            height: auto;
        }
        .text-box {
            padding: 20px;
            text-align: left;
        }
    </style>
       {{-- <div class="about">
        <h1>About Us</h1>
       <img src="{{asset('assets/images/mission.jpeg')}}">
        <div class="text-box">
        <h2>Mission</h2>
                        <p>TimelyGenius is the culmination of months of hard work and dedication by our team of 
                            final year students at Arid University of Burewala.</p>
    </div>
    
    <img src="{{asset('assets/images/vision.jpeg')}}">
        <div class="text-box">
        <h2>Vision</h2>
                       <p>Empowering educational institutions with seamless, intelligent scheduling and management solutions for enhanced learning experiences.</p>
    </div>
    
    
    
    <img src="{{asset('assets/images/members.jpeg')}}" id="members">
        <div class="text-box">
        <h2>Unique Feature</h2>
                        <p> 
                            Our user-friendly interface makes timetable creation a breeze.Our user-friendly interface makes, even for novice users. 
                    </p>    
    </div>
    
    <img src="{{asset('assets/images/userneeds.jpeg')}}"id="user">
        <div class="text-box" id="user-text">
        <h2>User Needs</h2>
                        <p> we've prioritized user feedback and usability testing throughout the development 
                            process to ensure TimelyGenius meets the needs of our fellow students.</p>
    </div>
    
    <img src="{{asset('assets/images/recommendation.jpeg')}}"id="future">
        <div class="text-box" id="future-text">
        <h2>Future Goals</h2>
                        <p> We plan to continue refining and improving the platform, with the goal of making it accessible
                             to a wider audience in the future.</p>
    </div>
    </div> --}}
    
    <div class="about">
        <h1>About Us</h1>
    
        <div class="about-section">
            <img src="{{asset('assets/images/mission.jpeg')}}" alt="Mission Image">
            <div class="text-box">
                <h2>Mission</h2>
                <p>TimelyGenius is the culmination of months of hard work and dedication by our team of final year students at Arid University of Burewala.</p>
            </div>
        </div>
    
        <div class="about-section">
            <img src="{{asset('assets/images/vision.jpeg')}}" alt="Vision Image">
            <div class="text-box">
                <h2>Vision</h2>
                <p>Empowering educational institutions with seamless, intelligent scheduling and management solutions for enhanced learning experiences.</p>
            </div>
        </div>
    
        <div class="about-section">
            <img src="{{asset('assets/images/members.jpeg')}}" alt="Members Image" id="members">
            <div class="text-box">
                <h2>Unique Feature</h2>
                <p>Our user-friendly interface makes timetable creation a breeze, even for novice users.</p>
            </div>
        </div>
    
        <div class="about-section">
            <img src="{{asset('assets/images/userneeds.jpeg')}}" alt="User Needs Image" id="user">
            <div class="text-box" id="user-text">
                <h2>User Needs</h2>
                <p>We've prioritized user feedback and usability testing throughout the development process to ensure TimelyGenius meets the needs of our fellow students.</p>
            </div>
        </div>
    
        <div class="about-section">
            <img src="{{asset('assets/images/recommendation.jpeg')}}" alt="Future Goals Image" id="future">
            <div class="text-box" id="future-text">
                <h2>Future Goals</h2>
                <p>We plan to continue refining and improving the platform, with the goal of making it accessible to a wider audience in the future.</p>
            </div>
        </div>
    </div>
    </section>
    
    <section>
        </section>
    
    </x-app-layout>
    
    