Return-Path: <linux-renesas-soc+bounces-26185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D9FCE9704
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 11:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 280C8303C80C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Dec 2025 10:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFF42E040D;
	Tue, 30 Dec 2025 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Y3Pr0Bp+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6932BF00B;
	Tue, 30 Dec 2025 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767091236; cv=fail; b=AjwT0gC83mi71yyqzbVbMywvESlAx9U5lGNjyDAE82eCO+SNhAMoPwsCB5VPYoSM3L/zoHsaRBRnD5DTA8ZC2H5dl8j5r1eFDZx/8Hfms5bLz3qyJMLxeExp3t8DpW+VbyVvrXiz+PczRnYI/1bGLgZ5H8jNjOfHJLuZnaCndDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767091236; c=relaxed/simple;
	bh=QnSxPreFheszigty9xLfILbIprFRjz00PMiRU7c/02s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qVqj+JxudElSgCiEXo0H/8rZijNdpwXXRxx+UDK9gd9MOhLsbyu77/lvB3wCR0QzAPSizErgc931XHOQeTZFvtkf+0OIzM4ZT6J6TKb3Sb9osGC1W/HMUnsZlf3SOiOBed+4Rqsn2vNGgQHcaVSEIGHR1k3wiVxHlqqsDfMsL5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Y3Pr0Bp+; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0pww1W7E8mFqPm+OHy/KGYft+8MZYEjI4qpCWHJbhXorJqhAq8p3bBssfjfmIsib4Nkf7dfRNPJnyg+sSK4Qv73qn+QxhmiPKwAMCcPwd0MXqA4Fl/6kPBahUHHV+YCC+rTBcRG7yVV2fTUq2wepCM7LfWU3IuS8CYv95Bg6zE495u5TgZhr2s0fYJE2lQ7Zb6wagrSah+F/JLobZYjWiGz5cTLDjmKwSTbAESCbsPW4rgMxhDaX/jkjKGr/TiXQLAmj40JHgUjrH7U0tHqCf/x8kHxdGpmsU+fKsCjmP5R/sZiZ8qvQbHOxfE3xE3KNWRnrZvOPyqbS46ciKk6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+xyvQfHknbG5K+9pvIEx+KU2bn9sXTktx4gYcCzivg=;
 b=JAu/ylMGnrDJKONncZyZTwwRVWuwwmj3wBF/N7WE+CS+vN/wLEEwO6slQrCGVQTQDDfZy7jtVex9Wu1E+6TkMnFxMZyzm3qcSnr25wGSvAdUmPAQmntDzTcBVBXluEV8CftW5tCZJrulPGxFM1YkOe1+AaOPhzldzLk74gK+xPej9jln4tPUoe8OI6VFo9TNwSXGqoOvpXvPDXtefZY3rZ7EqGcuIioIkXgM0WcUANOyr7/n0dUOwmiBDu2pqKqYzj4Y4zw1G2Z0GZRkHMv87CXgoTIdwx6C+/bK/7+yY3VGa7vH62fPdgnLieuKEC58gMZPJqZrY8ZyGnKcRBpPZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+xyvQfHknbG5K+9pvIEx+KU2bn9sXTktx4gYcCzivg=;
 b=Y3Pr0Bp+RLPbvtu90sSo7mA0Hg38bqCkrcF0rZoGH39+pCrwggmVdm76o4A0GFKRzP+73vlsnSM2iy1A77GviG43z0orl0Vxg2mZUc9dpvIBmtO2Sk3IsSjc2jFqM1aMOWAJBhvzbzCrZ2fmqnYfvM+a1EejO8Xllxf1EQtudSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY7PR01MB13563.jpnprd01.prod.outlook.com (2603:1096:405:1ee::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 10:40:30 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Tue, 30 Dec 2025
 10:40:30 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] i3c: renesas: Factor out hardware initialization to separate function
