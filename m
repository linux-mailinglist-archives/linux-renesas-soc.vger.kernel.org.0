Return-Path: <linux-renesas-soc+bounces-16848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A036BAB12DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF53AB2530F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CD1227E93;
	Fri,  9 May 2025 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fUGboyGv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584DE233733
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792151; cv=fail; b=Qxa2OjVtdQLjR4qpx+aaEpQO4kR/XUhu625QPy8LkstgCdZcwHI49eQZy8o7r3HaypSqJD5Lr2/AJadPoM/mZjtR+TAUhPliLdTLmXrVnmfdm+tY0FO1Dckf3p7y/izXAF91C/pwLQcRbM59hRcpZFG5nA3SKHXZOrskrochWKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792151; c=relaxed/simple;
	bh=NCEDgHsDIDWHJpQGE3jE9PIQedgdeBGV8D4s9fYtWAk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hz/Ch1Z2U78dCV7zxzbXqsAWu1tiu4mHwMd4ZZOKKfDZSkgcjKPssXx+jcfHGd4Ki2uDJqwiR3kuFr2A3BF3oF1oYIZ13yqxHvRUFRP51BGzrpk125CRafl9FQf3Z+7Sl1EhpEE017YXeHs+VqZgXVpKrOwOEbA0kLWqNta9+2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fUGboyGv; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjohbogWL/nVbI74qsJ8G9o+8M8oY8LRU31fJWtc9umugpF248bQqy8bQzQEotVOJjvKJgIyF/S0sEHiPL2HsvKEaYJCGtKRzX2l9gcGNcyXwu5v5SgVg6+/vZ7gGWYb0GBPEHYWZQQndi6J3v/HtN6m5VpnVYKgIdjPiPcr3ZQEBpjzYrX45/hyeUaVMjnSjamVpsForT8hJ++87OxPTlO3I8TMFwoy56PDZPzvfoG94Hcd0IthPa2BiObQX4hZC82Wc1+euREiJumPAacps/sMfm43nGjW9wbOa9h1OfFPFoaKarmPfCdEcWvEoUN4wMCty+QPAAf0eMYXqgDn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLO7LGgeT/KoagCCM58RqJk7E65TJyxDcVu5l4E5aJI=;
 b=OgGz+GCFW/WSHjXDJQOmGne2kFbLaTEOlr5NNN3KXw0MNQzf10mkKbD4FhRjpWZGC1Jp4l6DZXnq4mMt4eoqiOtEqchQGdqrzvZ3XMV1GFhTrjHnKg3Ae4O3jUUYS2RyNEjmk8DZfeeFr2D1MCJIlAKhN5McKyq1Hn9ErEPG1XKWKvIFOQ3IkJ/I8TeFQ1MOR8cpwR1RnxCAtwVpTiIzNuUe2Nk5DsMmshKk2Kqq2p51DYXni0jSpowZJYASP/FDMC0biWqwi7xLUtB3uaQnp2SV6DKsTpmt0Db8ZxtNtfIm5+fN+ufe4pmvC2I3LgAuE6pko4rjeQ7kqd8yBwl7ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLO7LGgeT/KoagCCM58RqJk7E65TJyxDcVu5l4E5aJI=;
 b=fUGboyGv/XWgU9YraGKTbl4xlG4OO9euhNKeOpKTg9IkeZjHT8+G2+flBnx/qzER+MVM4r7m1CG9zQklZC5Q0qD2JXluWMZB8oVzW+KxbYmiJ+6Qlawf/qDK0IaX6FqLPBP3m5PKZItBBAnO8RGs5W91L3QYsCyCLyswVbPzN1s=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OSCPR01MB15842.jpnprd01.prod.outlook.com (2603:1096:604:3e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 12:02:26 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 12:02:26 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 6/9] phy: renesas: ethernet serdes: improve stability after
 reset
Thread-Topic: [PATCH 6/9] phy: renesas: ethernet serdes: improve stability
 after reset
Thread-Index: AdvA2joLSrxg1jnPTHqAYfHtJ7Xa6w==
Date: Fri, 9 May 2025 12:02:26 +0000
Message-ID:
 <TYRPR01MB14284CC862CF0D42C380455A0828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OSCPR01MB15842:EE_
