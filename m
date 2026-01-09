Return-Path: <linux-renesas-soc+bounces-26483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F1FD06C21
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 02:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE23B3007965
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 01:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB30D2264BA;
	Fri,  9 Jan 2026 01:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BDFnmeYR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011031.outbound.protection.outlook.com [52.101.125.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5034D219A7A;
	Fri,  9 Jan 2026 01:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767922728; cv=fail; b=WbWF3JOnK6t5ON43aluPB/bFOSpLj145fZsGGwxE+byKAnaZgbX+kdfCXmDc8CAeysn8JB7jsbigDLdZhnm+HUDdcE/BHGjj7mJpNNMukUaebRrZSs0QLjwMdjf4vaFiIS4zKeMw6pg++P0o3KqAXw+GTQw1RwIq38VLL9zwqGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767922728; c=relaxed/simple;
	bh=om4JVEAdXKWTvkBznh04U//0hQdqPcMRO8hVkZsXbYY=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=ObG7aovDS/SKy2TbCc358iYiSnp4LxgzHhiym0ljzlKYnyHNVJwIla20+XBl5moUspT6lJUbdGVJvRVtXuoBvNMu9jO0MxtjPP94QZADwH/WpPK9A8QpFnvQllM4BeaHUprCFkm+OJQDoX6SNm4TxVgPW3WpXw27qbEA1nwnuDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BDFnmeYR; arc=fail smtp.client-ip=52.101.125.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANbeOuSLJUXJc8Cm+/hYfh4BhzjZw4UApcY8ncLw7XmdtPlDZXrRcv/1XV9Ugt5Xdv+pSG8N3yOPirKFLmqaqb0wvIucHxFs+7ztom9WjRTAqrd3tsoSeHYwj90PaSp3PWb7dwlVKHpePPvbKUH3ZuWer8YOkevX8l32v55qRLNxFlKYrMupqvz7hER67tV1Y68T25Uq0IpH6Onwf/eQ4uDMEK49peMxAPm9veNjp42ylc2TJzAISy5pFNMnyXQM11duKDyyTCFBPiJBvRVt5M7Wc67enktSlwooIV1E9fmvYfNZCPb1Dg3+0neQVs8r8kC3XLrIZ9KkDY3aXFuljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWLtJf8xgQbUWc40V6MOXO0/vjbWgwdNMvD85qDvGXs=;
 b=Y9XJo8D7n3fNKnPqzuF34GDKJaBAMJJVCbJG727bcGNWVR/I6BbSYLNtMEA1GtZ6/XwpbQCqLoJb1LDzfVtDP/wtueBpcIIleWTQxdMv3O/4MIIxkfFzSnJdQbabZDxW02lW8vXersTbsF4MeuMCyoJ1ayrYOZqeLy3w25Eo2IwZ5S1qYS66IS5LNi7oktob1qPUia3fHL6TadBJUWCBu3uSZVBAXz1uksJofal3A6ZWRNSoHvpc/f9YYaF+lgQUHQPrgw5gvD2BzvOQfJuNHDVyv15JrZC5FTKXJ8erzNTmlMg3MlPKkbRhXbvDA2pkRTdFnPhUwS0arPCtpyW/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWLtJf8xgQbUWc40V6MOXO0/vjbWgwdNMvD85qDvGXs=;
 b=BDFnmeYR88VPxbFTVCdj/tN7M0opdSjgh3DtzJj4AhGKHYRapV9oHhlytX4eMsyIwiJXh/3UUdHapQDhFRMJrc6oHyEm0qcKLJSuwBk6sz1rDQxRi9y0QiP4/4U9etx73+2AR0wtuH2YR634B+tXImnbt8z3C6QgmtO+/+z/OnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB10286.jpnprd01.prod.outlook.com (2603:1096:400:1de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.1; Fri, 9 Jan
 2026 01:38:43 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 01:38:43 +0000
Message-ID: <87qzrz1s65.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>,	Geert Uytterhoeven <geert+renesas@glider.be>,	Jassi Brar <jassisinghbrar@gmail.com>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Rob Herring <robh@kernel.org>,	devicetree@vger.kernel.org,	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3][resend] mailbox: remove unneeded double quotation
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Jan 2026 01:38:42 +0000
X-ClientProxiedBy: TYCP286CA0236.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::12) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB10286:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b0751b-7efa-47e0-0928-08de4f1fd2af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0/OIpS16t4Hq2CZ+cG6GtQfazjMP64KKx7CIaydpOXxaq/Vwevb+JUYUaxlh?=
 =?us-ascii?Q?DtXY1YrXjEB+e/gqSrhm9L55OabvmOb+HrjLYjPJRCllyTyD3ZyKGc2+qkN9?=
 =?us-ascii?Q?pF/zy2QKzFgU8MIMlqGJl2jdd5pfTpaCVbiuduE0apnNVy5blC5tRBL8xTCp?=
 =?us-ascii?Q?+y4+bQoHiS8MAqFOfKs6cBhMm2wGwgiO7TIyFN2dvvA1jIGYbYPlTaODGDSv?=
 =?us-ascii?Q?/mjtnkgGisBZJyI/b2PXFveLNawNRlJz62xopaKgLV6kLG/B58Rx4AXEv0jQ?=
 =?us-ascii?Q?AF/jG3+dzljmBKvuaaAkRGD9SNNTQoRp4fHHfmSFEdh0xWa2Zk/4L4qhnFfT?=
 =?us-ascii?Q?cU/EO4FS92ez/HE1nizCqnrFqphMvdmcYtdk2Li4zwyUre5my1LU/Iz8f/13?=
 =?us-ascii?Q?LtWC9+9S+4allUXhJzQBSNE8DBrHI6oCkwfR2pSPj+NjKHzBwa2Jpk5tF0io?=
 =?us-ascii?Q?uf/y9er4H5k170EGDjDDWisKxUXbXSGOQOVTwSf8yZ13dJrR3NpQQwok6yz7?=
 =?us-ascii?Q?HKxGRTah7PPlhfAuniaMewLpUnF3gPK+EOoHzZIQGW9P4935YUMqWpwYpZcP?=
 =?us-ascii?Q?fHExPvrlNk7H0/XLkMlSldhVWZHu91FPAAZ3J70KkM/W4QUp3ng5/CtfYm9Z?=
 =?us-ascii?Q?uPFYMp/FptSo7Cpb5Nkj5LFxxIiRu+WAZGXZTxLhx1RfSPLM77x0ICmrmDSz?=
 =?us-ascii?Q?9zkUViR9b5WYQMhuTZ6XeDeEueEMj5brAlW1Bu1u2qi/+trCQwxQnKk4kj5b?=
 =?us-ascii?Q?pO7nNJkIkReTLhAnXBWCSsKe8gvIMYZcbsPc7RX3/vG/hGPibspO8F1/nQOM?=
 =?us-ascii?Q?PFTBDtcMxjU4qSaZVj9fbA7WZjUdZ/uuzBQU26pAq2q08blVY8MZaBjDGNih?=
 =?us-ascii?Q?59R/UQ1mNvM6T+kyU01a62Mk7zrysT/g3rUmB9FxJ4F48tLfRppGAdUjJbrA?=
 =?us-ascii?Q?aTKj9H2PGCQBZYKY1T21r6/T7sgs35+DrQW3khATD8UmXfAALoJAzMRn78Nt?=
 =?us-ascii?Q?D14FyBgl6IuV7ySVowmZQFRy8ZsTYb0O7dLCwlroDQAyaqqnLefjpxntSD73?=
 =?us-ascii?Q?dVHUu5drkj5DsnyqQVDjJ4jIcfRCtUrsKOuDqusmlfmwwPJ7L7311gfkTGMf?=
 =?us-ascii?Q?OODWJ2/R+S9ByCCRNStb/17rz/qmybkC9113se+axT1ndrs5ODmEvuKaim7W?=
 =?us-ascii?Q?moJfO4hXVRpaPEq9kaofw/laERhCEZ8vO8A9tdTJFNQw/VURqqF+jzMMn6sC?=
 =?us-ascii?Q?l3BLHl62UqHA/XCi+G4IJNIDObfXzvkIx9DMj8ayUpPr2FrBVfrtQBrY0mHl?=
 =?us-ascii?Q?TajiXNFQp/+mh8TkpUW6wxq/A+X10/T4XYylxEDahMM30ZgGVEvpYqJdTtda?=
 =?us-ascii?Q?PTJ+EkVhFdUkNp42MEdBrcZLNi/5uQOPaUzyTGow6vGgiO1bm3sBJ+MEPdBq?=
 =?us-ascii?Q?r5JawtMrhKmhbXpa8c5pnlITA3GkId2mKzfMSu36R9OM+5k5P3JqXM7Ydp52?=
 =?us-ascii?Q?scFVZfEPLTX0hnMGWwdg80PlmaCtbEjHS2xJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f2F6thBxpwh6Us1vbyZcwDzdxAZPVCPJgdXpLoRTrMPBrQRW5Fo8K9O5iYWW?=
 =?us-ascii?Q?fbVr4WhD3fWVK7pxTCBwfU3XKMFLVzERhERd0MPrYOeUCamBFGWIRmCXdEF8?=
 =?us-ascii?Q?8ZSRQToG4jGD6/mOSczVLfw3GUOYj9Z8gUG9UQbSbSA0NXYznKT/xpkVcr/m?=
 =?us-ascii?Q?317VViWsofqT6/L9ruMfCAg8wsuIXR1xFmmuC2H5DHvmHzQkv6nXTFTw/AmK?=
 =?us-ascii?Q?zS/L0J+fhSIi5YBo21KqUORuhnWKry/Lne1dggSv6NKQRWztU5zTXxUJE4/2?=
 =?us-ascii?Q?ARrqBW4gpKA2P0qjrTpaMGLKvHot0XoD/0g9HBv6qHq5NxoqjY78QTI+JCpa?=
 =?us-ascii?Q?m0GSpoIeiDUzOupBsUW6d1OJk30ozD0md1APMNhedQCKGbkAU7cZWbwWi+0d?=
 =?us-ascii?Q?PKGxjxrZmoyA4Nv6g+DSFDL31sXov+jfW5t+WysadlucEyEvLSn9w9qCYKAF?=
 =?us-ascii?Q?GKlLfHFsD7rAoLisEQS+N7LfOFyu/iFtNDlhHPxE2Tq+hU+xaRf5nIhlh4M+?=
 =?us-ascii?Q?q9gd6pZqp7lGKCMrgwHS4fAkbabmcPpQmX845bvskAJ2+ia0hUkIY6aKQiyR?=
 =?us-ascii?Q?H0vfYuyVAqV1CWUyfhauM9e3s5pQ95ItgTQ1gSHkEGswccCsp25vvbjcjgwu?=
 =?us-ascii?Q?N52mbmCHVCA3wXK5ncUJepfaXMUqCl8DeAS7cfJCTqQIxUGsflYc/ojdO/zH?=
 =?us-ascii?Q?KKJeLCImP6fy/xAQH7e+icy4zufTFQ7dT5XI+u0FJz2oACkuSZggu7Ev6O86?=
 =?us-ascii?Q?hwlqO+BZJOpQcsT5TAaDTvHhEWHgOYjN6H/C3qApss/BbGd8kogl2eE58pAg?=
 =?us-ascii?Q?qdMRuF7hKT7DD04c81htfXYH3cIvugYSpfT9tlYOAZc/rd23GlgefIgXiWq/?=
 =?us-ascii?Q?xjfoaoE/TD8ngvTMBDO+6rX0orkacd2zplK6dDWfO9lnfERbCX24/MYGqpq/?=
 =?us-ascii?Q?UYNddmRUDX6D7cEkjsnDQAos58DDSQEaisQ9r9GmPaoVetQw+Y8a8BFHQ/jK?=
 =?us-ascii?Q?9heLxjzjChQGxtsnpTebBxKOcs/CIADqsUgR1gFmUnwLDtlBI9KAMoxbeyXR?=
 =?us-ascii?Q?CANaNbYm4zdHan29E1kR2Pwfo+1z5qvVB+BSSnizRR0ZJdlH6saF6O9ShrnI?=
 =?us-ascii?Q?qNdTjcLDDxK0IC47+VCM7/4SI7pxvAZJ7I+0j8ukzGOwPNJ8Kbl6KErDKr7s?=
 =?us-ascii?Q?Ex8ANGTRfjtGsrwUcwSZX+24dzvIF2kVwNMRdqeSpx9UjiflBwBtXcZNYQIH?=
 =?us-ascii?Q?ZKb+nAdjPph8+hwt8ShPC2TNpvCe+fiDWpxUgguMqx+U4tuGnbpyBBGCbTT6?=
 =?us-ascii?Q?4G5FJnqugxIUuOl7y4jK4tRAFq0hRQmf3KtLN9+v897tDy58K2/KRpqdNrGa?=
 =?us-ascii?Q?1ViTzva7oTgTZM9GB6iXaErjKvaKfn7Npq6tIs8x6oYKMJAjGJ/CyO3H7tD5?=
 =?us-ascii?Q?NVDenu1MsSsU1ePTpppUHh+iGfCkLaGQZVexVrhTCOtNGZitlNJ4yozneFjC?=
 =?us-ascii?Q?WRYHOCr/lcJHE3FzDzEcghGNl61e6GbTToJ+8r+TFBXUHDEWMNXaga6kmpaR?=
 =?us-ascii?Q?uS5/DfzIMjIppmFe5P4waHd0FiHL7lzp2NKwoM8m3V3ngEFq65egnPVUwSnU?=
 =?us-ascii?Q?KfkcE9m+0ciZXNscmLGZoUrJ7Z739DR0Id2zO6sH9Ex+153UDCZ4irQjrSsJ?=
 =?us-ascii?Q?duBgrnz5srXvcwwfeHDIHcPUm44J4W1hlfUESynB0ns0QhKlIlewhvMDbuOA?=
 =?us-ascii?Q?k65Nhus4Oo4b2eFkqKD0q2lfGw4ZKB1iRO++vbKUP26PY7tuhubb?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b0751b-7efa-47e0-0928-08de4f1fd2af
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 01:38:43.1615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OEmMmFRj/Thi6c4qeXU/c8WxuZ4Mlsl255JeFidG57G1AL3QS8GhukEZCV+/MP3Wg70R/3ldWOuk5xvzKqvl0gLC8y6TeyV7i8NqETINXwdJPavgL4h6Av8iSgBEVRU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10286

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


