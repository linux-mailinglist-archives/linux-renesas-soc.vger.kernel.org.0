Return-Path: <linux-renesas-soc+bounces-16851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB2AB12F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 810E0523AF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810CC28F934;
	Fri,  9 May 2025 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SfQFtASA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010069.outbound.protection.outlook.com [52.101.228.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3427A925
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 12:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792342; cv=fail; b=n52hGBv6mdGO0lfoA+FwLyRv7mX+YWqkXzxq0QKqsr4IoYef7V2ZgKVJ5Ze+gmrxsCQh09zO2O5XIXTnAfZXq9YJtDRgLD+okCExk+FwHxwR11UqRu0yhu/W5DwS/5HcHuYx1ejzYofK2phfeVPkM4y7cGKOQPIFMY+1uwxzqVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792342; c=relaxed/simple;
	bh=g5ANI0ZwcG+ZCPg3WwuHylSahO8F7wC6pynvDRcaY1s=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CF4AzitopunYsKjxKGkJtomC7UoV0TXVK7+BFMrMx3h49nSX6TDKfSlDMHNKemnohQRFKpEBfGX51JGhbK/3DKquev5IUyw7j9qwYfwqPrmueq+r+BGZKcyuvezSKby67v0FmXYS4U/kVd+ZkPkLxbwtp8xA9gu5VZ7/v9xqvnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SfQFtASA; arc=fail smtp.client-ip=52.101.228.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnhCz9ZUey9EbnLlzWx3XOKL8R+w/RkpmPF+fEaJAFL/c5Qr4YJQdqjB63n2QIYtZTU7lQ5jNk5jZoVY7YH2aKy/6lOk49L9aV1HHkQAhle7Cf2PV0Zio96pCKGL17LwCTCr2oG8teBzmdHO3hfkY0vaEIolpsttcFwMUE1oKbfxZ9eOJNKCIsOAP0cZ66mWCz3ALjt+0rFfc6V2tKyGOk0n3o9mLWIUa4QVze65uDZPZjUg0UhVXs9NzDB6q7ddscNyJqgSBrKA4dnvCeP3CRKLQDhOEiXJF851Iw5pqLMtTEsrNJcNxDAYyn3NONjzH9SfqtEk0d/nEv9SXbcAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvKk+P1xczMWYwvnGbrBEZOqa1xcpaMnbJ1GHXWUqF0=;
 b=BmDr9feuz61MswfVpOfftppkTve9i4p7z/+T08jh4YJ4z+IwnunkD9yONiiP03S/tPaisUnMKVT0N6rIZah9GKD0awSpSYE5W7fU54Isz3AfCg2j66TdsKa46KEj/zNIfTDjQgWRYwAIBYZeXJnqqRsGQ0EWEdOEftC0iQgcIbuR0TFif8zPtt2zMmm0wIVyMXCpR3iNYwWxL2B1o9aSbnGndOmv/ACxxUiJiBb0YmYbWTVWD89lGU/HRVjF3QskbCFdQpLhMkIsyivwMKKuMQQxENLYwdn9DztpO7E/kAO7yD2x+W5+xpPk4RwQlayjlmJOEziHwK71lsoOgwUArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvKk+P1xczMWYwvnGbrBEZOqa1xcpaMnbJ1GHXWUqF0=;
 b=SfQFtASAFpSZeVMH6paRR4RpX64ffy/8I5jq9zb67bLLvvYCftKW/NZ4mDnDVKyuq4JGlgqCuW+yLG6yAhep0tWcplzb1863b8lyfGCaXjVLG8IMV1xhU5drZqJUMjKGtQzG0hmoSb8L7OWIFfw7wIhYqVWYKBSEw3h8+QeoTvM=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OSCPR01MB15842.jpnprd01.prod.outlook.com (2603:1096:604:3e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 12:05:36 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 12:05:36 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 9/9] phy: renesas: ethernet serdes: introduce register names
Thread-Topic: [PATCH 9/9] phy: renesas: ethernet serdes: introduce register
 names
Thread-Index: AdvA2qqOHxkiD2B2TQKeDNXsGck3CA==
Date: Fri, 9 May 2025 12:05:36 +0000
Message-ID:
 <TYRPR01MB142843BDB61D280B348AC7CAF828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OSCPR01MB15842:EE_
x-ms-office365-filtering-correlation-id: 384df387-adbf-442a-0129-08dd8ef1cee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pKR7SjmrN4PPAMbp/VdvrulW1HoLLd9nNo0L8eGhWzqi4x9pdtZurgNy54Bq?=
 =?us-ascii?Q?huUWYJ+vbkuF9T7TlM0z0aQI1NY1V5QOZX0AVvNZakS9LdoQdNxa8unFDP1w?=
 =?us-ascii?Q?nQTCGqW/MK4jiCbyr5JNYGcE0WInQnmM91TC60gL1MiHRwpnaGlAFVP7bkF+?=
 =?us-ascii?Q?FQKyigT7QqnqGvqOVeYU8/PHfBMPaTd0/v+CNT0ifok47wNFJHcwsnPy5mkh?=
 =?us-ascii?Q?7F8GBHa8jd8dlWZCVeVQpVqrDzgNHYPdRKQyani0ERKXAEe/RnT7skLf2m7f?=
 =?us-ascii?Q?7BOJvRX8R4xlrp74Ugs0AwblyV06pvi6o0NzCKol58qxLGRgr0B+MOz9J/S4?=
 =?us-ascii?Q?Gir2OT3J8VCQwDSKNF/VWE875SMkP7CHeJpzHzTuSzII/g655p68DT6wM4Tv?=
 =?us-ascii?Q?ZhGc9/LjvU0pQoAw6MZGGal46PrVYned5iX02IjVBTKJf/hLS4Q9ppTi6vGX?=
 =?us-ascii?Q?al5rgB0br1JIbZ6MxC/y/dnnHAxiQzI35dnhbNh2u8kQtw6JWqLO+u+JOv5L?=
 =?us-ascii?Q?KM/8062JUjcB/cDCXViOY8a7qIDwJT13kV5de96HQhX9z+5VT1lu7bM+6L2k?=
 =?us-ascii?Q?IRJTpC3mPJwmJWPC8VUh7IFK97QPBg5dMIfFJuf9mHCg9Dgqa4PeJodbZ426?=
 =?us-ascii?Q?TroT8kLSKvZPcSPZ8NMHAjVQ9oeDxA4Ja0xI768Gi1GbN6/KL46iElGvp8Pb?=
 =?us-ascii?Q?R5AtXLTYGRfwKjW32cX4a8GFJ1uq4tlM2RIcDgcXvSEOBnifrIiERL0CFovh?=
 =?us-ascii?Q?mDXqch8WEWQyc1bNLH/huZv32WoRvXj3S+Ka+ZN8cd9HLFS4YXmLCkVHVpO3?=
 =?us-ascii?Q?SlZI/Z0Scjzg1IgQIH2LegsJhgWo7tlwGi0h41EQxPyr3crnMWibhSu7MpA5?=
 =?us-ascii?Q?iH4U+geCo8GTVE0I6BWwEK8pTMAXRQSEGz/wRMNCNNyT8dEw2Si26Ombl7WU?=
 =?us-ascii?Q?MbEb0ngDUz8YUCvgUYjEzX3JBu+/xTvip+m5345tluu3XjWVM4J00LCt/xpz?=
 =?us-ascii?Q?71xSZ1i2XEnhCt7jDbcSnSu9PbeUYSaZwgVpcwwZmvh5/Br/vPmTWgTpNOo3?=
 =?us-ascii?Q?pbskDAGlkgDa68puu/IeaFxAEl5SMbIFcY3werlxPDHRizpGIfwjHaoin2GD?=
 =?us-ascii?Q?ysSyzDaDrey7rOnkALToArpurR6N8CXmlLGl6v+ZRnXR9iQLMgxiykNzYPAf?=
 =?us-ascii?Q?TZ6GnryclDmHvgAY2kKFMhIXBJz/xh++nCehnjw1pHxm0SIlviPnJCYeWGdu?=
 =?us-ascii?Q?rY3BaxlRj68zA8sNnJifyQTYJ8J6NPsOPgZLhjv5aYHzq+cQwnYIF8ETbHZ5?=
 =?us-ascii?Q?sd4/O+3Kv61pFPF+n3AqcL9OGOgBDNuYuk9tmwMxkf/Y2yxeYvoOYK1TzT5a?=
 =?us-ascii?Q?Bp2NnWSethk8xTfFwtj7bto+76pPvaZBwVfMsTQPJGREiuZvcvV/LCfNzyuj?=
 =?us-ascii?Q?6nXzQ5FzhzyNwJhXa8ZktUtqqfHGQtGtbDUaRm4mC6pWWOmCAjlhlH3AEs+3?=
 =?us-ascii?Q?A0KznFVFp8/kffU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YLZVS29LAWnMKzRj7TXKg8lVT2Amtrvg96HYrSYfzTUPSIPsEQJmRBZR2jTW?=
 =?us-ascii?Q?zumKLnw3GOVsDK2npObTIpL2/2zqb8GxA5XtQkTdjvoIJjk6jkr1y/r3z6mt?=
 =?us-ascii?Q?cvG166ANh53pzCNkgeXL82fDjKXqe1cGQOODvQ0+eCe0tFU8QQeczT1y4wQl?=
 =?us-ascii?Q?uZv22Xm6tTRy10CjMuXPDmdokh9U9Q8l27wDrcz862L7I9UcciktaPwOCmBL?=
 =?us-ascii?Q?lfninKslz++89s37jgvVR1tqPgH5c1oYi8iaaf/T2O8kRvxd5IGqhhCpIIQb?=
 =?us-ascii?Q?6JmiTT5fefB5hVxGYfveLkvsvJLIfbbQWPzMdDn8cNTTV4c2JHOh5k7khrll?=
 =?us-ascii?Q?QnVoivCRPNOigcZPAqpS0pIdxQ/iLJVVFFB7C04Ntw8QRFfY4SIbz+9S9FA7?=
 =?us-ascii?Q?97XlukYTo9xjJiNjT2/9xsHXIN1131ZE4tHE8M5U+SyRpQi7KYKI6yHZV1UA?=
 =?us-ascii?Q?nT1WTVgD5fCok40TJ+5kz4QeL+FAgRq8EmuibLP9El0Neav1rvW90tj/qdR8?=
 =?us-ascii?Q?m3ELg6GohBD+jlZNwYDMPt3N7OqSx7dlQAyYVACzp5VFGBlwUzWDUL5oePMf?=
 =?us-ascii?Q?el8yp/M4wDs3CLyL43B8WrhlDVx3qL4IrMORQdTnzUGrkaEd2WDNtZ2KFBNZ?=
 =?us-ascii?Q?AUMqpbXavGFxwN1LhOM0dgyFGOECW4csRlOo+W3nHTZ3oMXRFRThcs33//Y1?=
 =?us-ascii?Q?yVX7dA0J0cC9qGxaT7zJymCcbtr7uz4FPhHVx6gIj/BcAD6yS54iaukP0hl3?=
 =?us-ascii?Q?rl+qcAFmQHh2kz+se4Gjp3HRAMFCdFyu3x3vhFe6N1PS0ePCEhuepQuKk77W?=
 =?us-ascii?Q?I4lYPcUvx5cIiP7VPqdabqP/TmTPe2ekc6R+k/ShNcGmlMN0u2oRXIQlpozN?=
 =?us-ascii?Q?uGXYObtI1yjiTuDX+Vu6I3ZJoFk4n7hTnEfETbyTsYJYRL4fBmxzVxoLm3h+?=
 =?us-ascii?Q?jfvI4RJOICkTguNsYN6OJRI3MMbntsp0qXihFlZDsfv+piPAH47ndhHEsvgm?=
 =?us-ascii?Q?vmH4SJuEzf1Mj/T1/9BqYUag55A/QebfmgTU3jNiV9JLkzTB4pH+sxxO0kW9?=
 =?us-ascii?Q?AIp3MsUiJWLV1zncO/etaDGUQAen9XhX/Ncekoqs773BTUOOOAS3/XrU4KA9?=
 =?us-ascii?Q?U4OZ9toaOd7/qcQe4OK2TocZ2aj0i031pyyNpLJY4G135WoFXvuejx3nlH41?=
 =?us-ascii?Q?MIB3M7MOnzEjpwW0+nxvamxzsEVWqLtXRj8ATlDcNz0jn/vLs37Rc4oVrw23?=
 =?us-ascii?Q?xJxLlnoiZSyc3gaXw1Z8BI9evko0nVJrMRGmFI8krq7pIi9P6Q33P5SU5HS0?=
 =?us-ascii?Q?B1EyWz4BE1KYrn+xmhh5A5TRpWOvs42MOvqCCSPx8Xqc5HxnM4MEciDO2uXg?=
 =?us-ascii?Q?3LFoZePONNW12qBbDUoAZKTs0JaV27KJMbOCfV4RzjGyDUCIvK9fPyUp55Y6?=
 =?us-ascii?Q?1hRQi8kFMRB3kQL4+oIy/6QdpvGxtNt8VsRbpu7oFozsdidtYjvC2Hi5lmYQ?=
 =?us-ascii?Q?flnyJQJgNQLu69j6ooSuMuB9iQzFNhlkpj3S9dcEBG9Cb27/tNvo2UG0i4Ad?=
 =?us-ascii?Q?00hRdEU+58LbeYY7Ib1/XfEDETvyKRhDn0gcMd7g?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 384df387-adbf-442a-0129-08dd8ef1cee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 12:05:36.5496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zmBUtpMvgwTyvKpai9LwW+tAD5IQCUtDm2niHOHvh2lMOGwBOeFMS7fktfweSKytiozd/R2nX45c1p18qTVhbwt1KcEnAJyRgBuSuZo4eK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15842

From 033f260266007c19c959b3e128c427d3d76953f7 Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 9 May 2025 12:51:59 +0200
Subject: [PATCH 9/9] phy: renesas: ethernet serdes: introduce register name=
s

The original driver used magic-number offsets because the register names
were unknown. Now most of the register names have been disclosed.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/renesas-ether-serdes.c | 298 ++++++++++++++-------
 1 file changed, 203 insertions(+), 95 deletions(-)

diff --git a/drivers/phy/renesas/renesas-ether-serdes.c b/drivers/phy/renes=
as/renesas-ether-serdes.c
index 4c53c81903ef..81b67880678b 100644
--- a/drivers/phy/renesas/renesas-ether-serdes.c
+++ b/drivers/phy/renesas/renesas-ether-serdes.c
@@ -23,6 +23,55 @@
 #define RENESAS_ETH_SERDES_LOCAL_OFFSET                0x2600
 #define RENESAS_ETH_SERDES_NUM_RETRY_LINKUP    3

+#define BANK_180                                0x0180
+#define VR_XS_PMA_MP_12G_16G_25G_TX_GENCTRL0    0x00c0
+#define VR_XS_PMA_MP_12G_16G_25G_TX_GENCTRL1    0x00c4
+#define VR_XS_PMA_MP_12G_16G_TX_GENCTRL2        0x00c8
+#define VR_XS_PMA_MP_12G_16G_25G_TX_RATE_CTRL   0x00d0
+#define VR_XS_PMA_MP_12G_16G_25G_TX_EQ_CTRL0    0x00d8
+#define VR_XS_PMA_MP_12G_16G_25G_TX_EQ_CTRL1    0x00dc
+#define VR_XS_PMA_MP_12G_16G_25G_TX_STS         0x0100
+#define VR_XS_PMA_MP_12G_16G_25G_RX_STS         0x0180
+#define VR_XS_PMA_MP_12G_16G_25G_RX_GENCTRL1    0x0144
+#define VR_XS_PMA_MP_12G_16G_RX_GENCTRL2        0x0148
+#define VR_XS_PMA_MP_12G_16G_25G_RX_RATE_CTRL   0x0150
+#define VR_XS_PMA_MP_12G_RX_EQ_CTRL0            0x0160
+#define VR_XS_PMA_MP_12G_AFE_DFE_EN_CTRL        0x0174
+#define VR_XS_PMA_CONSUMER_10G_RX_GENCTRL4      0x01a0
+#define VR_XS_PMA_MP_10G_RX_IQ_CTRL0            0x01ac
+#define VR_XS_PMA_MP_12G_16G_25G_MPLL_CMN_CTRL  0x01c0
+#define VR_XS_PMA_MP_12G_16G_MPLLA_CTRL0        0x01c4
+#define VR_XS_PMA_MP_12G_MPLLA_CTRL1            0x01c8
+#define VR_XS_PMA_MP_10G_MPLLA_CTRL2            0x01cc
+#define VR_XS_PMA_MP_12G_16G_MPLLB_CTRL0        0x01d0
+#define VR_XS_PMA_MP_12G_MPLLB_CTRL1            0x01d4
+#define VR_XS_PMA_MP_12G_16G_MPLLB_CTRL2        0x01d8
+#define VR_XS_PMA_MP_12G_MPLLA_CTRL3            0x01dc
+#define VR_XS_PMA_MP_12G_MPLLB_CTRL3            0x01e0
+#define VR_XS_PMA_MP_12G_16G_25G_REF_CLK_CTRL   0x0244
+#define VR_XS_PMA_MP_12G_16G_25G_VCO_CAL_LD0    0x0248
+#define VR_XS_PMA_MP_12G_VCO_CAL_REF0           0x0258
+#define VR_XS_PMA_MP_12G_16G_25G_SRAM           0x026c
+
+#define BANK_300                                0x0300
+#define SR_XS_PCS_CTRL1                         0x0000
+#define SR_XS_PCS_STS1                          0x0004
+#define SR_XS_PCS_CTRL2                         0x001c
+
+#define BANK_380                                0x0380
+#define VR_XS_PCS_DIG_CTRL1                     0x0000
+#define VR_XS_PCS_DEBUG_CTRL                    0x0014
+#define VR_XS_PCS_KR_CTRL                       0x001c
+#define VR_XS_PCS_SFTY_UE_INTRO                 0x03c0
+#define VR_XS_PCS_SFTY_DISABLE                  0x03d0
+
+#define BANK_1F00                               0x1f00
+#define SR_MII_CTRL                             0x0000
+
+#define BANK_1F80                               0x1f80
+#define VR_MII_DIG_CTRL1                        0x0000
+#define VR_MII_EEE_TXTIMER                      0x0008
+
 struct renesas_eth_serdes_drv_data;
 struct renesas_eth_serdes_channel {
        struct renesas_eth_serdes_drv_data *dd;
@@ -97,12 +146,13 @@ renesas_eth_serdes_common_init_ram(struct renesas_eth_=
serdes_drv_data *dd)

        for (i =3D 0; i < dd->info->renesas_eth_serdes_num; i++) {
                channel =3D &dd->channel[i];
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x026c, 0x180,=
 BIT(0), 0x01);
+               ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PMA_MP_1=
2G_16G_25G_SRAM,
+                                                 BANK_180, BIT(0), 0x01);
                if (ret)
                        return ret;
        }

