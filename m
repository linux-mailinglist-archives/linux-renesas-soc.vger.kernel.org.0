Return-Path: <linux-renesas-soc+bounces-23890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA87C1DB37
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 00:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40B263BAA6F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 23:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA08313268;
	Wed, 29 Oct 2025 23:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tu4Rz1mF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4418B224B1E;
	Wed, 29 Oct 2025 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761781127; cv=fail; b=Ayv99KYpEvXM5LigFaevCRkIg+9WJ8Gz6ssBOY24BfyGeMYMNhEpsTHY3aD0FZvvFps/waE8/4gT/YbnR0+Y/OI60oey6Xk3UY7nXR6gNiyATRYDL5pRow9WfSccIKOns7I5ewYOMcWDD/qPpA7iniDozMRJPUk5TrEEfA5m1ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761781127; c=relaxed/simple;
	bh=om4JVEAdXKWTvkBznh04U//0hQdqPcMRO8hVkZsXbYY=;
	h=Message-ID:From:Subject:To:Content-Type:Date:MIME-Version; b=Db/fM1aJ9fvbI7HbaY+gYOGBDgP7SqJP4LbUZxEaSVUWDrbkMkORpPvRjQ40NYyZpahxMgcOWNsCjA6taMKF9oDufWl4TGaa27UboYF+T2MqRdfLCOAskrjiiTZDpcVTYVRKeQ5mS9O0FLRv0hq+qnlTriJI73arizrluhnBRFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tu4Rz1mF; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wfkhShI2/NN1otzwLonpwuciDKfNUwOOdfT99iXA1uivy9tXAvwAvUkhBx4SWdzGyAwQQuNlcI9m/MfzOn966RDCS4/U7vc40H0uk8nw7hsJTBokorYpJFHN/4xffucY6kVXXBZMJ9uw1CdhXgNwk86BxatmZ6r5zu6TYBeO+iXWqex2a4wx7QS0H6uLTQYS/jOZfIbYeSyhBPjzFpuxEq0ZvjhrvML+dm75FNGNqCwLgnzktKn+B7IaL6vfSRkAcMLvgPdpkW1/WBHeer0reWv8Rv5RWhw4WGn8FJtM3ebf/agKpXqAtaJrkmXTxFXsrQXw6WemcZKXrzJIWWf/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWLtJf8xgQbUWc40V6MOXO0/vjbWgwdNMvD85qDvGXs=;
 b=O6VR3bhvLuACpAR+YNulPXDta9SixJzX/I+q7Ens1o1hwz9B6Bwaoo1vo+Mbw8YG5yIIYa5MMBpb66Fm62PuSsGJHB+gyVKmXZevuYkkEyhUoEOBjUgfH3B9OKSdoPFfUf6kod+aJr4NTd6hQcxtP1q/Co3C0Pvrj4GXHcoj/gJai+NP1v+iZjrUu1SqYGm6CY3aHiFXsI1veBNiaCRhIVDwI4KrgMKnriU8+pLvagtvSerb4fEIQa0rDLxzb8iHCPe5bjMgL7SOv3hj3CFQaFNuwL4pa/ajwqTPHRAY4A8Og2Rdf64wYYErOojQjYYUZIB+thiDf2A82CD52DWlqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWLtJf8xgQbUWc40V6MOXO0/vjbWgwdNMvD85qDvGXs=;
 b=Tu4Rz1mFvenb3/Ivzz6wKiaSkkHyrdIaxenm+zg4Gha/OABJ6P0aHKQ8ZkDXu4XCRfxI2rvi9V9JFoi5effHXLD7EUyPHxNscCZypj/BEj0/KQWt2Y/RWRTvta9zEag2r/EnPFo323ZuMHrlaWcgdsKnDIi+RSJTdjBoXP5oYt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB13962.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Wed, 29 Oct
 2025 23:38:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 23:38:41 +0000