Date: Tue, 30 Dec 2025 11:39:38 +0100
Message-ID: <c93219af1fcfc461a1b072df0289c291a37c45bb.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767090535.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY7PR01MB13563:EE_
X-MS-Office365-Filtering-Correlation-Id: bde37978-b54c-4549-74d2-08de478fda47
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wDjySowZUxWWeUDRC5uBnAx7aBa1Y+2MaoLW1raej3fiWaNQP/rvzZyHymIr?=
 =?us-ascii?Q?iWrsN+Ok89qBF+QvqGMo7lvEI+/tTwQYjrlS/MaNAUMSgS/poHvEVjcG0aqb?=
 =?us-ascii?Q?1WCVQ2EG1KEZCpaYKaLvhSN+hx65o/jsrvLqkzspyzZxkD74CU9vZQk2Ccu0?=
 =?us-ascii?Q?PqwoLdRQCAQCIpRWIicwmNxbBebBSmegIpsQcv9EHdtTFq899hnEI2nLrPbc?=
 =?us-ascii?Q?tszJK7RhSsa2YYnaYfwPwjE9+oTG35yt88h1aSTqB8zIHNxUhqTwMmvMTFCR?=
 =?us-ascii?Q?iG6Jb/1pAJeOm7nBuTi4h1SIY9l4sdTtw19ARWfosnFJdJ4sPDWSfkJ9om1o?=
 =?us-ascii?Q?jTBsLtNdxNS5HiIuzQv/aWSPQIBFv5NQ4FcKyfmm0HO4wsF6harPnibI1csq?=
 =?us-ascii?Q?w1NBrkQVsBcqc7vHj/wasuQ/ITC55KKTh/QayrQJigwd82JdHrirYjkR5yoX?=
 =?us-ascii?Q?rxZ1YMhYjAcfzKq9cspk/bKpo+1G7UfFS1VxWE/TH146Z8nLAnGc+WrY4xme?=
 =?us-ascii?Q?M+4jfcu8xWFBILtsOsb1jUd9rWJhbpxL21//yGHHFJzjsioN/hvvEDSEUshK?=
 =?us-ascii?Q?NA/3r+STSp3o4A9kPJGUa4N9CCIjY/K9M8kDYrlqPWfJUuIX+SMp3Y5XEbOe?=
 =?us-ascii?Q?iRqRHzSfGc0UxbThwprNsd1Qmc98wLcXMpNPlHxqkKuRVxfx0IulrAytHl31?=
 =?us-ascii?Q?YND0cOrHTFwI3p3oV1rGLQHVlQZuHzLSL9EsutFAu2TvTfa26GF//UQy1t7j?=
 =?us-ascii?Q?G3ieH/cTjTDoaP9ps7MG56yijLPiWuayASqPfYjb+aGtBkUYcfgWXDivcNeE?=
 =?us-ascii?Q?9gwqAvY4ZlalOr53A0ryy1H5WCfOh72WvtmtIaCJq3NjcVgWGD2FdXKnSoX7?=
 =?us-ascii?Q?uev1ujMMNyJ8CsHGGWGBcnen8M56xkZWYfwYBKKXIfafac8o2ihrPWKnIoze?=
 =?us-ascii?Q?0w+epPf8JS3ntzkuTVo/J6D35XcF9+NeSSpI1QsB1OHvE9PSxgJGntJnYJ82?=
 =?us-ascii?Q?JG3d2eZfFUmSI/nmGmVFp29siLQZW88W69/PtYiZIxGv1yfCXQRYQL8peVy7?=
 =?us-ascii?Q?jOMyIIMoaboLcJ6VAr7+3n7v6pabwvNuuGIpm8EFvSvx54JPcef9urDYMnqJ?=
 =?us-ascii?Q?WdOyMk5H7KjvNZpZFC6HU+JGLLguxprZSA7092+NVI8F6XqdMOsmJtyiq3Yr?=
 =?us-ascii?Q?aP/lZFn0YIwB14861kR9OX0OhQnvkfYB1OROjO+o8H516UyoZpbIBA0gWw4O?=
 =?us-ascii?Q?GSCdGQAWcs/tERs3Q+yQ7s8NdnzR2P01PDGM67pyJZ6xAAq80Khaf4oJQq8R?=
 =?us-ascii?Q?2xFUm92aSSXE0taelZoPI8y63T9CgTJvqjcOBmEmwyFRT7JMD39XBpKWVz5H?=
 =?us-ascii?Q?vcVTItKE8ng1RfsXdTkSb2wSWDvEpv1qir/yAuRmCx/SCchHHS3Uoh2sJNPO?=
 =?us-ascii?Q?prBnnYiN6v+sUWdSwZfI7CCSQkcyesZpAhf1cv9S5XG+0RnYQ8vcnTDyfVM6?=
 =?us-ascii?Q?RaHcatni/IKGBM6YcjUOa+/4dBkPDNHzvvw4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ogqI55/u1PfQZ4rhnee7thCsHsI/DuqklaNVJqcJSg1OsrUhhTpWVKZ0U8wY?=
 =?us-ascii?Q?xUgt/HVuooJEJusAi3Rv7rGuTR36FMthisikLd6pCfVgqMXFZvn1AfjCyIyt?=
 =?us-ascii?Q?+hPK1EjemXChTlxQGQoYjMCElKE9WAkz8kUJY1wg2CUj4qIXk2FGJUBF9/PN?=
 =?us-ascii?Q?reTbjk7H34WyzsImpr5gdh7jpaTWOWdn08daUvKSUoHdsvocrfCALYV8Vn00?=
 =?us-ascii?Q?CFYL9Hhu1++TErotQT9mmhuXWezE9H11Vk3etePMGSoOWMm7Se2D0/ViRETr?=
 =?us-ascii?Q?HgAPzYm/QDYRqveB9NRTfTTaxIccoPkFoPVjd9/KmdyBby39z/EsJifuEM/N?=
 =?us-ascii?Q?8en/mVu8fm33Lem/FpES0gYt6VY1Ix5KRPEz9WCBm/OzzPnV/ES+XnQImICu?=
 =?us-ascii?Q?odET+4MyRKWnnyc6BKSvdVwDnjZ7cdOxeR2wCIrBMxKt5IFhuWB/zGgkRtui?=
 =?us-ascii?Q?YfKfafSIelSFCiU03C0GRQwpR3A0dXSoBB7wudgogFD2BiodeSe9AR7OTkDN?=
 =?us-ascii?Q?jI5AVADEP5J9JeGUPBnaXflfRFYWzij9IPPP13xhtK5cuYWo8IcrqJjOaQkg?=
 =?us-ascii?Q?2l+8bkkOOYpDkZNQh7I8yhPt1r4aK+z0wyPivrck66bF1JnmguhzaB5JvmS0?=
 =?us-ascii?Q?aNq1p8OL6JXTlaBxVHzy1DxpnltQf3UtlQxvtdzYNCvHgKjKjVbcWCDG1WYb?=
 =?us-ascii?Q?YMnbiA0ZK4HCEYEY2hoyFxyZgu7/Qu9UkRfwgx6kAFjSzFS5ow0cB6Zqz+v7?=
 =?us-ascii?Q?gtp5nITS+VPxdxJAU+wEEWhfEgw83N0ytyv6v/d+qwT0zuAZ+MRQ4s86peJ/?=
 =?us-ascii?Q?uQ+yxXPQB9kBgTQr/nf5aNMt/UgtOAv36ElkRvff6Ls39GMZBecyREhtEkY9?=
 =?us-ascii?Q?/vUIUH9tij4S45uLDkxY9i5YPAU80jpq1PDE2JTHv1UNyeIuSp749mpgPygJ?=
 =?us-ascii?Q?bk/2FzoAWqVsXamyMdqBAvfv0YLMj2QfefaDkl21Z4SXda4YIu/B5Tm22yNG?=
 =?us-ascii?Q?xNUUR0qGmImNBfEaOEqWlzoSTdwWr9ppCKvfYBDN3GAZSgtq8TDABdoDltFJ?=
 =?us-ascii?Q?fz6CJ7lJ90eux39OuimIV/qw/JxV4VvkLXqeCx4pjJy1kHWhDFPrh3dkaxKZ?=
 =?us-ascii?Q?OB57CCcumhu8LoJW+zfZWLYwOmmQy386XqNQ9gd/k7j9TP2Ux9aNAOcF48d5?=
 =?us-ascii?Q?HBAf9F3XA8OacUV5wum7yPlDw+gr4kz5UpQEvFcQXGDPwDFDFcFcQaslUK9y?=
 =?us-ascii?Q?/UUaHPKVkK1LviS+Aig2acIwC7fj2hP0KmBGoYZcMrCyj2w5u4lZAJ+vA99M?=
 =?us-ascii?Q?lmjk0dLGTyUqU0HWssuivwjmwrOzyLVGcu7XHlPnzbfDtOvP9IbFPencq5AT?=
 =?us-ascii?Q?BpiUFhsWG4UW1EGKK41XI/9IpmPNQ8BIWvHyIIVULcai4PuanvU+bMsBxzmp?=
 =?us-ascii?Q?8ZPtpxg5GVBsULUXq+ARDE51/BSVGjrs2bn51qR8z5aSu2Ujwp06RZgDNhAT?=
 =?us-ascii?Q?PYhvuD7BpaSEgRUNyMGzr1dvWU5yCAi+ntdmEsIQ6+zoRHZJ1KTF2WLkLq8s?=
 =?us-ascii?Q?HCHzRHQDmqbNLqG5Et2pesk0DLLXkUep90xBP8vBc1eqZMxoi5eGx5CYPWI4?=
 =?us-ascii?Q?cHXA29uY8I7j90+0lJKyVwRJcXD+HtQF/9rEsuAl8s57C190dBb6sIH5YPyB?=
 =?us-ascii?Q?sTxQ7I+09cfZPNSGf8dgT0k663Z2LcSPW8q24wxlYihTQAj732thQ4GDRWlH?=
 =?us-ascii?Q?3xcBLUA4QDNLcZt/E34tgZstki4satn4uZ3bRMJb+t8fnbIHjj9v?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde37978-b54c-4549-74d2-08de478fda47
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 10:40:30.4524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjYKxDodEEQTc+28yvCQNcaRV4G1fBT8lHitVxprhabrWtwX+ifLJPX/3UXJq4RCe3Ky2kbJmsQHsws8N31lFJXQODO5ZgR87mOpXO81pkH4eiMH8LXR35x+zLyZ0jn5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13563