-       renesas_eth_serdes_write32(dd->addr, 0x026c, 0x180, 0x03);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_12G_16G_25G_SRAM,=
 BANK_180, 0x03);

        return ret;
 }
@@ -113,15 +163,16 @@ renesas_eth_serdes_common_setting(struct renesas_eth_=
serdes_channel *channel)
        struct renesas_eth_serdes_drv_data *dd =3D channel->dd;

        /* Set combination mode */
-       renesas_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x00d7);
-       renesas_eth_serdes_write32(dd->addr, 0x01cc, 0x180, 0xc200);
-       renesas_eth_serdes_write32(dd->addr, 0x01c4, 0x180, 0x0042);
-       renesas_eth_serdes_write32(dd->addr, 0x01c8, 0x180, 0);
-       renesas_eth_serdes_write32(dd->addr, 0x01dc, 0x180, 0x002f);
-       renesas_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060);
-       renesas_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200);
-       renesas_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000);
-       renesas_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_12G_16G_25G_REF_C=
LK_CTRL, BANK_180, 0xd7);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_10G_MPLLA_CTRL2, =
BANK_180, 0xc200);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_12G_16G_MPLLA_CTR=
L0, BANK_180, 0x42);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_12G_MPLLA_CTRL1, =
BANK_180, 0);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_12G_MPLLA_CTRL3, =
BANK_180, 0x2f);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_12G_16G_MPLLB_CTR=
L0, BANK_180, 0x60);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_12G_16G_MPLLB_CTR=
L2, BANK_180, 0x2200);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_12G_MPLLB_CTRL1, =
BANK_180, 0);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PMA_MP_12G_MPLLB_CTRL3, =
BANK_180, 0x3d);
+
        return 0;
 }

