Return-Path: <linux-renesas-soc+bounces-16846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89371AB12C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83973A20C19
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 11:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B1C28EA72;
	Fri,  9 May 2025 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CrrFN5Jw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD59627AC2E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791978; cv=fail; b=YJ1JihvMVwQZ4ltV9rQsc2bJGi5OpVZTeqAl+3oHfDfktrQw3QuIz9k/7A5qhu1hSqcULLdyaxya++r9QdkU+gPyMC28VroD9NL05mTaTnHghaTlLFLBagyzJue0PfSwUfgO0u4DPTH2dyXnXXimILUt8rUmHslY0XsBCgHITiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791978; c=relaxed/simple;
	bh=JvygmdKkN8NwGP8bFiucEJhSCpywZkLFmwEhTBPYk6c=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=o6XCnJjKWrA2Y4adshsOiY16r7b+BU1Qm1KiaiJVKPwBoaS2wTXm5KM7KAPxBucu6JwnI9KZ1ktrgC0Mjeax3ONoWfAdMMtWxkFCUaWGzFUujJ3lBv7WCMGdQD1rZOEUCf50WgaMCOgXu79a8sOncYH3LCgp5hkrnpVOzVKmSlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CrrFN5Jw; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIrfqNHuU11xscndoF3swaegPC+7JODgtTRv92nW8Y555xzBBhryNSSIG82v+MGgAZ1hCfyvKgOd+uyBQaREtFk9Vd4ZDnjdF7kSmfxdSaYQRQaVDDNlMo8ypaqxlhS0Gd/K2FGAkQaVV05nRjeBUIO/CC7XfWNjcExO0FPkLd2l8NLOjuR1eWK3Flv5uSBsyofoXxfTgzm1/QGcgCkPD0C+GZgQz3NN5Y9f2MVkuFcz5BAq3L7wTl2adqFP3FGbI/yfZsuVhEZxC3CRWT7M7y/1XVZnizg/KUrerUn6H3X8gC9niRGQLA58yS5WKUyYn028eRjxVLPCmsPWhIk+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pysFNICpT3SwczcBRlDRGoK7k3DKaNC4wg+jKOnAoSU=;
 b=CjXNdrCCpEUo1AneZmNjr456WQcFmCCQMkydYMQQw0TmsXl8XPjpanVdvRchY0MKGD02phwgdf7m1AisCx6tUtEGyDQjzwSp0ozHevgUXGHK4Z0qKEEsVOr0QR6hYY6L9ED2PGJul8Xosa/nv5WhbganwHI8za7TZPPqXAfHy53CabId4WW1Q07FtYnHk84zpAMFIEZOQCSokS1VhLW8/JCM6xpsCFxeNjdVsFX3w1iiI2cVMaJUs+BhT8ukOoERjiqo5WdJ5GoOlQCFE3LMkM8s5vg+P4cg0LXkILBfAn4YQ4xjh2pHywKi6mClg0YGPAq+aiX1uerubmIoBP2cFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pysFNICpT3SwczcBRlDRGoK7k3DKaNC4wg+jKOnAoSU=;
 b=CrrFN5JwGM+YfFFGrCcnLM7DdCftvaihX+blHvCwIx6p1c6miMR5gGPvdeItQRj9SYTsN0ZaEGXcOp5wcEYBHIdQU4d5oHmYNjk3jTixENqnRGjRSuVimv/9dQSai0oO7z6rANauRCC0Rc76UUaceV8VIRqcMOnmRrVlg1nhYy4=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by OSCPR01MB15842.jpnprd01.prod.outlook.com (2603:1096:604:3e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 11:59:33 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 11:59:33 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 4/9] phy: renesas: ethernet serdes: add USXGMII and 5GBASER
 modes
Thread-Topic: [PATCH 4/9] phy: renesas: ethernet serdes: add USXGMII and
 5GBASER modes
