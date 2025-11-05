Return-Path: <linux-renesas-soc+bounces-24153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 67083C3662F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE4E034F20F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3018C30F950;
	Wed,  5 Nov 2025 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QzUrWzxY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7372192EA;
	Wed,  5 Nov 2025 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357205; cv=fail; b=P3jUHtAQpLbWvFBkIXC82LzCsQt7ll2T2TOq7mcimTs5Cg6gbfpst/9bhNUk1k2IpPsgRlT1iJoTbVEydjBiabXfXemKWXgzeASIXvi0duFf4GxhZqdgIso/pm4fdgrIFfK5oh8pwvZwfboIMlpT0yPpgPlpRwlsfxQG3tzcjWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357205; c=relaxed/simple;
	bh=kg6Y9xV9PrJQckF/JrjMPDI8ti6hH8dVArXQAAH2ik4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UNgpQlQD7VEdaF1TBDkfj26XqB6uJoWVd6JYxLxhXNV4aY/D40quKm9l6+yUzun8wFqfxi7T6qHIa+2pJ/LQ+DUeTzmrInuBPYj3huGh5jrezHtkDHYvBsQQubHhGr1v5uyr7bgv0Um3OY5eUZvAGq5JoJZtySKHXi+it8c6iBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QzUrWzxY; arc=fail smtp.client-ip=52.101.229.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w91+Tevm6hjCYTtaDqgt1rDwy3jFfV+S+aeaV7xr4jIDMKXF+vYf+Ml+/Z8I4qna7X4OYJuu7P6x1gcONXCzq0rppmPUCi9LPHWjytsChjLHPblHbioSgCmaYOOsPVghzeEK3V3hW9B57mfBOAlyQStgd0xJ2HrHIUkeuDTBERXa7ApMJ+7Q7JzBNPEptPO9Mth+uYMZmp3T6PcwcwwCYQwaU0gnUk6FTz0/EWBr7mu3tJzDdh10gibvv3yo0RPJdmgVpQPBgwudEGp5GtcEZqwfx6kDb1/n/5gIFxHGQqTsZwy2fKIYuRrooBGmpKVch2lK36Wz5wCzfUFEuqZLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSV87wyyzB2cSIDAaDpfdioF0qEvrPeZalUdmbpssXU=;
 b=ez58u/Fbycogji3/+jml9qohtRfP2sgK6SRrZTxbU3pYiKceBXPhi/PB/cRqa/Vts2mEuuzE+v739YhiRONupqkroTRFs26dOWQSulp23QvRlCLwr6Tidd76LWBZ9SqV1bVX4WAwZEv4bD+SNjdWwiJdtTIyAKq+dTQhctZ66oZFWTS1+xHS/hthw/oHkzItD9wWV+dKjDeRzpCuybxvH3zzwpTPPxEcgN3aiIrYu174OXyIwEA4LLHhnL65yR+RGw2Qgy9A92jpJXXmcjnDgAPbu4Pg0ARRc4DIbnZJeeUcqIkDVTQ9lSN+8APS2tFDgjEhI7cfgW0elK1YU3zlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSV87wyyzB2cSIDAaDpfdioF0qEvrPeZalUdmbpssXU=;
 b=QzUrWzxYqbmV/YyKEGC6qkydx/QCH3z3qNt6Uov7/mBkkfmJ+j/tOD4bxMKicksnp5ouq1lBCtFuF7K8sMA2SaP06r8TJCIpk/ALvvECamnCDFRJ6nxuSOmJL1Xb2eMCxPzZuElwXIE8pmlSG8ram/nczz+sHColm99voeVTdJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 15:39:59 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:39:58 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/21] Add USB2.0 support for RZ/G3E
