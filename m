Return-Path: <linux-renesas-soc+bounces-26342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670ECFD3AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 11:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2D54302B130
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 10:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43B72FB983;
	Wed,  7 Jan 2026 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GqrRVKrv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683B813D539;
	Wed,  7 Jan 2026 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782070; cv=fail; b=tBlpSyj2aaJd+G4AiSiZauC+yJxHEvir+gTqOQfUzyOOTms+lXDMmJxuMsCNIj1jj1/tiVMRLoXNTf31YGavbnenWQJwyEeS/l8cnBq2j4SUMnhi3acqjWuwCh5CXtxTO/6qxMMei7nT6OxJA90SRjnFhw6X38HiMfj1IHRYwVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782070; c=relaxed/simple;
	bh=thFA3KwwYwWfpMUZmgO9qjcpMkoTbCoIAScrSDU254o=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SR4/1uX+nDiPehJAGrmauNJ7G/+78dD8E8sUtIrmNk6T8mOkJB7jEo7/57wEhFo0LZ5aOIa2ScukLLdTTfDPjYO+Alpk6TOm/jbv9fHI1Qt4ULnyifc8aMia14gf/bwAUTy6gjS43sNAPq0SWjzpdVYI7jjrWfN/IBRNFBFr44k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GqrRVKrv; arc=fail smtp.client-ip=52.101.125.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wX9mK58mLUl6u8JTLXiVhZG3eKmubzEzD+vMXl8AXq9zH6Sh1dPg5Tko9h+MMsk3rgHvhxS/P1sglH3ewcP1Z4It7oVkfBxzyNRy0xXNZNeuo2CQiicQ89fadnqCkv2USD9tVIJHQKOSVd3ywEtRwfoDgOaj5p3W9j8BBnagjFUTI/aixOF6nCQc9QPYwLdictPTHL6pJ1k9/PHEn2yhaWAt8BZQ5H/ffVZSoP4oquack50NPU9oPYR1acoWdiukWjxHoWlMd6Tw1m1JrSTaPJH/YHkwnnWXcWoYSxbKVLajnWwDuM+k1tRrIn7GRqyEBydXXqSgqwK68etT2Mw2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOjudUeqKqsEWBSySU9qqIeKqrR9p+FrmRgclKw8FlI=;
 b=n5gZAEO+JmQpRl2cwuayC18G2fIe9z3a8IfuxImmq9KKw2rRsOAU+sAAi0DNyRfyhteSUVi1rD1hRNgaf5VExL0ne7tWwob39hfJoP+oWxKlqUayW4PeCSy3KzC/bADaSEZ8NO7At/+2xB+DOh5HhXK/Fsfu3RO/yuIv3DxkiJc2YcY7eEgHRvh4AexqiwWKFzxu7Bbztt+AT5+yOZlAjHQXZM7B1NxZTT9+wy0pfrKpOytpVOL6TuXu8BodNJOs3uQlHsr9EwlAmpvpkxT6MgtA7FvUW7jgykysfXRR/3B0gg0ByKh6q0MqKqZ5pXe8TlXHKc7VjtWH6qaK/pdBWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOjudUeqKqsEWBSySU9qqIeKqrR9p+FrmRgclKw8FlI=;
 b=GqrRVKrv6Mxhe+jghtK+a7bH0OecJYuM/Uol9YLnxvIpmNo/TTHsdF9nd5yByhG1mhVsvHaXzTD7MHpAOZwyu8fpxOR6j0BqX07AgyHKI7gLWStCOHQ+dbDhQLOQOlp4nEhu1YZK1KOSRTHYhyYuoVlnyD51ehwGBOO+mNX8N8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB7842.jpnprd01.prod.outlook.com (2603:1096:604:1b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Wed, 7 Jan
 2026 10:34:20 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 10:34:20 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] i3c: renesas: Add suspend/resume support
