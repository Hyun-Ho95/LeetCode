class Solution(object):
    def maxLengthBetweenEqualCharacters(self, s):
        dic = {}
        ans = -1
        
        for idx,k in enumerate(s):
            if k in dic:
                ans = max(ans,idx-dic[k]-1)
            else:
                dic[k] = idx
        return ans
                    