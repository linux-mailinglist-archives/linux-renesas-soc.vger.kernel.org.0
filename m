Return-Path: <linux-renesas-soc+bounces-29710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOTBCugLuml8QwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 03:20:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C925E2B526B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 03:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6B02301BEEE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 02:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0494226D4CA;
	Wed, 18 Mar 2026 02:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b4xLFX6n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A251C3BF7;
	Wed, 18 Mar 2026 02:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773800400; cv=fail; b=Cq0XSK69zKOrUdb0px+Rc2cV7QHwIXtCQXpNl+0RmmD/sYfAKpafFB9jJvFmI1pnLD5fpsNNiQtQNSuTzwNC4UB2HHVTacJnBGvGxoDYp12zdYVgiFADXpeoeojLOPYg7VtT61lSV6w8UWQGBHE6Jf+rW68fisEhZWl/s4G8750=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773800400; c=relaxed/simple;
	bh=2qlgvyjCAqaWUGNsEnBRlCzdL8XWacKjzHi3Px8AcS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r3SyL0xuwn8VWD7nzKFTrDyibAElYrHAsJdkxFHiD/524h792dC4IRZDYPB771BvLQVQ6lV78PZQHaqWj1P2nS3k8JR2nz2UjYk5sPVy664wRLwjLhh87lBxl1Aw8EDl2yh+xqeddLzMJAeveA53Xaeqe2UPYqCa1jbqHKy+sXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b4xLFX6n; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHVfnDQBEjji40QLLrMZtS1Dgx2IoT+hVNm1Vu25mpu4z0zfTuvxMEX+8b7i8n8jV1N2aFZp05tKT2SGSHklAMTvDHd5c8q40pNAg/6FEbpRI4/y6720smz40yiCtjejNna/8+yj/SL4VOfD9ZvD1CMs7bxYjF0tp54PW7nUXMku3OJj6BKg5naG4InT0Lz9Na8tGGpFeR6xudVMg6Y9qcbofZ/T9MZYLAnJU5wS/G/FA38Sht6Fh4EHBOO0hf9jDcHIy640sEHg6MlUaUFg2rrlN8id0weyawFygppQKpKJ70ChvA6IvuCSkxpQoGI2QrwWzBe1VPNpPRHaQbaLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbQGXXvLqwnDEuVQK/DDsBimqUlSJeGoyfU5z6bAKQU=;
 b=X9X0q9N4m13OOfs4LkuUfOvQuHFmB3lFKEqBKVUF94B36O00y9y/YKLtvIYCLo/P87tHE3i3i8n1+RCA1TrvnIMwY3BZDlei18UYOI/0WXiC9aPtETQ7NZrELtTqRq/mjryave1hTH3kO6zKxxUmMjeVOMPKfhGhGEP1PMCgo7GGhHK+G2M3XUu4lOYarcFU3rRuwMKkjv45+A/mNmn85vx++3boVg2jblhCCMN1x1YTk+9nmKgNeXRr6DvYFuQJBGPYmQWynyacG8jECfctbbZzq14DYDegp6/psfghZzALn2d0/vK+6YeFhZimAHEgnxz7bjqaGZqqgY9TbLqlzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbQGXXvLqwnDEuVQK/DDsBimqUlSJeGoyfU5z6bAKQU=;
 b=b4xLFX6nM7bOlzLpYyxoS/yw9kYobp8PdgBKfrwFGDJquybo91mCkhorxJoqq4K2JOFIyzNItVvPO1M3GgamjhabhAqBkwcVxogen7e9QG/fcqr/NhNs0GS3qfIO/VvtCOjtwuHLNjQ8AmkJr2L67gPEdanKue8l45rM2dhihHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
 by OSOPR01MB12456.jpnprd01.prod.outlook.com (2603:1096:604:2d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 18 Mar
 2026 02:19:49 +0000
Received: from TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429]) by TYWPR01MB11935.jpnprd01.prod.outlook.com
 ([fe80::dc30:6b24:b7ba:d429%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 02:19:49 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com,
	linda.xin.jg@renesas.com,
	tabreztalks@gmail.com,
	Dawei Liu <dawei.liu.jy@renesas.com>
Subject: [PATCH v2 2/3] hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and RAA228943
Date: Wed, 18 Mar 2026 10:19:20 +0800
Message-Id: <20260318021921.75-3-dawei.liu.jy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318021921.75-1-dawei.liu.jy@renesas.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0054.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::6)
 To TYWPR01MB11935.jpnprd01.prod.outlook.com (2603:1096:400:403::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB11935:EE_|OSOPR01MB12456:EE_
X-MS-Office365-Filtering-Correlation-Id: dcde121c-67e1-4c7a-5ee3-08de8494d47d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|366016|376014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	87rfesA3+XDVu/AuGAc2ji1sVCRxAKqZpOY9lUTXJWUBDZPtn21gh0X1ykDhkAR9YJD0mWFV49dAl3U4q332zHev7X/pNjePnFGlKsY1SxLWA2i+IPNV3zUMb2cqqgRvc1ybjmYzomKSdRQ0OJkxNwjvzIXqbMiy9A2lF/Y/8HFe4/BtgSGzsMyRfy0P5xi/KXQIY1X6iebe//HYWAGjyLoKQzqqs8cxoHVsRkLScFCKoIIrodO/SkwFMfufU9zUuQgZsp1naYyz2QThWX+W+iKQ1yDMaUdYxjBAYaxGOtbFckzQdnwfuVf6kPfI9PItWKuq7lMowUfalSeg9g/3f1JNl6u1yLpFPDGvrtwt5tsAXqMAfPsu9pYXMpg/EUyBbjHDRFed3ooNPVFLv/IhVt/sQMioniq8bWy079BDPEIqFOpKkvicDb4TnP+x58O6ZDkHSfw60y+5Lvj3wDiV1imPWmCH4VXUBctIyXlmzY9niocz5utU6+dmdRVD7Br2r/JJJHEb5ncSjyW2epM8fWeMu1XBYWtAqLPYLCzfPnXOSk6eysIrQgXmV6Tgs2PHPlaRiNYxV34JhrdjWIVClqd7WxLGcZ7CLbqjnP64H4xeJc5aI0FCTjtcC1OHudFPjTOtbLAmLowR/QZT4+MvqGmbkQ3pEO2JGNn2iNzGadmSQnsHVToL9tl/r96cwmwWvIGKrs3pkolDXmAKUXy2PTc9VKsy+LR14kUnU6MfVWz1H4yRTmLJKDS1D5ZPZtfhzX/2T47Y6UqhFzdt1k9OYLKwm+ATkZhlhIgH0O5Y/QA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11935.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(366016)(376014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8/3a3sk4E4gllZJGRhcYQ0T1BwizbGjvoyrsut6ySXSE/TwRSturUGnSOYTE?=
 =?us-ascii?Q?W7AryVf3zQsbfNkUShAx/rrRIY3I24HMNvylaiiUTCbzTyWH9aHHK+Eyux2J?=
 =?us-ascii?Q?ITz5UoaHYQQEuml58QcMRl9Rx+hlLcNiWiVKtfRoBVi8uudC+OaAbBk1zSmQ?=
 =?us-ascii?Q?esN3mM26YogCXNYJT3H8TwM0jvkJqJ1add//loOO7rjgoBRlhDYmpL0aJXVa?=
 =?us-ascii?Q?a0YudZIUs45hN8iPZEGMJGFuhlsWgRAM10Lbr7dfcDnzAO5vdyw9lJ9nxfHd?=
 =?us-ascii?Q?epdbg09YDWfVjn9Co3HriiFjDTQs6zP2mGxwCJfASs4/PbGHIuJocasMAQYX?=
 =?us-ascii?Q?KizU782goMgN4oF5QLUwMo6n7ZPhhGLvC9MJI++ux/277Bknwt57Gmpo8NFv?=
 =?us-ascii?Q?ET/M9bGwLjm+nk9nj8h6S8XNmnLiQkyVfZus8EMTClASQr2/t1iLmH1YdC77?=
 =?us-ascii?Q?z8Bh8IPmXxIeRPqAOVpPz7Io7b3jLCyJhhf1HzDNtXc7UFrpIIb1kMIpGwpj?=
 =?us-ascii?Q?nQiKnREyF79jgks6dCW63uswTGRa6UBGhEKDXGdxEL2Xhk8JNdQdvSCneJa1?=
 =?us-ascii?Q?7hEYtCAoy0ekIApYc32mtQooIeYMko/wxtLnb+OoAi5toyKb7c7y3r4FL8Mb?=
 =?us-ascii?Q?m8hjoWyTX5HjISnHiBUXFeXehQVZ60gFvJrkYIDSFuD8b9DLthi+9Ib+H/EZ?=
 =?us-ascii?Q?aGqLB+0uo/DoGRAVEOgh3mcuYtSKYTXGVs0U53uLKcvuHzFBaG/ORerzshDK?=
 =?us-ascii?Q?Y7kXc2aeiX+tgnYOGuCPKwlx9HZEJHFHC50Of/0MRD1LPaWlkeIlaMsngeuJ?=
 =?us-ascii?Q?kAWLF5OEu+N4PlFb5aHI3riAjwV8y6PHrzqG+h262t96T/4YgrfKTRWU8gMp?=
 =?us-ascii?Q?fukCNk/MJWmV8+yCRU/qxVCgY/IjumD2q7L12rXkun7FBIGTQEnWRthkbhk6?=
 =?us-ascii?Q?EsStawwLeNTMvqHqdiTrCPjdpTy1kc6RXPYDE7Unw2xcMSOUY/30QRcMGKO/?=
 =?us-ascii?Q?qd42QtKVeGEWbxAI0mgFw7H1GGSAvxMcW97cNu3zMQ9K5/S9loUxj1YiYPZt?=
 =?us-ascii?Q?KLnGevtLQJTUTJdhBKqeskPNKEMFR9OL1y/3ZRcIbV8bO6SeIoVgfBdyo0Zu?=
 =?us-ascii?Q?8FWyMJmptbgvQ3bMyLnZp1kGe4+V3TXoUpbTK1SWAM9njHIu463TAwpZ2qcD?=
 =?us-ascii?Q?IzS+3/MS9+05NqrRwKJKdWG9bZQKaYvNn/jgBA1v9r4M53b05gxDO3N5o3Mv?=
 =?us-ascii?Q?S0sE0+YKpWdJRsi6EcNFRiy/XH/tpC3RpUOfRqRN7DxQbApdklBh8Qr08f7f?=
 =?us-ascii?Q?MUMQX6g7tcKhDcxoCHjiOigO1d76PNMA190FsOAdCTSHFB1+LHsODyP6R+2n?=
 =?us-ascii?Q?e9bSzmtruV3EIad1eqI9LcucyUfpcm8rs2rCmcKjvLekDqk3eo96HFptq+nA?=
 =?us-ascii?Q?Ut0FJikRSbbK0u1D3VHkxOfJLyb6pC4MqIfizNUzf90Zn5A4tNEvNuzOVElD?=
 =?us-ascii?Q?4fhZ5cWaPVkbdJMBE4ybgwAoj0ECT7lO9RR/dROMNabinbfRM/C0/AoQ42oN?=
 =?us-ascii?Q?fXdwZPsuETVxpfaBLt4b3EySnDT/R9W3yikc8Jcrr8qsh4XXDfYn6kZcMFvY?=
 =?us-ascii?Q?hjqvsc/InurbFP7vnlkcj7coUgEY1eRprwqLc+35sNZcRpVu9a9NEy580Qfd?=
 =?us-ascii?Q?1J3cj17CRkyh0F8u/i4I5LfROJ9nvQ9CI1m1CgdRrY4zZanA2BVv9DaaY8Cj?=
 =?us-ascii?Q?emY6mphRmw=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcde121c-67e1-4c7a-5ee3-08de8494d47d
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11935.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 02:19:49.0889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gn4y1GDhNqcMYYQDdC8gPJrVBEaZP713qkkGc0ZODh2KaJGWN6xaeZoTgitnUgkOYraWjthi9qTM9FbN1ZyqC+H4hpixLGyux5rTJZ9vPwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12456
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29710-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C925E2B526B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Both RAA228942 and RAA228943 are digital dual-output 16-Phase
(X+Y <= 16) PWM controllers. They are PMBus command compatible
with the RAA228228/RAA228244/RAA228246 family and use the same
2-rail non-TC driver configuration.

Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
---
 Documentation/hwmon/isl68137.rst | 20 ++++++++++++++++++++
 drivers/hwmon/pmbus/isl68137.c   |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/hwmon/isl68137.rst b/Documentation/hwmon/isl68137.rst
index e77f582c2..0ce20d091 100644
--- a/Documentation/hwmon/isl68137.rst
+++ b/Documentation/hwmon/isl68137.rst
@@ -394,6 +394,26 @@ Supported chips:
 
       Provided by Renesas upon request and NDA
 
+  * Renesas RAA228942
+
+    Prefix: 'raa228942'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Renesas upon request and NDA
+
+  * Renesas RAA228943
+
+    Prefix: 'raa228943'
+
+    Addresses scanned: -
+
+    Datasheet:
+
+      Provided by Renesas upon request and NDA
+
   * Renesas RAA229001
 
     Prefix: 'raa229001'
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 3346afdf3..e9bb24a2a 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -432,6 +432,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
 	{"raa228228", raa_dmpvr2_2rail_nontc},
 	{"raa228244", raa_dmpvr2_2rail_nontc},
 	{"raa228246", raa_dmpvr2_2rail_nontc},
+	{"raa228942", raa_dmpvr2_2rail_nontc},
+	{"raa228943", raa_dmpvr2_2rail_nontc},
 	{"raa229001", raa_dmpvr2_2rail},
 	{"raa229004", raa_dmpvr2_2rail},
 	{"raa229141", raa_dmpvr2_2rail_pmbus},
@@ -483,6 +485,8 @@ static const struct of_device_id isl68137_of_match[] = {
 	{ .compatible = "renesas,raa228228", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa228244", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa228246", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa228942", .data = (void *)raa_dmpvr2_2rail_nontc },
+	{ .compatible = "renesas,raa228943", .data = (void *)raa_dmpvr2_2rail_nontc },
 	{ .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
 	{ .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
-- 
2.34.1


