var qs = new ActiveXObject( "QTTabBarLib.Scripting" );
var path = qs.Arguments.Item(2)
// qs.Alert(path)
var wnd = qs.activewindow;
if( wnd )
{
    wnd.invokecommand( "run", path, 3 );
}   
else
{
    wnd = qs.invokeCommand( "NewWindow", path );
}