Thread-Index: AdvA2c+hIQHrIJ0DQpy8FcLcBMFrhQ==
Date: Fri, 9 May 2025 11:59:33 +0000
Message-ID:
 <TYRPR01MB1428487ECCF63C17631E41C38828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|OSCPR01MB15842:EE_
x-ms-office365-filtering-correlation-id: 6fb1f926-e21e-42f0-31c0-08dd8ef0f65a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qwbdNB5InBmUzMRwwAgUrXxTdHyiab1n6xzsT9J3FhtPRfOD3gAYZohqItKP?=
 =?us-ascii?Q?5wndR5SKiSl6ftxWYQWsCv7O5u2TNJSSasPWtF5rfQ+McvPx7RcJogkn8q9l?=
 =?us-ascii?Q?ec+JSLBHyqm0jdzcdypZIOlovL2IF/tVe9qqRxezAQ07TGlnQdm4uBxIaWUo?=
 =?us-ascii?Q?7HNS1We5tK64KAA9hrFu/uP1yK2p8nbKc1fEizGBIJkJKDoxFhUe7nRlAuCN?=
 =?us-ascii?Q?7IcIiKsDfMNte/QgfeoY/LTdMiSdOxODc4tW/TZMx73qbYIIvatzU7yh+3nj?=
 =?us-ascii?Q?C3Iog8WIXJ02bOywAzBha4jmKAjXF6UW9ZJVX19rU4vdExD+6D5seM8IXXB5?=
 =?us-ascii?Q?6+Zlr8ucvLmbSpRzqKyqz/l6jJKcfmiI0vaqmuDmNDm6oz9PVrITyPxrUfTH?=
 =?us-ascii?Q?jAMrn7CuRZeX69BMhKpBaExWl1iwJOVOM5uJ9atZgPEVu6/p+VHI0cyHw8eI?=
 =?us-ascii?Q?DRKWhRmV0l8pKJIpGjKxEqmvkIyPuux+Q4aQgXUXwCJDAGssEiEBJ77VFQX7?=
 =?us-ascii?Q?nvQih+tNC6EVGgTzLsW8C/i/wwefvqOVu07jZoH6JuTLL+wDWFj4WifyHanG?=
 =?us-ascii?Q?Ysr+tXLcGoSPjyVGZ9dta/a/x8rtu6sVpht1knLYMWmoR7PyQuiznj8ndRek?=
 =?us-ascii?Q?jQBo3fMYbHzosU91G/FQHlH6QrAsnt0rJtHJs1cig94O+Tl4cgSdnB9KMglB?=
 =?us-ascii?Q?++6Zeeu/SNfNZgW0mj3/zxe4Ap/xVwKczuhwoKcaZ8s0rW1ggy4UIbIpAUfq?=
 =?us-ascii?Q?sNddDIzSZQEBV4hNx8wt3sx8O9sxhm+MNibFGRP/vm+6U9bpARbD8WT5xkJZ?=
 =?us-ascii?Q?qzsk88IHYtb1kbmIj5SkSC/aeQnhZyhAJKaazzpMxCrsRNXU4+UYNNVDU9An?=
 =?us-ascii?Q?nHiFYhS7oJ+bboO3/HSOYDS6ojcWzl9r7BU9m9IGAkfZC8Gs3zBv08npfMC0?=
 =?us-ascii?Q?O0mXrhprzaF8fCE+xcrg9mIstk35Y+KnIknpviKPD4Sq4T/FUTstEY8vMlkr?=
 =?us-ascii?Q?ez4QcwHFos/smgP9NsRhz8UzBUk1RwilfbB73dGdS7TXOq6aXta6zvDANPFg?=
 =?us-ascii?Q?GlJe6JGs/wI297PY6EwaAYWX7fAH/yFvdkn+Ck9ApGHvN39oJQ8c6awOeN+U?=
 =?us-ascii?Q?MVucBM9okxHz9/mPaEtvj36D7XrUeKK6WTYeElqJUw77WwkJ/wYGnzVc2FcQ?=
 =?us-ascii?Q?BQtGB+dg5jWi4YhxnqQSmm/60OT/AqUvpnoSNc7128iiiMZkFgDE3DYISyFK?=
 =?us-ascii?Q?gOA6rlLjjXfHu85F8zldxiY97awvE+dC/s6eqf4FXCEPhIuIVdpZ8zQK9Ns1?=
 =?us-ascii?Q?eH8JuqPv3srgIfEnK7BBbP2cceG7s0Sg6iOg8KOPNp+1JiQihdfodb/QMumz?=
 =?us-ascii?Q?FAnzbaLT7bAbtNfxInoPUJXyIbM/zC8McYc/4+p+WJrZPsRzjDwhEAjr9nqm?=
 =?us-ascii?Q?PiphBBua5UGaX7MtbwyyFyCvCIxPtIOdYeWV3W3zuf0GK5EqaTFWcghNUR5l?=
 =?us-ascii?Q?S1LLYoP/R1I/egw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1XXqOpGBWC4XnUKId7pCH0Q5RcJj5x+zWdIjOZJ8of5m4mXEbUUfQ0W4Jq3O?=
 =?us-ascii?Q?apP4tJHkxvX1sb4gotZhe1uIYDk7x6aRFtvhtn9H2OC/lbJiKf4jtayf2mfc?=
 =?us-ascii?Q?o4IVEUPLbylKm+lpON480HTK6H2jZiqUYRajHvixEwBnTWAz5RnnCkOJ8w0I?=
 =?us-ascii?Q?mXi9JOGDin09c848IoWp+0xvZlGDOJtjTumAZ6NlXkZAQq5MIWLs66ptkxF8?=
 =?us-ascii?Q?eWyTftZqleCQFbDBqGMH+KC915R4+Xs1mHbRzAWbhuSGUNkb3xRxLwgZUq8h?=
 =?us-ascii?Q?lAfhnt14rpgqyQa2POfUWTVD2CfABfkgVVheCCmx3erC0+oWqxffHDIiBgXU?=
 =?us-ascii?Q?GW64oh97n0EXU3ULuFM7e6kP4ldio8owydH4Cx0kfgpUIPsHnqq1a9JWAC44?=
 =?us-ascii?Q?fagQgNymUz/rk6heuCDAFe7p0gp4McfoWnfGmZZLKaVtSMfM52r481nl2KNG?=
 =?us-ascii?Q?xHj9apcBr+35B0xkEJgFdF9djiBpj6e4zE54NZz0lhA0VM8oI8bMJ8sMV9qY?=
 =?us-ascii?Q?6mZGW5G/P2clSFgazg034zLEREB7eA7ExP4sWz/5DjAhBltCKp47eH3gDCXy?=
 =?us-ascii?Q?f72UqDyYa9BKQOlDSR/U4aBMz+KrGlC/h2phd1/+7dOZtbr16Jk4yVd6vSir?=
 =?us-ascii?Q?7a6wSM55xyY69sdiubFUhdmEERybzFmR/2DczsXRVqbdR7dOt2eyyO7sfQm2?=
 =?us-ascii?Q?msAUJ2UeHaweSuOcjDOb1mZZ7yf4SLYZYdjSIFPXPTnwTY8xEYB/TwBgcYwj?=
 =?us-ascii?Q?VxVab1lyvCkSw+m9CYGRdg0/1+j/kEXDJ3EL47TzjDRJf1dTKgiOHf+sVERF?=
 =?us-ascii?Q?Q7VjMtlNwBDBRIVIR56lpKORof0IhDk4PvXVDGUgYBNooCy5JGY2OAQdbVRc?=
 =?us-ascii?Q?/iwDFNolL22XeLFj9l/Xc8iRLXwdbM9Ag+RWNQ8v+2DS4jzMO4IJsTzglUrd?=
 =?us-ascii?Q?xQKLyqQrIaT5tJduJ74ltq70K8SZ3fdI5r7RuyCp3o1HCS9GIjJhxYj9Vsfm?=
 =?us-ascii?Q?UP7Bq2cWJFcvYCNyJiQCMxorNcuXXjZe4fqmCUQJ8ulsYTfQHO7RjPpWhdik?=
 =?us-ascii?Q?lHugUTjjOE7kwkrLocKKjtDbt12FgEWGhe59HApqViKzl2M3+QjgYW+6t2zW?=
 =?us-ascii?Q?/y+k32xGkmgxswveLKyHcSmkA2nz2aFBAWBaMy2CWSbxEiYkyAuSfs6kgg+8?=
 =?us-ascii?Q?M/dVf/xcvvocEOdtErQrH6Nmh+BUyOk2mCjE/4bq+Y4aVLHEv1dP0GHLaAKs?=
 =?us-ascii?Q?fmUuLU4zCIDZzEm9oCwndSx/jpHHdT4/r2n0F3OX7tlEwoGh8ihtFwV2OgCt?=
 =?us-ascii?Q?KLsLooChqQBLn3QR7YP70uIlKnrDL52k7+cXMz4tGx6+Si3MkErfWxslvXoO?=
 =?us-ascii?Q?o8jnOqTc29dNHw7BDJbFZPihoGIgqJuHORb2kDj/LTyfBJ2BjEKO4X/wcMVS?=
 =?us-ascii?Q?NF5Cmn42hN+TzHzqdZ3FTzqG4snDqvm9OAk142ugL+FufTR1fH0rXX5FwgLU?=
 =?us-ascii?Q?svSggaYqCnSHLjVwQ7g5e2XqmYeA7eYGbZoNPnWbCfK6GXyk/A1lKgUXb3C6?=
 =?us-ascii?Q?sEVCTr7CqWx3vTNzmg3RE6fcEqpivmbsCNTBxTiN?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb1f926-e21e-42f0-31c0-08dd8ef0f65a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 11:59:33.2699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DtAJIIuG9FmuvJgtGzZpOoTuh4EDPDSy3HndYspa9ciqzdEniLPbUHZhrxh4l2CcBHTodVpIw265s0Cpf8pSaJmciQyhm+EcN8/X/YaFHyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15842

