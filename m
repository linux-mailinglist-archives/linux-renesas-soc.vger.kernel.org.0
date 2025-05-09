Return-Path: <linux-renesas-soc+bounces-16847-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0226FAB12CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93561B247B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA1921CC43;
	Fri,  9 May 2025 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WCAee3Tv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4A61A2C3A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792066; cv=fail; b=MoHMeLJBsbcWy3J/M9c+ZwNezD3I5WVP8wo2iULr5Mnon+d3MR6sccDYmVGE8Toh3ahdT0UQurCO0IHeOJ97PgzKVIFB75Gojv4jLTrXCEp/9fsyOAmKplcNRydXZbpVfSCv7BnYaUuio26NYfYuNu0rRWU0PaEnspnX75FNCM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792066; c=relaxed/simple;
	bh=uZyuqX21dzC1vRkEmsWUK9CZPGeV26uW3Zz+jZurvkc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lcmBm2prpOmefq3X9KdeGoFxmeNV45JK4KcoiULfaZBqIsPmbVBkaB9xIhAdQb+VkBimzRdS6jfbVjIld/zh0tgcP0pFxYv3lzzj2cK+/UihExtmDRh70HolJzCNnxif5I4dWH6KkRMinPjuFLOwpoBsengRwMFpeekWV/QpBUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WCAee3Tv; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSXrDpDPk4aWR9DE2G/PMbyNbwsYGacvYSuhAtKsdSZTp0fWydlYBPPRvNR16MsP3KWe7evp3hmhkoVh6gAzgr4kwi0giN37BO+paCoGDiUmbNgBY5V37oCDQc9IrM7xeLrKonHS6dmsiTUJVZMfpmWW8cydPXYMFL8BIjMa8GpJKGPESKV9Ezhw2hjmwOnCZuWjXzo8wjbf0ZMR2626bHWwHJrWqPz9I2902ud0i5tWckwwQMVIDy1rPH97QsynYKZhJ1WgJfU2mQk/+PWstScNJFlRaZqGyiBXUvdP+UqNUxyLRX81F7+zYKKPt9L/sMKKT9+EBi5GBgbZ5OfVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dx8WX294P+oJmaB7r/BAtnkdrb2+LyYk+EekATWY9yM=;
 b=KkO9t0EWcYGulCYzdcMk8D7mF3v5WilXecXfT5yv6CsxelP3oZ1ftuOtpWA5ZoGbs0Zr8gU3VqM5TsQxoJcU+zQazTWWs33Y85M3/9TDZR37lSkGTBUxtdajk7H3TExLCLxUA6XCAR10nilSuQjlpU3Jh1KyzCZz7Q7UUQKRK6kn47dFFUtk26g427hUtCYo0qwH5fZ5ROyzABCMWggY+8x6wD9ds6kt0SSWmKFHa8wufrKPLYtFLatpr7nixJYOqLPXULw5HJYiyAkPNaSKRJDvHvOMR04QoQA7xWjgRYOJJ4HFohIpPwAHHIVBBxZdq2ENiaGEJTQhu3XMh0JFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dx8WX294P+oJmaB7r/BAtnkdrb2+LyYk+EekATWY9yM=;
 b=WCAee3Tv8tu5rAmoF7ZEoh2KviAkVuYWuq0xL/ZyXpJkK8Z0yiaZQxmIUDACcTs6KfhGu9eBlcRd80gtV2nMdKwV/rIkBAKrpAhMQAb7ZaBVQcENE9gJFSoxPRBNPGnuGWVD7ut7QVJAU0t0FPQ190di/NQh6ByBruDW4BUmHS4=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OSCPR01MB15842.jpnprd01.prod.outlook.com (2603:1096:604:3e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 12:01:01 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 12:01:01 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 5/9] phy: renesas: ethernet serdes: add new step added to new
 data sheet version
Thread-Topic: [PATCH 5/9] phy: renesas: ethernet serdes: add new step added to
 new data sheet version
Thread-Index: AdvA2gdQehWhUfRIRdmxWpqDhrnx2Q==
Date: Fri, 9 May 2025 12:01:01 +0000
Message-ID:
 <TYRPR01MB142847DB17454965E4F04D010828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OSCPR01MB15842:EE_
