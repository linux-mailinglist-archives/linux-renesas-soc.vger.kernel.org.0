Return-Path: <linux-renesas-soc+bounces-16849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD04AB12E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B6557A7AEB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCC128ECEF;
	Fri,  9 May 2025 12:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="alQH125Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AC274648
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792220; cv=fail; b=R8EVKHR4VRpXarJA7JBZHSAAfrBZPBElnmlFLFwy4FC/P0yRFzTGCLh8a7kbp5DMjZ8/CpLDc2yBK0F76PRihgiiXW5S6EYzaUTYDS0L9HCSDx43fROSU5gYu7rUTU4PKeVeHzFGJBBJyUFH6G2AyvS5g8LIQybi+6WHTNdIsfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792220; c=relaxed/simple;
	bh=XqsmcrcDNX+ruk0w7zqU/z1mhzAF9l7qForEG68xyTY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ufMMaAXKHGgxcZZb3dVe17NuAUI0DUd6325MfrRDrGCgY1EfW+E68ff6fq5E3h6gZPeU/NijulKBlpxws6JQc0h0CFrwFnv+S9W3u5pHwxZWG23znuhucPMT0IZcYGv7rquzEnYhuQPrPmzyYyXkgmJxXGBteTS+64Cy8os7m5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=alQH125Q; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qg7RsZQnP+w+tT00xeYXDPlmiZLGWvl3G4wgtJycbwh78F7CAuF1uVIcjO7KARQPMrpA5i9q+eClQdeeZ8zOXtc/H4pIkWkYWls5GTvASwB0iOmfQKdLnrX7sHF8RoXUFWH25xsGkIG2qWArt6U0Q3CJAw6SIyj7johEDRJPnoPxAyOxj+aoy1vX77fsw/kAXw0HWIkoljAwgnpeSHufleGGi98enhgGjx4HXUJjbykXaeGV/ouNMhpqjz/8WZxRns6nAxY35JOnSBubXfXF5OZ2qqyV3gDuTg94vMhlhNxxYQVc5OzOIfY5cj8LWBdMGBf4kEox+g3A39d7la+tNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGxN3+vwGbS1I1fYUJTN5TrvXDj6P+cu+ooLOmst+xA=;
 b=ptpb8Wbk6C/cNDuMAweYFD384ZHKeAg4Sy4a7SVtGNihrP+Q8l4Xm/Ja9XiyH7xlAhfr7HhWc9G63cJYvyjR/tgN9Pc0qRpJKHS/qRZlVVtd/2KV3oMM9GFdeopn0ButMp7vxKHTsuc5N2hysgNQbeRmPkUE/S9W075MDWY+IbdLfHKdRisUr43S/kaQxOz9tFl74rC5ApG5LKS2/6LFqP6AVgEVQ7h+LATw+UrSFCwVQVMcXBU7RkL2QU9HXWX3Nn/SY2b87ufwJNP4PX0S77O+/iK6B2assYCyz3j4hniV+2xSDY6FLGFlaMopatdSgvqYWPI7Z5Es9jE+SWT3lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGxN3+vwGbS1I1fYUJTN5TrvXDj6P+cu+ooLOmst+xA=;
 b=alQH125QkqmjEz65Q2X7fSL/UQAeNRHcUQ9GoGAdEQ+DhAsgTJPDrjNXnEPIhMy0ShImK14/w5DaQsUQzuqfjc3bQp7FhM+8b0TdGD4SGMoRlIfDKsVza1CzMeLuu9QzpCWBONEAt856/1BoI/nMSidmXsBwnvjw41vMq6+B2ow=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OSCPR01MB15842.jpnprd01.prod.outlook.com (2603:1096:604:3e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 12:03:35 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 12:03:35 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 7/9] phy: renesas: ethernet serdes: add support for R-Car SoC
 X5H (r8a78000)
Thread-Topic: [PATCH 7/9] phy: renesas: ethernet serdes: add support for R-Car
 SoC X5H (r8a78000)
Thread-Index: AdvA2mNLDABcA0N7Q52j7lXd7otvvg==
Date: Fri, 9 May 2025 12:03:35 +0000
Message-ID:
 <TYRPR01MB142847721F6AAE69FD827C320828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OSCPR01MB15842:EE_
