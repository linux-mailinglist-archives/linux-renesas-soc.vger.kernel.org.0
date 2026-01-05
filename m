Return-Path: <linux-renesas-soc+bounces-26281-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F79FCF30FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 11:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D5D3303F0E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 10:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55E83164A4;
	Mon,  5 Jan 2026 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QnWiWrxp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637DA3161A8;
	Mon,  5 Jan 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610240; cv=fail; b=BTtVx9sVekfnGRyJk3tnWRajPSh/7rSqN/Jq/U8trZrmoypVVdFAxf8ycQFOVKxhwE0dSmQS3V19rUYj2t7jIDWLLOkVFJ4Luy/fo9fgnC00iRbVzj4c082radwg6qlXftMRPfLttQ9u05FHbjL3OcOnwbzKJfJNt7PAN4MUSe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610240; c=relaxed/simple;
	bh=lQMx2DUbH2QInQ5u7Nff1Oe2yVqcE+Tr2jFKg65XBc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S83TVRlKm9mAoLBNSuR9Rjo362qqPwUGx9Bj6/W3ocFyqQAU4JWMniLf8WwMTVAH/f9hjEh3nBwBBwxfKKgaNGleqUhMqjvypF0N0QCQaRpE51gXhScZaLzjaszvgwKlmWFNp+C9/cxCgjUqUJWE+sntxzOxunVeWB5zIYw/FkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QnWiWrxp; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4VxxCHLWfiAFMF1y0f2Y/VCFpu4VGSKEcsq72C1EhiXVwVOl4s8YTYzo8OkvX9H/skIHMW9oOx04mxZkRRdnZoErSvKgGh0qlJXLNF4HrP3EVR66A94g0HeiLEm86QMxgzFq63J6b65udo4U0PMCnCa3qySyreQ9TDvgP8JPBb6x/gfH8WFsojKA50k6EO8ByB1bNnZjOTo1ZaS3UBZwnM6+OHne5vOXU7ERU6pns61Od/J9V2+YWEASthysW7D8RqYl3txH9tyAUlsHFZg+18WgOnQBcOQmbMoLS7QVyX7Xm0nhkZO5KWSlQqDngOLvY8nZ8KW6cht1OrpI/wf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7+Ed/oIScMJuYJukV04InAm6c7+Ocv3Mx3sc01P3E8=;
 b=kw4RfPZosiuO9pCJnrLYUkBjvBSDzNAxMaNTpfLabkZkg5MHWSpWJ/wx7aWxSswcNLeRZr05mAyg9lIwcvyU0wo5vd613bbyybT3qY+ApWwPvQhtYFvmxZSA1yZ9g1I3yDrDMNBznPVctlsbk3NO71IyQ1URyKa2Xa8x2Auok/KTrZvxMpVQ5sT6LVeUW7zuINjDsW/HXhceD0KyeetZRDY6uXCKffRNnlw29OSkh/ybvPvSWiNoJeC9Z55HMVd9d5ZNQHFbxjdvrFqWTEOTtiENqnITdYAIXGQWmwmALgU2gNv6GlTmey3UVtfqHVz2/Of9RMJbP+ESNePSd52Mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7+Ed/oIScMJuYJukV04InAm6c7+Ocv3Mx3sc01P3E8=;
 b=QnWiWrxp+46n2QEqOEG5seqL5vzGcXBSrp62/ncG6H9FHPxkVHVmNlcxoibMrR/M6I3Nh/0wvRt0WFFOJhhyleTFCxogJogDO0c01kfYmpIbaHnVK3fik1pN0w08ysWqI/z7rjO09eBA59YRWE0f6e4zapkSSeWY/9kDWOirRPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB15540.jpnprd01.prod.outlook.com (2603:1096:405:274::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 10:50:35 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 10:50:35 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] i3c: renesas: Store clock rate and reset controls in struct renesas_i3c
