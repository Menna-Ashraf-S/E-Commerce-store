class Rating{
 
 late int count;
 late double rate;

Rating({
required this.rate,
required this.count

});

Rating.fromMap(Map<String,dynamic>map)
{
  this.rate= double.parse(map['rate'].toString());
  this.count=map['count'] as int;



}

Map<String,dynamic> toMap()
{
  Map<String,dynamic>map=
  {
   'rate':this.rate,
   'count':this.count
  };

  return map;
}


}