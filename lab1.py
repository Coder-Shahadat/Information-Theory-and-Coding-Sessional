import heapq
import os
from collections import defaultdict

def calculate_frequency(my_text):
    frequency = defaultdict(int)
    for character in my_text:
        frequency[character] += 1
    return frequency

def build_heap(freq):
    heap = [[weight, [char, ""]] for char, weight in freq.items()]
    heapq.heapify(heap)
    return heap

def build_tree(heap):
    while len(heap) > 1:
        lo = heapq.heappop(heap)
        hi = heapq.heappop(heap)
        for pair in lo[1:]:
            pair[1] = '0' + pair[1]
        for pair in hi[1:]:
            pair[1] = '1' + pair[1]
        heapq.heappush(heap, [lo[0] + hi[0]] + lo[1:] + hi[1:])
    return heap[0]

def huffman_code(tree):
    huff_code = {}
    for pair in tree[1:]:
        char = pair[0]
        code = pair[1]
        huff_code[char] = code
    return huff_code
