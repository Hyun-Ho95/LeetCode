class Solution(object):
    def minDifficulty(self, jobDifficulty, d):
        """
        :type jobDifficulty: List[int]
        :type d: int
        :rtype: int
        """
        # 작업의 개수  n
        n = len(jobDifficulty)
        
        # dp(Dynamic Programming : 동적 프로그래밍) 테이블 생성
        # i번째 작업까지 고려하고, j일동안 작업을 완료하는 경우 최소 어려움 저장
        dp = [[float("inf")] * (d + 1) for _ in range(n + 1)]
        dp[0][0] = 0
        
        # 작업 개수 추가 
        for i in range(1, n + 1):
            # 현재날짜의미 
            # 최대 예정 날짜 d / 현재 작업 수 i 중 더 작은 값 선택
            for j in range(1, min(i + 1, d + 1)):
                # 현재 날짜에서의 최대 어려움
                max_difficulty = 0
                # 현재까지 작업 중 가능한 모든 조합 고려
                for k in range(i, 0, -1):
                    # 현재 작업의 어려움 중에서 최대 값
                    max_difficulty = max(max_difficulty, jobDifficulty[k - 1])
                    # 새로운 작업 추가했을 때 최소 어려움 갱신
                    dp[i][j] = min(dp[i][j], dp[k - 1][j - 1] + max_difficulty)
        return -1 if dp[n][d] == float("inf") else dp[n][d]