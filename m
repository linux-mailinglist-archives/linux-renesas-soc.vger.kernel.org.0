Return-Path: <linux-renesas-soc+bounces-16844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E666AB12B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F32451C4363C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 11:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2714F290D87;
	Fri,  9 May 2025 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="B7UlIV82"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38704221261
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 11:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791839; cv=fail; b=NY9rg1OUYGpABXmczIdn+WamTvp0EhCu611m39ELQYp4gEUOo6Ur+y0oLdMxGkEwre4cl2Dzw8YFmwL1zhjJZCkpJAVMNb0bUsqUJvN4Bn/4Ay/ndo8pgJ3ebycUk1YUgDwh+9dVGt5O2qE3X5UwUHTWx7cPWqK+ITXXwIJ50KA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791839; c=relaxed/simple;
	bh=kd+lI5Idcsj9jUVyqjVTGFf0NdrdumAkX1FdpyXvHcI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AkSh2ESkchE+1cApf3gwHmJ+1BiT8KOkCbeSyYy4ThH9AotrF4Pe8F1zfmYogzCbaKf7iWou5ABJfg69cgaOEU8ayb3xwrgucwujCeWITH7vUSaWTnLkgBHWL/u4jFki2Fn866Sar+awUu0ze8vxB2qmNOW8pMQBzMeH3PUihUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=B7UlIV82; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTYXM37OkTbwqBL6ig1wE073rVI5E8ePVhAf9B/NNza8ms8tqQhHvVWCj9B+Hdk27JIUSv1sT/lHN6RjgoTBmPpVFmbZnTPYzqT1e7sz0YLyuYpNcogpbTCxAvD1HT/lQU3RLBUyo+hCrxZeVK+Yi8qzR7TYjIByOUhkFmA4WinQ5GvEXjBQLxeLKNjL5Gvreg3Cn45qcYEADCTazKf4d6a9kre8tMql4lKwYOHGGNhpVsvfs3l1dyKIV97svmQg52ETCifmVvCqRZWwjwR4oaHekmYh2I3JEOA3Kadb9xlFFIjJZNGPKkw/KMyyab2fPg0ugn4K+sCfuWAJyYpB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNdGFb+GvarYP2UlWQbOcHqSe8PeCfJ6qqNvUeHf8RA=;
 b=muux0eiP7RKTKYn+BzXq76+6yJvxNJ2+sVG6mTPrEzml4iRjK5PFMYqlOjdSHKNs+eHsnV6j7167if1DXCHFXE1ALAAJqAlcL7wUlTQAlD2NaW+Qs38AaMtPUz652e7LeeXPr9jke0ca8YQiAki9twHkoT4N/2P/gLXVFNQ+16ImJVX9lt/8N9hfmhjPMWiB5GIomhe2VyFzqA25mmxqkhc1s1YwVYplHytbXB8SqvGwOM/modTBqAyx2QxKZImMHp26FWDft0XGAeCAuSjlfrcgZQYtq993KiVSYdxz4gp28U6rJ09taF9TsgO4VTF5Hal8xF6jPK/68M+caBb7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNdGFb+GvarYP2UlWQbOcHqSe8PeCfJ6qqNvUeHf8RA=;
 b=B7UlIV8296aEmZ6p57gtYl6qx0fA+5jtPIbO8tOA7zx9cOhvSm9SwWbpoLG6kFARawkfvaSuqkSp44xp91hy64/cXWKHy/RU3BdcwDeqbhJoETRPVFScwGxi27g+R6O2MN5dSftFpNBlqb5o7DPmu7IU/smxhXiPzSfBMK/vttQ=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OSCPR01MB15842.jpnprd01.prod.outlook.com (2603:1096:604:3e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 11:57:11 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 11:57:11 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 3/9] phy: renesas: ethernet serdes: rename functions and
 structs to accommodate multiple SOCs
Thread-Topic: [PATCH 3/9] phy: renesas: ethernet serdes: rename functions and
 structs to accommodate multiple SOCs
Thread-Index: AdvA2X3se25EufH2Qfiad1jWgKYm6A==
Date: Fri, 9 May 2025 11:57:11 +0000
Message-ID:
 <TYRPR01MB14284ADFCC442ECA4BFE91336828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OSCPR01MB15842:EE_
