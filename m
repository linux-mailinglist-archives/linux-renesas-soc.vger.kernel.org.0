Return-Path: <linux-renesas-soc+bounces-26220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 756FACEB867
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 09:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A8BF304EDBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 08:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87B0312814;
	Wed, 31 Dec 2025 08:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pRhpDxk1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF08312827;
	Wed, 31 Dec 2025 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767169429; cv=fail; b=dMa9PxQUsYhjzgdNffZS3kgt7lO1kOOSI/XbVgpA5JMAFLuATWll7TXHdXFiHYQysvLflWxM+2aeunaZObr+P2PEE5zUtNNYdKyW31ENyXTT7R1/YCyWjmvJ9a8Mo4376vepTKbWDnHekIgZQzLVgUsjV8lzTfaV+Qb+/32QB5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767169429; c=relaxed/simple;
	bh=kkDxKo7vsTBcNh4gD87qQh9g/0ZGyXj3hRCJ2qR+tXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kEmi66QmRgCiCc2yshUn4msMd3ygxrhWALRH6qxcXG3wi3jWCeAVq7bSIG/SgwpI6YTCCmi3WmY191Gf7/7ScIcH1vlfAzmqlWhv7QHmAIzWioJXMDeRhLWWc/aEBlwTeUQeLPp97YeUDBrT+ads8Rk3QcA/1aR7OpcRseCTsyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pRhpDxk1; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5+AXjBxaJR8HlAqXoD8UtYnsWBYjkVee+6O/NQwez8mlZei24g0cStRXo00u5Ub/r1fqbrNo//Gw+DOplLo4bUALaXaIqnqn6lz/Xex47njao3vktceBCZMyIyx5+RcUbgOcW6hwbFejYDB6q6SwbCXqq0KVXI2O/mJLkRfhekHKAcHm5s2MUZxSgC86Cvk/5IydGCPTQGvVBClO0MPHDwJzufobmXAjPSW5ardOq4CabQy1Rv2XZkD8IAaz5yyLma3HVseb2cTSwWK+PN3bhBvSv4djspBDaO09ScU6t6Edi/7A+/wpsYPn3FjUYqO4BtCvEnWUaQcse6NdDdEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWOaVdI5/1WaxeDb5OO/+f07aonwanctFyrxtXVuhwk=;
 b=DNORp8dWG8R+lplssnaTvns1L8zF3sQzfu0ETjd3djJcZgSY0Ray2uJIb9MvNaW/ou9V2UNNOo4Oi2yAbDmBpemaEtNlfDVE/kJy1c7pcLMxRLX7GXb+S5YkSTQoNBaQLFIfNUrFpwOfhZiu4aMZBZK18jK845Bou9G9nUvI/ZtE+B1XkAYvYQgaJmeJk9jp/VgJanS/utJjFtiIj3t0NUkcFX0xiR2mIvQUnKdIM0M7EPRq5M8pHuO8cegt3II6CxXF0rKckVq2lY3QHp6OgE/FKgHsLKj2HQArTJ/IOtYrbWmKCM2vZ5zn4j7e1X+KU0wvwlggeboILHsyWsIrFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWOaVdI5/1WaxeDb5OO/+f07aonwanctFyrxtXVuhwk=;
 b=pRhpDxk1p+3Qzy+i+d6s0oJEcSZVooFWFVtWBw+H9zZ3uBWnjhgCjTQ9v8Sthceu6Yx9bUkZ/Q6BCgAY5YbbfNl7Yy02bmZIV/kF+KLWSMd/QVbQsbpFWXSHezJC7U8W+Olj+sdrCijKr9cfE4/PrSoVDIVb3Zq8z/7gi2OLV0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11751.jpnprd01.prod.outlook.com (2603:1096:400:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 08:23:42 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:23:42 +0000
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
Subject: [PATCH v3 3/4] i3c: renesas: Factor out hardware initialization to separate function
Date: Wed, 31 Dec 2025 09:23:00 +0100
Message-ID: <63c6066fd3ca5a6417f46da967c2f29a25f34919.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: 41caba0a-a586-4616-48ef-08de4845e88e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zl8ws8JrNu38LAB1IgDgu5tyqxUK/oeYmrh3MMpjkXSqafbvrvOBokulpD+B?=
 =?us-ascii?Q?ij+JfxG+rVLfWI3o/Bxj6PIkLCLMfDs6Wy4L1YAwHKNIzsPFq9QFJc7zPVQ7?=
 =?us-ascii?Q?7msYRDS9kiHnftJXTN1UcDb8q5u6ID7SrWCcI8RUZwG/AyQITtg0GGZpFc9a?=
 =?us-ascii?Q?g84Uy2pqww9wE4X2NZpbE1eZN43obAT9hnNF5IuzVVOUYun2LFvj7xYP5lGh?=
 =?us-ascii?Q?WWltTaYCxZK/Yb6mKvBdmstXvEoGYydRPoVTCPg/57UWD3nq0ibaTq89IFrr?=
 =?us-ascii?Q?HEBAykNjX4kF4cKZbDGC+IxTM+ZbfB7Csr0CDbUnSISfNaKbLj3TD7QVw8tO?=
 =?us-ascii?Q?eCqdDXypBEl79wNyjluDW4dmD9R/rbHRZlmJGOnKWmtYMq5OATxqED/BYpWL?=
 =?us-ascii?Q?cP2RbViDGMJxhja7+GrRjsOuj8Qwt2raPv2VijqljW2VRtZgUGG0v53sK5Bf?=
 =?us-ascii?Q?bFF/9dilvgTyQ6/47dYoOcqoz0AuVHWp1COeh+8N2DjlwIeeR+HQr8/WU1jR?=
 =?us-ascii?Q?35+Wb84n/YJKxEq+P4H9uX6V3+6Ho2PvFFPPgTKN6QJP9y+BgAtgcVI4U4Is?=
 =?us-ascii?Q?eCR6cA5PtbwcZEW8z8rAldXIKBFzZwdAU5+hOi7JxFE8UVdKhpH9GV/4PX1P?=
 =?us-ascii?Q?SWa3s0p37e4GHN2kGViZbaUiq5ek+dbPnix7DRUNxZaQbpPXyBMc2Zgz0HKu?=
 =?us-ascii?Q?yLmkExaHwRRpA4l+DmcRLnnZhMXYaSU/yEkcp2d9qyErfn3gQEO3tRmCGDuw?=
 =?us-ascii?Q?VZn3zY5I27B2rDB2upZX2JZCzIGtIZoLLwvceC5JK/b2Mr2KOzyi02tlE7RO?=
 =?us-ascii?Q?g3eeG+FvpUg4EBA3wYvUkS6BUF01wDtxfV7wYO7kJrAGye/GSPaHqpG6eyuJ?=
 =?us-ascii?Q?UBSAJ1coZQ21bI0YvGgX1om4nxlCw8nIytz6tzMLFB+LSsHIKTDUVw0yxF4D?=
 =?us-ascii?Q?ffkyTAXMAuhY+mJt+znMSws8LHdlqnmeUGhZCP/tEAy3XGEhGu5OOM2hIqOU?=
 =?us-ascii?Q?OAA5Ulj0L+Kz6oHXOEOLB3ySAmvniEE9wtoFCRQZ11XOBY44vbsw8rjtzw5T?=
 =?us-ascii?Q?e87Qn85nMudEd9lddhIq7CAvJvkYGLHuDThkKL70Q2LAssLJJGqh7jG7J7Ys?=
 =?us-ascii?Q?ungmnbWcYVdrJjQta3jWuXBAj377Dt7bRF1tlKlxyEfFVSWu1UeRyXTw3q2Q?=
 =?us-ascii?Q?WJ2rEZsq94G4kcE50qvrq+5jOaM6gxWxqkpEjYCjY30++OfJb3lhgmrvw4rk?=
 =?us-ascii?Q?6CzvgyrFzqAyzMGG32EoFk7q6ZJwRR0HANq+yb1vI4D+0ZZ/gucikxrAbJ4h?=
 =?us-ascii?Q?4IMfRhwD/gW5jfxgEmt6i7nHQPoVrZa2NlD77mozUAVH72YhhmDC6+fEZ+Wv?=
 =?us-ascii?Q?PbIzp3sdIhUzyhVJkLZyBuniWbKg4PLAK/X9/ILY03VrPkG6m3EbzEgYNDS5?=
 =?us-ascii?Q?ghqcKR1J9anyHkLT8XZjdAsDNe79ZoSYF7OWjqmV7+akrVLQPeEw9NEch40J?=
 =?us-ascii?Q?kptc3WUdK47Co7/Gct3Cb+8veabqY2i4SWlx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DfuXIeuJOCZ/JXE6XzylRhzZS3PMT9Q1bBd9GQWWQATVkY3GyV/MxhiDilEX?=
 =?us-ascii?Q?v7I6JgLU/YwjB5R4+8rtJ+gspYwmu6sW3EewitYR9r/Wj9HFkmZ8Hy4Zg9g+?=
 =?us-ascii?Q?kACmeZNSSax1gyYWUaWNMPdXZV8JOTtb+WJIwNm3gnSG1/XhGcHjD/FpZyB3?=
 =?us-ascii?Q?saqsOyCt028Hm3uszSw25qOjrcNfm/zDYBq2xCahbBeMcDIm7OB6aSQP2lex?=
 =?us-ascii?Q?AWjdeIe2Y9I2IhKLu1Wi7UBV09duG+azKr0OjdZeLJWOMIyCPvdbvX1jrpLN?=
 =?us-ascii?Q?w7vUvCEjf68I8Xxfp8xvFhlOg9DBvZxdkIXN05cTKGlC7iGzYpODjtSRi9v4?=
 =?us-ascii?Q?QQTpL4cpUuvS1LK4u2YDhv7w4mO0xRLWOMSpgTniOrSNQdntB+VIq3do72Qh?=
 =?us-ascii?Q?68hw2giDBYRErcn0T2FlMA62tYsTs0AxZUr1jK9o1WVxTqMC37fHrWBlBUV4?=
 =?us-ascii?Q?TlLt6ruF8RL67VpaVN9UlMA6Ctm6/LMc+WhHWH4dORLRnPZxhkcYHuRDKOHE?=
 =?us-ascii?Q?irDFfdYIOYf9aAbOP+EXjPh9+lTt41kW2RVBDJLzk0U4xQZs1gO4YDS32t78?=
 =?us-ascii?Q?cu72RxVdlA22hX5BnwIq5it84ykbo9x5eSfaEfNA0LJcoPmd4AzF0DPVzZbB?=
 =?us-ascii?Q?SkQIUJWYGjhjXfy6ZH2mRFO8sPhWgu4rB0/6wGuEr2X8C9fROBH6mq1W5bnJ?=
 =?us-ascii?Q?emBrtvqiAP8K2fbmDntrAwh6ZwXefziqQysoUTpkmmgEcvPTNcJL4HdSV3GP?=
 =?us-ascii?Q?1AkN32pHvxN9Z4E7NAVasdi91+7MM4I5pZkOer8r+T5jGbfXbpQpzRm17SNq?=
 =?us-ascii?Q?efJM3oFPD74dZbUKQnn5wSoPPN77Rm3epnJ91fcAj0Zjalr/yJjt+yuz5rmE?=
 =?us-ascii?Q?Ir3ChPm/BdeKnZBRqc9J2a9l4cE/TurRtG9aKpUfsHsKOg7vk2kXWCeEWnbJ?=
 =?us-ascii?Q?afM1rWnCxSIqMs8uni33egWgUNlU9tOmAfElU9VQMEN8bhmstNn5fT8q8LsZ?=
 =?us-ascii?Q?B8DHvbm6CQXXzo/pYNWFbu01hYzLNfcXDHZ45NrNX7dxMenm1PxuJaOX1VdU?=
 =?us-ascii?Q?x/axqoRjOUcxsGpW8s/zvI/ptjQfq8WYUIFEaezIqISW4LdLpQw7jpF2qXn8?=
 =?us-ascii?Q?aQYdQ7XJAJj4gWaKqNsUci0yX6EUk4q0efP6gghxUgTVDG/65mziC6lrBDV8?=
 =?us-ascii?Q?3AFyBSQfvElVqQicGNEb4zOTjDg3VjYRwg5B5e+Kky+q6Nf9xqhJ9s8ZEf9u?=
 =?us-ascii?Q?0ZT1rj+y1YhzAgdDNoRv+Rikpm3Vipvoimy+u+aixZ2040ZqoBTKozNXU0e2?=
 =?us-ascii?Q?UsaJcvEwS5sYPkbM8VkpFL3po+Ojk/IyD2STHh9XfzheBMEfDkfc6Tntf9uM?=
 =?us-ascii?Q?Hb+LNEYBsTXcSDxehdN3p7lv0j1zNejTL4O9aROMzWupKjuKTeM+9nnqX2R6?=
 =?us-ascii?Q?18PFyiLqH2UrSLna34LYb3DydqmZEIG17ajG3MwBfJwGlDkeFfP8PIEVrSh3?=
 =?us-ascii?Q?YS256lZOK25vVLtXu+ZFla0gUE+Fvjoi5fyAGOkbD/D3rIv3sUzSYFj5BRL1?=
 =?us-ascii?Q?d2a/JolF1NxvrTCswgTGFp/ICLFoO8y8umyAh26hUVl8yGdm/3HIgTGOV7xd?=
 =?us-ascii?Q?35HytVGoBBkt24rM8LztRDEw3aidIJZOSjh0PgGty5fcPBp3OoGOzIJ8DrXw?=
 =?us-ascii?Q?Z1UrAm0OXOSmkaBuJd5rrJ6VxnugjytCoelqpts8Dag0cZFibkVPZcmYsIUF?=
 =?us-ascii?Q?2wtz/AcSUtq9tSAYBsohsQI/FzrlFUi/uv1vKZ7nbPP7cbsONd1S?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41caba0a-a586-4616-48ef-08de4845e88e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:23:42.7914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKADqXxc0KdJToxfjOb0VTvNyF+P7H9zZXXT0XWKSF/D+DGrQqrS/9kU+taRaaZ8zc35sx9wb7cWGHKKuzfGDH9VtOaiEhM7q4qEY74v0U7bn0GLHCYDJkUBpcMWaFu4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11751

Move the hardware initialization sequence in renesas_i3c_bus_init()
into a dedicated renesas_i3c_hw_init() helper.

Simplify the code and prepare the driver for upcoming suspend/resume
support.

No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Collected FLi tag.
 - Improved commit body.

v1->v2:
 - New patch

 drivers/i3c/master/renesas-i3c.c | 99 ++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 44 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 7359f71f78dd..b065b8d4b138 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -479,13 +479,65 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 				 0, 1000, false, i3c->regs, RSTCTL);
 }
 
