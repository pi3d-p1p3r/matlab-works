function schedule = roundRobin(n)
    if rem(n, 2) == 1
        n = n + 1;
    end
    
    numRounds = n - 1;
    numMatchesPerRound = n / 2;
    
    schedule = zeros(numRounds, numMatchesPerRound, 2);
    
    teams = 1:n;
    
    for round = 1:numRounds
        for match = 1:numMatchesPerRound
            home = teams(match);
            away = teams(n - match + 1);
            
            schedule(round, match, 1) = home;
            schedule(round, match, 2) = away;
        end
        
        teams = [teams(1), teams(3:end), teams(2)];
    end
end