x-ms-office365-filtering-correlation-id: 4f0ff693-b64c-4bbb-ea03-08dd8ef0a1ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?8dZB5S8nRmedOq3ovh94lUHJsxEXqA8Znbki6bGPWVveLEKRFp30B8YDxb75?=
 =?us-ascii?Q?h1uVglPqQCkr/Qp4THdK03IpYdx4DAX24ikaQDl2bNZ+u4/JtbyeUruhSWwW?=
 =?us-ascii?Q?gCZv8eZXaaovAg6SVqQfyKO0FprvfUTssu7w8s1KM2AkjWiRm+yz9cyD62Im?=
 =?us-ascii?Q?Ah7gScY7xKzxPronnGsLRAJUiGVuyNDMUTIXzK1AQYYbetdgVJbEegmYTRYD?=
 =?us-ascii?Q?pa1horzqdYJ4FbnxJCaUVIX9CiqRSWnN/8eIyyWG5Ib+d/KGYUIT1ydMZYfm?=
 =?us-ascii?Q?/ssZ+wbPD1wEfFPUeAP7XA3vb/a1oDJaHe3szMsm882GZe4wYP3AMzV5Gw2d?=
 =?us-ascii?Q?3dt9JM31POtDxqSUdMfSYYBl3nGfaPL1Jx2SNnTS43x2g1nKmUyklp+QW4wa?=
 =?us-ascii?Q?tc1NGoRCzi7pvT7/cndlaCY4WlD5LK+4vfQSLtis/NL+hHY6wFvUDzh1UENC?=
 =?us-ascii?Q?uWLzLykTX/vuB9a1wDe7U3rCHJNc08l4MRpe1mrE3uPazoeTYSLO46JtFDHj?=
 =?us-ascii?Q?MIAWPcWnerpEW34ySjqkzBIyeetCihgkrWOHqtjkMuQ9rzJK1wiDvZm0nG+n?=
 =?us-ascii?Q?UmaKI8yFQZPB/aFbN/xbtBXrCgq2VnshbBe0qG5PWi2Hme2q2N2Feif5/l2T?=
 =?us-ascii?Q?IAseOPq3dAibZi0wlZGnYkvqpX0R3bYvWKWek2BEv9IC0qOPjhJvaczUypRB?=
 =?us-ascii?Q?X1s5mbZjW6V0oPt37EcsC784zJHsDOkpsQzD0FueC8RsYimqjx/yoBWh13+w?=
 =?us-ascii?Q?qdtysz9BwmnnkDjKJlVkcxFiJ/bkUPFy9A6k7R5Mqf7G3n1E4hY0L9JbtNoV?=
 =?us-ascii?Q?qQkpUeS1SwKtMeNzwzGc4KMBq0exOYCsxymi9RQFBDvMgNjOSvxvvFCJOfFa?=
 =?us-ascii?Q?PT17SHsXVbtE6sM0L0wNmfitnUrfp2iwVJtoOvdg/M0VCRJPGzyGvVz1WNim?=
 =?us-ascii?Q?9mUaa9bJyEr62MnY2FM6RCihq0DeCRMv+47TTfnnI7cwiSHfqLNW6VxltxJt?=
 =?us-ascii?Q?GsGPQUCw62v8dzIFPF0JLYDkjlrAc1gKe76NnFInlmNaD1013RThzGy/PVTq?=
 =?us-ascii?Q?psbmpxFYa1Wv2FdyhRn8uP/Spcn36bdhsUvbHZ6M5yXNycNC1Qc9ypjiDCNM?=
 =?us-ascii?Q?TTq4NRzYyqQ31vWgTUVeGYavbdoXq0zCtOyUCxkbhR1wh9+06qFT1zVeJF21?=
 =?us-ascii?Q?4QCA/24hL/FfVsPWJz25qxW6JpwMkuhmW5u0QzGyGXtQ5+KoRgXQs2Yrmfjx?=
 =?us-ascii?Q?71mnw+mJy0q6opJuTYnAEqBSiTNUKaOBb7L3cdqDxyA+92oakX/spj4rdBYo?=
 =?us-ascii?Q?6Q9CqcKVrUDsO4F9/TzuHqZ3cPqJMTSLKOLUkA/Q7YPPD2q8sL35ONvB0avj?=
 =?us-ascii?Q?OKsMI4aeSnOk82GT0ZtqJJRKOAAlBnUdNR47BkHUq3zCW3h60J2Xh13WEz2j?=
 =?us-ascii?Q?GesrdtXgnET0YtipeN+qsjdJeQ6K83mCNDobbJgCWhwEW9OAtzUKprO/6cNU?=
 =?us-ascii?Q?A3D5NbS94t7pLcM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?asDYuGl3MsRzUx1KAbQ0N26kRwmaQsVy/CCgpAAhXxBR6rUsUAyffxIT7d7w?=
 =?us-ascii?Q?E4ksXCxf5CRC9/QR2CBJpNCpvDSMJzjnOL+dT+cGsjVpgqZ22RJbaHAdv3E6?=
 =?us-ascii?Q?nXUgZ8ELCNycDdyNtUOmMd9VtycP5C0hX6v6Fa1G3HF5LR0BJMACu53dqhFq?=
 =?us-ascii?Q?ddxcnTFqJrRaxkKTxqI9wM6CZoZa95u5jKiWxQv55fT+kk47J2T57WusxHnc?=
 =?us-ascii?Q?82RjuGqMkSWbf9pdFPUMmYlQF525Pz6kxDsPL3mGKMndSQo63E+UqhVqNCgR?=
 =?us-ascii?Q?bfkwGaRhIGswkg0+nOV2sjnPJ4ra6LieE6+rCLR0xZgKrJJTbd0XM73TzJzc?=
 =?us-ascii?Q?h4y7ALrB8IxfgYTeV/9FNzTI0VL/ig2D08+CjT1QDclA/WGwjZIpsfVx0Kzg?=
 =?us-ascii?Q?1lzr7dYyMRyZVPAdMiDfxRhv8ZNQY+UckpPF0iggEl4kSJkleFO8doLa1QR2?=
 =?us-ascii?Q?IHHYtEjuFjUejFT3azLuqVQ8qfJRUkPZgloMdRzb/VZYfpBVKD9pf8qQS/ZR?=
 =?us-ascii?Q?vpqaT0MDWzYLUp1yIhrsKdQM0GPpgpihO4wZhddskY/zGWtMi8H8WEx3Sd8P?=
 =?us-ascii?Q?UuIoC0+S95/8z8L4GCzWNoa+rgi0YWNOHXTWzMplbJIR6ezez+aoKJWnXrHU?=
 =?us-ascii?Q?6bLK1KynC7yTLCosGiBgPpbskKwUwe2Y7vbBp+9HO9aybsiQny9+DqrQhJSI?=
 =?us-ascii?Q?gn2Guf2HW57o3LE0ZKRUcwePwuIGaKwBqMOCvOrfvya27K7oQDqKMhN7lUhN?=
 =?us-ascii?Q?3V86A+Dj6vqVGISbRJSRbU/HMxWsKoX0GeMOPN5CLL2y2qTyrvUySw5ajt8i?=
 =?us-ascii?Q?v4j80/biq/5uNWbam9W71nJsBB1Uog+NwmWnFrT0g/FR7kU0If8V8cm7039o?=
 =?us-ascii?Q?bKf1dl/gFqW4zfR+wpZUTXRSbtyw+1Of7SlcXfA9ab+uJxbVjJZbK9LcYyzy?=
 =?us-ascii?Q?TV/IMVshxMnzItT0L/Om5culTkjYvBImQSSpIhwDdPI9UU9hXbB/CeBImwW+?=
 =?us-ascii?Q?0bBd94+SyVtuE+i/+3DekOKd97zKv9Y2wogsA2sfaQ6jfB3rVMkmJNC5KSUE?=
 =?us-ascii?Q?FZELflNNK/M1J/MoPqzcU8r5Ur+KQXDGMy2rLomDG/Y7bstFJc6h0EpcWOaG?=
 =?us-ascii?Q?3GvshDbDd3oxQjiT6m1JBGQBScBujqSdL1cULmjYmaitudGlixoNmu7wkcMS?=
 =?us-ascii?Q?+mJgN1AOHu9mzQ+yLJsbzf2Gq/AvKFCD/u1NjCUmJxL4ty162X1Plx4wrHfZ?=
 =?us-ascii?Q?uDS5TZcoRd4PKIDwKm/dndq7jQNqVmmxN6ZCUcqY/dcRpER65W7hiUij/3i/?=
 =?us-ascii?Q?L0tvxGG+ypHsL+sSMF7vFIiQscU+azgbliiaBAZs3A8+KquXswSg3GPx9Ate?=
 =?us-ascii?Q?qddJbXXSpMC3mMaXDr3axo/HVISHghERfN1424JI0WTjgHOWa3l57X1lxc3X?=
 =?us-ascii?Q?BRFQc5X0FuDKbPgoEpikxJBRlAhK+5Q2v8j0PIIFaXvYiE86Yq03x36c3wdG?=
 =?us-ascii?Q?Gp6OoNBu/2KSCkC8uPDwRbfLQD66fiUGozg3zEh9DLHl5j4aLuIt2skwGMDJ?=
 =?us-ascii?Q?DT63Og/Ltw2R//riOYQk7Xa43XoH6N5U9Ro4j0Aj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0ff693-b64c-4bbb-ea03-08dd8ef0a1ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 11:57:11.2143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qE5JPHSuMEzPNttSaHEpiuU74eLNC1KK2jfmJdIB76No4UzqQ9gD1alkJigcmiEJa7qbE6JjGAnzeqNIWp4NTL3S3OWwDSSA+BNu+qdfFy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15842