Move the hardware initialization sequence in renesas_i3c_bus_init()
into a dedicated renesas_i3c_hw_init() helper.

This simplifies the code, and prepares the driver for upcoming
suspend/resume support.

No functional change intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 99 ++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 44 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 2736363c9074..4f076c372b36 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -485,13 +485,65 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 				 0, 1000, false, i3c->regs, RSTCTL);
 }
 
+static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
+{
+	u32 val;
+
+	/* Disable Slave Mode */
+	renesas_writel(i3c->regs, SVCTL, 0);
+
+	/* Initialize Queue/Buffer threshold */
+	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
+		       NQTHCTL_CMDQTH(1));
+
+	/* The only supported configuration is two entries*/
+	renesas_writel(i3c->regs, NTBTHCTL0, 0);
+	/* Interrupt when there is one entry in the queue */
+	renesas_writel(i3c->regs, NRQTHCTL, 0);
+
+	/* Enable all Bus/Transfer Status Flags */
+	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
+	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
+
+	/* Interrupt enable settings */
+	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Clear Status register */
+	renesas_writel(i3c->regs, NTST, 0);
+	renesas_writel(i3c->regs, INST, 0);
+	renesas_writel(i3c->regs, BST, 0);
+
+	/* Hot-Join Acknowlege setting. */
+	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
+
+	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
+		       IBINCTL_NRSIRCTL);
+
+	renesas_writel(i3c->regs, SCSTLCTL, 0);
+	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
+
+	/* Bus condition timing */
+	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+}
+
 static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = {};
 	struct i2c_timings t;