Date: Wed,  5 Nov 2025 16:38:56 +0100
Message-ID: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: e68ace78-d042-4258-6188-08de1c8193a0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hHr6Hu+/2KzhMfNfe4PPrGgWeDyphn42zaT6GtXyD3BFkl+hVYiszamNqC4g?=
 =?us-ascii?Q?U8Qpc627c9NOCUC7g0isl20jkFvz4x9tlD/V5L4zO2v5Q990Pn8+LZ3T5otU?=
 =?us-ascii?Q?jEYSuRC89xG3Aw2uYlYn9DR+BEtse/1qc/cKfFAn+1b5z+L4er+kdVbjiNiF?=
 =?us-ascii?Q?0kQjGpGgzoK2VbaasAJ7RTJRxr6BDj3nrsd8S0p/cF3bnxTQap4EINbJHsvb?=
 =?us-ascii?Q?fi0m2ZO+oFwM3vwa/LKysvMo4ho7CdaaRDnlhtE70zQ7ceaXwrV6CGFwoDe3?=
 =?us-ascii?Q?cNEVadVSW9vds45u6nITXUmtqdTIcOAsCdRMwYfFw5npq9BiDxkWvOuhONRf?=
 =?us-ascii?Q?PqRjUOLwYRo90y7HZBkIqBO9hM75OB1T9PpugqAcDHOmLXBFLl41PxlMWznF?=
 =?us-ascii?Q?wZUuwXB1DGuQTE0yfesXrd/+WXJTxrPAuq0/XHo1qbnGf82ik4ULg5igiyph?=
 =?us-ascii?Q?QLBDOBUrC3nuO2W0YcI6I0AwsdTdU1SHVQ8nau/xhdi8+O/UTfhN+GrHKVdv?=
 =?us-ascii?Q?a0Erom39HiBdL1HLYDvCh9NqnmBIh7ij0I3a1/UcksyIyEygRQqg2x/qPiFZ?=
 =?us-ascii?Q?/Zmhecxxp3mHZILOGqUMIfv+lu6sS3p7WQsiaryx6otb+Wo51FC8TDoAeKvk?=
 =?us-ascii?Q?znPjwLJGWwqynXaQYMQu45gyfr8lIGOppEnv476sN5n7cI0KVP73iE1CitYU?=
 =?us-ascii?Q?WWByMOaOdWM7lSda++dUJIeeZ4C+OoHd+peFT4Xafb8H9AIiO2JqHKbM1rdZ?=
 =?us-ascii?Q?7AmpW6voqv99xYjPuhFjQ+I7ZR1GXvH29BIiy3G36Z+NyfW3I0//qHN70Zfj?=
 =?us-ascii?Q?fxUf7TK6zM8/2wC2ccKky7rNYCoOLTHcWE2p0GfvGM9jUfdM8Jy3/sBKpw9K?=
 =?us-ascii?Q?fkFGm8M8GxI7DwUE6Wt5Pc5AhFEd8kFGugmPxodXgArtXBS3my6vHqV926RX?=
 =?us-ascii?Q?Qo4gUedAocDzzemMndtk7He0DxdEPJj92Kp35bgkwXybfAYepWso5DsllnhF?=
 =?us-ascii?Q?nqaynGOVuXRIQZ1MUaGJV8Pq9/0ReBDPEtNuGSg7y8sngrM9arYnj3kALyrD?=
 =?us-ascii?Q?7+NEhfKoRLLGMvwQHBFWzOoSu0/29PzVZjXyDJyroNSP6mPPAHVhU6foGYiI?=
 =?us-ascii?Q?pbD5YIIJn8pvl/cned3jzsT6YkwVWBgL4dblQl/tk65609xp1JRKyLPtltNi?=
 =?us-ascii?Q?THtZ/RYRYAcf92Rm78hJ4N2SQ57UvKvYT6n964rgXIFHsMjUipy8pMuh+ulm?=
 =?us-ascii?Q?L8Fzz/3iPoI0fVktUUsHAnriIB/WgT87JjTdabgEqaGqzr9JTBby/VEg7qqW?=
 =?us-ascii?Q?/VB3aW9c+Qlt3hleE+YRA+GM/Bm/A3RdGqVCrGiatY63lRl4cO/QdBUSUdQa?=
 =?us-ascii?Q?NY2eUPDsSNBPgOgjEdD2ih1iRs0XLM4uXOouDAU1y6pDhwfe0PND6JRRBy3P?=
 =?us-ascii?Q?38riYJWVwgsSOXeTNHslms+IJkD6SP625uUAtNTvDIJhaFdU7Oh/s1lCD2Pc?=
 =?us-ascii?Q?b3YFxzJeiT5+ZWBlClJGYqh48A40AbYvf9ec?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M2u7K6BScDvtCgGg1TzVzwRj5+IXFk55yFvJZyWyx//wyF198WE4j9PdxXge?=
 =?us-ascii?Q?dII1uUn/ejgnOLpiPK9TQGpH9deKIR04wNHgt7IpiV7HrUKVQmnmyrUaAfEZ?=
 =?us-ascii?Q?vGEfNBiOEdosDabLodnB/li1zvbvHEezkQK1qHR3LkGaSfF4tyi0GWKRizWh?=
 =?us-ascii?Q?q7SYVNiBMtSJsi157HCZQKSsVU3oVcM+fTL0A1lVo2hV0cY60K4kAlTNbtHn?=
 =?us-ascii?Q?1mv0KsOfd7PL78419Erzo/HpYfMzlk/ClrxWkXaaD2XrStIGHhBP1foxHAU4?=
 =?us-ascii?Q?nu5AKr9yz1YgZl9/vjQeawbGbl+fisfXq8vzs7qaBHMkPQ/LHdO13oFgwwVe?=
 =?us-ascii?Q?x3H2HotIZ0I/n8wOdSWSOoNG/neby1xigd8fXp3FyFWXJpPMkw26sWtGAKMy?=
 =?us-ascii?Q?ppQQEY7RQGS48D17RyOwQnOyMg2+mVWxYIC+EFHpLZLSiaNnr6vH4L7QNvX0?=
 =?us-ascii?Q?aq/2v3tTB2R0NNsnW0gY4nxPcXwLs/Zj4kAbzWIoCORDBj71AtYSZhKRpiYS?=
 =?us-ascii?Q?NOoabIB85MgAUmMwjp49JWZrXaReuGG1jwRsuNtCb4TpO9XQTN1kxnJdj4++?=
 =?us-ascii?Q?eOZIMqo8GSOeA8sG9tg0rcdJMtZrE22CfZuu0PCIFcUwqs6hkH6lOkI/4XOC?=
 =?us-ascii?Q?lhiRzyjw39a7W5l9WugbxWDu/V0L2RfH1Vk0FGyKAn9x7s40gXbqPfYiH12Y?=
 =?us-ascii?Q?cqGEetZ9EZCVLHN65FEb4C2azNOeTrDSmRJrutGlF3p5wMgF48Gk9isE/WoD?=
 =?us-ascii?Q?mIuCz8s7KjQOJIikpgT++C84IMPlUkbYqOjJuM//ruJ6goUZYpjjsaZrrtuK?=
 =?us-ascii?Q?rDN5PSKSeQTG0E3Rkg+CzXJRWxD7202+i2m/eJz8esNIqccd6Ubi7nk3bx8C?=
 =?us-ascii?Q?NAi92WXYKgl2PvRzMI8KIe3gdNG9g2aJ+AlT1Qu3iVg6lfq1fo1Tj9lYvJPD?=
 =?us-ascii?Q?/HwbcOyE9K5LokLrUQPsc9GxE+0FDp1twPqMh2yaa531kA0rSdSqmnPhHlx8?=
 =?us-ascii?Q?LcFYgUTLlCReWjTDCgjZ80FttM8MLCPzsgRWs74GJDveCsQqIFNAYLco1iC9?=
 =?us-ascii?Q?pybnmF6+IpsdAcZWirpfE0kzq7sf+w4HzRYHepRw02gGhvm3eh/bQkACeS+o?=
 =?us-ascii?Q?RUMnsoEwXcY/cKFp62zoyhDrXJuKeTarkqt385eoH1hCBrQD2c83Mj94vnRH?=
 =?us-ascii?Q?Iwqj2J8lfWwIvpUzSw9YERxB4wvqrvWtCk9vIXLyitj9HU8e8rnlVHB3yiYa?=
 =?us-ascii?Q?YLgO3dXo4KKn2CH6yYdP9qkd83/9J230hTnE/tIHGyoX1FWDHVviTbhF+pYd?=
 =?us-ascii?Q?/pvgRZCsvxUhGzkjwn0as4HMGY/KWe4OaGEXzvCGGdUdM+4ID6VFu2V2eI2U?=
 =?us-ascii?Q?k9ESOCghqK6gDHPOLMkpwN8IZzcWnZgSD25fCvXwxNeapU5I37I1HobeIDx0?=
 =?us-ascii?Q?Ya6ypCib2p/sNPzTT2K8sguL7zD0GU/YLzPmNoXsgaBK/uoV/0HpshHAwFjT?=
 =?us-ascii?Q?tzdSsyfKDmwPCFolveRIsWZAeOikgZEr+Yzm71PaVQ0MJ/GajO09Oi0FUddY?=
 =?us-ascii?Q?5gr4ooCkeQ8ZIiEB4GffgspkhSeQRvjSUNwI5Fths7aRexpQ0fCKbD9znlsd?=
 =?us-ascii?Q?YmKUE/ymNHEz1+tgYgyqyUk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68ace78-d042-4258-6188-08de1c8193a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:39:58.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uT7fgiAvA+LoK12FxUcX6/92PPp26FKAxg3IH+rg3glUbksI4nqzOz7WR37YHASUBnZTEPgXAZIufr2wiprdsCWDqK/xvlhIyN+xEU1OMXfRebhwMx7QUOaB2vGpNQ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329