Date: Mon,  5 Jan 2026 11:50:00 +0100
Message-ID: <9c36f4107b257409a513fd6095fac3635411ef7d.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB15540:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1f7b0c-57cf-4361-d877-08de4c4841ab
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sdMObFxmSsw13PM1mnd8sHvcXN8szxN2LKGr2WEEF+mf6XibbfBCYfolR5B4?=
 =?us-ascii?Q?bjpYReT1CnRDoJutu1xFhcm49b+soTJCuEVOplk/N2PfCCsvyHoHGeYyqjD1?=
 =?us-ascii?Q?jz7t6Uwhn3tvJFUUnMULsvwi9VwZgwIU9qgyPei9Nn0fE2zBCvuHaAGetd7n?=
 =?us-ascii?Q?l/BaG1dFhU/hMyMlyjnsWGAHUTwEpW3D32kRORZbTlcVFB/V8NtM+gfidENX?=
 =?us-ascii?Q?6dwQVC371k1ruMmoSXsUi+da6rfqDkmUW2dwdOmWRtTbB/K58J0Puf53q5Q2?=
 =?us-ascii?Q?Yz/whzsR/mYAeDThyQ/GDxejQGtd8tUkBbgYwnxyj3paUOtCBjAZ9VdAkfz8?=
 =?us-ascii?Q?HXMHmVeRnF/L7TkrDLPQlEDeBk6O+6eaVxLOnIxxPE/p9QZWAARP0jz4a+mO?=
 =?us-ascii?Q?+hgRfDpy9SFCFit/fpqM1ntXoCP3JxVMHkrGK2siBbv78hC1YNn48CzL8rKU?=
 =?us-ascii?Q?ZnRajaU/844rMxjzHkvoH2mr+nyqGbMfUdSUjuX+y/qI0L4heU+F1tGxMIfM?=
 =?us-ascii?Q?n1mFyBwzqLaQKwXPVf4MPuRnxLq7V76uUulBw3EGXKYiTXM+XANuZsk0uP5v?=
 =?us-ascii?Q?GDssgfo48dszufjkF7rnT/iX5WdNmlkRKJMV22p8WLQJSH3K1FR0empN6kZx?=
 =?us-ascii?Q?F1OXSnXyIUd9qparxDCBwaZcROjYggVeD1fXbsadkoSLBLnEPdGE4wGLdEOv?=
 =?us-ascii?Q?qMwcdGBSR8OwR/BLBZukatF+hF4xJSp2naudj8RxAxhyY6uC4BXL2AKy+mhG?=
 =?us-ascii?Q?6FQgfEMKLwfSbwUlFgcFrYhVMCAVbcYn4moqSlGGGmCc65TiNg5/vWt1CiFD?=
 =?us-ascii?Q?+SoxNeWaliH2gK2A8+MBPn8DJPYnLIAP1CGkUzGgRNMDfghSnlCf07Dma9Mr?=
 =?us-ascii?Q?URKZztMbIV8R7ZrgeFq3X2tggGDC51Zk7STxT6+fw4KHOcPAAkVMIK9c10uL?=
 =?us-ascii?Q?Sye0nM0K74KH/hUDzbiXWB32xWb84w8e8a/x7nIqdum2Lm1FYDIV+/n9SjlF?=
 =?us-ascii?Q?yFMtpyff6RYppZzAYhWH07eL0EgBkBLAq9b1bZLv6xlA6ZlSFz/kdOzkmePt?=
 =?us-ascii?Q?ZPwHqhJH84U6qeCuJjyagrwshlhacNVkio/p+C89NNVgLIHIa4FNEtPxU0V4?=
 =?us-ascii?Q?zuqRhr0iLOqA8aNQwgeGmOfBZzkY9k5lbbfDfkCjnyMDb2L5oURAUYwhNCro?=
 =?us-ascii?Q?y4YoirWzUjmLLlT+9U8EBxe0qVPu4+giKMRkPsuCJ42Ho9BDRnZMHTYwpbeh?=
 =?us-ascii?Q?V8tNxjCUd0x1bX6Zc3gUCQumDm3q9b7gpHGS3Oq9er3c5rr3ryDpNmJpYUCG?=
 =?us-ascii?Q?TszvGk1yQJv+wapVUqPebK2VgHCizmkPk9C4ThFRudu/E39/w3QkxtIiWrHT?=
 =?us-ascii?Q?tWBFEwT5+hpsHEWNsF7Is6AWyq/xtWGuvNxEpYct+GNhomQTLEsxApnKGDtl?=
 =?us-ascii?Q?2crrFJad/ioUMaqxrhYhB7cUjp7Gb3N3DnWpvaSKNNkmvUbBaIJl7j1X1xgh?=
 =?us-ascii?Q?VLIbszMAw/sHLCmb+FGun9cuN81LVwg/ZeL8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SnJrPMLMJ1+Q82anWV5qz07ug5nTntzYVoCdoIJ4O/QJ/i2gRa9KLIsydl8Y?=
 =?us-ascii?Q?q8O8I4rjYrItS9RyOc5LuMGrBfgUJgY3zojhxUj12PmDw4mnGtyD16wTTkXk?=
 =?us-ascii?Q?a0X3ObQJKAU8PQz9I9nnEwuVRuzMtX7pF3Uco8Eq+CVXdF9yWnkDzj9l+YjX?=
 =?us-ascii?Q?953Pl9uimmWJdmVHj7gIQzRCUiDtU4yA+3fhbhQmUvj/iZHERiMJEBBjaW0b?=
 =?us-ascii?Q?qwkYgbufcvMIZHxUn8mxF1aantCTF4m6M+31xrhBIPkSuney06onrP77mj4f?=
 =?us-ascii?Q?KtwHZpDhw/ELwRZ2paWDSX3kIsOeMHmlVF169dwA14zRwQmKFLkHAb0vT8mj?=
 =?us-ascii?Q?37SxfKHgW8uKx4JIFIuMLeM2XaEXO3rK38ofvWNzw7+pe0JhexbGrpOPHfr6?=
 =?us-ascii?Q?EM47+z+nH3A1GoxK5cpcuiLaQUmcIyl0lrUNzzkcNv1DYhYqn+rNJ/KB+FVt?=
 =?us-ascii?Q?6H9Xd88x1IhoAJKYYK6QjDaglPWqTgpCznrZDvIqw3f2/Zfb0sSHVKyhKlkR?=
 =?us-ascii?Q?+Fz2c8p85pElyXSH2A6HjJaxD+zVKCcthknyQcf7gpx7lWfU8/ZOvTbWacMV?=
 =?us-ascii?Q?q3SaWUHO2weZAamz0VkWK1f5QcuOZM5AEu6DmivaBwEY3Gm9YyZp7Pk8M1GP?=
 =?us-ascii?Q?YH2UdHOX9M567jWNgrwLKw6gjrXtMjkTgVQMe48vP5pyrBGIlLzDoVCybAuK?=
 =?us-ascii?Q?UfzG18o9T2S+r+CDuhxX4IdIdMSujaFUAgs5J3S013BPZXgD/66cmYO+zCIU?=
 =?us-ascii?Q?5qb8AKY+SrXSuG03zRbZ+pMdLH1X/3xhRVlixZ1/owXV9VaQm0b9coFqQIod?=
 =?us-ascii?Q?5ucYV6u24eMu0CNWpJbp8fVNL6qWNdq7+l4BmtK2qq28+3pVbUgjA9/EI9fW?=
 =?us-ascii?Q?+xKpYHoq95QKFEIfwQHn0JszBQYzfAGoUHk/CFCS5L8ZvHy/NHe/6Q63sJkg?=
 =?us-ascii?Q?G1AGSBUls4XTl5AowxJHKJaup5OH+15mk4GQTmUYXvF/kXDwfa8HriOikRJf?=
 =?us-ascii?Q?V+lOqXls00c4RughOKHbvtPR/93vbYbv3QssAF3+qlSaE3TcXDOqMHg/QKgf?=
 =?us-ascii?Q?NqDHUKr3AH/UNTl/vwOvD7ltklaKF52pjNCrEWsyLkiMGdRxVEvFoqSBUBqL?=
 =?us-ascii?Q?tVIJdIsS9kIPdBlkN6Is30g4tDvWXGMGAfhHJoVjRlIYJ9G4E1NxBhQBD5s/?=
 =?us-ascii?Q?RwU3KB3lkEKbxE59dAlhFwVdNMK4GLSmiQ7X2qICeT6DC4KTMM2pip4Lnq7K?=
 =?us-ascii?Q?xJHwnJ5YbGPb93C5dFYsip0LZGYo3r2wQF6DmYcpvKbMuNTTqPptp27ZZmIC?=
 =?us-ascii?Q?Xq1rIhzO18bdZ2oM9DmtolckbdgzddeYrz/+J2zfaLuhMAPwysq4Atbs++tJ?=
 =?us-ascii?Q?gXKrli5ajXDrxcJN9wrDBU0N5XeRCTgn7dVr/V1bHAT+YCi2m/IbwuRPUw3W?=
 =?us-ascii?Q?KoHukmtIcrarXRZVa0tLN0rnxGcNW/09cNeAhnWONx8DJ/6Z3JJmEg44sNn/?=
 =?us-ascii?Q?MoqCAqiMtZ4wUhjBp/NEmTCryNeCg/RbCNw+vYETSd97JYl6bhYON7U+Sck7?=
 =?us-ascii?Q?ATbUGgNjB0yAF0jTQIHxC4+wnVEfapQRvGvKV4lWIpyrY7TFLnobrvIag+ym?=
 =?us-ascii?Q?m5fNdakJFyQAx1I493tm0KmsoMxr+9jC8WC04CLVE0RZHvHf+s2dk/vgPNgO?=
 =?us-ascii?Q?KH/iANH2NevZWVOb9Jg85BuK8COi1xd7bo4bdxTWQutUWGKRJ1iXds41qZhe?=
 =?us-ascii?Q?ZTe5LPwdGyWbQPea2YY4zG1NYHZAOoJ/qqhl/H2nlCPnsIjc64CZ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1f7b0c-57cf-4361-d877-08de4c4841ab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 10:50:35.7078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Va61oy22w4gL8j6owAgQIF3aMfjJU/1LRL781L03b3rKhWL8gDGeATimv9RLDugG7Xtvw6UMqKPZx4DNEj7UhR4ctkqwsXIueKf0yQ7MN0ong7bv+gSRu5tPO2LPY01
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15540