x-ms-office365-filtering-correlation-id: a6f9e550-617f-4eb3-531a-08dd8ef186af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xlqQronksJ2tx6UkibzrfITWCvI2F/XaDMa6R8mqXdigBfVuYcIiX6pw5ut5?=
 =?us-ascii?Q?6PpbgsEvGTO5DrDIGWeB+tJ9MngBcCbJCuvsPSZGza7+khhmPSzqdpjoIxTL?=
 =?us-ascii?Q?fV6Ac7Qpgz0VwuSVemztbIH18eT9MGZXgiwt8W8eVIIfGWOhBPIJZLy8696I?=
 =?us-ascii?Q?uOgU8VkTQD7+4yFhbZSBC0FadnM+4XTXy0V/K3LUDGpJmv3DCRgcXyF9lchv?=
 =?us-ascii?Q?uOiR7PZTxDjcyx3Oqufv8UdZDQpPeVKGMsS1ynVn5vIT8a3DxtmeS/GkJQhG?=
 =?us-ascii?Q?r6zqJdkVskdoBQEbMcEeH16TbqPN6eJdgDQ6GmZTx82zqWGTtgQPpCQvq+GA?=
 =?us-ascii?Q?nMZn8r+56fp6FP5amWK8yr5DPetovUKZzDKu6llRbknoMMnuVXRljLafgs4V?=
 =?us-ascii?Q?IvcYSJea9XLNMkVgobF8lqQoODCIO3lb7RqtcA+Hp9sNEAZB9Phu0slk6Z7e?=
 =?us-ascii?Q?MTy7Kid83dMN5PEjeC0sdmyCenq2c12NylaJyEw9tqI1PUc4Rnf8A9n2EfzZ?=
 =?us-ascii?Q?KAMwSwCmUFI5Yc3JKMRMwFjPnHD/mK5lAbajdQmBBwuJ3ELp/SGs0sNzkj8i?=
 =?us-ascii?Q?kUWwGjgkqnXQaWqb2lekYSAFqMutjqZ2tWmv3CeiA+mfcedOaonH6XmVUr0U?=
 =?us-ascii?Q?+2euXIR8szux5ECWdO3u4XfkpMnlS3LGAhJD8VkvDNOP5i76iFWq9th1C1k1?=
 =?us-ascii?Q?r1bEvHWo4MmYPxf+AP5XGNZPiXx8eY5HONSmU7AYJ+thBTU9FzEJos9DuLtZ?=
 =?us-ascii?Q?xC2Fr3aSRaOVd98f0OdL2ptyzfQ/FIpM8qjR6DfrqzEvm1Kg+qZK5BENItql?=
 =?us-ascii?Q?cl/Ab0FQpQIlkMT2x1KEl76QNp5dmRwhpX0oOu0HvYwFm28CK8+vsuqnCmaf?=
 =?us-ascii?Q?jw/cpxxAwxQG3gyLTqQvkbuI2FmYuhbFnS7hQ3g/Zse+vmV5OCWU4Ix164b3?=
 =?us-ascii?Q?HRCsmlEtcoFGX9UpvPDcvel5T3ON0eNmRen33vZjmdNXxPMWxVmODOioWgnw?=
 =?us-ascii?Q?YHHS7DkdASHCfc2GpC3dwlBJS3RSEddEoxcQx3Kgj9KYyOvuL5ONAzskPySg?=
 =?us-ascii?Q?lnt7I4LY83/ZvJrUZdzAgmYL/u54I9JT7o/KRLQdh2ATY1U1fYK/pYvJlIKH?=
 =?us-ascii?Q?NtfaSIDh9zcOjVz7NCz186sCfkjtArpdNrPPh/wP0yCuKh3oM9DOxaw5IZD6?=
 =?us-ascii?Q?mSMe/dABQDFAvPqcbOn2kOlc6BaIQZmxBezPjOsSdys+lMwiRJo95UW74UJH?=
 =?us-ascii?Q?/EpbIFN/b+qzeg2nLq6Drt+DIYvrgaVsjj58ZyyiMJ6APCwbhrQM9DL7K/Gx?=
 =?us-ascii?Q?2DzFahwLsVBLU+dgTwS997Bzdoi8aACDRmT2Ge9qvzLD01NOssaIrsBXA0Ka?=
 =?us-ascii?Q?rpnGv2ORVrMv9YbvzVv+swU5bNFf0GOMC2lJTLSgPmkydpZWk8JmmWvPenEB?=
 =?us-ascii?Q?fvC3Zd/LHfDhLiPdPafOTxgvCDBR5Z20YX4hzVWhYyjHDWxvjA8K6UWW8hmb?=
 =?us-ascii?Q?ch68L21yZD2M1AA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9BKURIhA3wHhSyT+hTliawGBb2uSyZllyK4kSE/0E0nGuoBJTlMPG06xOlDO?=
 =?us-ascii?Q?AmEeeC6XNMJKO0zvvrETB3Qtf7PNvDJFlrGLcOnMu+3asHpAXefHAf7G+ICB?=
 =?us-ascii?Q?ba6wH0W7qX9lDt/V1lUwfQEy1BXX0fR0qQ4qvibvkB9XTEE99P+Y+SVjDnWH?=
 =?us-ascii?Q?2QqG6+iJjfMYGuvKpnBjkBz4QKiT1Zp9jlZZmEvbn4uBvw/OK/TTbs6pEe+t?=
 =?us-ascii?Q?bIVt3spFKt2D+KrfD6yVou6JhW5cM+ZjW/+eHVK3t880BrPrk9sEHihiANyF?=
 =?us-ascii?Q?+CDtYNrdzLgyJWpTc9aPXdUAmKDr8byNfNmM2I8VfoR2NtMcCgZISczZMziQ?=
 =?us-ascii?Q?CQUoRooJCiGqTPge6tLAbZdbuMwEkLPncZRvm0NC0pNa7G0fOLtPqS0BkGV/?=
 =?us-ascii?Q?1cFg9K+/8AqoMUUZVAqfJ0oXaPvTSDKNYBiLWIwekjrYY3szkFDzOcJSEnHP?=
 =?us-ascii?Q?0a3bfoAGpnqiOMDTcaNL8O1+R+cxp/S32K44STfZ9+SMCEIc5V6XU4ZJZ2LR?=
 =?us-ascii?Q?6/dcb5LyNKmvkhvDP1Oq/ldMnDVxCGxgYuBasu1IHOX4Jjb3IqoyNIbUNr1a?=
 =?us-ascii?Q?RFCBanuyKeD1NZPwsRf3nhTPghpt3D+htT/EcyLELLvh+P8kKovLuCM5HreV?=
 =?us-ascii?Q?KLizCXhDeWhTCx7RUaNy4yAsXGh4C+rd0BmZprU4psWK4DLaOJSnlUC2rg65?=
 =?us-ascii?Q?kT0AAxMt6iRTgY1DcNBZX/RYHE19qmKQKFzJUfUEuRMgYWfHMz0Xmc0Pkbk2?=
 =?us-ascii?Q?gyRcwmopmnnxjFK0V6QldrBVp4Ww1ZaVHNDKG+3NyCoIxaT1hepXNX6Pfhcz?=
 =?us-ascii?Q?GzWdIx8j7zQuQR27/2SOVdKUETDmKCOLrgia/gl83uOK8uEVHXmF7+t0tiI+?=
 =?us-ascii?Q?XZUIpr3lEXREvi4fp0k4QxbvOc+s7x7UC6wjvcaltqlR7NC+HnVlkarYj8Se?=
 =?us-ascii?Q?qcayJpAscsLbPRNWWswaT9h5VGqZccmr3mCPjqDzACUTciNhIpSeWXIUvLzZ?=
 =?us-ascii?Q?ci8biRnmShSqqPyfRXCHVXUieCO6Z0ovg7A2tG4cTLFQn+y9gVcgidUayqY9?=
 =?us-ascii?Q?cMw/PGi74HDUXLY2OOb51n5uJcAiyNmSkUwdVCzBnwICv24KgnZcYYTOdKnX?=
 =?us-ascii?Q?QL1y5wY2/VG9/HPTOtnBA0uWd3mC3fG9EvaIWfsXTx3mITleQSN+8nAuD6a1?=
 =?us-ascii?Q?S9niC2W1LGUgOYGbNkI6Jdfb3bGBWkeDNtX92uGRmn03xcWVvKJM7Wxnlnp8?=
 =?us-ascii?Q?chRA36/x3iLI012zyO3tgVRkRrnyUic7KlhKu+tFxsqtKSTpy7dUY1jclSPE?=
 =?us-ascii?Q?ExjprkSh2LwbkYxaqRcwP98z2GMdDvTBBnhBmUTyfzSLeUWIiTO8JWuRBfU3?=
 =?us-ascii?Q?gzGYYb2p1zvcuLIjBATPnSgq6/wH9yZ7QEB7aLrhIgJuHEy/D6vnggwhb1AW?=
 =?us-ascii?Q?vf+piuQfyDcOZCnFQJeAQHSJKBss/nT97EosWlXN0H1uSlOB3hQXtAwdS90S?=
 =?us-ascii?Q?+6/3o6GzPIfWffM1S+fdzItTFVoH+alq34oFK4fgvGhjUFfNlV2WQfSYJUvj?=
 =?us-ascii?Q?oagXYA53fI9L2yInS6zdcn2xW4zUNVJbcLlgnqpN?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6f9e550-617f-4eb3-531a-08dd8ef186af
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 12:03:35.4311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dm0f4DR4v3UeQqL6vom5jwD/rzs19sW0I2XXIqPKQTR+NHV4XfBd6sU3PcXdDBmdQ0meIWwWtuc0HuSuNMZXw5wDcRE7f8Kv2Ow9aJtfXgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15842

