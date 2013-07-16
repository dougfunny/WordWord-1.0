package
{
	public class node
	{
		public var left:node;
		public var right:node;
		public var value:int;
		
		public function node(c:int):void
		{
			value = c;
		}
		
		public function add(c:int):void
		{
			
			
			if(c == value){return; }
			if(c > value)
			{
				if (right != null) right.add(c);
				else right = new node(c);
			}
			else
			{
				if (left != null) left.add(c);
				else left = new node(c);
			}
		}
		
		
		public function contains(c:int):Boolean
		{
			
			if(c == value) return true;
			if(c < value) 
			{
				if(left != null) return left.contains(c);
				else return false;
			}
			else 
			{
				if(right != null) return right.contains(c);
				else return false;
			}
			
			
		}
		
		public function toString():String
		{
			
			var out:String = "";
			
			if(left != null) out += left.toString();
			out += value + ", ";
			if(right != null) out += right.toString();
			
			return out;
			
		}
		
	}
}