Update the struct renesas_i3c to store the clock rate, presetn and
tresetn handlers. Replace local usage of the clock rate and reset
controls with these structure fields.

Simplify the code and prepare the driver for upcoming suspend/resume
support.

No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes.

v2->v3:
 - Collected FLi tag.
 - Improved commit body.

v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 39 ++++++++++++++++----------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 1b8f4be9ad67..7359f71f78dd 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -258,11 +258,14 @@ struct renesas_i3c {
 	u32 free_pos;
 	u32 i2c_STDBR;
 	u32 i3c_STDBR;
+	unsigned long rate;
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
 	struct clk_bulk_data *clks;
 	u8 num_clks;
+	struct reset_control *presetn;
+	struct reset_control *tresetn;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -482,22 +485,21 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = {};
 	struct i2c_timings t;
-	unsigned long rate;
 	u32 double_SBR, val;
 	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
-	if (!rate)
+	i3c->rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
+	if (!i3c->rate)
 		return -EINVAL;
 
 	ret = renesas_i3c_reset(i3c);
 	if (ret)
 		return ret;
 
-	i2c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i2c);
-	i3c_total_ticks = DIV_ROUND_UP(rate, bus->scl_rate.i3c);
+	i2c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i2c);
+	i3c_total_ticks = DIV_ROUND_UP(i3c->rate, bus->scl_rate.i3c);
 
 	i2c_parse_fw_timings(&m->dev, &t, true);
 