Date: Wed,  7 Jan 2026 11:33:46 +0100
Message-ID: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0368.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cde23b-0f70-4a7e-08f7-08de4dd850f4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vh3/TTkiaPYG+SjnTX+gCNSaStpf+cp64ZE4C/3A9NYzQYtJ2kCVEI0kNV8+?=
 =?us-ascii?Q?dO6YwIF9to9pz8Y2vz0FqP+y6e71mxHT3jJuVWWakmAFnbaMCQBZDIOCgoDv?=
 =?us-ascii?Q?FeUzxQ15IpSV07fWTFP0Mu0ZBKtYYIZhAL0hn95m5/xB2XSUUUMaqfAVsiP5?=
 =?us-ascii?Q?uVEG1X76mPQE9o5xC/wtl2kA4Banr5Wv1Q/L5SocZyiBaR+80hPc5yGx1w3G?=
 =?us-ascii?Q?rnwDQYqIwnninqTz2Q32abI50PYzbElWvpSfCadEu2+gz/oGfYqyKGO4l79S?=
 =?us-ascii?Q?6FWZHdivERS7lMgpxpjPwQiLNT35F5+7K4HNnWq2Dp7lfBB7t4zShpdXbMm4?=
 =?us-ascii?Q?X1+sCSCDtOQ06abzMMavrEGqqn0RGQvNsiCU3Gqm+PVtNIsWOJdfcz3Xd0gm?=
 =?us-ascii?Q?u67YKRF9yWj3epujnX766UfrVE9DMFLqNv8laiXeD+D7B/ur+Gk9GPEi7DWF?=
 =?us-ascii?Q?lXWyVOtBSkKtTh1h8QmGQECo1k2/h/tiIg7u38CSIqLWpw44Ok2s6aRO8bm3?=
 =?us-ascii?Q?9uAed1s71EoogfLoQVZI3ZMVH0C0fQ8VSNcfS+9j+K2I2wIEqiGAoCsKEQ8r?=
 =?us-ascii?Q?sS8ryGRSRWZRg8o8wukU93WHNRNEMHSpoD3h/zuX2QwvZqVayrylyY6rVL0T?=
 =?us-ascii?Q?m/NyyUYBuKABwendfO4PmcuMJ0ieeJbh4+GELCnWLwY0Ajw4BzJUdcpvWuzR?=
 =?us-ascii?Q?KBBetUuVkci2qFTaZsVUwlOIjlDSLKYAyRZQsPFv5e2tWuWY8gCk53pTAJGM?=
 =?us-ascii?Q?iIzifjuedBaf/DzB68Nej2su+4pBqXvxpaWNGO6qPoAnDWI3owDUyN91Lfzp?=
 =?us-ascii?Q?hjUQbik6B2eLA0cHRAWjdVGAquPMrnaEYWB8iAeW/hIdAxWhvbO5+4pPjJXf?=
 =?us-ascii?Q?cpBj6i7/mp+IySwsRx8S3gc2pNYN1P1Oykur81uKrnkE67JrsXyATs09rw/p?=
 =?us-ascii?Q?6ljWeq/RDdp93xVXrMzDuN7t6RPFa3VgmnmzITj6nPbNkRjndmBRTP69K6c5?=
 =?us-ascii?Q?zA+I53yz6m9rYW82wj8KVzeRGLBl82VyWXGUn5wvgLb1vf3HLgQAZwrFDpjU?=
 =?us-ascii?Q?T+EB4GExmQWGhtaKr20i4EO7KwIqtwwRonKycSPELdxUJWHqlg9/5hWy+Qsj?=
 =?us-ascii?Q?g7KcPIGgeJlboF0fYlLHLrq2tcNrqzY6dCI7ITSHOv8X0rHTzdoBb82Zc/Cq?=
 =?us-ascii?Q?SvYLzvHHR8fUddOjtEgfexzBIa26zMSPSxGaST+XhRddcevrW6EWVAk10zQX?=
 =?us-ascii?Q?2S/jAYN33R0y2+sKB1VYhi6Swzw4d734G77JVdSk8QagNCk0+UjUDtzzN321?=
 =?us-ascii?Q?ygs0O5skltxe6Udi6W2uXMuCPHFBkbV7eTuUeqfqfAOzAnEf1k/hU1/PMPTJ?=
 =?us-ascii?Q?64D5Gg04t6FCh3a0tVXMhlQQPIVoxiZy2lFglarL1aCVoYeIFHMQrnQc9fCp?=
 =?us-ascii?Q?ZnbS8TGJik58lnTCMfoN4pNysUtNrAnXjGPhb6BdctDmywG7ZU3nl9jVw7Xe?=
 =?us-ascii?Q?OBNCFVVKbCCwKLOQuVhKNJB2srzSLyfp/r1T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2fQ4lTgzxiYbsw6tmPTNWdrjc08LjarngDoQPIbnqopXv7LDcKqAJLHERPEU?=
 =?us-ascii?Q?h2tYw3DM6v+5/pC9x/HCDVre/sI0/UylS8ylroKllEhY8BHViXLdqN2O9bzi?=
 =?us-ascii?Q?RCg95ly8SodT+sZN8dB6/WmWeIsHQCd1ChTJ6PuPf5fL9A3SqnTPN6i7kpKn?=
 =?us-ascii?Q?H2Ccyqg1atQmou+umUzmB8GX87pRZvZKpgyZZQEKJfm6Zzw7eQ2GFhXLWHnh?=
 =?us-ascii?Q?BPG4G8YSJS9XWfzX5xi1Canh7P1uhgyZatR1vwVGysJ2pN0332g6qjp4MR+o?=
 =?us-ascii?Q?Dm0WLGWFu7U4R4bFmZWn4Ir9FpKX17KilLQjwkGW0/SD8Jm0ZWi9u89PNFxs?=
 =?us-ascii?Q?PAi+o8CNHm79xrNiodHAKh3C6cjdhRVFaP3aWSvr/sKOfrpU78l6zXkNZ73S?=
 =?us-ascii?Q?4uFqmWuI3zBFGHd3MFsIUP1FpjLB8pepCJ9hHLOttKmUnlv+1cYJrh9mv72C?=
 =?us-ascii?Q?N6hUrGHni/ABAiEdjdyyfXjXZsgewI1rGX2qsCYQ+ojJg2hfZGuY/kBnIz07?=
 =?us-ascii?Q?wtIfAR122e8PE0PB8VoggxYdFAkIHPbn+NqTEfLxzfq6S4iMe/GgkDcj+Boz?=
 =?us-ascii?Q?V1YkonbR7soRdOBmyvWj9b0rKHN1PtOyPAwgCOXt4Xizzaz290YVib79KkSp?=
 =?us-ascii?Q?YtyR4s5AWzGp4Z+/+l5prxwGvosk4euPqDoRdgc8ZU/r1maGgwvUqkuzV+MI?=
 =?us-ascii?Q?DaPNle9feuYeZHQXvDOxQ29QNW7QOgSw6lykUVmrNLXpC6kdWernbiOVPLI/?=
 =?us-ascii?Q?zYUWF9AguuQPGa1La0jU5qsbQKoBD/TGTde9GMuZNU9vZRTaM5Su2WrfBPBB?=
 =?us-ascii?Q?LAqI5UXQfz+mHPcqTMbi2jOdsXa40AWcaibnalqFyc8tT7NO/b2nv7xNNzWK?=
 =?us-ascii?Q?7mJM7exaUp9FHJXvrhyfxcvdkQU/+gwBZ27BJreMInFdWOgizy108lRAfgpQ?=
 =?us-ascii?Q?/kZDw1IEWVIFA0U9k60azQ52xBCHE916SYoZcCOQ7utC8BSMZJzHH7IkfQAp?=
 =?us-ascii?Q?royyllRsyU+8VZPKksbkcYMmtUw4g6MWmegnAth02Y/YWNwSiOBG1jxf6RbJ?=
 =?us-ascii?Q?439zMb70ToSR+4RRzDRZMIGha4KyREOve+Wlhl5qGhPdOUWQXjBLBJ36dGyv?=
 =?us-ascii?Q?lohWUvxuj9/HhIOGdC0lUxLzvAtplFyW+APYoHzWRkDenH1dxLc8SjoQEumk?=
 =?us-ascii?Q?8+IS0SC0vy4py4LeFKnN5wvwheO7hwDofZ4dLZHluosG45N8IthxtrLGTjhk?=
 =?us-ascii?Q?IwBHu2nrPFafCWkAduXT6vt+K5IOOn0Y0zZsOxaIZIsTF2i5XhigsXyqaGeE?=
 =?us-ascii?Q?v1jiOqiY8BrgWaQy46E7Vkae3I2+cNiGHazdzZrXUrGCadjCmPOW2uIfKFDh?=
 =?us-ascii?Q?NbwGmMB9tnUKQx8+L6vkSXHFpHNBBHOEm90suFCN0KW5ngVc+B4pbfkZFjWG?=
 =?us-ascii?Q?qIJTCtU35//yHAbh+tIjW0MaFhab8lQ2DphRyXORGh/8JBIqQC4aYBB6gr3K?=
 =?us-ascii?Q?KlxtUnTP/lkf3C+PlPfvWbcoeo5vDJW1k/tTWaaoyrJRusm+ZuaLrjvg55uj?=
 =?us-ascii?Q?Yogns7aIXotXcqMC3NMaaGeXt83sQM1xj6vImQCtpxW55aJ4BIIou+XEwtVC?=
 =?us-ascii?Q?znKsxH0y2A4WSrrIeuM6LWo79k+ihWcSdog8E1FTfRbH678D+NM15WcNc/v9?=
 =?us-ascii?Q?pQIPdjrp/ZW6FgBxnHYTwlYbxiR6uIRNNppoBuTWuaCFMTpVNLMj0Hmk6mBd?=
 =?us-ascii?Q?1qTqzNkz/lrUFb0Ce1EsMMWqe5OZAE8Z0e1I5wk2IAW43rM8qtml?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cde23b-0f70-4a7e-08f7-08de4dd850f4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:34:20.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RI+FjQ+XkihGicdyyWIE+O80wx7jU5XF4sDqo2DJBR/NPskve5weA1GG0keIVY+37Zau7vLl/i/jC9h5eoAP/JizYgJQAnxM0WX7UT5O7aus1B4SEuoT3vSH5T3tsCJX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7842