From 394aa94afea5d0dd735237bf1518d8d03d52fd0e Mon Sep 17 00:00:00 2001
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 9 May 2025 11:08:43 +0200
Subject: [PATCH 4/9] phy: renesas: ethernet serdes: add USXGMII and 5GBASER
 modes

The enitial driver implementation was limited to SGMII and 1GBit/s. The
new modes allow speeds up to 2.5GBit/s on current S4 SOCs and even higher
speeds on upcomming SOCs.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/renesas-ether-serdes.c | 69 ++++++++++++++++++----
 1 file changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/renesas/renesas-ether-serdes.c b/drivers/phy/renes=
as/renesas-ether-serdes.c
index ce4e3ebd85d2..af5f491cfab1 100644
--- a/drivers/phy/renesas/renesas-ether-serdes.c
+++ b/drivers/phy/renesas/renesas-ether-serdes.c
@@ -92,17 +92,17 @@ renesas_eth_serdes_common_setting(struct renesas_eth_se=
rdes_channel *channel)
 {
        struct renesas_eth_serdes_drv_data *dd =3D channel->dd;

-       switch (channel->phy_interface) {
-       case PHY_INTERFACE_MODE_SGMII:
-               renesas_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x0097)=
;
-               renesas_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060)=
;
-               renesas_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200)=
;
-               renesas_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000)=
;
-               renesas_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d)=
;
-               return 0;
-       default:
-               return -EOPNOTSUPP;
-       }
+       /* Set combination mode */
+       renesas_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x00d7);
+       renesas_eth_serdes_write32(dd->addr, 0x01cc, 0x180, 0xc200);
+       renesas_eth_serdes_write32(dd->addr, 0x01c4, 0x180, 0x0042);
+       renesas_eth_serdes_write32(dd->addr, 0x01c8, 0x180, 0);
+       renesas_eth_serdes_write32(dd->addr, 0x01dc, 0x180, 0x002f);
+       renesas_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060);
+       renesas_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200);
+       renesas_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000);
+       renesas_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d);
+       return 0;
 }

 static int