@@ -510,7 +512,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			pp_high_ticks = ((i3c_total_ticks * 5) / 10);
 		else
 			pp_high_ticks = DIV_ROUND_UP(I3C_BUS_THIGH_MIXED_MAX_NS,
-						     NSEC_PER_SEC / rate);
+						     NSEC_PER_SEC / i3c->rate);
 		pp_low_ticks = i3c_total_ticks - pp_high_ticks;
 
 		if ((od_low_ticks / 2) <= 0xFF && pp_low_ticks < 0x3F)
@@ -518,7 +520,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 		i2c_total_ticks /= 2;
 		i3c_total_ticks /= 2;
-		rate /= 2;
+		i3c->rate /= 2;
 	}
 
 	/* SCL clock period calculation in Open-drain mode */
@@ -539,8 +541,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 			STDBR_SBRLP(pp_low_ticks) |
 			STDBR_SBRHP(pp_high_ticks);
 
-	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / rate) + 1;
-	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / rate) + 1;
+	od_low_ticks -= t.scl_fall_ns / (NSEC_PER_SEC / i3c->rate) + 1;
+	od_high_ticks -= t.scl_rise_ns / (NSEC_PER_SEC / i3c->rate) + 1;
 	i3c->i2c_STDBR = (double_SBR ? STDBR_DSBRPO : 0) |
 			STDBR_SBRLO(double_SBR, od_low_ticks) |
 			STDBR_SBRHO(double_SBR, od_high_ticks) |
@@ -591,13 +593,13 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
 
 	/* Bus condition timing */
-	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
 
-	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
 
-	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / rate);
+	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
 	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
 
 	ret = i3c_master_get_free_addr(m, 0);
@@ -1300,7 +1302,6 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
 static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
-	struct reset_control *reset;
 	int ret, i;
 
 	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
@@ -1317,14 +1318,14 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 
 	i3c->num_clks = ret;
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->tresetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
+	if (IS_ERR(i3c->tresetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->tresetn),
 				     "Error: missing tresetn ctrl\n");
 
-	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
-	if (IS_ERR(reset))
-		return dev_err_probe(&pdev->dev, PTR_ERR(reset),
+	i3c->presetn = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "presetn");
+	if (IS_ERR(i3c->presetn))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
 				     "Error: missing presetn ctrl\n");
 
 	spin_lock_init(&i3c->xferqueue.lock);
-- 
2.43.0