+static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
+{
+	u32 val;
+
+	/* Disable Slave Mode */
+	renesas_writel(i3c->regs, SVCTL, 0);
+
+	/* Initialize Queue/Buffer threshold */
+	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
+		       NQTHCTL_CMDQTH(1));
+
+	/* The only supported configuration is two entries*/
+	renesas_writel(i3c->regs, NTBTHCTL0, 0);
+	/* Interrupt when there is one entry in the queue */
+	renesas_writel(i3c->regs, NRQTHCTL, 0);
+
+	/* Enable all Bus/Transfer Status Flags */
+	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
+	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
+
+	/* Interrupt enable settings */
+	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Clear Status register */
+	renesas_writel(i3c->regs, NTST, 0);
+	renesas_writel(i3c->regs, INST, 0);
+	renesas_writel(i3c->regs, BST, 0);
+
+	/* Hot-Join Acknowlege setting. */
+	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
+
+	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
+		       IBINCTL_NRSIRCTL);
+
+	renesas_writel(i3c->regs, SCSTLCTL, 0);
+	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
+
+	/* Bus condition timing */
+	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+}
+
 static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = {};
 	struct i2c_timings t;
-	u32 double_SBR, val;
+	u32 double_SBR;
 	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
@@ -558,49 +610,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
 
-	/* Disable Slave Mode */
-	renesas_writel(i3c->regs, SVCTL, 0);
-
-	/* Initialize Queue/Buffer threshold */
-	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
-					     NQTHCTL_CMDQTH(1));
-
-	/* The only supported configuration is two entries*/
-	renesas_writel(i3c->regs, NTBTHCTL0, 0);
-	/* Interrupt when there is one entry in the queue */
-	renesas_writel(i3c->regs, NRQTHCTL, 0);
-
-	/* Enable all Bus/Transfer Status Flags */
-	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
-	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
-
-	/* Interrupt enable settings */
-	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
-	renesas_writel(i3c->regs, NTIE, 0);
-
-	/* Clear Status register */
-	renesas_writel(i3c->regs, NTST, 0);
-	renesas_writel(i3c->regs, INST, 0);
-	renesas_writel(i3c->regs, BST, 0);
-
-	/* Hot-Join Acknowlege setting. */
-	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
-
-	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
-					     IBINCTL_NRSIRCTL);
-
-	renesas_writel(i3c->regs, SCSTLCTL, 0);
-	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
-
-	/* Bus condition timing */
-	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+	/* I3C hw init*/
+	renesas_i3c_hw_init(i3c);
 
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
-- 
2.43.0


