<div>
   @foreach ($computers as $computer)
   <li>
    {{$computer['name']}} is form <strong>{{$computer['id']}}</strong>
   </li>
       
   @endforeach
</div>