@@ -155,6 +155,43 @@ renesas_eth_serdes_chan_setting(struct renesas_eth_ser=
des_channel *channel)
                renesas_eth_serdes_write32(channel->addr, 0x0028, 0x1f80, 0=
x07a1);
                renesas_eth_serdes_write32(channel->addr, 0x0000, 0x1f80, 0=
x0208);
                break;
+
+       case PHY_INTERFACE_MODE_USXGMII:
+       case PHY_INTERFACE_MODE_5GBASER:
+               renesas_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x=
0);
+               renesas_eth_serdes_write32(channel->addr, 0x0014, 0x380, 0x=
50);
+               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x=
2200);
+               renesas_eth_serdes_write32(channel->addr, 0x001c, 0x380, 0x=
400);
+               renesas_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x=
1);
+               renesas_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x=
56a);
+               renesas_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x=
15);
+               renesas_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x=
1100);
+               renesas_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 1)=
;
+               renesas_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x=
01);
+               renesas_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x=
01);
+               renesas_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x=
300);
+               renesas_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x=
300);
+               renesas_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0)=
;
+               renesas_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x=
4);
+               renesas_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0)=
;
+               renesas_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x=
310);
+               renesas_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x=
0301);
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x00c8, 0x180,=
 BIT(0), 0);