x-ms-office365-filtering-correlation-id: e868d305-db31-41fd-f882-08dd8ef12ab8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NV499ZoaIU7wYthpZBhc7hjaZdsN8cZov5P3kfVEXz5EU8/35evEylS1WE9a?=
 =?us-ascii?Q?TDbu4S0FgQ8w3cdQ5tQ3TpONky14ZdsIPru+ym94DJWgP0+KdlbiB9cLeUBf?=
 =?us-ascii?Q?OeemxP5K70gsSHcHsT037S8OImGglozOBJYUPzPe9Mi6wagPLwgTrxyzmbT4?=
 =?us-ascii?Q?yIe0Wz9FgVTf1MQngIAhBZ4KehgnnA1pKimDXC65GCNTO/sKEnFlOYEF48PV?=
 =?us-ascii?Q?4hxbpzRgQNlCUoRI7y8lnZ6Hk/1B6OYe7zouNN32dw5U0WQaBqqrgSsDKyDS?=
 =?us-ascii?Q?+mXnclbCypVkUbHbRua4T+LuKNdK5oGPbqlTv44ImpvvyJJxVPfLn1y3hDGC?=
 =?us-ascii?Q?H+ytxMW95iVenYbVSouMYQarawgS8uwwLB7Bj430zWYD2FUD5IC57RiwcEZY?=
 =?us-ascii?Q?vI6dgf/g4NbzS1Kus84hy1dg2ryvT33a/IGV8EiZ7+ZI6sKVLbMVj+uLTy9p?=
 =?us-ascii?Q?EFJnpmXx7QhFAO2/Yp/At2SDOBzbb1aXEWltmWrGrEOq28kRO97oyKGnmUdd?=
 =?us-ascii?Q?LH9SNOCNNddXA2sJyjJtw/Nv6iNiDwewddBCTOo9UfO9OyDBqNMuSEEIThCG?=
 =?us-ascii?Q?aNS4IBP+y/JZwdYRfHiNErZ1MaF9ewk6ggHIGw5olzsR4xoIKsv2hcDJkJ4W?=
 =?us-ascii?Q?384mjlknxAqSBxbLEaG5lu36UO2HEAvEggPXp1pt9bpSo/N42vckLKslut/b?=
 =?us-ascii?Q?aZQ1BslCKDcOQEHA4t1+Kj88VFAHv6xNUTi1smNY3jGa2Rau33UJ3FJfT7Ij?=
 =?us-ascii?Q?4ZcPTPBCcfKsDDFF5I7HnlURcr/XzHCP/DktJuGfakdmqsVBgcPnSN9L601P?=
 =?us-ascii?Q?nEfVEErBuLMGSYhUgP8dnyn1GhAO12nr4H71cgwZt6+zLZ7VGMbv1zb/QEfd?=
 =?us-ascii?Q?YJmz5Pw0t7NRH09BBg9K68u/yd9qx1Te4HuqqtQgCNL3cDeFLUMJ+zCGogXG?=
 =?us-ascii?Q?9cibGhkQjc0+TuP4h1MrMcB5CHxZQsnAupZsDIwfzAvmechyh9WaxXyyRkMj?=
 =?us-ascii?Q?Ci3tpKrxJZNDZO91pmaBQm434Cv6Rev+byuNAT49/AFbxrkycqeuyOcps2Cx?=
 =?us-ascii?Q?n8tN6G76XlKmqtxg6QJQ9B1DOYjZtF9h765e7buZ4du+dnh8fdv5GcVyaLmU?=
 =?us-ascii?Q?8e56r8u7moRJm4/ztPk5v3EX3Ayp0TGY4aw5yZthsaTnMm7yFndGzf0vILAw?=
 =?us-ascii?Q?Tgb7MoeAQNQI15kgtpZgPg1AAolbddu98TmKtMqVLdcu5qL/oy30ppaIS79w?=
 =?us-ascii?Q?UHoe23AIQpbmM5XxRXsbm1qmokeufgsTG31bqQ3mJAW84jdPsOCh6CIHsUbg?=
 =?us-ascii?Q?YYiso+0ymAPB15lgFL+v1Z+SrfsVIMdY9ZyDpA3ktQzKiV9SO/dYPseUcG7l?=
 =?us-ascii?Q?DseQ2TwnppZDmR6weCGlS8iVnGYoZ8Ni0B0C8EmZVnqxdwdd1f4OgbLJQb5i?=
 =?us-ascii?Q?UWgsU9k8IWDE1wLD04KbQKm6Rbj25CxllHHwkzbp34wF+UXrtZlzkg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uZY8KeQYpUAA6KsjcA7+1vPcaOmllI6wcZ3aZTpnG2I4vxeoWvrWbkQL/kln?=
 =?us-ascii?Q?K+rWHGpibquydvQtM4q/AzCJavBLcFXGcrVehII3V4qvusHidNxikRIGLMwX?=
 =?us-ascii?Q?/NhU5hXQkTr/caThUt8Y6A/KR1yrxxiYrWLK2I7BJdwLRfr582e3hnz0LLxP?=
 =?us-ascii?Q?T1z234ZeLlUL+ohxN2XdNihP9YHh1nqGLgfzJWOG58DdZKO06ywAdwrj5o81?=
 =?us-ascii?Q?t6/YAwQlAxBzdeTMzgUlicyp8zppAyAnA5H8M9wTgRFTC2N/4dq7FbUWtUpJ?=
 =?us-ascii?Q?IBKtzqx7psNy1/3tqfEu9T0uuXBsKP4GG9cktfpHJrBOHJs53WdNJ3mADd8C?=
 =?us-ascii?Q?axofZAbmqERIxLv9kQ/pvSSOg1P3ELl20LsconY+YKeaM/x4kgaw5W2S0Y5+?=
 =?us-ascii?Q?F4HR+Ec212bnCDsnG8aKktXY99d0djFWbizoLJhObgX3515U6n60liCstpEY?=
 =?us-ascii?Q?ai0eO4rNZbC3dMi/GpRi9od6ZG7Ogg7r8xmneZtQnsOZu2dn5thrIK4Rqxh1?=
 =?us-ascii?Q?Zl9IfMQvHp22+kpfdzjXgXaF4inkFCfZNIgW7d4cLk8rE4/ZPvulM51GXMOF?=
 =?us-ascii?Q?2C/kA5Ls8QNiiojql4ojdDDvA+qhooafHynd/VVqr3rb8WP29GtMtZyK3biR?=
 =?us-ascii?Q?rjO4nd5fXfkTrJ5zVZEH8qwuBO+hHne65Gz6Gk0SlfAI/DkILz597SNXDFu5?=
 =?us-ascii?Q?ji25SyYbsaCsKf3FGI0YdjJWi3HUceSGPlfgFrNzJmaWzLqcLzVZI5fUmvOX?=
 =?us-ascii?Q?o0TdOtRFTPGpGRyTYaSrcH3vMxnw7oxeg1EfmEhrrkbnMa2ukWBc5DJRTteQ?=
 =?us-ascii?Q?SdzQ5PorMi4rEAF6Wpu8TtrmygXZXz6UJ5iWWtzjUdALtVWxob9L4IlWAUjA?=
 =?us-ascii?Q?tEczqtGv3BFm6AFuwdFpVTe73AogVMrDHfONLVtj1GbxWxlNxjNUlbuIAQFM?=
 =?us-ascii?Q?Uh1JU1nFo2dwKRVebZqZDudsuz32d/w2KMEbaf52k0Wi2SADRIvR8xzEbkY2?=
 =?us-ascii?Q?Fjlg4u4JRaqv14121/39gDMQ+ck6WZPw16WjsnsmXjDJFmOVxaBoVVWFS0tM?=
 =?us-ascii?Q?+h15o0N8IjWj98+w7NL4zV1oEvIrMMY/qCXAl//M0MudYesvQAG8oaihE6PM?=
 =?us-ascii?Q?ubyqngbz+1oTtFUIv+lzDw0OILATNp7yCADXmMstSncLhXw7D9bM8Oorzzfn?=
 =?us-ascii?Q?nbDyC1LnO6kGGi8AIM8OB43rxgnah6yYhg0Eg6uZsDwXG1/gU+T86xxX0qNT?=
 =?us-ascii?Q?SoaOXpAhS8xvR0rg4nhU9zmfgn7YgKqWTa2aE/AREm7QueNBYxE9I24oclWo?=
 =?us-ascii?Q?oAtAeR0NZBB9VfjyC7BaOb1IY7FLMqdXc3yI7PIYfD/qKapSDhK9GrmN45k1?=
 =?us-ascii?Q?Vo2BtoQzxXDicCrEyDlMguSZQRMdBSVzfRT9dyJeaUtnxFgrVNPhE6Wc+QlN?=
 =?us-ascii?Q?V2FaL13bw3vcqokoBwhw9Eoo9Gd1h77/lulonSmUx4iPMRKOkJfLz4JBkIi4?=
 =?us-ascii?Q?usnM/19DPiF9kcjEQ2k/aNEhCiyH3MNed+7IkIdMDBf2enaIN6ewr0HZDagN?=
 =?us-ascii?Q?fxDHjb/6GkhQbY+TbY60pROCoPHH0U5EnjnxhNF4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB14284.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e868d305-db31-41fd-f882-08dd8ef12ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 12:01:01.1163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3zWu6PRAT8EbwHj91N1SK0icS3CseoZJvFbuvGG1u+FJd3Nz2v8QW5QaHb5s+0g59egnRg+TzVgtx9rckkl/SxcuPSYbE9+n578OXiDkrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15842