From 0a6a169942c0c10112fcfd9552fb1596b6a95cc5 Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 8 May 2025 10:02:10 +0200
Subject: [PATCH 3/9] phy: renesas: ethernet serdes: rename functions and
 structs to accommodate multiple SOCs

Multiple SOCs will use very similar ethernet serdes implementations. Update
this driver to make it generic for Renesas SOCs.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/renesas-ether-serdes.c | 234 ++++++++++-----------
 1 file changed, 117 insertions(+), 117 deletions(-)

diff --git a/drivers/phy/renesas/renesas-ether-serdes.c b/drivers/phy/renes=
as/renesas-ether-serdes.c
index 3b2d8cef75e5..ce4e3ebd85d2 100644
--- a/drivers/phy/renesas/renesas-ether-serdes.c
+++ b/drivers/phy/renesas/renesas-ether-serdes.c
@@ -15,14 +15,14 @@
 #include <linux/reset.h>

 #define R8A779F0_ETH_SERDES_NUM                        3
-#define R8A779F0_ETH_SERDES_OFFSET             0x0400
-#define R8A779F0_ETH_SERDES_BANK_SELECT                0x03fc
-#define R8A779F0_ETH_SERDES_TIMEOUT_US         100000
-#define R8A779F0_ETH_SERDES_NUM_RETRY_LINKUP   3
-
-struct r8a779f0_eth_serdes_drv_data;
-struct r8a779f0_eth_serdes_channel {
-       struct r8a779f0_eth_serdes_drv_data *dd;
+#define RENESAS_ETH_SERDES_OFFSET              0x0400
+#define RENESAS_ETH_SERDES_BANK_SELECT         0x03fc
+#define RENESAS_ETH_SERDES_TIMEOUT_US          100000
+#define RENESAS_ETH_SERDES_NUM_RETRY_LINKUP    3
+
+struct renesas_eth_serdes_drv_data;
+struct renesas_eth_serdes_channel {
+       struct renesas_eth_serdes_drv_data *dd;
        struct phy *phy;
        void __iomem *addr;
        phy_interface_t phy_interface;
@@ -30,11 +30,11 @@ struct r8a779f0_eth_serdes_channel {
        int index;
 };

-struct r8a779f0_eth_serdes_drv_data {
+struct renesas_eth_serdes_drv_data {
        void __iomem *addr;
        struct platform_device *pdev;
        struct reset_control *reset;
-       struct r8a779f0_eth_serdes_channel channel[R8A779F0_ETH_SERDES_NUM]=
;
+       struct renesas_eth_serdes_channel channel[R8A779F0_ETH_SERDES_NUM];
        bool initialized;
 };

@@ -43,24 +43,24 @@ struct r8a779f0_eth_serdes_drv_data {
  * about registers' name/bits. So, this is all black magic to initialize
  * the hardware.
  */
-static void r8a779f0_eth_serdes_write32(void __iomem *addr, u32 offs, u32 =
bank, u32 data)
+static void renesas_eth_serdes_write32(void __iomem *addr, u32 offs, u32 b=
ank, u32 data)
 {
-       iowrite32(bank, addr + R8A779F0_ETH_SERDES_BANK_SELECT);
+       iowrite32(bank, addr + RENESAS_ETH_SERDES_BANK_SELECT);
        iowrite32(data, addr + offs);
 }

 static int
-r8a779f0_eth_serdes_reg_wait(struct r8a779f0_eth_serdes_channel *channel,
+renesas_eth_serdes_reg_wait(struct renesas_eth_serdes_channel *channel,
                             u32 offs, u32 bank, u32 mask, u32 expected)
 {
        int ret;
        u32 val;

-       iowrite32(bank, channel->addr + R8A779F0_ETH_SERDES_BANK_SELECT);
+       iowrite32(bank, channel->addr + RENESAS_ETH_SERDES_BANK_SELECT);

        ret =3D readl_poll_timeout_atomic(channel->addr + offs, val,
                                        (val & mask) =3D=3D expected,
-                                       1, R8A779F0_ETH_SERDES_TIMEOUT_US);
+                                       1, RENESAS_ETH_SERDES_TIMEOUT_US);
        if (ret)
                dev_dbg(&channel->phy->dev,
                        "%s: index %d, offs %x, bank %x, mask %x, expected =
%x\n",
@@ -70,35 +70,35 @@ r8a779f0_eth_serdes_reg_wait(struct r8a779f0_eth_serdes=
_channel *channel,
 }

 static int
-r8a779f0_eth_serdes_common_init_ram(struct r8a779f0_eth_serdes_drv_data *d=
d)
+renesas_eth_serdes_common_init_ram(struct renesas_eth_serdes_drv_data *dd)
 {
-       struct r8a779f0_eth_serdes_channel *channel;
+       struct renesas_eth_serdes_channel *channel;
        int i, ret;

        for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
                channel =3D &dd->channel[i];
-               ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x026c, 0x180=
, BIT(0), 0x01);
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x026c, 0x180,=
 BIT(0), 0x01);
                if (ret)
                        return ret;
        }

-       r8a779f0_eth_serdes_write32(dd->addr, 0x026c, 0x180, 0x03);
+       renesas_eth_serdes_write32(dd->addr, 0x026c, 0x180, 0x03);

        return ret;
 }

 static int
-r8a779f0_eth_serdes_common_setting(struct r8a779f0_eth_serdes_channel *cha=
nnel)
+renesas_eth_serdes_common_setting(struct renesas_eth_serdes_channel *chann=
el)
 {
-       struct r8a779f0_eth_serdes_drv_data *dd =3D channel->dd;
+       struct renesas_eth_serdes_drv_data *dd =3D channel->dd;

        switch (channel->phy_interface) {
        case PHY_INTERFACE_MODE_SGMII:
-               r8a779f0_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x0097=
);
-               r8a779f0_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060=
);
-               r8a779f0_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200=
);
-               r8a779f0_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000=
);
-               r8a779f0_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d=
);
+               renesas_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x0097)=
;
+               renesas_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060)=
;
+               renesas_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200)=
;
+               renesas_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000)=
;
+               renesas_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d)=
;
                return 0;
        default:
                return -EOPNOTSUPP;
