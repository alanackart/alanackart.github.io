---
layout:     	post
title:      	Fault Tolerance
categories: 	[Design, Bug]
description:   	Fault Tolerance
keywords: 		Bug, Fault Tolerance
topmost: true

---

一家客户数据更新会全量覆盖所有客户设置, 在有过滤项时，只发了一个客户的设置，其他客户的设置数据被清掉了，其他同事的bug

# 线上问题

如上所述, 设置是场务(Production Assistant)人员做的

# 反思

- 从设计角度来谈， 在一家客户的数据发生变动时，全量更新所有客户的数据是很危险的动作，开发上的Bug倒是次要的。
- 从测试和软件设计的角度来说，重要操作应该要考虑各种使用场景，另外，不允许在生产环境操作未经测试的功能。

# Readlist





