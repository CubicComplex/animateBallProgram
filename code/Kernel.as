package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	public class Kernel extends MovieClip
	{
		var ball1:ball;
		var floor1:floor;
		var floorRot:uint;
		var speed:int;
		var direction:int;
		public function Kernel()
		{
			// constructor code
			floor1 = new floor();
			floor1.x = stage.stageWidth/2;
			floor1.y = stage.stageHeight-100;
			addChild(floor1);
			
			ball1 = new ball();
			ball1.x = stage.stageWidth/2;
			ball1.y = floor1.y-ball1.height+100;
			addChild(ball1);
			
			addEventListener(Event.ENTER_FRAME, Update);
			direction = 1;
			speed = 5;
			floorRot = 0;
		}
		
		public function Update(e:Event)
		{
			ball1.x = ball1.x + speed * direction;
			ball1.y = ball1.y + 1.5;
			ball1.rotation = ball1.rotation + speed * direction;

			if (ball1.x >= stage.stageWidth + 50)
			{
				direction = -1;
				floorRot = 0;
				ball1.y = ball1.y - 410;
			}
			
			if (ball1.x <= -50)
			{
				direction = 1;
				floorRot = 0;
				ball1.y = ball1.y - 410;
			}
			
			floor1.rotation = floorRot * direction;
			if (floorRot <= 15 && floorRot >= 0)
			{
				floorRot = floorRot + 1;
			}
		}
	}
}