@@ -130,88 +181,130 @@ renesas_eth_serdes_chan_setting(struct renesas_eth_s=
erdes_channel *channel)
 {
        int ret;

+
        switch (channel->phy_interface) {
        case PHY_INTERFACE_MODE_SGMII:
-               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x=
2000);
-               renesas_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x=
0011);
-               renesas_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x=
0540);
-               renesas_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x=
0015);
-               renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x=
0100);
-               renesas_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 0x=
0000);
-               renesas_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x=
0002);
-               renesas_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x=
0003);
-               renesas_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x=
0100);
-               renesas_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x=
0100);
-               renesas_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0x=
0000);
-               renesas_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x=
0007);
-               renesas_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0x=
0000);
-               renesas_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x=
0310);
-               renesas_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x=
0101);
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x00c8, 0x0180=
, BIT(0), 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PCS_DIG_CTR=
L1, BANK_380, 0x2000);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_MPLL_CMN_CTRL,
+                                          BANK_180, 0x11);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_VCO_CAL_LD0,
+                                          BANK_180, 0x540);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
VCO_CAL_REF0,
+                                          BANK_180, 0x15);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_RX_GENCTRL1,
+                                          BANK_180, 0x100);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_CONSUME=
R_10G_RX_GENCTRL4,
+                                          BANK_180, 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_RATE_CTRL,
+                                          BANK_180, 0x02);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_RX_RATE_CTRL,
+                                          BANK_180, 0x03);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_TX_GENCTRL2,
+                                          BANK_180, 0x100);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_RX_GENCTRL2,
+                                          BANK_180, 0x100);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
AFE_DFE_EN_CTRL,
+                                          BANK_180, 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
RX_EQ_CTRL0,
+                                          BANK_180, 0x07);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_10G_=
RX_IQ_CTRL0,
+                                          BANK_180, 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_GENCTRL1,
+                                          BANK_180, 0x310);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_TX_GENCTRL2,
+                                          BANK_180, 0x101);
+               ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PMA_MP_1=
2G_16G_TX_GENCTRL2,
+                                                 BANK_180, BIT(0), 0);
                if (ret)
                        return ret;

