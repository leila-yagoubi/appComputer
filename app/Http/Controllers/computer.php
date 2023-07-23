<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\computerM;
class computer extends Controller
{

    //aray
      function getData(){
        return ComputerM::all();
    }
function add( Request $req){

    $computerM = new ComputerM;

    $computerM->name=$req->name;
    $computerM->prenom=$req->prenom;
    $computerM-> description=$req->description;

    $result=$computerM->save();
    
    if($result){
return ["Result" => "data has been succed" ];
    }
    return ["Result" => "failed"];
    
}
function updatedata(Request $req){

    $computerM = ComputerM::find($req->id);
    $computerM->name=$req->name;
    $computerM->prenom=$req->prenom;
    $computerM-> description=$req->description;
    $result= $computerM->save();
    if($result){
return ["Result" => "update succed" ];
    }
    return ["Result" => "update failed"];

}

function delete($id){

    $computerM = ComputerM::find($id);
   
    $result=$computerM->delete();
    if($result){
return ["Result" => "deleted succed" ];
    }
    return ["Result" => "delted failed"];

}


    //-----------------------------------------------------------------------------

    public function index()
    {
      
    }

    //-------------------------------------------------------------------------------
    public function create()
    {
        //
    }

    //--------------------------------------------------------------------------------
    public function store(Request $request)
    {
       
        $validatedData = $request->validate([
            'name' => 'required|string',
            'email' => 'required|email',       
        ]);

        

        return response()->json(['message' => 'Data has been successfully stored'], 201);
    
    }

    //----------------------------------------------------------------------------------
    public function show(string $id)
    {
       /* $computer = self::getData();
        $index = array_search($computer,array_column($computer ,'id'));
        
        if($index = false){
            abort(404);
        }
        return view*/
    }

   //-----------------------------------------------------------------------------------
    public function edit(string $id)
    {
        //
    }

    //-----------------------------------------------------------------------------------
    public function update(Request $request, string $id)
    {
        //
    }

   //--------------------------------------------------------------------------------------
    public function destroy(string $id)
    {
        //
    }
}