From 29225bba5c4bb27ee0c10edd599bf629fa59f997 Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 8 May 2025 12:44:24 +0200
Subject: [PATCH 7/9] phy: renesas: ethernet serdes: add support for R-Car S=
oC
 X5H (r8a78000)

Adding support for a new SOC device.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/renesas-ether-serdes.c | 55 +++++++++++++++++-----
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/renesas/renesas-ether-serdes.c b/drivers/phy/renes=
as/renesas-ether-serdes.c
index 683409d5e0f9..4c53c81903ef 100644
--- a/drivers/phy/renesas/renesas-ether-serdes.c
+++ b/drivers/phy/renesas/renesas-ether-serdes.c
@@ -14,11 +14,13 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>

+#define RENESAS_ETH_SERDES_MAX_NUM             R8A78000_ETH_SERDES_NUM
 #define R8A779F0_ETH_SERDES_NUM                        3
+#define R8A78000_ETH_SERDES_NUM                        8
 #define RENESAS_ETH_SERDES_OFFSET              0x0400
 #define RENESAS_ETH_SERDES_BANK_SELECT         0x03fc
 #define RENESAS_ETH_SERDES_TIMEOUT_US          100000
-#define RENESAS_ETH_SERDES_LOCAL_OFFSET        0x2600
+#define RENESAS_ETH_SERDES_LOCAL_OFFSET                0x2600
 #define RENESAS_ETH_SERDES_NUM_RETRY_LINKUP    3

 struct renesas_eth_serdes_drv_data;