-               renesas_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x=
0101);
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0148, 0x0180=
, BIT(0), 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_RX_GENCTRL2,
+                                          BANK_180, 0x101);
+               ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PMA_MP_1=
2G_16G_RX_GENCTRL2,
+                                                 BANK_180, BIT(0), 0);
                if (ret)
                        return ret;

-               renesas_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x=
1310);
-               renesas_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x=
1800);
-               renesas_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0x=
0000);
-               renesas_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x=
0001);
-               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x=
2100);
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0000, 0x0380=
, BIT(8), 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_GENCTRL1,
+                                          BANK_180, 0x1310);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_EQ_CTRL0,
+                                          BANK_180, 0x1800);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_EQ_CTRL1,
+                                          BANK_180, 0);
+               renesas_eth_serdes_write32(channel->addr, SR_XS_PCS_CTRL2, =
BANK_300, 0x01);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PCS_DIG_CTR=
L1, BANK_380, 0x2100);
+               ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PCS_DIG_=
CTRL1,
+                                                 BANK_380, BIT(8), 0);
                if (ret)
                        return ret;

                if (channel->speed =3D=3D 1000)
-                       renesas_eth_serdes_write32(channel->addr, 0x0000, 0=
x1f00, 0x0140);
+                       renesas_eth_serdes_write32(channel->addr, SR_MII_CT=
RL, BANK_1F00, 0x140);
                else if (channel->speed =3D=3D 100)