Dear All,

This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
enables it on the RZ/G3E SMARK II board. RZ/G3E has USB2.0 IP that is
identical to the one's found into the RZ/V2H SoC (R9A09G057).

This series apply on top of [1] + [2].

Thanks & Regards,
Tommaso

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1015037
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20250912130911.185674-1-tommaso.merciai.xr@bp.renesas.com/

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (21):
  phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
  phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
  reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device
    lifetime
  dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells'
    property
  mux: Add driver for Renesas RZ/V2H USB VBUS_SEL mux
  reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
  dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
  dt-bindings: phy: renesas,usb2-phy: Document mux-states property
  phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
  phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
  dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
  dt-bindings: reset: Document RZ/G3E USB2PHY reset
  arm64: dts: renesas: r9a09g057: Add USB2.0 VBUS_SEL mux-controller
    support
  arm64: dts: renesas: r9a09g056: Add USB2.0 VBUS_SEL mux-controller
    support
  arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator
    node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS
    support
  arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator
    node
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2 PHY0 VBUS
    support
  arm64: dts: renesas: r9a09g047: Add USB2.0 support
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

 .../bindings/phy/renesas,usb2-phy.yaml        |  16 +-
 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   9 +-
 .../bindings/usb/renesas,usbhs.yaml           |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 125 +++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  49 ++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   7 +
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   5 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   9 +
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   5 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  23 ++
 drivers/mux/Kconfig                           |  10 +
 drivers/mux/Makefile                          |   2 +
 drivers/mux/rzv2h-usb-vbus.c                  |  97 +++++++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 263 ++++++++++++++----
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 129 ++++++---
 include/linux/reset/reset_rzv2h_usb2phy.h     |  15 +
 17 files changed, 669 insertions(+), 97 deletions(-)
 create mode 100644 drivers/mux/rzv2h-usb-vbus.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

-- 
2.43.0