+               if (ret)
+                       return ret;
+               renesas_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x=
301);
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0148, 0x180,=
 BIT(0), 0);
+               if (ret)
+                       return ret;
+               renesas_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x=
1310);
+               renesas_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x=
1800);
+               renesas_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0)=
;
+               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x=
2300);
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0000, 0x380,=
 BIT(8), 0);
+               if (ret)
+                       return ret;
+               break;
+
        default:
                return -EOPNOTSUPP;
        }
@@ -179,6 +216,12 @@ renesas_eth_serdes_chan_speed(struct renesas_eth_serde=
s_channel *channel)
                        return ret;
                renesas_eth_serdes_write32(channel->addr, 0x0008, 0x1f80, 0=
x0000);
                break;
+       case PHY_INTERFACE_MODE_USXGMII:
+               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0=
x120);
+               break;
+       case PHY_INTERFACE_MODE_5GBASER:
+               renesas_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0=
x2120);
+               break;
        default:
                return -EOPNOTSUPP;
        }
@@ -192,8 +235,7 @@ static int renesas_eth_serdes_monitor_linkup(struct ren=
esas_eth_serdes_channel *
        int i, ret;

        for (i =3D 0; i < RENESAS_ETH_SERDES_NUM_RETRY_LINKUP; i++) {
-               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0004, 0x300,
-                                                  BIT(2), BIT(2));
+               ret =3D renesas_eth_serdes_reg_wait(channel, 0x0004, 0x300,=
 BIT(2), BIT(2));
                if (!ret)
                        break;

@@ -309,6 +351,7 @@ static int renesas_eth_serdes_set_mode(struct phy *p, e=
num phy_mode mode,
        case PHY_INTERFACE_MODE_GMII:
        case PHY_INTERFACE_MODE_SGMII:
        case PHY_INTERFACE_MODE_USXGMII:
+       case PHY_INTERFACE_MODE_5GBASER:
                channel->phy_interface =3D submode;
                return 0;
        default:
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