@@ -106,54 +106,54 @@ r8a779f0_eth_serdes_common_setting(struct r8a779f0_et=
h_serdes_channel *channel)
 }

 static int
-r8a779f0_eth_serdes_chan_setting(struct r8a779f0_eth_serdes_channel *chann=
el)
+renesas_eth_serdes_chan_setting(struct renesas_eth_serdes_channel *channel=
)
 {
        int ret;

        switch (channel->phy_interface) {
        case PHY_INTERFACE_MODE_SGMII:
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0=
x2000);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0=
x0011);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0=
x0540);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0=
x0015);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0=
x0100);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 0=
x0000);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0=
x0002);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0=
x0003);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0=
x0100);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0=
x0100);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0=
x0000);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0=
x0007);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0=
x0000);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0=
x0310);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0=
x0101);
-               ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x00c8, 0x018=
0, BIT(0), 0);
+               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x=
2000);
+               renesas_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x=
0011);
+               renesas_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x=
0540);
+               renesas_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x=
0015);
+               renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x=
0100);
+               renesas_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 0x=
0000);
+               renesas_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x=
0002);
+               renesas_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x=
0003);
+               renesas_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x=
0100);
+               renesas_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x=
0100);
+               renesas_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0x=
0000);
+               renesas_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x=
0007);
+               renesas_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0x=
0000);
+               renesas_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x=
0310);
+               renesas_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x=
0101);
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x00c8, 0x0180=
, BIT(0), 0);
                if (ret)
                        return ret;