-                       renesas_eth_serdes_write32(channel->addr, 0x0000, 0=
x1f00, 0x2100);
+                       renesas_eth_serdes_write32(channel->addr, SR_MII_CT=
RL, BANK_1F00, 0x2100);

                /* For AN_ON */
-               renesas_eth_serdes_write32(channel->addr, 0x0004, 0x1f80, 0=
x0005);
-               renesas_eth_serdes_write32(channel->addr, 0x0028, 0x1f80, 0=
x07a1);
-               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x1f80, 0=
x0208);
+               renesas_eth_serdes_write32(channel->addr, 0x0004, BANK_1F80=
, 0x0005);
+               renesas_eth_serdes_write32(channel->addr, 0x0028, BANK_1F80=
, 0x07a1);
+               renesas_eth_serdes_write32(channel->addr, VR_MII_DIG_CTRL1,=
 BANK_1F80, 0x0208);
                break;

        case PHY_INTERFACE_MODE_USXGMII:
        case PHY_INTERFACE_MODE_5GBASER:
-               renesas_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x=
0);
-               renesas_eth_serdes_write32(channel->addr, 0x0014, 0x380, 0x=
50);
-               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x=
2200);
-               renesas_eth_serdes_write32(channel->addr, 0x001c, 0x380, 0x=
400);
-               renesas_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x=
1);
-               renesas_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x=
56a);
-               renesas_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x=
15);
-               renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x=
1100);
-               renesas_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 1)=
;
-               renesas_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x=
01);
-               renesas_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x=
01);
-               renesas_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x=
300);
-               renesas_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x=
300);
-               renesas_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0)=
;
-               renesas_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x=
4);
-               renesas_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0)=
;
-               renesas_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x=
310);
-               renesas_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x=
0301);
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x00c8, 0x180,=
 BIT(0), 0);