From 46f4055baa6d9da1ac8b08dd6593bb877e0d4242 Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 8 May 2025 11:04:09 +0200
Subject: [PATCH 5/9] phy: renesas: ethernet serdes: add new step added to n=
ew
 data sheet version

A new version of the data sheet suggest some additional register writes at
the end of the initialization.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/renesas-ether-serdes.c | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/renesas-ether-serdes.c b/drivers/phy/renes=
as/renesas-ether-serdes.c
index af5f491cfab1..db6426a5fd1d 100644
--- a/drivers/phy/renesas/renesas-ether-serdes.c
+++ b/drivers/phy/renesas/renesas-ether-serdes.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet SERDES device driver
  *
- * Copyright (C) 2022 Renesas Electronics Corporation
+ * Copyright (C) 2022-2025 Renesas Electronics Corporation
  */

 #include <linux/delay.h>
@@ -18,6 +18,7 @@
 #define RENESAS_ETH_SERDES_OFFSET              0x0400
 #define RENESAS_ETH_SERDES_BANK_SELECT         0x03fc
 #define RENESAS_ETH_SERDES_TIMEOUT_US          100000
+#define RENESAS_ETH_SERDES_LOCAL_OFFSET        0x2600
 #define RENESAS_ETH_SERDES_NUM_RETRY_LINKUP    3

 struct renesas_eth_serdes_drv_data;