@@ -35,10 +37,21 @@ struct renesas_eth_serdes_drv_data {
        void __iomem *addr;
        struct platform_device *pdev;
        struct reset_control *reset;
-       struct renesas_eth_serdes_channel channel[R8A779F0_ETH_SERDES_NUM];
+       struct renesas_eth_serdes_channel channel[RENESAS_ETH_SERDES_MAX_NU=
M];
+       const struct renesas_serdes_hw_info *info;
        bool initialized;
 };

+enum DEVICE_CODE {
+       r8a779f0,
+       r8a78000,
+};
+
+struct renesas_serdes_hw_info {
+       int renesas_eth_serdes_num;
+       int device_type;
+};
+
 /*
  * The datasheet describes initialization procedure without any informatio=
n
  * about registers' name/bits. So, this is all black magic to initialize
@@ -82,7 +95,7 @@ renesas_eth_serdes_common_init_ram(struct renesas_eth_ser=
des_drv_data *dd)
        struct renesas_eth_serdes_channel *channel;
        int i, ret;

-       for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
+       for (i =3D 0; i < dd->info->renesas_eth_serdes_num; i++) {
                channel =3D &dd->channel[i];
                ret =3D renesas_eth_serdes_reg_wait(channel, 0x026c, 0x180,=
 BIT(0), 0x01);
                if (ret)
@@ -265,32 +278,34 @@ static int renesas_eth_serdes_hw_init(struct renesas_=
eth_serdes_channel *channel

        reset_control_reset(dd->reset);

+       mdelay(1);
+
        /* There is a slight difference in SerDes hardware behavior between
         * each version after resetting. This step is to ensure the stable
         * condition of initialization, especially for R-Car S4 v1.1.
         */
