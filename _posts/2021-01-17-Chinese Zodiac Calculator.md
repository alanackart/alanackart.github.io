---
layout:     	post
title:      	Chinese Zodiac Calculator
categories: 	[Python, Zodiac, Astrology, Chinese, Calculator]
description:   	Chinese Zodiac Calculator
keywords: 		Python
topmost: 		true
---

Chinese Zodiac Calculator(12生肖计算器)

# code

```python
import unittest


class MyTestCase(unittest.TestCase):
    y2z = {
        0: 'rat',
        1: 'ox',
        2: 'tiger',
        3: 'rabbit',
        4: 'dragon',
        5: 'snake',
        6: 'horse',
        7: 'goat',
        8: 'monkey',
        9: 'rooster',
        10: 'dog',
        11: 'pig'
    }
    z2y = {v: k for k, v in y2z.items()}

    '''
    https://en.wikipedia.org/wiki/Chinese_zodiac#Years
    1924 is rat, 1924-160*12=4, 4 is also rat
    '''
    rat_year = 4

    '''
    limit the output of year
    '''
    year_end = 2200
    '''
    in a repeating 12-year cycle
    '''
    prime_period = 12

    def test_data(self):
        print(self.y2z)
        print(self.z2y)

    def test_year2zodiac(self):
        input_year = 2021
        i = (input_year - 4) % 12
        print(i)
        print(self.y2z[i])

    def test_zodiac2year(self):
        input_zodiac = 'pig'
        i = self.z2y[input_zodiac]
        year = self.rat_year + i
        table = []
        while year < self.year_end:
            table.append(year)
            year += self.prime_period
        while len(table) > 0:
            print(table.pop())


if __name__ == '__main__':
    unittest.main()
```

# reference

-  [Chinese zodiac](https://en.wikipedia.org/wiki/Chinese_zodiac)

