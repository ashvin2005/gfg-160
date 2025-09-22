# Day 1 - Second Largest Element

# Find the second largest element in an array

class Solution:
    def getSecondLargest(self, arr):
        sett=list(set(arr))
        sett.sort()
        if len(sett)<2:
            return -1
        else :
            return sett[-2]

if __name__ == "__main__":
    sol = Solution()
    test_cases = [
        [12, 35, 1, 10, 34, 1],
        [10, 5, 10],
        [10, 10, 10]
    ]
    
    for i, arr in enumerate(test_cases, 1):
        result = sol.getSecondLargest(arr)
        print(f"Test {i}: {arr} -> {result}")