+               renesas_eth_serdes_write32(channel->addr, SR_XS_PCS_CTRL2, =
BANK_300, 0x0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PCS_DEBUG_C=
TRL, BANK_380, 0x50);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PCS_DIG_CTR=
L1, BANK_380, 0x2200);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PCS_KR_CTRL=
, BANK_380, 0x400);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_MPLL_CMN_CTRL,
+                                          BANK_180, 0x1);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_VCO_CAL_LD0,
+                                          BANK_180, 0x56a);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
VCO_CAL_REF0,
+                                          BANK_180, 0x15);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_RX_GENCTRL1,
+                                          BANK_180, 0x1100);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_CONSUME=
R_10G_RX_GENCTRL4,
+                                          BANK_180, 1);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_RATE_CTRL,
+                                          BANK_180, 0x01);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_RX_RATE_CTRL,
+                                          BANK_180, 0x01);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_TX_GENCTRL2,
+                                          BANK_180, 0x300);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_RX_GENCTRL2,
+                                          BANK_180, 0x300);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
AFE_DFE_EN_CTRL,
+                                          BANK_180, 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
RX_EQ_CTRL0,
+                                          BANK_180, 0x4);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_10G_=
RX_IQ_CTRL0,
+                                          BANK_180, 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_GENCTRL1,
+                                          BANK_180, 0x310);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_TX_GENCTRL2,
+                                          BANK_180, 0x0301);
+               ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PMA_MP_1=
2G_16G_TX_GENCTRL2,
+                                                 BANK_180, BIT(0), 0);
                if (ret)
                        return ret;
