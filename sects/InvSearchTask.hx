// search for investigator

package sects;

class InvSearchTask extends Task
{
  public function new()
    {
      super();
      id = 'invSearch';
      name = 'Search for investigator';
      type = 'investigator';
      points = 50;
    }


// check if this task is available for this target
  public override function check(cult: Cult, sect: Sect, target: Dynamic): Bool
    {
      if (!cult.investigator.isHidden)
        return false;

      return true;
    }


// check for task failure
  public override function checkFailure(sect: Sect): Bool
    {
      if (!sect.cult.hasInvestigator || !sect.cult.investigator.isHidden)
        return true;

      return false;
    }


// on task complete
  public override function complete(game: Game, ui: UI, cult: Cult, sect: Sect, points: Int)
    {
      if (cult.investigator == null || !cult.investigator.isHidden)
        return;

/*
      // failure
      if (Math.random() > 0.8)
        {
          ui.log2('cult', cult, 'Task completed: Investigator found.');
          return;
        }
*/

      cult.investigator.isHidden = false;
      log(cult, 'Task completed: Investigator found.');
    }
}