x-ms-office365-filtering-correlation-id: 4653f765-93e4-4732-c0a8-08dd8ef15daf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KpK2HT4LGN/JvUhh4fS5bgNbpUROmlz7WpInFKLJD85fsNMOcQaL36NAQSfW?=
 =?us-ascii?Q?H5vMZaGmTChbiTn8n0oAprc6bT1JTRUSkMf/RqcATSiLFb7mKljkKRATN8hr?=
 =?us-ascii?Q?e4uW6SDJw1XRjh6h3YPR2LxHJw/vKQ5Y2BqmUKWnbwWky8e7aBya1G4/P92C?=
 =?us-ascii?Q?3xSd3lbwNK8ARRi89Q1WpL2KUQ8lsjr3b1UXBDZe+rUHQaqJzWbUIMDMb4PP?=
 =?us-ascii?Q?Zu8KtabU8WoMEcWVDX1qmj7Qy1ItQTau48VZVKM5NHwK1f1mVFS3habznm+J?=
 =?us-ascii?Q?FN6qcUV1zgAXH5iOABzKWnK2x0YkluvIkLRvInlASeXN1WoBMKxEKjwD1o3l?=
 =?us-ascii?Q?+9rrkNKyvtWpFAxpIoN580X3NvsRK86k8wrkpNf7e3/VKYFKNplSQYV6SD2y?=
 =?us-ascii?Q?bZ6Hj+l3fXIf4pATiDmyv6E51zvc2RNh6VY16yyseNmI5aRF10ovjJ7YZitl?=
 =?us-ascii?Q?NX1BZOJ9olY97JOv+LoXtYcY+tryYb494L/vtgzJp9wozTjTpKXtynukNVWp?=
 =?us-ascii?Q?MeTEeu4DxSmkWXYe3dWaNWFANIEwnKzsHxhE5xOdsaNE9uroUDA7EM/svyZE?=
 =?us-ascii?Q?ojKlvMWXrnChuQ5amMcad3szHGcI7kW09hFLuA8wUfOyxZEbBQokYNmRVW4E?=
 =?us-ascii?Q?zsSivIknRZjz63kUNnfn5BCilNdpt+DUNZMBUJMcUM7DTTznOZgZyfeoB3EK?=
 =?us-ascii?Q?NLwlKr0BMR1vooORFpIvmljnf2TaRmptQNkeQ1sOWfHUGDhe0WgndAHrk8Cb?=
 =?us-ascii?Q?KRvlmpqLzbEVKZoCCvY+3qxTTayyCthfal7rPSThyY4e2tx/x5w4xPQ/zwT9?=
 =?us-ascii?Q?wEcUR+qOVRU8RUaVRVfXiCIJe5jeG+uPLSni8YaP+PShyw7s3jjOphSwt/RZ?=
 =?us-ascii?Q?mjIxN8uCFgo25EcLz1V6DlcEg1OmJcXWKH6smMP+/ODg+WDp4hsDQxFUKkOv?=
 =?us-ascii?Q?hCykvVQI1N5wt7/Ml6+pV69K1ebIAMpNGwiJjN7dUX+RhA3is0jIUX0KUucZ?=
 =?us-ascii?Q?vhWo0W6cZkauwohOlJFlrWy5oOZyT8ifirOsW3B+Dqi1PryeIavDl4sYrJn5?=
 =?us-ascii?Q?XFG78/KMvkT7uj/f2HkSIuYM8sX0GlaV9QkqtvWTYklPPz+/x02+Wd4KCTEH?=
 =?us-ascii?Q?G+ul/5ZCYblmp1VhrrHU5J3pDcBtQRjRL6PdDPfLOYZ72uYZEqNwpais8ZIW?=
 =?us-ascii?Q?vTUPrApxV9zxGqz9zIIRZlbxLsfoGt1xcHCUJjcM9rQBE9uXQIGEh+nyl1z8?=
 =?us-ascii?Q?VkqJCxQEQ1oZfTkz1RuwL63w18XAHPZtpWKCupqBnKG6SlYVsFt3GCHIO5GS?=
 =?us-ascii?Q?7KJo6XJW4ovEwgAKLu3DKdUIvcTdwDNL3aC+faaAK/tjb2OtxkVuTV00Fsq/?=
 =?us-ascii?Q?Oy24cnODDo6dIhnzNFk7Kh40jOkzt6c2XNmSkvJPfZgpkUZZaEIUVnH3wsZY?=
 =?us-ascii?Q?/3ZVJUasrkPaUt8qp4QvJb076QCUJZsyMyqnUdQqvTpQ9pbpuQJ7VZD6bc7i?=
 =?us-ascii?Q?POMrLoWz4EmW1pY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?96XzwuNrHfuNMNOCsSUk4AIv+ZH27S/5HTgVghvoCzLLRgQ+4ZrRN1LgGAo9?=
 =?us-ascii?Q?RiNhaeOlFpEW6pigB2R4aSdG2IzbSPMPxKvT41RJVEuCfo8SlR40E/LUwVSp?=
 =?us-ascii?Q?Z+SF7n86/HI0owT4Da8qwcDxzWMTb0buJZTqqgIKzgR3VzcBTE3H3If5vubf?=
 =?us-ascii?Q?eKnYk6KdvbgejWa0C/5ESXHo2IEUp/tCRApwPcSpmliGGyOtGNeEToTtEI4W?=
 =?us-ascii?Q?ERf8sVizs+3qG8aLGMHToZtULh4U6mMTmEp1ASquW/lAoQ468gHtNH+g8V3a?=
 =?us-ascii?Q?yoAbBic4q7wVoOfYcwIVsluifzRqUlDqTy9DnN1JhuGCmErkXgGLHZy6eLz5?=
 =?us-ascii?Q?EUXKpTCZtHMhAWpHt84QueftI5Twg/pVu5Fhir1foHx3fTLxEwqD0jW2fV+0?=
 =?us-ascii?Q?izrl27H5KPPzxs1z6+xT58NHiOkkd1riDRyc/QO/8WOAMoz/tH+feQccfgMH?=
 =?us-ascii?Q?FH9WksLfaTNmRjdZhgUCapryRcJ84XINdwr79LHVVV555fKEXDdfnHQlIHL8?=
 =?us-ascii?Q?w1OqNo59+Az656S6S784+xhO75dduYEjcotEipY0mwi9vskXnmR1IJ1wPKTJ?=
 =?us-ascii?Q?Hym6My1fvHmua54rvsA2orjJaendXXfGSiVpyYkFp14ywsh/vRpCLmWrOrYj?=
 =?us-ascii?Q?RmGzq5VIFGnNGLX9IM8G/pdnomnf5MV3YNZLU9+InJ9N/Pw8rGb/rdSkAkOS?=
 =?us-ascii?Q?/9KCX93r2fY9GfySACjCYSB6lsjhrWWoFJUAlEc0q72lwHJ0kEvrqSxYNmpK?=
 =?us-ascii?Q?UdtoiAr/t1SotgTkH0LRi7X3a+F1dy7o2ny/OUEBGNvUGmLCCskobISbySHG?=
 =?us-ascii?Q?YTW2ScCDw6bk0Fhcy2MMIHXAIRDKJZjbr3iYgVUdKuyi7Yep5Qlqaw5IB+rd?=
 =?us-ascii?Q?gWzSUxj057KrbHcwiaI0QRdEhudo3WoLYoUpSJiEaQZ3l8ESFDsp6c2i+CQJ?=
 =?us-ascii?Q?jx84uiFSEXEklw67hDnacw40nVNuNAB1Oi4iMjWMqF631eWpUgEw226x81qF?=
 =?us-ascii?Q?6bLH9fOnjZ7sp7/VMq4Ky6TwOdNBlzj8UaxWFq8SrrAYWtMm1gFEholQkcje?=
 =?us-ascii?Q?aDBiwmOp9iGcs7DJsmEX3Cl94oFjozJ/ruHbHmgn7AqJ8idR95xbrJT5D7qr?=
 =?us-ascii?Q?/QhuaCtbUwLgGFytllv/FMg0MxN1w6JPyVnctsfguP7tJ/QelMwsAa+lESBE?=
 =?us-ascii?Q?8tcE+Ucg4Pt9fXACnbAgPp8cC9TXPc8AukHABmjeEz6c61bU92fJNJ4gKnMh?=
 =?us-ascii?Q?no9uV/xxblqiHR8oVZrcYlSP39YnlcVAqU2VxJ0a+ey1poAjVT6d+OjfZySP?=
 =?us-ascii?Q?x0x1MCkh2WpiTNYJFVFLhsCGDb1WbPWty+uDxJ7uxK4pGSv2wzaWX3phrY3o?=
 =?us-ascii?Q?7VY3WZ3S8rrPcquGJf/bjq7xNDJtXqgAD1Bv3Du2qntRhovF3f0c8Xp0TeOq?=
 =?us-ascii?Q?eT5Pgbt0jhaijnB8+wJ+gKrWZTaiKKQCFKiHKoaMHJCyGdYjShOI55B13eO2?=
 =?us-ascii?Q?URhNeR4QkSVixNR1hCcgGSt9hfCGXUdAWB3Umnj+Aw6OmkccDpC23dQOVgEE?=
 =?us-ascii?Q?zkoaOXKlmeQUegNHn5/CqtdQ0O+56/kGmZ4mE+aj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4653f765-93e4-4732-c0a8-08dd8ef15daf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 12:02:26.6096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqgkBnwMIXsZVJ1eVYF+4DEScQiT8ytd0Akx1mosAbIe08LTxKOwmnyxdZybo9NAvtzdaXhVuaKHpTXGLkK6Xciv27YtxXV/R0OHNzEY/rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15842

