class Solution:
    def reverseArray(self, arr):
        # code here
        n=len(arr)
        for i in range(1,(n//2)+1):
            arr[i-1],arr[-i]=arr[-i],arr[i-1]
        return arr