-               r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0=
x0101);
-               ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x0148, 0x018=
0, BIT(0), 0);
+               renesas_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x=
0101);
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0148, 0x0180=
, BIT(0), 0);
                if (ret)
                        return ret;

-               r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0=
x1310);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0=
x1800);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0=
x0000);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0=
x0001);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0=
x2100);
-               ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x0000, 0x038=
0, BIT(8), 0);
+               renesas_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x=
1310);
+               renesas_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x=
1800);
+               renesas_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0x=
0000);
+               renesas_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x=
0001);
+               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x=
2100);
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0000, 0x0380=
, BIT(8), 0);
                if (ret)
                        return ret;

                if (channel->speed =3D=3D 1000)
-                       r8a779f0_eth_serdes_write32(channel->addr, 0x0000, =
0x1f00, 0x0140);
+                       renesas_eth_serdes_write32(channel->addr, 0x0000, 0=
x1f00, 0x0140);
                else if (channel->speed =3D=3D 100)
-                       r8a779f0_eth_serdes_write32(channel->addr, 0x0000, =
0x1f00, 0x2100);
+                       renesas_eth_serdes_write32(channel->addr, 0x0000, 0=
x1f00, 0x2100);

                /* For AN_ON */
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0004, 0x1f80, =
0x0005);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0028, 0x1f80, =
0x07a1);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f80, =
0x0208);
+               renesas_eth_serdes_write32(channel->addr, 0x0004, 0x1f80, 0=
x0005);
+               renesas_eth_serdes_write32(channel->addr, 0x0028, 0x1f80, 0=
x07a1);
+               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x1f80, 0=
x0208);
                break;
        default:
                return -EOPNOTSUPP;
