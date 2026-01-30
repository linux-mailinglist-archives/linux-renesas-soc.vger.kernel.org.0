Return-Path: <linux-renesas-soc+bounces-27715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGxWAQD5fGmGPgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 19:31:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF15BDBA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 19:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A0B0300E714
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FC137F752;
	Fri, 30 Jan 2026 18:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fJ80aidD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891102EC0A3;
	Fri, 30 Jan 2026 18:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797860; cv=fail; b=r857c5JNOxRg1lFYzJO/0K5S4BB2WQIEoeOBWZtQbp5zot2X/7fNlrg5ljdttGMxZx9NyHdNLNhsg/ZH+oozvOW8eMErdGe4IM0GPtDiLN1qgxCPcTHhjwP3BLS932RBDvTqmNe/d6xKcYE62vbS7rWljTRGFGLDTrLv4lMgHNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797860; c=relaxed/simple;
	bh=cmNCiTXvwbi+IyA0UMDtY4rxbp3ITEXwS//ed0nHkxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IoIUSunKyw0tXKg/07KlGMnh+7QuU5rDUde1fV9IjW47rIExhFT3N3b5cJh7Xt5LawTATcKjziRWStPpx74BKbDAu10nIzf87EHOk32quP3AnP9KefuS0QmNZyXATlcYg8kWRgjy3JAnqrKbNtjyXSS28VdSyfAu6wxig17lnJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fJ80aidD; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ga6ryH7m94VGjcrH3zhFDxlRG0BusUd2RD4WGLtUiv30QFuiMRadenifVow9kkvFMHAPe1DtNSckIZ1SHoM1yMWfI3uo85bmWnESbyvJrEDw0NY9gcYTO2x801RgBc03O89zeNaCsXqDsxIjcB3gqjNSBfNkSxqEcWm0YRW/eAraXpgDYOKd0MrIHhrU6+R7S5zn02t6CpSRQ+nObO/VcOzkQw/Jv5LLJIJriw+7oiD+pLxmrurtZfl+GXCSSTuN3kz6Tmhx9IOz8W6DJu+l3ZUTur1094Ymsw6WJ8CYQKtaJ0eROUFHAH3AGgOl0XPz8mqqXj/1wE9oCuTRj8jkkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEAemltwCIPtUEiKPcf+VuZDmC64ZmRyyurw5vZadTE=;
 b=HPIsKPquoKQyqy7+lM7LEhFMDSHZiNVjtnwf6afI2GAFODlF3UdV3ZV7pnMOsAPmWQb/johLT8r3rp+lR/2242iAduYC5eLwLVV7K2DuhQa557YTZ0/QiHadB3TaS36zKJF4UyuZYK3bA2puvkergLuOAYFcFHqVJCz9F4ibNJziFpDWetZIgwg+l5aqFgGeH1E541PXkkuwHCT+/qLANBea7WdQlrh0az7Z7WVYK4e7PMV4KsVBb3MiUb/zxlYuCuXYXK/KlevgxYjJipjmhWDAynYPzsZI/uDqhsZAoCFnDOTe4q23UG4xCMQm0z6wM7Vkj5g75Nk6+v5B1BLxww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEAemltwCIPtUEiKPcf+VuZDmC64ZmRyyurw5vZadTE=;
 b=fJ80aidDruB6kYpW8h4dhmbbNh8MCewvIloWorS4prDRirzGk3/yBDwMAb4GMArxrbOCwmtVtgZyeAq40jlk76nA4/qaCzv7grPbgIC3a4tJrXWoqeDqPJc1obtLh83HDbsL3IeCfVCKn2LCRC31jr95n2XxWcM+HzQT/qsLbTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:30:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:30:55 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 02/20] clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
