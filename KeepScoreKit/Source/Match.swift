import Foundation

public class Match {
    
    public var activityType = ActivityType.Other
    public var homeTeamName = "Home"
    public var homeTeamScore: Int {
        get {
            guard let score = matchScores.last else {
                return 0
            }
            return score.homeTeamScore
        }
    }
    
    public var awayTeamName = "Away"
    public var awayTeamScore: Int {
        get {
            guard let score = matchScores.last else {
                return 0
            }
            return score.awayTeamScore
        }
    }
    
    public var matchScores = [MatchScore]()
    
    public init(activityType: ActivityType, homeTeamName: String, awayTeamName: String) {
        self.activityType = activityType
        self.homeTeamName = homeTeamName
        self.awayTeamName = awayTeamName
        matchScores.append(MatchScore(homeTeamScore: 0, awayTeamScore: 0, createdAt: NSDate()))
    }
    
    public func incrementHomeTeamScore() {
        if let lastScore = matchScores.last {
            let newHomeTeamScore = lastScore.homeTeamScore + 1
            let newScore = MatchScore(homeTeamScore: newHomeTeamScore, awayTeamScore: lastScore.awayTeamScore, createdAt: NSDate())
            matchScores.append(newScore)
        }
    }
    
    public func incrementAwayTeamScore() {
        if let lastScore = matchScores.last {
            let newAwayTeamScore = lastScore.awayTeamScore + 1
            let newScore = MatchScore(homeTeamScore: lastScore.homeTeamScore, awayTeamScore: newAwayTeamScore, createdAt: NSDate())
            matchScores.append(newScore)
        }
    }
    
    public func revertLastScore() {
        if (matchScores.count != 1) {
            matchScores.removeLast()
        }
    }
    
    public func reset() {
        matchScores.append(MatchScore(homeTeamScore: 0, awayTeamScore: 0, createdAt: NSDate()))
    }
    
    public func description() -> String {
        return "\(homeTeamName) \(homeTeamScore) : \(awayTeamName) \(awayTeamScore)"
    }
    
}

public struct MatchScore {
    
    let homeTeamScore: Int
    let awayTeamScore: Int
    let createdAt: NSDate
    
    init(homeTeamScore: Int, awayTeamScore: Int, createdAt: NSDate) {
        self.homeTeamScore = homeTeamScore
        self.awayTeamScore = awayTeamScore
        self.createdAt = NSDate(timeIntervalSince1970: createdAt.timeIntervalSince1970)
    }
    
}