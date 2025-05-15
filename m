Return-Path: <linux-renesas-soc+bounces-17122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB9AB7DB2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 08:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E86C41BA3EFB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 06:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB261F30A4;
	Thu, 15 May 2025 06:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Imio2Ue6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EB91F4C8C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 May 2025 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747289923; cv=fail; b=EETx23uyietdvf+kmOMQkkYEzaQcDktNUfO2ty2A+M2VUTm8LVXL0oQCsz3YkRhX1IUCLteUGoPEsN2tDTcUkPP9IJYg2CCxb969QNhuoEdxkLVMrl2H5buudSpbIyF70CTWNX5iRjM9QOBUzn40Gt2/9w64f2eDVljt19XSVyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747289923; c=relaxed/simple;
	bh=wndbAbto/FtGrSyonRlouIik0DA0gd9OLscHbdYvW7g=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=XmvwLDq66LXTz7WcCgNW7c3JYxv8N727u86QRnSvGGiMi4t6ndVyNSeM/pE/MCvQbVjXyU8WagsAjnyAhrb0WIbmsFdAEomcdcvTLi69YpvKFuxbQmWr/ERrC7caMkG/5CdRSADnGuABkzfWYUvarAIjD+kWjKW2TDYVFzOpe3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Imio2Ue6; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjPVZjXrIqXPs6a6wsK4bsmLCq10geDGULWGQIEDP5bp0Tf50BtMMsT1tDQAuuUKusunY1BZRG3iGD0EyAtYJaJ9qaQ29OGQsXzWSxUxemaSIjFbGZEfGUe3eR3MxnYKsjvRWTr1NwY2ClZBiQteXLS2qEehm1X+zk5zP21fE6qhG9psqzQ7FALFU2OHwxeFQlNKe1+/Z9kHcK2IG97jMW/qYOFxfhASOYzrmtQvxLzvsXYXMcV3nsCTTeuTmOxpBVA38OGkf5giUQNrK3Sxa7zMlYFqqxDuShPeZWJ9HgLGM5Ce7Ql2HcV5BclBT2Sb9dgtaYGWyWUgCUddTtL4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+RrIbqW0MI57a1J8kfm7arMph/7VEwXzkINrFT+BAE=;
 b=Y7rPrFq77EZbyJhAoZYh9tDnoBqmzUpY4d3A5u45JWLR7n3KwbUhuZ2WBwvqyb+lHC0twYSPAMbxsWzFnvgfXqfLAcmU2CSqYIkVYc3bS/8nYslbu1gko3wjJGn0wCgOa22Z/TawD6pZ59eCTaep4YJT72yC+qXKTebEr8fRSTXuaq3j5v9yOdJN6/kug8U0ZSb06M8if2B8aMxtKpJ/NWArR1vK79smTnud8IXDSdzCcl21qurV/JxvKOFmI0R7UMncHDJPn3cOHZGbL/69cT9/FkogVNpwvlQbRccYeb8KZqeSds80JInG0n3UotFW28nNdTuhScRW+dnkRw9tCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+RrIbqW0MI57a1J8kfm7arMph/7VEwXzkINrFT+BAE=;
 b=Imio2Ue6CZ9WreLK6tXgkn+BYD3bCcaXVu3njM0SIRE1NxJJPnxwcgiaJUa90zUqL+qcWgB4J8267JDkG0egYLT8r9bnqUNemR8MSd8TDzbzhsB4h2fzUL7gMrYt3xeKZoY/CdvA6j2oxr9+vh6z8Ne3iic2agjJGWpLHJ7iNEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11406.jpnprd01.prod.outlook.com
 (2603:1096:604:238::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 06:18:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 06:18:37 +0000
Message-ID: <87jz6itn0j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: renesas: defconfig: tidyup Renesas PWM configs
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 15 May 2025 06:18:37 +0000
X-ClientProxiedBy: TYAPR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11406:EE_
X-MS-Office365-Filtering-Correlation-Id: fbee0dd8-0184-40ef-4a0e-08dd93785422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1URYjAt91NrU/92BHUMJMhVvad6syeNUKk/9bgoYJhSd3Fmz/3fpjiZbiNyx?=
 =?us-ascii?Q?yIAuQRa7WlVf6NlU8uio9NQBbfnWuMRCbBzoYfr3+CLK8HZERM27MLzdjGpL?=
 =?us-ascii?Q?T8pI4oiwWyni+9mxPqOD7NpJYOqJ9xaBbhJK6+j5lXmQh9mEaQ/vvENEuTV/?=
 =?us-ascii?Q?mnZFrpnOIjgzJQTFN3r8GcagqS5xQLHmzxEBcCIFhd3co0H6vdLjJuyaNQVQ?=
 =?us-ascii?Q?xLa6Rmwngext/uNp787rM3m/P3feVMx3RAdyH0f/l08PZ8tKry81+UPfGeHl?=
 =?us-ascii?Q?1ykOhuZfW/Fkss/pxZMNTM3ksBk+3DCCVrNR9GcFRUF4DmzX+B6DR3SVlEj8?=
 =?us-ascii?Q?4AZQkfDIgR22CqhIs4zITYts03OZwjtOhFvBU8y0TTG4sUIhN6SSi+eix6Cs?=
 =?us-ascii?Q?klggKKhMUq0Rz0r5cNH811JScbBb7BywzhIxqWI+8zyQ0RZZ0YrF3W7LLq7X?=
 =?us-ascii?Q?qDLOKtrgsgyQWvNLqqEWhCMSok99Fok+r5OMJqIM2Qj3qGviUtiEQK4JCKqj?=
 =?us-ascii?Q?YyLhBRgZ/CPiti8EUAM6S6OmfqW5IlwLqNYlb5nWTc74Aw3rrmNpda/nOfe7?=
 =?us-ascii?Q?G5NpQWTk6yo0P0SwXRLu4Zvk24LrYFU9BmVoJFDsLfJCHDO92kdtsziO6obz?=
 =?us-ascii?Q?/VrdopCEDCd5yqbVdtWsCYWvbHXeFkju0K9PlwjN+KoYyjcss1WVgXJa5DHM?=
 =?us-ascii?Q?5oNz0mT32eDOUcowrjmWQZj+dp2oAN9nBQrfCp/54etZTV9j8wlvTTXEOvSd?=
 =?us-ascii?Q?E0uO8xDGh4tdp8GD3JucMwO4yTLP/+IGVSqWrvCCtM4dp5oT03cj2nRPYDD1?=
 =?us-ascii?Q?zjICSRxgrTs4nqzTuFF23THQ6fzIDl4u8MxffRZa6bwjT7LWppKPdWgmdWYu?=
 =?us-ascii?Q?Mm5GGu/ccEd1TcVjbjdnctoHTyXWYdHPmXZu85SfS7IGmjBi1vzxUerVm9tJ?=
 =?us-ascii?Q?hX2Ck9YliiFIbcYCy9qtTucMGmOQBD5queQnyfTMFrCBzILWMI1pi1X2cmXe?=
 =?us-ascii?Q?jQmC8vGGINq7WdllW4twm51ZMM5tHi4om3Ge32p/fPksqsEaxZ09jshKfe44?=
 =?us-ascii?Q?Rjeqdb4VrSoTeARwZmUkKHR2yCRVdTuZL8UTDZHLiLgKKPSyhZ7u8Yyx+Ms0?=
 =?us-ascii?Q?gGMLdcVBaDlYQSL7dFGKHYL/Vc1wKGQOShAHX1s6lYudHp07FhAEfZBGBTJR?=
 =?us-ascii?Q?RwAQ2HeS4mFCvgNAjrak0dKOj5A4KNtGsjy3sgPPJ94qQocRnzsHZtYOFYNU?=
 =?us-ascii?Q?amKashpi08LsG+xxZXRoJM3Mf4Xnhtuqov71ip/o7XJ6rPfDKyQJNWVsgLiO?=
 =?us-ascii?Q?+7lQJEyC9U/FMukkgqNTNYnoOhfnuOqTo2XsDd3Lm+QhyoqdVopxsBHhNdxs?=
 =?us-ascii?Q?Eda11YSlJCJ2BDob2F4gUQJtXyFJ0PSRJI0KnEA1EZ96PqHcA0w1yA1NuhqM?=
 =?us-ascii?Q?CQTiobO1K87ZZhys3J3iK3pmA4OQmAMpTahNzz92pVLcAAYXwlT8vQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N0IThYit/TJvklEtHaO69pKavzRc+8T7n+plG4PoHlqnfLwMOWzWFWhdsuje?=
 =?us-ascii?Q?Giqz1bt8egL1s1/RnC9BNQ4joIjsS+CMK0VF7tzz2grDCHIl2BKcKfAAPXmm?=
 =?us-ascii?Q?04rQP24Zt4xmwEW5AVEgoSNUeta14WD+J2vBaRLI+mdPoxfEkLCS9ezL1zlu?=
 =?us-ascii?Q?8GTJr/v/o147dCKo8eHyyu1j4l2UNKRyMPK/3mKEDimSbv6BZ7CZaHWGz+TV?=
 =?us-ascii?Q?KOQrw22IdLSb9Pg+2NXYUzOg/suuRidOf2CZGgykea9mwm3JSy7It2xKYzqL?=
 =?us-ascii?Q?z3zPVpygMbldDqgU+vV0QeBsLATtv58mX0VwfSs59mU+O7Uy4kpKXMWVhtlC?=
 =?us-ascii?Q?0+Q8du6Ej9f6RR+C/HcASSTdEJamTXM5WnifN3QGoyJK9yMtenwN0cPbMgTX?=
 =?us-ascii?Q?j2h47rgkrOX+oEMNrMMCE5Vj8HaKmBC89Pk3JFhP4NnLDhIvzYE5AlTh3Pab?=
 =?us-ascii?Q?6KAEOXxk/8I3lmBjuKtjiPqxhI6WW9L1i99urPLrH32Lyi+N5N+vcux1ITNj?=
 =?us-ascii?Q?+L+nrsaoVNJ4jmwcy0hg5+cNlkZ3qCtohia0EKcCD39jKMtn7EvqKLjMS7rj?=
 =?us-ascii?Q?KKLhRf8r7rkdtZ649SqntZGyuae8K0DDUUc+Bd3QzvIVPwn0xLCtBy2m80Wt?=
 =?us-ascii?Q?cR1XpLsaHTB3qzsHL8ip659BVBGiEZYGjEDQCx5wWKEw/XvhyyMo7syzWfPG?=
 =?us-ascii?Q?61505U9Kz+GoUEQDX3KHZmDS63vW2V3/RL5YJ2b9fA5+Png7vEAnCko6Wmsj?=
 =?us-ascii?Q?65f0+DY0Y8AsR6udZCuTQFPqBBBK5cqSdMGDQ5FRzcXHOKI0N78Y99gHFmLc?=
 =?us-ascii?Q?DPZpb6jVF4y8/GdW45VDXyXDlFV8qjvwo81+HtRLThQ5lEm+zX2Xuc9ezEuB?=
 =?us-ascii?Q?zq/QJ3WdRaB3PstklS79nARTrjETUHzSRP/WiS5KkZ2R4nIOetUFhR9RwRxH?=
 =?us-ascii?Q?O4SJnYRL5z7ET3fKgUcNyDKgS64GkmQUuCHNhMep9k+s/XhZxL0LktvtETZJ?=
 =?us-ascii?Q?XtUQSSCMCrX0uMCvQv5f7BuQ2DC4EQu8mgBTdaM2IdsCFZHHfRxdG68FvMk9?=
 =?us-ascii?Q?M0OjUk1GNZeWXTqf7mR8q72YLD/rC5i1ioGsEURumZTe4+O1mN39JLKeUTgJ?=
 =?us-ascii?Q?ft+Ym4QbR1LTPjPerNss/rre6gbj9KIhrOtxGcT5g8Coh5FHqyrcKfkvzxj+?=
 =?us-ascii?Q?CuRkq69IXZ0BIkciYw7z1QwCwTFVKSho4V63X48KHEdpm/IPxECrBU+kR6RN?=
 =?us-ascii?Q?Xm1FTTuR/Bcb6/tOuxJNK6VdhWV6EpCu0i7rluGxqUdGk8UBsUurVXEIHPqA?=
 =?us-ascii?Q?s+hZeZijKwyoQhtuK9jBI9rtz9japQ9GraFlgyewa/H9nm8TQSScwTDTBl1v?=
 =?us-ascii?Q?GoLjL0UsM+N96GWub1xeDShTLtOBe3ZS3PQFn44oBjEmszi1RkzkEoR6+Pqx?=
 =?us-ascii?Q?5zxttygcNHbQfM41HK4ps6hy7IinwoCX0tLIqHg2lOR74dmPW4dPUv7No3ZE?=
 =?us-ascii?Q?bRP9MC8XE+i4dSWJfSJyE9x/7rDzpQVnq+3qj3caCJ8NPUtz45h3UlrqgviK?=
 =?us-ascii?Q?e4ued1ky+y1nPJxsuiXHgEyzKaZAwn7dfaiT70nY0+iTcGvF3Z490Me9TYL9?=
 =?us-ascii?Q?2lHswisMnxWn541Fk6Sn0SA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbee0dd8-0184-40ef-4a0e-08dd93785422
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 06:18:37.5056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naHro+VkzfZx5vUi0R4XBNgSPi2iUIpluZ+o7/96duKsHPEUwhpbjSAykAzK2CiP5jxTXVxSFj9E6VTTtMd7hLMDGKbT377VtyRnIOtPL99fsixJbNpL0MpsOdBzf+er
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11406

CONFIG_PWM_xxx for Renesas was renamed to CONFIG_PWM_RENESAS_xxx.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
NOTE. for v6.16 or later

 arch/arm64/configs/renesas_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 74f5b1341542..25c77fd28486 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -391,9 +391,10 @@ CONFIG_IIO=y
 CONFIG_MAX9611=y
 CONFIG_RZG2L_ADC=y
 CONFIG_PWM=y
-CONFIG_PWM_RCAR=y
+CONFIG_PWM_RENESAS_RCAR=y
+CONFIG_PWM_RENESAS_RZG2L_GPT=y
+CONFIG_PWM_RENESAS_RZ_MTU3=y
 CONFIG_PWM_RENESAS_TPU=y
-CONFIG_PWM_RZ_MTU3=y
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_PHY_CAN_TRANSCEIVER=y
 CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
-- 
2.43.0


