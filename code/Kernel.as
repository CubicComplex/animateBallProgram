package
{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Kernel extends MovieClip
	{
		var ball1:ball;
		var speed:int;
		var direction:int;
		var dragging:Boolean;
		var NameArray:Array = new Array();
		
		public function Kernel()
		{
			// constructor code
			ball1 = new ball();
			ball1.x = stage.stageWidth/2;
			ball1.y = stage.stageHeight/2;
			addChild(ball1);
			
			addEventListener(Event.ENTER_FRAME, Update);
			ball1.addEventListener(MouseEvent.MOUSE_DOWN, DragBall);
			ball1.addEventListener(MouseEvent.MOUSE_UP, DropBall);
			direction = 1;
			speed = 5;
			dragging = false;
		}
		
		public function Update(e:Event)
		{
			NameArray.push("Bobby");
			NameArray.push("Boris");
			NameArray.push("Bob");
			NameArray.push("Bobinsonio");
			NameArray.push("Dave");
			
			var i:int; 
			for (i = 0; i < 5; i++) 
			{ 
				trace(NameArray[i]); 
			}
			if (dragging == false)
			{
				ball1.x = ball1.x + speed * direction;
				ball1.rotation = ball1.rotation + speed * direction;
			}
				if (ball1.x >= stage.stageWidth + 50)
				{
					direction = -1;
				}
			
				if (ball1.x <= -50)
				{
					direction = 1;
				}
		}
		
		public function DragBall(e:Event)
		{
			ball1.startDrag();
			dragging = true;
		}
		
		public function DropBall(e:Event)
		{
			ball1.stopDrag();
			dragging = false;
		}
	}
}
		