-               renesas_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x=
301);
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0148, 0x180,=
 BIT(0), 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_RX_GENCTRL2,
+                                          BANK_180, 0x301);
+               ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PMA_MP_1=
2G_16G_RX_GENCTRL2,
+                                                 BANK_180, BIT(0), 0);
                if (ret)
                        return ret;
-               renesas_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x=
1310);
-               renesas_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x=
1800);
-               renesas_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0)=
;
-               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x=
2300);
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0000, 0x380,=
 BIT(8), 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_GENCTRL1,
+                                          BANK_180, 0x1310);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_EQ_CTRL0,
+                                          BANK_180, 0x1800);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_TX_EQ_CTRL1,
+                                          BANK_180, 0);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PCS_DIG_CTR=
L1, BANK_380, 0x2300);
+               ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PCS_DIG_=
CTRL1,
+                                                 BANK_380, BIT(8), 0);
                if (ret)
                        return ret;
                break;
-
        default:
                return -EOPNOTSUPP;
        }
@@ -228,19 +321,20 @@ renesas_eth_serdes_chan_speed(struct renesas_eth_serd=
es_channel *channel)
        case PHY_INTERFACE_MODE_SGMII:
                /* For AN_ON */
                if (channel->speed =3D=3D 1000)
-                       renesas_eth_serdes_write32(channel->addr, 0x0000, 0=
x1f00, 0x1140);
+                       renesas_eth_serdes_write32(channel->addr, SR_MII_CT=
RL, BANK_1F00, 0x1140);
                else if (channel->speed =3D=3D 100)
-                       renesas_eth_serdes_write32(channel->addr, 0x0000, 0=
x1f00, 0x3100);
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0008, 0x1f80=
, BIT(0), 1);
+                       renesas_eth_serdes_write32(channel->addr, SR_MII_CT=
RL, BANK_1F00, 0x3100);
+               ret =3D renesas_eth_serdes_reg_wait(channel, VR_MII_EEE_TXT=
IMER,
+                                                 BANK_1F80, BIT(0), 1);
                if (ret)
                        return ret;
-               renesas_eth_serdes_write32(channel->addr, 0x0008, 0x1f80, 0=
x0000);
+               renesas_eth_serdes_write32(channel->addr, VR_MII_EEE_TXTIME=
R, BANK_1F80, 0x0000);
                break;
        case PHY_INTERFACE_MODE_USXGMII:
-               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0=
x120);
+               renesas_eth_serdes_write32(channel->addr, SR_MII_CTRL, BANK=
_1F00, 0x120);
                break;
        case PHY_INTERFACE_MODE_5GBASER:
-               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0=
x2120);
+               renesas_eth_serdes_write32(channel->addr, SR_MII_CTRL, BANK=
_1F00, 0x2120);
                break;
        default:
                return -EOPNOTSUPP;
@@ -255,14 +349,17 @@ static int renesas_eth_serdes_monitor_linkup(struct r=
enesas_eth_serdes_channel *
        int i, ret;

        for (i =3D 0; i < RENESAS_ETH_SERDES_NUM_RETRY_LINKUP; i++) {
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0004, 0x300,=
 BIT(2), BIT(2));
+               ret =3D renesas_eth_serdes_reg_wait(channel, SR_XS_PCS_STS1=
,
+                                                 BANK_300, BIT(2), BIT(2))=
;
                if (!ret)
                        break;

                /* restart */
-               renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x=
0100);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_RX_GENCTRL1,
+                                          BANK_180, 0x0100);
                udelay(1);
-               renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x=
0000);
+               renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_=
16G_25G_RX_GENCTRL1,
+                                          BANK_180, 0x0000);
        }

        return ret;
