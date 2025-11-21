Return-Path: <linux-renesas-soc+bounces-24976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92188C7A7FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEA8A3A2AE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E2F3570B9;
	Fri, 21 Nov 2025 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="w5wmYjs6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CED34D38E;
	Fri, 21 Nov 2025 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738138; cv=fail; b=TMCfcPmK2WoL50abh3t5sPafyhEz6z2ZBwJ8DsGqrTiZpTonXVQQtTyND8LWA3wkY375zCs8+AIDyII2HH+CHsvYbcnhGwuoA0pODaBRMyZ+1oCKW7cPWiOGHpCRqn5Q70G4Gu0ex2ZC6FTMdEhkyVVrUWaQT2EqRqvl4ei4WNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738138; c=relaxed/simple;
	bh=5ojgnxjDd4fWRTlucqZ2qpyXhdFQ7p3eDEK/dtwEaOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n4edPYReyYy8pCf6j+hsEndfEr5r3ApO7tvINiTfIbsXiaHHx2YI6u0nnUhDcf5Bd12J9awTao9961q9Q+mk9M40NH11t2YgygjjUa2oU1ydG2W3kcxS4ij7YSX14671KlYLb1XUvm4yKyEsT++X6VN0OMhPNTakA/v2OopnWsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=w5wmYjs6; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc7ZYFsn0fEN0kBu6kqI2sjbjYAljyjQq7A8WtuSMuWr8o0x6FgUAdXOr8drUKtm9F8lq0xSxjo90sLKrrZXEXT67+rDp5z/28nSjCsNzxogd0HTth2oaJ6LvXlC3bfcTsCsIMnnu+5osYa9WETxEOA6usRiUbzS8qaglJEm2Ch4rLtoAxQAm49hvF9Ax8DCYQ+cWQh3LyKPgJtVdmZpq0AqCW0QmLjyx+pEu/mBFwhWTToOJYDRFUcrqjodLB3kf3Wm5drGMg2W9vefC2ANgvBhqyWrEIw7LPqbXLVXZ5H6ShIeuePffOpJMtALcbbUIGqkczEzScReSh/W5vhftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohVnMPjiheiQyPCzYMohWOr1AMkIQFT2bRZ52ULEyAA=;
 b=QuvT0Nwb5aWROLz8dEMvMUwTlo82AeZI3eROjBYujBNEzXGrYSctMshH/yUU+EXEmM+YSeycj9QBIGXVN229Ka8IromxBXHxB2hIssSgyCUbt+8TgSJVBNICx0u3pBeuDodjbpoSmq77k0vT6eD2AYE1L2inioJLZBJFIuzIwIHWTr1A3lMTKe859OGVA5MD1FE6IcAtPMPJnGDEzNHvAfa3Ay0YVXS1NjuOn3GwCY5jpaLgrMHccTSuELKlS6QPJ+Q7sG3tHx42hAn0OgqXTOHwUwExaYNI3dvsTBlCzUJ9oj6GOrCozqTBFyo9l3d+AivaRDXy3In6Hx8ZXsf7wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohVnMPjiheiQyPCzYMohWOr1AMkIQFT2bRZ52ULEyAA=;
 b=w5wmYjs6kE2mAggSkA+efP6GOS9pBs8vO4V8FubcSv1HEmZdWlr+fs3IRI6qtG8QUO6BPylRyf620DUeIPIhT0y+3W4Y33FgYy9mUdKaMhgz/0lBuV0DZdfXikaJjOWQLNXteGlX6Rw5ZrQa/QWfnBfPGJvHDcc6m/sbn9XydUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB15857.jpnprd01.prod.outlook.com (2603:1096:604:3cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:15:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:15:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 19/22] arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator node