Dear All,
This series adds suspend/resume support to the Renesas I3C controller driver.

Thanks & Regards,
Tommaso

v4->v5:
 - Rebased on top of next-20260107
 - PATCH 1/4:
     - Improved check for clk_bulk_get_all_enabled() failure into
       renesas_i3c_probe().
 - PATCH 2/4:
     - Moved presetn and tresetn reset controls renesas_i3c struct
       entries above num_clks to avoid padding.
 - PATCH 4/4:
     - Collected tag.

v3->v4:
 - Rebased on top of next-20260105
 - PATCH 1/4:
     - Collected tag.
 - PATCH 4/4:
     - Use clk_bulk_disable/enable() into renesas_i3c_suspend/resume_noirq()
       instead of clk_bulk_prepare_enable()/clk_bulk_disable_unprepare()

v2->v3:
 - PATCH 1/4:
     - Added define for TCLK index.
     - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
     - Improved commit body.
     - Dropped unnecessary static const char * const renesas_i3c_clks[].
     - Removed the need for per-SoC clock handling and the renesas_i3c_config data.
 - PATCH 2/4:
     - Collected FLi tag.
     - Improved commit body.
 - PATCH 3/4:
     - Collected FLi tag.
     - Improved commit body.
 - PATCH 4/4:
     Fixed error path into renesas_i3c_resume_noirq() and
     renesas_i3c_suspend_noirq() function.

v1->v2:
 - Split patches into smaller chunks.
 - Use clock bulk API.
 - Update patch 4/4 accordingly.

Tommaso Merciai (4):
  i3c: renesas: Switch to clk_bulk API and store clocks in private data
  i3c: renesas: Store clock rate and reset controls in struct
    renesas_i3c
  i3c: renesas: Factor out hardware initialization to separate function
  i3c: renesas: Add suspend/resume support

 drivers/i3c/master/renesas-i3c.c | 259 ++++++++++++++++++++-----------
 1 file changed, 170 insertions(+), 89 deletions(-)

-- 
2.43.0


