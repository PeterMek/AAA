% Define your shape and start the game
triangle = [0,0;1,0;1/2,sqrt(3)/2];
chaosGame(10000,triangle,1);

function outPoints = chaosGame(n,inPoints,plotting)
% Set default as no plotting
if nargin<3; plotting = 0; end

% Draw a rectangle around the shape
xLower = min(inPoints(:,1));
xUpper = max(inPoints(:,1));
yLower = min(inPoints(:,2));
yUpper = max(inPoints(:,2));

% Find a reasonable domain to start in
xDomain = xUpper-xLower;
yDomain = yUpper-yLower;

% Find a reasonable start point
startPoint = [xDomain*rand+xLower,yDomain*rand+yLower];

% Initialize ouput points
outPoints = zeros(n,2);
outPoints(1,:) = startPoint;

% Iterate the chaos game
for i = 2:n
    chosenIndex = randi(length(inPoints));
    chosenPoint = inPoints(chosenIndex,:);
    outPoints(i,:) = (chosenPoint+outPoints(i-1,:))/2;
    
    % Plot every 50 points if the user chooses to do it live
    if and(plotting,~(mod(i,50)))
        plot(outPoints(1:i,1),outPoints(1:i,2),'r.',...
            inPoints(:,1),inPoints(:,2),'b*')
        drawnow()
    end
    
end

end