@@ -292,30 +389,31 @@ static int renesas_eth_serdes_hw_init(struct renesas_=
eth_serdes_channel *channel
                return ret;

        for (i =3D 0; i < dd->info->renesas_eth_serdes_num; i++) {
-               ret =3D renesas_eth_serdes_reg_wait(&dd->channel[i], 0x0000=
,
-                                                  0x300, BIT(15), 0);
+               ret =3D renesas_eth_serdes_reg_wait(&dd->channel[i], SR_XS_=
PCS_CTRL1,
+                                                 BANK_300, BIT(15), 0);
                if (ret)
                        return ret;
        }

        for (i =3D 0; i < dd->info->renesas_eth_serdes_num; i++)
-               renesas_eth_serdes_write32(dd->channel[i].addr, 0x03d4, 0x3=
80, 0x0443);
+               renesas_eth_serdes_write32(dd->channel[i].addr, 0x03d4, BAN=
K_380, 0x0443);

        ret =3D renesas_eth_serdes_common_setting(channel);
        if (ret)
                return ret;

        for (i =3D 0; i < dd->info->renesas_eth_serdes_num; i++)
-               renesas_eth_serdes_write32(dd->channel[i].addr, 0x03d0, 0x3=
80, 0x0001);
-
+               renesas_eth_serdes_write32(dd->channel[i].addr, VR_XS_PCS_S=
FTY_DISABLE,
+                                          BANK_380, 0x0001);

-       renesas_eth_serdes_write32(dd->addr, 0x0000, 0x380, 0x8000);
+       renesas_eth_serdes_write32(dd->addr, VR_XS_PCS_DIG_CTRL1, BANK_380,=
 0x8000);

        ret =3D renesas_eth_serdes_common_init_ram(dd);
        if (ret)
                return ret;

-       return renesas_eth_serdes_reg_wait(&dd->channel[0], 0x0000, 0x380, =
BIT(15), 0);
+       return renesas_eth_serdes_reg_wait(&dd->channel[0], VR_XS_PCS_DIG_C=
TRL1,
+                                          BANK_380, BIT(15), 0);
 }

 static int renesas_eth_serdes_init(struct phy *p)
@@ -353,27 +451,37 @@ static int renesas_eth_serdes_hw_init_late(struct ren=
esas_eth_serdes_channel
        if (ret)
                return ret;

-       renesas_eth_serdes_write32(channel->addr, 0x03c0, 0x380, 0x0000);
+       renesas_eth_serdes_write32(channel->addr, VR_XS_PCS_SFTY_UE_INTRO, =
BANK_380, 0x0000);

-       renesas_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0000);
+       renesas_eth_serdes_write32(channel->addr, VR_XS_PCS_SFTY_DISABLE, B=
ANK_380, 0x0000);

-       val =3D renesas_eth_serdes_read32(channel->addr, 0x00c0, 0x180);
-       renesas_eth_serdes_write32(channel->addr, 0x00c0, 0x180, val | BIT(=
8));
-       ret =3D renesas_eth_serdes_reg_wait(channel, 0x0100, 0x180, BIT(0),=
 1);
+       val =3D renesas_eth_serdes_read32(channel->addr, VR_XS_PMA_MP_12G_1=
6G_25G_TX_GENCTRL0,
+                                       BANK_180);
+       renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_16G_25G_=
TX_GENCTRL0,
+                                  BANK_180, val | BIT(8));
+       ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PMA_MP_12G_16G_2=
5G_TX_STS,
+                                         BANK_180, BIT(0), 1);
        if (ret)
                return ret;
-       renesas_eth_serdes_write32(channel->addr, 0x00c0, 0x180, val &=3D ~=
BIT(8));
-       ret =3D renesas_eth_serdes_reg_wait(channel, 0x0100, 0x180, BIT(0),=
 0);
+       renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_16G_25G_=
TX_GENCTRL0,
+                                  BANK_180, val &=3D ~BIT(8));
+       ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PMA_MP_12G_16G_2=
5G_TX_STS,
+                                         BANK_180, BIT(0), 0);
        if (ret)
                return ret;

-       val =3D renesas_eth_serdes_read32(channel->addr, 0x0144, 0x180);
-       renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, val | BIT(=
4));
-       ret =3D renesas_eth_serdes_reg_wait(channel, 0x0180, 0x180, BIT(0),=
 1);
+       val =3D renesas_eth_serdes_read32(channel->addr, VR_XS_PMA_MP_12G_1=
6G_25G_RX_GENCTRL1,
+                                       BANK_180);
+       renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_16G_25G_=
RX_GENCTRL1,
+                                  BANK_180, val | BIT(4));
+       ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PMA_MP_12G_16G_2=
5G_RX_STS,
+                                         BANK_180, BIT(0), 1);
        if (ret)
                return ret;
-       renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, val &=3D ~=
BIT(4));
-       ret =3D renesas_eth_serdes_reg_wait(channel, 0x0180, 0x180, BIT(0),=
 0);
+       renesas_eth_serdes_write32(channel->addr, VR_XS_PMA_MP_12G_16G_25G_=
RX_GENCTRL1,
+                                  BANK_180, val &=3D ~BIT(4));
+       ret =3D renesas_eth_serdes_reg_wait(channel, VR_XS_PMA_MP_12G_16G_2=
5G_RX_STS,
+                                         BANK_180, BIT(0), 0);
        if (ret)
                return ret;

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