@@ -163,7 +163,7 @@ r8a779f0_eth_serdes_chan_setting(struct r8a779f0_eth_se=
rdes_channel *channel)
 }

 static int
-r8a779f0_eth_serdes_chan_speed(struct r8a779f0_eth_serdes_channel *channel=
)
+renesas_eth_serdes_chan_speed(struct renesas_eth_serdes_channel *channel)
 {
        int ret;

@@ -171,13 +171,13 @@ r8a779f0_eth_serdes_chan_speed(struct r8a779f0_eth_se=
rdes_channel *channel)
        case PHY_INTERFACE_MODE_SGMII:
                /* For AN_ON */
                if (channel->speed =3D=3D 1000)
-                       r8a779f0_eth_serdes_write32(channel->addr, 0x0000, =
0x1f00, 0x1140);
+                       renesas_eth_serdes_write32(channel->addr, 0x0000, 0=
x1f00, 0x1140);
                else if (channel->speed =3D=3D 100)
-                       r8a779f0_eth_serdes_write32(channel->addr, 0x0000, =
0x1f00, 0x3100);
-               ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x0008, 0x1f8=
0, BIT(0), 1);
+                       renesas_eth_serdes_write32(channel->addr, 0x0000, 0=
x1f00, 0x3100);
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0008, 0x1f80=
, BIT(0), 1);
                if (ret)
                        return ret;
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0008, 0x1f80, =
0x0000);
+               renesas_eth_serdes_write32(channel->addr, 0x0008, 0x1f80, 0=
x0000);
                break;
        default:
                return -EOPNOTSUPP;
@@ -187,28 +187,28 @@ r8a779f0_eth_serdes_chan_speed(struct r8a779f0_eth_se=
rdes_channel *channel)
 }


-static int r8a779f0_eth_serdes_monitor_linkup(struct r8a779f0_eth_serdes_c=
hannel *channel)
+static int renesas_eth_serdes_monitor_linkup(struct renesas_eth_serdes_cha=
nnel *channel)
 {
        int i, ret;

-       for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM_RETRY_LINKUP; i++) {
-               ret =3D r8a779f0_eth_serdes_reg_wait(channel, 0x0004, 0x300=
,
+       for (i =3D 0; i < RENESAS_ETH_SERDES_NUM_RETRY_LINKUP; i++) {
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0004, 0x300,
                                                   BIT(2), BIT(2));
                if (!ret)
                        break;

                /* restart */
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0=
x0100);
+               renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x=
0100);
                udelay(1);
-               r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0=
x0000);
+               renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x=
0000);
        }

        return ret;
 }

-static int r8a779f0_eth_serdes_hw_init(struct r8a779f0_eth_serdes_channel =
*channel)
+static int renesas_eth_serdes_hw_init(struct renesas_eth_serdes_channel *c=
hannel)
 {
-       struct r8a779f0_eth_serdes_drv_data *dd =3D channel->dd;
+       struct renesas_eth_serdes_drv_data *dd =3D channel->dd;
        int i, ret;

        if (dd->initialized)
@@ -218,89 +218,89 @@ static int r8a779f0_eth_serdes_hw_init(struct r8a779f=
0_eth_serdes_channel *chann

        usleep_range(1000, 2000);

-       ret =3D r8a779f0_eth_serdes_common_init_ram(dd);
+       ret =3D renesas_eth_serdes_common_init_ram(dd);
        if (ret)
                return ret;

        for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
-               ret =3D r8a779f0_eth_serdes_reg_wait(&dd->channel[i], 0x000=
0,
+               ret =3D renesas_eth_serdes_reg_wait(&dd->channel[i], 0x0000=
,
                                                   0x300, BIT(15), 0);
                if (ret)
                        return ret;
        }

        for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++)
-               r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03d4, 0x=
380, 0x0443);
+               renesas_eth_serdes_write32(dd->channel[i].addr, 0x03d4, 0x3=
80, 0x0443);

-       ret =3D r8a779f0_eth_serdes_common_setting(channel);
+       ret =3D renesas_eth_serdes_common_setting(channel);
        if (ret)
                return ret;

        for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++)