-       mdelay(1);
-       iowrite32(0, dd->addr + RENESAS_ETH_SERDES_LOCAL_OFFSET);
+       if (dd->info->renesas_eth_serdes_num =3D=3D r8a779f0)
+               iowrite32(0, dd->addr + RENESAS_ETH_SERDES_LOCAL_OFFSET);

        ret =3D renesas_eth_serdes_common_init_ram(dd);
        if (ret)
                return ret;

-       for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
+       for (i =3D 0; i < dd->info->renesas_eth_serdes_num; i++) {
                ret =3D renesas_eth_serdes_reg_wait(&dd->channel[i], 0x0000=
,
                                                   0x300, BIT(15), 0);
                if (ret)
                        return ret;
        }

-       for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++)
+       for (i =3D 0; i < dd->info->renesas_eth_serdes_num; i++)
                renesas_eth_serdes_write32(dd->channel[i].addr, 0x03d4, 0x3=
80, 0x0443);

        ret =3D renesas_eth_serdes_common_setting(channel);
        if (ret)
                return ret;

-       for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++)
+       for (i =3D 0; i < dd->info->renesas_eth_serdes_num; i++)
                renesas_eth_serdes_write32(dd->channel[i].addr, 0x03d0, 0x3=
80, 0x0001);


@@ -414,14 +429,25 @@ static struct phy *renesas_eth_serdes_xlate(struct de=
vice *dev,
 {
        struct renesas_eth_serdes_drv_data *dd =3D dev_get_drvdata(dev);

-       if (args->args[0] >=3D R8A779F0_ETH_SERDES_NUM)
+       if (args->args[0] >=3D dd->info->renesas_eth_serdes_num)
                return ERR_PTR(-ENODEV);

        return dd->channel[args->args[0]].phy;
 }

+static const struct renesas_serdes_hw_info r8a779f0_hw_info =3D {
+               .renesas_eth_serdes_num =3D R8A779F0_ETH_SERDES_NUM,
+               .device_type =3D r8a779f0,
+};
+
+static const struct renesas_serdes_hw_info r8a78000_hw_info =3D {
+               .renesas_eth_serdes_num =3D R8A78000_ETH_SERDES_NUM,
+               .device_type =3D r8a78000,
+};
+
 static const struct of_device_id renesas_eth_serdes_of_table[] =3D {
-       { .compatible =3D "renesas,r8a779f0-ether-serdes", },
+       { .compatible =3D "renesas,r8a779f0-ether-serdes", .data =3D &r8a77=
9f0_hw_info },
+       { .compatible =3D "renesas,r8a78000-ether-serdes", .data =3D &r8a78=
000_hw_info },
        { }
 };
 MODULE_DEVICE_TABLE(of, renesas_eth_serdes_of_table);
@@ -430,12 +456,19 @@ static int renesas_eth_serdes_probe(struct platform_d=
evice *pdev)
 {
        struct renesas_eth_serdes_drv_data *dd;
        struct phy_provider *provider;
+       const struct renesas_serdes_hw_info *info;
        int i;

        dd =3D devm_kzalloc(&pdev->dev, sizeof(*dd), GFP_KERNEL);
        if (!dd)
                return -ENOMEM;

+       info =3D of_device_get_match_data(&pdev->dev);
+       if (info > 0)
+               dd->info =3D info;
+       else
+               return PTR_ERR(info);
+
        platform_set_drvdata(pdev, dd);
        dd->pdev =3D pdev;
        dd->addr =3D devm_platform_ioremap_resource(pdev, 0);
@@ -446,7 +479,7 @@ static int renesas_eth_serdes_probe(struct platform_dev=
ice *pdev)
        if (IS_ERR(dd->reset))
                return PTR_ERR(dd->reset);

-       for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
+       for (i =3D 0; i < dd->info->renesas_eth_serdes_num; i++) {
                struct renesas_eth_serdes_channel *channel =3D &dd->channel=
[i];

                channel->phy =3D devm_phy_create(&pdev->dev, NULL,
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