-	u32 double_SBR, val;
+	u32 double_SBR;
 	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
@@ -564,49 +616,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
 
-	/* Disable Slave Mode */
-	renesas_writel(i3c->regs, SVCTL, 0);
-
-	/* Initialize Queue/Buffer threshold */
-	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
-					     NQTHCTL_CMDQTH(1));
-
-	/* The only supported configuration is two entries*/
-	renesas_writel(i3c->regs, NTBTHCTL0, 0);
-	/* Interrupt when there is one entry in the queue */
-	renesas_writel(i3c->regs, NRQTHCTL, 0);
-
-	/* Enable all Bus/Transfer Status Flags */
-	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
-	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
-
-	/* Interrupt enable settings */
-	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
-	renesas_writel(i3c->regs, NTIE, 0);
-
-	/* Clear Status register */
-	renesas_writel(i3c->regs, NTST, 0);
-	renesas_writel(i3c->regs, INST, 0);
-	renesas_writel(i3c->regs, BST, 0);
-
-	/* Hot-Join Acknowlege setting. */
-	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
-
-	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
-					     IBINCTL_NRSIRCTL);
-
-	renesas_writel(i3c->regs, SCSTLCTL, 0);
-	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
-
-	/* Bus condition timing */
-	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+	/* I3C hw init*/
+	renesas_i3c_hw_init(i3c);
 
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
-- 
2.43.0


