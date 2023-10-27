using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Challenge3
{
    class Program
    {
        static void Main(string[] args)
        {
        //here we store in obj1 nested objects and strings
            
            var obj = new Dictionary<string, object>
                {
      { "a", new Dictionary<string, object>
        {
            { "b", new Dictionary<string, object>
                {
                    { "c", "d" }
                }
            }
        }
    }
};
             //here we store in obj2 nested objects and strings
            var object2 = new Dictionary<string, object>
        {
            { "x", new Dictionary<string, object>
                {
                    { "y", new Dictionary<string, object>
                        {
                            { "z", "a" }
                        }
                    }
                }
            }
        };        
       // here we declear with keys  
            var key1 = "a/b/c";
            var key2 = "x/y/z";
          // here we get the objects with Keys passing through the Extension method 
          // Extension method retrun the value that value store in this variables (Value1,Value2)
            var value1 = GetValueByKey(obj, key1);
            var value2 = GetValueByKey(object2, key2);
          
          // here we are printing the values in console
            Console.WriteLine("Value 1: " + value1);
            Console.WriteLine("Value 2: " + value2);
        } 
       // this is the Extension method      
        static object GetValueByKey(Dictionary<string, object> obj, string key)
        {
            //here we are spliting to the Keys
            string[] keyParts = key.Split('/');
          //Every key rotate in this foreach  loop
            foreach (var keyPart in keyParts)
            {
               // In this Condition need to pass the one key and nested object
                if (obj.TryGetValue(keyPart, out var nextObj))
                {
                    //here we get the key along with nested object count 
                    // If nested object count not it moves in else condition
                    if (nextObj is Dictionary<string, object> nextDict)
                    {
                        obj = nextDict;
                    }
                    else
                    {
                        return nextObj; 
                    }
                }
                else
                {
                    return null; 
                }
            }
        }
    
