var labelType, useGradients, nativeTextSupport, animate;

(function() {
  var ua = navigator.userAgent,
      iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
      typeOfCanvas = typeof HTMLCanvasElement,
      nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
      textSupport = nativeCanvasSupport 
        && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
  //I'm setting this based on the fact that ExCanvas provides text support for IE
  //and that as of today iPhone/iPad current text support is lame
  labelType = (!nativeCanvasSupport || (textSupport && !iStuff))? 'Native' : 'HTML';
  nativeTextSupport = labelType == 'Native';
  useGradients = nativeCanvasSupport;
  animate = !(iStuff || !nativeCanvasSupport);
})();

function init(){
    //init data
    var json = {
        id: "node01",
        name: generateNode("Glenn Dayton III", 1, "CEO", 3),
        data: {},
        children: [{
            id: "node02",
            name: generateNode("Trish Dayton", 1, "Worker", 0),
            data: {},
            children: []
        },{
            id: "node03",
            name: generateNode("Patrick Dayton", 1, "Worker", 0),
            data: {},
            children: []
        },{
            id: "node04",
            name: generateNode("Glenn Dayton IV", 1, "Senior Worker", 0),
            data: {},
            children: [{
	            id: "node06",
	            name: generateNode("Glenn Dayton IV", 1, "Senior Worker", 0),
	            data: {},
	            children: []
	        },{
	            id: "node07",
	            name: generateNode("Trish Dayton", 1, "Worker", 0),
	            data: {},
	            children: [{
		            id: "node08",
		            name: generateNode("Patrick Dayton", 1, "Worker", 0),
		            data: {},
		            children: []
		        },{
		            id: "node09",
		            name: generateNode("Patrick Dayton", 1, "Worker", 0),
		            data: {},
		            children: []
		        },{
		            id: "node10",
		            name: generateNode("Patrick Dayton", 1, "Worker", 0),
		            data: {},
		            children: []
		        },{
		            id: "node11",
		            name: generateNode("Patrick Dayton", 1, "Worker", 0),
		            data: {},
		            children: []
		        }]
	        }]
        },{
            id: "node05",
            name: generateNode("Trish Dayton", 1, "Worker", 0),
            data: {},
            children: []
        }]
    };
    //end
    //init Spacetree
    //Create a new ST instance
    var st = new $jit.ST({
        //id of viz container element
        injectInto: 'infovis',
        orientation: 'top',
        //set duration for the animation
        duration: 600,
        offsetY: 85,
        //set animation transition type
        transition: $jit.Trans.Quart.easeInOut,
        //set distance between node and its children
        levelDistance: 50,
        //enable panning
        Navigation: {
          enable:true,
          panning:true
        },
        //set node and edge styles
        //set overridable=true for styling individual
        //nodes or edges
        Node: {
            height: 50,
            width: 150,
            type: 'rectangle',
            color: '#ededed',
            overridable: true
        },
        
        Edge: {
            type: 'bezier',
            overridable: true
        },
        
        onBeforeCompute: function(node){
            //Log.write("loading " + node.name);
        },
        
        onAfterCompute: function(){
            //Log.write("done");
        },
        
        //This method is called on DOM label creation.
        //Use this method to add event handlers and styles to
        //your node.
        onCreateLabel: function(label, node){
            label.id = node.id;            
            label.innerHTML = node.name;
            label.onclick = function(){
            	if(true) {
            	  st.onClick(node.id);
            	} else {
                  st.setRoot(node.id, 'animate');
            	}
            };
            //set label styles
            var style = label.style;
            style.width = 150 + 'px';
            style.height = 50 + 'px';            
            style.cursor = 'pointer';
            style.color = '#333';
            style.fontSize = '0.8em';
            style.textAlign = 'center';
            style.paddingTop = '5px';
        },
        
        //This method is called right before plotting
        //a node. It's useful for changing an individual node
        //style properties before plotting it.
        //The data properties prefixed with a dollar
        //sign will override the global node style properties.
        onBeforePlotNode: function(node){
            //add some color to the nodes in the path between the
            //root node and the selected node.
            if (node.selected) {
                node.data.$color = "#e0e0e0";
            }
            else {
                delete node.data.$color;
                //if the node belongs to the last plotted level
                if(!node.anySubnode("exist")) {
                    //count children number
                    var count = 0;
                    node.eachSubnode(function(n) { count++; });
                    //assign a node color based on
                    //how many children it has
                    node.data.$color = ['#ededed', '#ededed', '#ededed', '#ededed', '#ededed', '#ededed'][count];                    
                }
            }
        },
        
        //This method is called right before plotting
        //an edge. It's useful for changing an individual edge
        //style properties before plotting it.
        //Edge data proprties prefixed with a dollar sign will
        //override the Edge global style properties.
        onBeforePlotLine: function(adj){
            if (adj.nodeFrom.selected && adj.nodeTo.selected) {
                adj.data.$color = "#eed";
                adj.data.$lineWidth = 3;
            }
            else {
                delete adj.data.$color;
                delete adj.data.$lineWidth;
            }
        }
    });
    //load json data
    st.loadJSON(json);
    //compute node positions and layout
    st.compute();
    //optional: make a translation of the tree
    st.geom.translate(new $jit.Complex(-200, 0), "current");
    //emulate a click on the root node.
    st.onClick(st.root);
    //end
        
    
    function changeHandler() {
        if(this.checked) {
            top.disabled = bottom.disabled = right.disabled = left.disabled = true;
            st.switchPosition(this.value, "animate", {
                onComplete: function(){
                    top.disabled = bottom.disabled = right.disabled = left.disabled = false;
                }
            });
        }
    };
    
    function generateNode(name, id, position, reports) {
	    var s  = "<a class='node-name' href='/user-info/"+id+"'>"+name+"</a><br />";
	        s += "<span class='node-pos'>"+position+" &middot;</span>";
	        s += "<span class='node-reports'> "+reports+" <i class='fi-torsos-all'></i></span>";
	    return s;
    };
    
    top.onchange = left.onchange = bottom.onchange = right.onchange = changeHandler;
    //end

}
