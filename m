Return-Path: <linux-renesas-soc+bounces-582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2C802955
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 01:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12DBA1C2042F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 00:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFE438D;
	Mon,  4 Dec 2023 00:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QiZthG+r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2114.outbound.protection.outlook.com [40.107.113.114])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CDFD9;
	Sun,  3 Dec 2023 16:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FFMi2mlXWoWCcWxwa1NxYLhOo1qd4eyROtARe9gn1qCHKz6p4WMqh3ZskUdmSf/6lHByZhYoT9bYfncSWeEE22bT5cls1zCtYKLjfsAcgU2LXjnXdu4SPiDmhtbI8kOZ5TypEd3LtoXsx2BoAiL1K8NzBc1p6nI/6TFRwsgtPE1W4OBIpBxLwEBC9eT2aSgWRte8mY2/y56YqJwbJpY6R5CrsvKyS4+F2JnxACFvnXyHngEILSEYMAJOBxurLvE8jLMSkuFZf9J+uqiNiBfGwfKNgxQL7fSn3AT/QVHofNhvayN1YiuG2q45txfgEqnn8dfKHHz2ojC6ux0QnO3ybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phHZuiaJdMGJxjEUc1PqVMMcApaCzlrHTu5MfFH/eUA=;
 b=fNUeyTt/E1jtAKqExEdMDQRj91vL0M3qVp4rgEceQLPhrMr5gvAg9xNPDLI173Zb0wWpA6c5rrfkcSQYicx4YNWa//S09H8KsuG8wsC7g29YegvIBuS2ri8jr1RmBCZHnn0aRk1Cb2qyfFbaiPCBhW2zIndNupNjt8yhH9skOlGqIjCd4X2h5ryahgCx2rw7FQl91usvrYqt8K5UYJzWbw5HsOi/OqdZYycyAVh/wQ6JMVU/LHoh0L5XmHDFTwQsxIw7syvkz52/RdOLmsv+crOBkqIyT2x+Jm1kLGtNti473BdWDE98iIIVdJqPrkIsBnKop31/TQ0HTL+GpM9DRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phHZuiaJdMGJxjEUc1PqVMMcApaCzlrHTu5MfFH/eUA=;
 b=QiZthG+r5MBh4PqZa4iAXNyYqQS1RBYxabLy2oe+TO9i+1WAQxMT+qOa6BcShkkz1KJedFLWvbfazNJdChGwhBNMAx68w8pZ0L+J50a2xCbZ8EcVNP3Oa0Rod0s6XY5JTk9LJe1iSRIssGzsFoBmTKPivdb9ZIdD8jfZL/pvufM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5338.jpnprd01.prod.outlook.com
 (2603:1096:404:8030::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 00:26:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 00:26:30 +0000
Message-ID: <871qc26ceh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Aymeric Aillet <aymeric.aillet@iot.bzh>,
	Yusuke Goda <yusuke.goda.sx@renesas.com>
Subject: Re: [PATCH 4/4] drivers: clk: renesas: enable all clocks which is assinged to non Linux system
In-Reply-To: <d7cd97fb5dd2f320fbf52bf96b8fe79d.sboyd@kernel.org>
References: <8734x9tda9.wl-kuninori.morimoto.gx@renesas.com>
	<87wmulrynq.wl-kuninori.morimoto.gx@renesas.com>
	<20231116192324.GB2821275-robh@kernel.org>
	<CAMuHMdU0Hqem8Ooehoo64rrGn8q8+5A8_DjGZd9Tvh=Xej6mdA@mail.gmail.com>
	<31afd614c5eb5e82a860fecfc1c21c39.sboyd@kernel.org>
	<871qca92s2.wl-kuninori.morimoto.gx@renesas.com>
	<d7cd97fb5dd2f320fbf52bf96b8fe79d.sboyd@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 4 Dec 2023 00:26:30 +0000
X-ClientProxiedBy: TYWP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5338:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca4913b-6f19-4b73-d4e5-08dbf45fa955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	64p2ayNjIO/xXaISj9WWwtSMRQry536mNg4d14tDEyPDKzG0XmoqA9aU+d5RQdV5nAn4s75UeKwfYktdgg0OzxMQDxjhgp6xn9ZCcYS4qww+57r8T1s+IsIkl4P3oEWfMsgv3Y2E1ugQNSG/raeXYpOzM0mktEY2LRmuDQHnwDd97lCPhyqx+iyJZh194VcAFO6uQlH0hcoUdv3X1fFfhABkqv+/R+n2aTcIIpMDylOV8IEBkTIFNBwN/IdB7Dh86lgY/wwlbV3yLZKiOcbdF7HAXtyX/fOeJTlE5HWeCGxzm5w13UhZ2WqqTG+0yWsWwpPoEv9jjCsgf6QkEqzaPSsQdd132gUdu9O1KP0G+jNT1ZZSN1IgcATJJVNX56bbT8QUN12nHKpMfG9dvzZKYDKrmMZ2+fVf6H9LqSnEC2HBHLIyZSSBYxgYdirt0bOMC38+icwctjJAgbBURyYTH+29/0PNlgOM2LcU66EhuxpHbniF4WY5CVtgEaapM72z9+JVFoELY+fgBxS+rW0cN6fT8CNmUFpIeTPXsxMN52uGn+JAe/DkAfi29ucdhLk8tsD6VuAE4KdAHEIQjs4rZs+HD4woLKOzxyu43sBhYpQQJ4DLVcwAFj9AQxE3tQfh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66556008)(66946007)(66476007)(316002)(6916009)(54906003)(6486002)(478600001)(5660300002)(38350700005)(41300700001)(36756003)(2906002)(4326008)(8676002)(8936002)(86362001)(83380400001)(2616005)(107886003)(26005)(6506007)(38100700002)(52116002)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MA+z42KbmIi/9oDtdyattMTB4ImbEvUgwpK/O3rWdqOV65JydC8ppCbhYr75?=
 =?us-ascii?Q?uF8O+sKmFCb35CT5VyNTx4bwB3gQByn3d6/bU/BG4aEFnts2rwKq6HBTyjW+?=
 =?us-ascii?Q?NAxDZVdv8zcAb5J2LctZ7000TzIzWoVO+ZF6M2Wa15l1Au6EllPlmtisYFvf?=
 =?us-ascii?Q?QqoGKxvupLOY3AN2QbrNx4d9Nls0t20r73OWFs71QkdJPIshKxstgq8xXiQg?=
 =?us-ascii?Q?hb/A+yceUdX3dmqN+AYVUPK94h5YwDrbRbI8SpVnuSdY3GCQLRkN8HfL/59F?=
 =?us-ascii?Q?eD1EDFFRYRek4PbVTg123H6RN0V3RS7+NU1B7hYoWY9mntrlwN3oaFDTs1fb?=
 =?us-ascii?Q?RhHgF4kg7nBYqAzXr3/+BlUKGRbiDjWt1a9m0904JSiu6D7Tah0fuk9y+SjR?=
 =?us-ascii?Q?G7YpN1fnHrm+/CWNw98FVMilxlPwaKJSXL+MKqHwsDZKvnhE27a9ro5ODf7S?=
 =?us-ascii?Q?bKMoGOy7/C11U0wbzM0dUaVmDaahVN/L1LgbekwqDZa+n6EcAo1YcbEEb8+p?=
 =?us-ascii?Q?YMuX5WGmEIvhG4DeQQ37jj82T2m2cOOIUfO37EOVMFxmiVDW/QDi+rG0JZS8?=
 =?us-ascii?Q?c8YMmsEIrcUaKioDjaDnYa+/3eH6cgdsQwf+PHWZkZ/FQEbdwpOVaGNe9PmB?=
 =?us-ascii?Q?sOEJsE3wPATuDgZ9DP3GVJRRLqhPDUi3XeslkP1fbXN93KoluOVG2xdrtkDk?=
 =?us-ascii?Q?W2uTEX7n+uPL/XXsre88QvkGOS4bq5E8EKxI4yNr7uJVMDQn2/uWxRqQaYgj?=
 =?us-ascii?Q?pPEVTs+TVx5ntvIBJO9KrLAGvdJ5R6zTh8lqtITi5MuYdW6mB33bCV8w8cri?=
 =?us-ascii?Q?WVQDkkwZqLOxBlStABpiatsCEttNfXBMNp2ffNzmUe0smxaP4g9jTRnihsBr?=
 =?us-ascii?Q?XQwLRuCJtJl788lc3NbBwiJcqBQZFYAji22+213c7EHQ5HGoVu6Kxv1dv5FA?=
 =?us-ascii?Q?9GMr6R+1J2b1r+FEG24FJ84/mX/Yy/fCeheCAEhmic4PK/UZIazzfhmKn4+C?=
 =?us-ascii?Q?7eqFVCALbv8zwUhVLNqP7HdWuzQdhzTk3PHjoZHpw36J0BUjcbziCTHofLyA?=
 =?us-ascii?Q?7Xrl2TzECZ8v8wJD33F7VFf9KbTgBxsvtOqNDPYHs3FJwlCgYjHwqY7gl78b?=
 =?us-ascii?Q?opzpPmRyp1JHFYaC6Mhdij3P34DDLEoKTVvTxya5Ce3HMFK4j/N2UT9wXJd2?=
 =?us-ascii?Q?ho2I1n8nYOH07GXvU6vluzXFQ0T2fii6SAY/qUC/oYNAeqrf/3AsvCFml9Ct?=
 =?us-ascii?Q?u0BK+Q7nugryl4JagNtpXQJvSoIztNmftupCbaQho3WszstQ1iSoKFAYJDyh?=
 =?us-ascii?Q?y+u3YvEgmwxE4UtkXef7vrL7cPDdHtlp9AcSJX/lSCfjCRJ0O57shZzJ0uxk?=
 =?us-ascii?Q?1oB0mB6d7nP8ARGNkL5EmCvsJ+OTAYWqv8uqMGUsJdEaq2XMj/s2XxFoZcFT?=
 =?us-ascii?Q?yXiZj8hkTxxvMfFwhBHbCCqNlSTUVkesm1x2Ch/vxyA1Pk0N6YectOj0MIkX?=
 =?us-ascii?Q?hgE2k6BwcROVY8B1VHZCuHlKZ88I3LKby8lTS2XjJp3F3zVa9RpoXsdSvTqp?=
 =?us-ascii?Q?5mHqRYuoFs2F1Iv1o5ersOf/HAIMczs83MmuHDiYW9Hlrg6sBKG3YBLs0YpT?=
 =?us-ascii?Q?wlDUawueC2xCnLpSkoeeOqQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca4913b-6f19-4b73-d4e5-08dbf45fa955
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 00:26:30.5096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6h6GD/OyR3s+nNhys6h8abCk4GNfcmJ0ckl1gH1U5QhWr9PDc8da0QAcQ6444wNrdR9RKXRLEFzabECVoNLHjnV9Iy+69sHTgVBEnAg6QvEZdaYytnqhKsOGjJhCpDD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5338


Hi Stephen

Thank you for your feedback

> In your case
> it sounds like you want to still be able to read the clk hardware? Does
> anything go wrong if you let some consumer get the clk and change
> settings? Do you want to prevent that from happening?

We want to do by this patch-set is to ignoring specific device/clk from Linux.
If Linux side change the specific clk settings, other OS side will get damage.

> I'm mostly
> thinking it may be useful to have this logic be common in the clk
> framework by having the framework search through DT and figure out that
> the only consumers are reserved and thus we should treat those clks as
> read-only in the framework.

"this logic" = "this patch-set idea" = "check status=reserved" ?

If so, now I quick checked the code. I think it is difficult or makes the code
complex if we try implement it on framework or common code.
Because the idea itself is very easy (= just adding the CLK_IGNORE_UNUSED),
but how to judge the clks is very vender/driver specific.
In our case, we need to think about total clock number, conver Linux
number to HW number, etc, etc.


# I will goto OSS-Japan conference after tomorrow, thus no response
# from me until next week.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