-               r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03d0, 0x=
380, 0x0001);
+               renesas_eth_serdes_write32(dd->channel[i].addr, 0x03d0, 0x3=
80, 0x0001);


-       r8a779f0_eth_serdes_write32(dd->addr, 0x0000, 0x380, 0x8000);
+       renesas_eth_serdes_write32(dd->addr, 0x0000, 0x380, 0x8000);

-       ret =3D r8a779f0_eth_serdes_common_init_ram(dd);
+       ret =3D renesas_eth_serdes_common_init_ram(dd);
        if (ret)
                return ret;

-       return r8a779f0_eth_serdes_reg_wait(&dd->channel[0], 0x0000, 0x380,=
 BIT(15), 0);
+       return renesas_eth_serdes_reg_wait(&dd->channel[0], 0x0000, 0x380, =
BIT(15), 0);
 }

-static int r8a779f0_eth_serdes_init(struct phy *p)
+static int renesas_eth_serdes_init(struct phy *p)
 {
-       struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
+       struct renesas_eth_serdes_channel *channel =3D phy_get_drvdata(p);
        int ret;

-       ret =3D r8a779f0_eth_serdes_hw_init(channel);
+       ret =3D renesas_eth_serdes_hw_init(channel);
        if (!ret)
                channel->dd->initialized =3D true;

        return ret;
 }

-static int r8a779f0_eth_serdes_exit(struct phy *p)
+static int renesas_eth_serdes_exit(struct phy *p)
 {
-       struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
+       struct renesas_eth_serdes_channel *channel =3D phy_get_drvdata(p);

        channel->dd->initialized =3D false;

        return 0;
 }

-static int r8a779f0_eth_serdes_hw_init_late(struct r8a779f0_eth_serdes_cha=
nnel
+static int renesas_eth_serdes_hw_init_late(struct renesas_eth_serdes_chann=
el
 *channel)
 {
        int ret;

-       ret =3D r8a779f0_eth_serdes_chan_setting(channel);
+       ret =3D renesas_eth_serdes_chan_setting(channel);
        if (ret)
                return ret;

-       ret =3D r8a779f0_eth_serdes_chan_speed(channel);
+       ret =3D renesas_eth_serdes_chan_speed(channel);
        if (ret)
                return ret;

-       r8a779f0_eth_serdes_write32(channel->addr, 0x03c0, 0x380, 0x0000);
+       renesas_eth_serdes_write32(channel->addr, 0x03c0, 0x380, 0x0000);

-       r8a779f0_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0000);
+       renesas_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0000);

-       return r8a779f0_eth_serdes_monitor_linkup(channel);
+       return renesas_eth_serdes_monitor_linkup(channel);
 }

-static int r8a779f0_eth_serdes_power_on(struct phy *p)
+static int renesas_eth_serdes_power_on(struct phy *p)
 {
-       struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
+       struct renesas_eth_serdes_channel *channel =3D phy_get_drvdata(p);

-       return r8a779f0_eth_serdes_hw_init_late(channel);
+       return renesas_eth_serdes_hw_init_late(channel);
 }