From 3beee0e225334807f2cf41f63ea2337c512093e4 Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 8 May 2025 11:12:16 +0200
Subject: [PATCH 6/9] phy: renesas: ethernet serdes: improve stability after
 reset

There is a slight difference in SerDes hardware behavior between each
version after resetting. This step is to ensure the stable condition of
initialization, especially for R-Car S4 v1.1 .

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/renesas-ether-serdes.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/renesas-ether-serdes.c b/drivers/phy/renes=
as/renesas-ether-serdes.c
index db6426a5fd1d..683409d5e0f9 100644
--- a/drivers/phy/renesas/renesas-ether-serdes.c
+++ b/drivers/phy/renesas/renesas-ether-serdes.c
@@ -265,7 +265,12 @@ static int renesas_eth_serdes_hw_init(struct renesas_e=
th_serdes_channel *channel

        reset_control_reset(dd->reset);

-       usleep_range(1000, 2000);
+       /* There is a slight difference in SerDes hardware behavior between
+        * each version after resetting. This step is to ensure the stable
+        * condition of initialization, especially for R-Car S4 v1.1.
+        */
+       mdelay(1);
+       iowrite32(0, dd->addr + RENESAS_ETH_SERDES_LOCAL_OFFSET);

        ret =3D renesas_eth_serdes_common_init_ram(dd);
        if (ret)
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