Date: Fri, 21 Nov 2025 16:12:08 +0100
Message-ID: <d5b76e9f9e95aa3287c15f9b1a5b3503be6efc82.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB15857:EE_
X-MS-Office365-Filtering-Correlation-Id: f42e5d5b-9b58-4de0-573a-08de2910d124
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vgmIxSnAi1WDc06sWmE6ZizKFrA0WgcamzVjWfY2BaZXj57CeDblLB2jDuLs?=
 =?us-ascii?Q?sGqqNutXHGDGixHTetKc6sMyd8mofWkOWqGViRA964rT5wq/gFVDczeyHKwB?=
 =?us-ascii?Q?DCCHC8MgVaR/ATmVCg1BySy7HwqlAOmycPeMO456mM5iAON5ITxvl22G1Xja?=
 =?us-ascii?Q?hJtsUlJa4hTp43il/eCBQBKdA1xr2yA1aWp8P+hCplqVRyeARxMGQcgRiT/G?=
 =?us-ascii?Q?99o5Uqx38MxJlHo0HrB1dnicFpYTQBQBrosAPjKHx0bLkHqVWJ4ELXZe73cp?=
 =?us-ascii?Q?jNC55QYHmOc2nxaeYpjBx5X5HxuTrpkVzWqpCDApFvaFOLZkuHla9NEFdNtu?=
 =?us-ascii?Q?TGvtITJBEnwxW5KYToTh4IeUOns7St02xhGjheENZcaa9qTrfHF3FcnAVKTO?=
 =?us-ascii?Q?qMajmjOmj84R+lkbQlIWCO1MgmUpAtbwZpTtkT/sWNK1AyRszymi3/cNDEyU?=
 =?us-ascii?Q?AhliTAODIGoFMV+1cK3jp3MbrpYZfOI7tPx5mL8lAdO9xBZhmqNqUQhuGN05?=
 =?us-ascii?Q?Xnf9XGAlttzMI0wkLXkU2Bj1M6hj7bC4JS+7Ku7EyQSTaNLfrUtHd++AEn1v?=
 =?us-ascii?Q?ToYlJO15Bm4RALrW7t8b19RBM2IshmXWADN+HE3w3eF/oXG4XGpWnNzLqcJn?=
 =?us-ascii?Q?e4NwJtO0ENSTO3V9QXWfE/qAYcr1DPxD7mytbgk7L26Q1MXPBkV0YYsPjLjR?=
 =?us-ascii?Q?wn8Cyl95v8CoSd+6bg1ElEkKrqPt5QPBbUvB5FUbBL2eAL6mXDRAt2UMztU9?=
 =?us-ascii?Q?aKdgfYAiJGYDSSnz8CxkFrrRqBCJpHdyXTIryz6BlHzDJ6HonfirlXKRlNzr?=
 =?us-ascii?Q?fFmmRc6RAfW7MyALsXN9LcHBj1Ml6nI4TXufQIrR7urnO5tCksn88JYYrQdf?=
 =?us-ascii?Q?5F7g5EtqBYDE+DJJuVW6/JZvEhh4j23YZfVU7WD3XXbUEmg6PwWqCjKK0wlk?=
 =?us-ascii?Q?tZkiF+pJzuw6Y7+kssl4SzIdOdvLSet7F/CdSbl4dwPS/qh4S6snRjruVA4e?=
 =?us-ascii?Q?Sv8PJ22l/jciCTztV3JwaB4NYCaGI8p1lRBK90aRdDYPfn4xXJNYBrb1l6bo?=
 =?us-ascii?Q?RvN47wRJYHExYXWKnuCePt5EuwwzE+jgjVOvM7MGDqHxEJ66jfUgHlXGwKOE?=
 =?us-ascii?Q?irHYg7CXl+/lwS/aMAABGppaC73A5PAnVZ5CAag2Uv7g4noD6Q02PWs7F2bL?=
 =?us-ascii?Q?aHkDxs4amqZH94Iw4IT6o22TEl7PiQzFPZjMlHm9DbXbyt3Khx56osN4IYjA?=
 =?us-ascii?Q?PnK4f7T3rCMASmgGK6qomMai5JBIz1mjG6No/wPMXq5yjdzC5g/Mluwnsp6H?=
 =?us-ascii?Q?ORsNInl6EzzkZWYYlzCo4djnDN1UiE8WjiluDO049gLH+1V5rt3ODSmTSlf3?=
 =?us-ascii?Q?XT0nWyICEdeUOIhn6DG9F1cSJlzyd+lI0zcNZo7xtsh9ctPfRE40XzifBmhV?=
 =?us-ascii?Q?9p+jPluz0kypuFd4wBcKZ5cPGOww7DtrroZAe6MOxthP4CZlOIx06jwtJ0JQ?=
 =?us-ascii?Q?9/Y1Gy7WYjBpbCiADPcYC0YzyedjUzyeuNs5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xk8ffeF+Am3QfW7b6zUfKT7URCRUCpd0R2WvJq9dtnzadJ7Z0daw5RRnnOxX?=
 =?us-ascii?Q?2+nf9G/lgCkj6Wt19HziNasoHMMQlgJ/mUcaKa4mVI1Yv3yMwXX/+vvjheJF?=
 =?us-ascii?Q?4LPC2A2oedDUPU9e5AUXswrSM79+MOtaoWiBsqBAHvNBQxDjByyTAT/Xh0qc?=
 =?us-ascii?Q?3mNplzihtKa4MOiNSEF4mw/E88JXI3l7y3N07XjbD2vRw2Et42G+OZOQNF6I?=
 =?us-ascii?Q?Mepg3wv4dPO5Tq1lmJMx/Dvdm5XVo1T+xI16mIan9tivuRDn+SvTZ4Vaog1B?=
 =?us-ascii?Q?ZFcHLjV6JyQPFtJ34xoNQYvpNYEwtSjZ3+adotD9gIuE26buSFPgzO+7QoiS?=
 =?us-ascii?Q?yYwH6vPRWVaJXN+QBa10/xmZwkOxGyAIBXNuD4TcvjIPBp8QPKqp7RXUNVXV?=
 =?us-ascii?Q?tD5sc6iVho/lpc7uOqnFv75+opF0/iNl1SX0OGsuQX73tlw4YIGj2I7/Bxjp?=
 =?us-ascii?Q?7ZgVtzqQlvsyI22vUHw6NtssfA6q9KuNv62QzE7OyCxD4woi/Y3f6fu8F9Vh?=
 =?us-ascii?Q?JfBmu52uIj0nsFuhnp+uobTbgzkum1n/DcwW9UAE0IMQwVZjLd/xub6F63mC?=
 =?us-ascii?Q?wbZ59iqB+tynsROh06sFx6OlGCuGX2dHZQGd/PMMDAbT5BzWIYVfc+fSt5+H?=
 =?us-ascii?Q?53NhpZjbzm0soBjndj8+C23zmbOjSzNK2LTbADyDRI6nfLmz7wSjCG1SI2VY?=
 =?us-ascii?Q?gVivRAkQk90vDPnyHzWAwgk2AIzBFGNGagqmkqn6vwez9xVJt/DabKB/fLYu?=
 =?us-ascii?Q?Bt0//oXGTuuyBW3U8RzhXlzF94+SJ1Z1r6vprmkxeNB7DAEPvPOaBTyNw3hG?=
 =?us-ascii?Q?NM2gvP10eVj3xBJqjbl+MOwIkTiushokdEdoAenfYG+XBs+DmLC3GPj0eTo5?=
 =?us-ascii?Q?VWqu41p6GZlVvkJq+SZs+KbzXYKgy+A7nv0+oDnJgbOzwFU4pdyRid+gOnH4?=
 =?us-ascii?Q?9tepnnBLXlo5hiGORi5aQZfxbBA8K1GhqWsZNJKk6VABqFkQg16CEH0y/DqT?=
 =?us-ascii?Q?ufQvU9ekHjs+IcDA36xwV73lyh2S3fc5w6jv++D8OGODrOZNOTRD2oUfgcjb?=
 =?us-ascii?Q?/RpGh8A1gqEe0sEE5+rytHF2wTM98M8DMFI/2Er9hgXe5eMtPN3G/WH5EGqm?=
 =?us-ascii?Q?w8w1a0yD+iu0c09fkU0wtsNGMTFjusSxsgQLxoIJj/YWmq4JC4aoQ60IUanZ?=
 =?us-ascii?Q?jdauZ3mpqEpHgyNbqyT55HBxEid26jhS7kk972wWmJv9y+hlz+2+Feww9I3/?=
 =?us-ascii?Q?cI7yBYxGSMor1f+kxeQq1vcohKj/XDBtw83gLLL9AfVaxkhcIGWS72J0TpFQ?=
 =?us-ascii?Q?MpDfIue8IbjgjLYr1CDVxAZ52RJKGY1lPaMgzuPeikaSsfpCt7mkc97qtKuH?=
 =?us-ascii?Q?RKUNE3MjOBgZ/xDbwm8yRw+WL2nAylYGxVTYjk3IBEPTORMxAXJxtP+d2yK2?=
 =?us-ascii?Q?ekISE4aacuF/THH3E0OmtUFoTxTr2M68ISpycLCuZqv0ZQX2I4ngDuRNLIYZ?=
 =?us-ascii?Q?/RscW2YRTggf8xvBTdSy5NcCfDcSnWL6NSzROnnlrsLIZ1sIgSmKb8BR5C7P?=
 =?us-ascii?Q?MtlqFuX9mwNQcfyCgmjV8qW1jAY2fsjM4GOdh36LW+j43peN5m8UEH7zfrLd?=
 =?us-ascii?Q?Hq4OxcpBx5YTczJ+PCT4Gw8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42e5d5b-9b58-4de0-573a-08de2910d124
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:15:34.1602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvJIgA2aAGJGT8cRMiQkXmzFBdfocGr+jBlTNL+/ZXmrB/fEvXCG34BYAoFoSHa60Y1buOJq5W5Oz3cLFmxJqARBhrlPOndnoYHK/ih6+3RtdKy9xX+5QKZCN7iE4bZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15857

USB2.0 PHY of the RZ/V2H(P) SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
nodes to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index b4bbcde33099..9dc0fcaad86f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1036,6 +1036,11 @@ usb2_phy0: usb-phy@15800200 {
 			power-domains = <&cpg>;
 			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
 		};
 
 		usb2_phy1: usb-phy@15810200 {
-- 
2.43.0