@@ -49,6 +50,12 @@ static void renesas_eth_serdes_write32(void __iomem *add=
r, u32 offs, u32 bank, u
        iowrite32(data, addr + offs);
 }

+static u32 renesas_eth_serdes_read32(void __iomem *addr, u32 offs,  u32 ba=
nk)
+{
+       iowrite32(bank, addr + RENESAS_ETH_SERDES_BANK_SELECT);
+       return ioread32(addr + offs);
+}
+
 static int
 renesas_eth_serdes_reg_wait(struct renesas_eth_serdes_channel *channel,
                             u32 offs, u32 bank, u32 mask, u32 expected)
@@ -316,6 +323,7 @@ static int renesas_eth_serdes_hw_init_late(struct renes=
as_eth_serdes_channel
 *channel)
 {
        int ret;
+       u32 val;

        ret =3D renesas_eth_serdes_chan_setting(channel);
        if (ret)
@@ -329,6 +337,26 @@ static int renesas_eth_serdes_hw_init_late(struct rene=
sas_eth_serdes_channel

        renesas_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0000);

+       val =3D renesas_eth_serdes_read32(channel->addr, 0x00c0, 0x180);
+       renesas_eth_serdes_write32(channel->addr, 0x00c0, 0x180, val | BIT(=
8));
+       ret =3D renesas_eth_serdes_reg_wait(channel, 0x0100, 0x180, BIT(0),=
 1);
+       if (ret)
+               return ret;
+       renesas_eth_serdes_write32(channel->addr, 0x00c0, 0x180, val &=3D ~=
BIT(8));
+       ret =3D renesas_eth_serdes_reg_wait(channel, 0x0100, 0x180, BIT(0),=
 0);
+       if (ret)
+               return ret;
+
+       val =3D renesas_eth_serdes_read32(channel->addr, 0x0144, 0x180);
+       renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, val | BIT(=
4));
+       ret =3D renesas_eth_serdes_reg_wait(channel, 0x0180, 0x180, BIT(0),=
 1);
+       if (ret)
+               return ret;
+       renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, val &=3D ~=
BIT(4));
+       ret =3D renesas_eth_serdes_reg_wait(channel, 0x0180, 0x180, BIT(0),=
 0);
+       if (ret)
+               return ret;
+
        return renesas_eth_serdes_monitor_linkup(channel);
 }

--
2.34.1

________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