Date: Fri, 30 Jan 2026 19:29:54 +0100
Message-ID: <80eddc1f8faff66a6e15415b2be9e92cf87e0502.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15715:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d5e85c-2076-44ed-d570-08de602db480
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?M3Ns5axwxvyMpK5t100/jRBUtSX1BJnRBrp0W4A2RCA1ar7p9bypbv6ndLJJ?=
 =?us-ascii?Q?ZMzKWKcGCt6mGiez1Df+B42QIZaTrv4yVRp7jKBZoWo48zPdiIeNb4okYl7X?=
 =?us-ascii?Q?yhty+vqDRQTYy6Ez+7cnFOIqasY1DMR3UYmie/FqaKVRaj6WkzNVVeQWYky3?=
 =?us-ascii?Q?UGSXhE0mrOL5jU2W+rfSRaFS5rYHpDZKV1bLz+KOpZjZFzFMFeLZbAO5WDSW?=
 =?us-ascii?Q?NL8xTu0u/ix3t9o68FytUkoDfIxxHDNbwMejM5pCxGA/mPMBvU+EdLuInPap?=
 =?us-ascii?Q?gIOUuzTE20NjAKgYkkh+Tgu8WEko789Hp3Sqj+WEetaI96neU3HafWsripYd?=
 =?us-ascii?Q?S7kRmhe0rONzv1s9QEoDM7Gfmk7fvFaC8xviCJlZXUppTy9VZ9/cYsuV+LC1?=
 =?us-ascii?Q?dNGZfto7gQXvD4KPKK/VVNrTN3aVQ2AakvDW3Fu6U2quiXJwMWfSYVSKvQr3?=
 =?us-ascii?Q?PfYQaG1m+PRJF4cCu2A0nSQUzi9QpfOVqt3Pc50xsl0Fqq16T+PuuPnRXXdo?=
 =?us-ascii?Q?bFr0aKH0E+IFfFp7qlfLUePdO0eglFByAAwLfs701H95r3IHUYKc7YnaEekY?=
 =?us-ascii?Q?mSV/zVftO1JCeA3L8vnarLJlwwozgM5m1KhONrW/oydZpjWVbXvtR3ECwHTK?=
 =?us-ascii?Q?6GhWlIi0ucmyVX2T1i4sxIGxe44r5CT5IVIlvuzdXtgBtbzCE3tsrDWl1jhI?=
 =?us-ascii?Q?VCiRgp0x7r8qfhveqSPiXxqgYoPU32x9qOLYdoqM2V3n7tcxkRteYakeAbqE?=
 =?us-ascii?Q?3HiziOrIk6wHJ/CnESAYL4jCpDf0ZTaSTEPdgrUd4/DBFaY3RTEbJyReVa6u?=
 =?us-ascii?Q?3OmstePOcxtK5RoB5AKaIaCI+UQzYp9doUlAgpwbDzfky7MjLI/G9JjmAYN9?=
 =?us-ascii?Q?WVGnzLeE3WfMWqNHuHBcqtHr+2bAuJ2ZMUC1D6CpQiVuXo3h8g0G3x/Thcao?=
 =?us-ascii?Q?hl74GYLBiypg1qVZXa+oWclEJTJhObau3MUfNamDKHcu2H8h1YhZWInyfo+m?=
 =?us-ascii?Q?uYrZsEIt+0/wuvnfiBrP1g++69s8CrGIcSxAd6n2Aq32fl9HGr+X+h/XBQX9?=
 =?us-ascii?Q?1nio56J2FHt1rvMHKjNGsDjJgC8IDOiYXcSB1uwUZrx/CUxIgX5Uri0HcYsj?=
 =?us-ascii?Q?UUHzL1LwZGwH7THdKjPxvTVIj76dKQL5lwpZ3PjVocA5G++wUXe6nMVDERAw?=
 =?us-ascii?Q?7eIwKjqcLTzYj9CudqsRBvCPytId3aHHN66A1FMTZpH6xaKrCEQTt6eqpZbc?=
 =?us-ascii?Q?cUBeDJ73sq4xC+CcsU1SRoLlTkZuoMCZsHa2NI/sq79yjYFs1TQG8oPPeSKf?=
 =?us-ascii?Q?UGEUjD66uXzIi619JSbRJIMry5zIxr0fUdV1qSJHwGQpXZCHrvD9FfY4VY9A?=
 =?us-ascii?Q?a0LcI/He2bx5KwIXtumfIMRtDN6U2pmxOGCPAg0CWCHth9bI+ECRJd19esQN?=
 =?us-ascii?Q?dtWojX2FTVqF6C0H8C1uOTC8zrpEyXeXcezJOIngKqT/8SfMAl8hGL78UCYI?=
 =?us-ascii?Q?r74D8LyZr8CK667qWTnLwJ2g7pSHWDFNjYjxTEjKpuIotaWP5Z9cBHBAntme?=
 =?us-ascii?Q?LmLS1JGqARiqH+hXJ6ybyKMtZ91XqKbMnLZ7M3dyAIf/tH3x8jsSpZa9dZWp?=
 =?us-ascii?Q?idXn4FVFoCeJVUegvmVGo4I=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?sre9BfxuCraHROF1964J1NAOE6Yjc4cgXeGaO1vNlRVDOcIorhg5onrty234?=
 =?us-ascii?Q?a37D0MQWgnBN0a6QgA/XFK91MFO5xC3hfOXhvBcBzwAZ031ffHpKox4Ib0uM?=
 =?us-ascii?Q?Un1Umm1pJBxPncZ1hEa8ua8Lj1JW7UaXnn+i+Jo8+vQnEcW0g4xgiKLjoSi/?=
 =?us-ascii?Q?CecdL+MMEstVhz2r4/jUPP+a6N51P3uS6mWgm1IlLyh/FyFRyOBQcMq/oI1x?=
 =?us-ascii?Q?aWCkPMsfbrR84/7sloq0/dnRB4oKLfsSQxSBUIL2Zlq0a+QFxWLmFWAJzl6J?=
 =?us-ascii?Q?n+XLnpTbq/0Zyw5XvQKdoJnmOmbego00NT/+bp3iB0918/XSfKRzRZ8kEz1r?=
 =?us-ascii?Q?BZht6ZLQRvsBn7z5HE1nJMbB+lII19B+u5Ey0fwsnUIwnwaVa+I67iPBgbdm?=
 =?us-ascii?Q?6COmCbQFH81+MUsjSNqUnu95GUZL3OHq+oO1UUowmB7I7Uy401P5yQ8aA4NU?=
 =?us-ascii?Q?2FVLC4s0qNSESS1c2racirvHWO855sGskYh2WVQhYswKAwS6Emda6XHdVGTF?=
 =?us-ascii?Q?F7vPuFjOKSVd756rEA2pTY/jgg7qxMDGZxXdi//B509Jk7RWVQtAIRIkSEN9?=
 =?us-ascii?Q?A5u4/aFw/Xl1UGSVcITEDVBKmQpN4XppC2YzD+J2Fgt29LEivrqmZVNt90wj?=
 =?us-ascii?Q?LS1yuZXYQ8XYIaylOFi7RtwEAU0dO8ff5/r+dd4oN8EA47YEH1XpBVPQJ/76?=
 =?us-ascii?Q?XSU7lpdJSAbp6QFOWI2tqih18ttsVx6myj8VRFa1tgJyGsOY+Cqn47rIRSoR?=
 =?us-ascii?Q?Ixoke6vkOd69OPBYkyi93xxsZb9OMhJofrb5zPeebHrT6tM+QovqWFJGePz8?=
 =?us-ascii?Q?syyLOsBAmO6k+Q+LQQts+gyBnKOT6U554hM68uizi8YRqmRpV+eKQsRh3nS8?=
 =?us-ascii?Q?elW3sMLefakXM1AIpBv4Boic+U7bzvxCAZfPxReFaX6TEz2zp750yRwc/1rU?=
 =?us-ascii?Q?SE034reMjql46ATXOmBOuTYZoPW2ZagO9917JKSCZDfGlCB8klC8c6Q7ZsT+?=
 =?us-ascii?Q?iD7VNrEra7YE0Z0Oi9CTR6ticGlmVcXTFvCqDVHe48LST2THU0T1xz5g6wyF?=
 =?us-ascii?Q?vLv1h3j5gLe9bS1mLkX5y68OSMzdYREz4EVlRhQrIXMX4TSqEHVzrPlNw6BG?=
 =?us-ascii?Q?5hPbKuz1qrNVoxAPcWUQurA7ygrdXKA2pjcMnW7FMrEzZ1gHxy70fXGO4Dmr?=
 =?us-ascii?Q?yATyo+BVfTl6USTfk9rJ4f4ysObj1qqeW1HUjeXqBrMlYtr52n4d28dVje0F?=
 =?us-ascii?Q?87UOHLAZGvltLqlByfY0HHhVVjiJJ1t5OPv9/KOQafIU3a2Ht3VN4iy3yUO5?=
 =?us-ascii?Q?mvwhhVaeCGYBQRO1pMs1uVT7RNur2Ot4P9lvkq1bRm51q5vt/aj2o1kd7VTG?=
 =?us-ascii?Q?hpE75ajA+MGwL/K3RzEyp2b/tlem/huD71+qDC5g8Q3eYIcZ4EzTXyB7UdGT?=
 =?us-ascii?Q?k5maz3xCUPae7YljhPL7j0dLRd6rj/i5cdiEWXWdBWFHVDvP/qlN5Z5x3X+c?=
 =?us-ascii?Q?Hflpclm+vSVH1UxggWAeRAqsSpfjtPCW0qJucSGkiX/LQiiPlVX5huhRJHBB?=
 =?us-ascii?Q?9KhI/vgz9vCwIyRYRHmXkVgGwIuMAnsYDO9deoG5/bV6Y5m1LdZZjvblVYSF?=
 =?us-ascii?Q?VeWqLPP/JxbXd/EzGFQO9zbYEIawsrYBTdL/RfzcGFYQosMBFJ1O1T/lLarB?=
 =?us-ascii?Q?rzngelnKuoTAEWooypjwNUUDXKC8HfnFuUkitRCQWjzxYYmsHOHeu4U9x9Lz?=
 =?us-ascii?Q?wrsci+XaD6P2Kb3VttQnYBor4ysYmVdL+W1FF3Iu/YdxSIgCRez+?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d5e85c-2076-44ed-d570-08de602db480
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:30:55.4050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgytMEBVp1Y3YvqkjBTlE3Wbdq6bmDn5AO3xeUwH1pkkWyCltquBtJVTroGEwF/Phn0fjlpnjj2iomZnZF2461/pXxOYNtcbo4UgXx2d6JmdqVB63S3Syedb1abV0zYA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15715
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27715-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 5FF15BDBA8
X-Rspamd-Action: no action

Add CLK_PLLETH_LPCLK clock support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

v2->v3:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 1e9896742a06..a73d12d4964a 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -64,6 +64,8 @@ enum clk_ids {
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_GPU,
+	CLK_PLLETH_DIV4_LPCLK,
+	CLK_PLLETH_LPCLK,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -107,6 +109,14 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -171,6 +181,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
 
+	DEF_FIXED(".plleth_div4_lpclk", CLK_PLLETH_DIV4_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
-- 
2.43.0