Message-ID: <87qzul2s8v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3] mailbox: remove unneeded double quotation
To: Conor Dooley <conor+dt@kernel.org>,	Geert Uytterhoeven <geert+renesas@glider.be>,	Jassi Brar <jassisinghbrar@gmail.com>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Rob Herring <robh@kernel.org>,	devicetree@vger.kernel.org,	linux-renesas-soc@vger.kernel.org
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 29 Oct 2025 23:38:40 +0000
X-ClientProxiedBy: TYCP286CA0156.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB13962:EE_
X-MS-Office365-Filtering-Correlation-Id: b11fd96a-dca3-4097-0c97-08de17444a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G9z9+FLBMIrh0GIs83auKIFl5Son2fPTjKQKu3P275yKgb2HtOYmOhz/KIIw?=
 =?us-ascii?Q?1pYt8kLuXMp8TyXOlSlF+c6tMF+lABQGhlFZ41dThb16Zs2zDDca34S81DrZ?=
 =?us-ascii?Q?jj+m1tNJt4K2f3VSwFZpTQs4XH7IN+MRFsU9ryKhOsyRDMYAMmIM9GcynQgC?=
 =?us-ascii?Q?QbdU6llOsiPnqElx3+mtaxJ7ru1cqd5sX2OmSIrBIKFDdat7N7v0GYxmGv0u?=
 =?us-ascii?Q?iRqqnCuaBIKCY49ZVFHtdk7OAZVll9CMj20ipZO5o44+hWRgAaXXK6AoEunT?=
 =?us-ascii?Q?ihG2p6HLq9JZ8Bw3E8jGPXj7cJ4WfiShw4QmfSkj3ZBGc1GCmrX5TuSpKlgK?=
 =?us-ascii?Q?akarf1GJwrd2LCCHgDGJ+ZiJ5M57gR8Hj4/Nas4Unz+ptA0vniMgRMjRGBwe?=
 =?us-ascii?Q?BLSZuik1+/pfjyeoPLT8EryTKoSsOdi0NYC4SA6EjQ0Tq1vZTFRJUFwJ2qhC?=
 =?us-ascii?Q?/o6d9VqCcMnTVmBhgLtN6PKEkLnkIWIPiDLQwcYr6ouMow9xJp1JHJ+bTufy?=
 =?us-ascii?Q?YKWgYfz/dAAoF+/3n1gWObZ+pUTym9Sj1VHDC3Dd9iQMtOgLb5ebgSiIa/j9?=
 =?us-ascii?Q?8Ph/V9KauT/m7C7ONFlw/r0TEk3/hhihMYNwWXJmfxJn1JIoyAvaSu4sRDLb?=
 =?us-ascii?Q?tCOCsa6YwdOrzZcKxnjRdj2J6Lexks1Sh2y/Twzkt1a2A4I2c49BUa+s/Efl?=
 =?us-ascii?Q?1w5PgKhgg7ch0LtbT0BxUk71wwIe0WDL88YvlZHafr/4fMXbKR2WBQx/hLxG?=
 =?us-ascii?Q?Z/FjbNR5ikjErjb8WcuyzRtlRr9fGx0wLVvrnqPl6GaGBC2tsk4iYK4ITZsg?=
 =?us-ascii?Q?izCFTisv3LTBo8Po3nfR8EjmvSD+HO7glw83Q9oZd8KnDwcgaMjn0YEb0l55?=
 =?us-ascii?Q?nVlg32EPCNYpvM47yWMHBIHXGfTZtJuDck+Umm4kXO3n6m6gSv8ToypHu1Wa?=
 =?us-ascii?Q?H9OMXtiNYQy8TZ2wBYXEsS6Z86n29jroRmTI3bNp/YpxJ3pvLdKRdNsbL1gA?=
 =?us-ascii?Q?qx5fexsLfdeP9XUcuC5TdLJ50oiGeO8fmPC3Mdd8yL3/v5v9Ib6U78xu0Hr9?=
 =?us-ascii?Q?wFtpplm2CbWbtUz0MnHZE9t1WwpHPeTTleiFZbHrnfMLEn9yDqsbxmgzLKmU?=
 =?us-ascii?Q?UFFcB3WrRYJrwUNxVk2r4R7hoIZt1STxzvOEyYmWqVOYHc0Vm6GNwV3YjU6z?=
 =?us-ascii?Q?UyPV1A1fsXY7ykcCjCPNQn04Kq3yXapYYLGYNwSQYK8I/U9pfymxzD8VBgBq?=
 =?us-ascii?Q?e3DfDFDZku2UdswOce0V05W+LwFC1juHRXZPJFQtqc9Hpohi55N9M5Xax9aJ?=
 =?us-ascii?Q?NFY0FyIANWLl8sedLmZb5Pv8/HfpZh5Ymx8AN9PMXiY1UQJfAV0vw3KE91p7?=
 =?us-ascii?Q?nlCL7jOPTWTVsYUFCk6hxYvh3HZVtypOfgxpLxzznwUZfulpCaUzOg8QvzsF?=
 =?us-ascii?Q?qKRwI31ER1RRKQkVT0fsfBXyutAkKmP6lIN+jybxNcQN/86/azcK+zbMSiHR?=
 =?us-ascii?Q?pTy/+R2iACbaVkfK56Nbd6ECXuHunN8/EfBn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sl4/lcJKVczu4diAibzJhey4R1u2LRyLsP3dDsGtrrCqZ+/6RgvT36mJTznS?=
 =?us-ascii?Q?TKJcOTH9NVWAfTunrUaiwlXvPygHFelWhtNFnX5OF3IbB5ZP2tr7Simp0Evp?=
 =?us-ascii?Q?K3NkqDI7YG52A7evd8Oav2o3+kVc7yoNqfkVbfQ3JIdQv0uKwi4R1sTCAHfi?=
 =?us-ascii?Q?hM/BUPoeJgftGrRvPIBAuJGcVc1U9quZ+foaS0rBJ0DZxv74a6uAmsPnflm7?=
 =?us-ascii?Q?2PbjbrLLxWIzhVOi+VCAZ2M7iPF85eKdX/Ha35DBRjP/YFgCcz02bpd33xuu?=
 =?us-ascii?Q?bdLKYoEfKStV7FrY6V0/okLCZo69IOJWuvhwSqJQg85x3xsn0Jb1ekeDb/N2?=
 =?us-ascii?Q?XTZ9ItWUyx9nrJP65TzyfaOegW/8UbfagfpTDFWM1s3qGHWHEbdNEcwuUyAk?=
 =?us-ascii?Q?l3Wl9WMbITI9mLqwNkKDP/RA9tvyehI4pC2LGDoVDjE9tOq6d6qp9HkTnHOA?=
 =?us-ascii?Q?Dvq0D1kDXLR18jN97+giv1Jb9ON/FMUkyBDt7YX2h2Xn2vRTZcWd4Z7zThzm?=
 =?us-ascii?Q?bZ/a6ViWv3qMPvx4Vv0W4FuQHLiRPNXEsbIieJvLZwreV6npc/TDO4ZO+pS/?=
 =?us-ascii?Q?+65m6zP1YjtOsyjbY6Z1dSkeGnkfasWkBW1rLV2UyWj54IhPbXlw2zP1nnph?=
 =?us-ascii?Q?ADL+08baqF5FCivleAw6d1CCWPFN14qKPKlJk/ZzlmID6tZbmqzLing/b5E1?=
 =?us-ascii?Q?VG8OUnCWQ5hG+7V5HXsUA+LMQynO+BnnEj+vukFFzfp+fXUzBvn6bePyVPtM?=
 =?us-ascii?Q?yu1ZUg+q3pw35cpE6hvNHvdZfichoG26PAgTwHhb1XUdN7BKIhN3WVxlp+4y?=
 =?us-ascii?Q?ZZz9ul9pixqxzObEZTJdhT1bMhqH0mHvpdjyywMtb8rhZ+ldtTovEKPgaxxE?=
 =?us-ascii?Q?GEg1lQheC13FEFpadwx9SfLq8FskWfH2dIYEpZy1KZfnR+72wDRncKTWZ2xS?=
 =?us-ascii?Q?fgITVjQ4sSOS4D/kXyGiq2H9iV/H2xVr+3fVl5FdyuzbMVtU5WoRS6LDH/v9?=
 =?us-ascii?Q?sz15DTz44M46a6IQ8JGXOBb5jFaMdCiLmiVs8/e57nB137cXULdvfgQUaLnT?=
 =?us-ascii?Q?caTV3QPEZyMXQoaQxGWrUfaSX245LyM0eY2dQ/lHVtBckuk7vNLCD/Fm+J+P?=
 =?us-ascii?Q?7qko/TeyLKB4/cWNx1yovRnhtqclESNOp4WPDECxJcU7Q9AYI5MdSXOR2M9z?=
 =?us-ascii?Q?7m0FXGHTzngXQ1pnJr4HjlSqjXpABinwE9rDG14odhMqm89K5NVKC96tCrXs?=
 =?us-ascii?Q?g5g8fYwhyC7yzNP0ip29d9TgfqZlezF5qQohGv8hdm9/+/1xtoWzBN24CldE?=
 =?us-ascii?Q?ljmB1CAzUc7PpNy2jXAMMi+TZljVTB/OrKJE4IHk+30aPQc4RhhJdbgsGrc3?=
 =?us-ascii?Q?WGOva43fcvPIR5YIZBJAWpRiuENOFF0NAvsIBwfWuPJR9OgF5udAXjvS9aar?=
 =?us-ascii?Q?p2jKatg1Eh3vT1ml8p8s+hCjobEAlHphXqKgdRrIDcsKy6lgm7ZBixyfwWAc?=
 =?us-ascii?Q?eQTWKxgC1PT/AjQXnKAtEr72XZpwr8d5apa2luifvkcdE0N6EYAl2pObdFQ9?=
 =?us-ascii?Q?C8nGHc69e04x9GVvWfULQoRkjRMef9aQzjhxgXGTTWYzMwdsGBOh5/ya/vN+?=
 =?us-ascii?Q?81vaUduxVd/3vLzrg3mftB0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11fd96a-dca3-4097-0c97-08de17444a8f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 23:38:41.0348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh1gF45Oczjt82sUJuuMVqAwYRj9iOZpOtqbGBoE8iVeO2nJnovJX8ODTqfEUCNQmp1SuQ6+4eeOyOfnvlp7Nc4f2tGXM1IN0rMROEQ/1fAnAi/jpxyHsppfVxmWFqAa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13962

It makes Kconfig strange. fix it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2 -> v3
	- separated from Renesas MFIS patch-set
	- Add Wolfram Reviewed-by

 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 29f16f220384f..e47cb68989267 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -279,7 +279,7 @@ config MTK_ADSP_MBOX
 	tristate "MediaTek ADSP Mailbox Controller"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	help
-          Say yes here to add support for "MediaTek ADSP Mailbox Controller.
+          Say yes here to add support for MediaTek ADSP Mailbox Controller.
           This mailbox driver is used to send notification or short message
           between processors with ADSP. It will place the message to share
 	  buffer and will access the ipc control.
-- 
2.43.0