-static int r8a779f0_eth_serdes_set_mode(struct phy *p, enum phy_mode mode,
+static int renesas_eth_serdes_set_mode(struct phy *p, enum phy_mode mode,
                                        int submode)
 {
-       struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
+       struct renesas_eth_serdes_channel *channel =3D phy_get_drvdata(p);

        if (mode !=3D PHY_MODE_ETHERNET)
                return -EOPNOTSUPP;
@@ -316,27 +316,27 @@ static int r8a779f0_eth_serdes_set_mode(struct phy *p=
, enum phy_mode mode,
        }
 }

-static int r8a779f0_eth_serdes_set_speed(struct phy *p, int speed)
+static int renesas_eth_serdes_set_speed(struct phy *p, int speed)
 {
-       struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
+       struct renesas_eth_serdes_channel *channel =3D phy_get_drvdata(p);

        channel->speed =3D speed;

        return 0;
 }

-static const struct phy_ops r8a779f0_eth_serdes_ops =3D {
-       .init           =3D r8a779f0_eth_serdes_init,
-       .exit           =3D r8a779f0_eth_serdes_exit,
-       .power_on       =3D r8a779f0_eth_serdes_power_on,
-       .set_mode       =3D r8a779f0_eth_serdes_set_mode,
-       .set_speed      =3D r8a779f0_eth_serdes_set_speed,
+static const struct phy_ops renesas_eth_serdes_ops =3D {
+       .init           =3D renesas_eth_serdes_init,
+       .exit           =3D renesas_eth_serdes_exit,
+       .power_on       =3D renesas_eth_serdes_power_on,
+       .set_mode       =3D renesas_eth_serdes_set_mode,
+       .set_speed      =3D renesas_eth_serdes_set_speed,
 };

-static struct phy *r8a779f0_eth_serdes_xlate(struct device *dev,
+static struct phy *renesas_eth_serdes_xlate(struct device *dev,
                                             const struct of_phandle_args *=
args)
 {
-       struct r8a779f0_eth_serdes_drv_data *dd =3D dev_get_drvdata(dev);
+       struct renesas_eth_serdes_drv_data *dd =3D dev_get_drvdata(dev);

        if (args->args[0] >=3D R8A779F0_ETH_SERDES_NUM)
                return ERR_PTR(-ENODEV);
@@ -344,15 +344,15 @@ static struct phy *r8a779f0_eth_serdes_xlate(struct d=
evice *dev,
        return dd->channel[args->args[0]].phy;
 }

-static const struct of_device_id r8a779f0_eth_serdes_of_table[] =3D {
+static const struct of_device_id renesas_eth_serdes_of_table[] =3D {
        { .compatible =3D "renesas,r8a779f0-ether-serdes", },
        { }
 };
-MODULE_DEVICE_TABLE(of, r8a779f0_eth_serdes_of_table);
+MODULE_DEVICE_TABLE(of, renesas_eth_serdes_of_table);

-static int r8a779f0_eth_serdes_probe(struct platform_device *pdev)
+static int renesas_eth_serdes_probe(struct platform_device *pdev)
 {
-       struct r8a779f0_eth_serdes_drv_data *dd;
+       struct renesas_eth_serdes_drv_data *dd;
        struct phy_provider *provider;
        int i;

@@ -371,20 +371,20 @@ static int r8a779f0_eth_serdes_probe(struct platform_=
device *pdev)
                return PTR_ERR(dd->reset);

        for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
-               struct r8a779f0_eth_serdes_channel *channel =3D &dd->channe=
l[i];
+               struct renesas_eth_serdes_channel *channel =3D &dd->channel=
[i];

                channel->phy =3D devm_phy_create(&pdev->dev, NULL,
-                                              &r8a779f0_eth_serdes_ops);
+                                              &renesas_eth_serdes_ops);
                if (IS_ERR(channel->phy))
                        return PTR_ERR(channel->phy);
-               channel->addr =3D dd->addr + R8A779F0_ETH_SERDES_OFFSET * i=
;
+               channel->addr =3D dd->addr + RENESAS_ETH_SERDES_OFFSET * i;
                channel->dd =3D dd;
                channel->index =3D i;
                phy_set_drvdata(channel->phy, channel);
        }

        provider =3D devm_of_phy_provider_register(&pdev->dev,
-                                                r8a779f0_eth_serdes_xlate)=
;
+                                                renesas_eth_serdes_xlate);
        if (IS_ERR(provider))
                return PTR_ERR(provider);

@@ -394,7 +394,7 @@ static int r8a779f0_eth_serdes_probe(struct platform_de=
vice *pdev)
        return 0;
 }

-static void r8a779f0_eth_serdes_remove(struct platform_device *pdev)
+static void renesas_eth_serdes_remove(struct platform_device *pdev)
 {
        pm_runtime_put(&pdev->dev);
        pm_runtime_disable(&pdev->dev);
@@ -402,15 +402,15 @@ static void r8a779f0_eth_serdes_remove(struct platfor=
m_device *pdev)
        platform_set_drvdata(pdev, NULL);
 }

-static struct platform_driver r8a779f0_eth_serdes_driver_platform =3D {
-       .probe =3D r8a779f0_eth_serdes_probe,
-       .remove =3D r8a779f0_eth_serdes_remove,
+static struct platform_driver renesas_eth_serdes_driver_platform =3D {
+       .probe =3D renesas_eth_serdes_probe,
+       .remove =3D renesas_eth_serdes_remove,
        .driver =3D {
-               .name =3D "r8a779f0_eth_serdes",
-               .of_match_table =3D r8a779f0_eth_serdes_of_table,
+               .name =3D "renesas_eth_serdes",
+               .of_match_table =3D renesas_eth_serdes_of_table,
        }
 };
-module_platform_driver(r8a779f0_eth_serdes_driver_platform);
+module_platform_driver(renesas_eth_serdes_driver_platform);
 MODULE_AUTHOR("Yoshihiro Shimoda");
 MODULE_DESCRIPTION("Renesas Ethernet SERDES device driver");
 MODULE_LICENSE("GPL");
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

