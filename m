Return-Path: <linux-renesas-soc+bounces-21240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17512B4187A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 10:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B7C07A646C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 08:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC8E2EC54A;
	Wed,  3 Sep 2025 08:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KKhJKpD2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76452EBDC8;
	Wed,  3 Sep 2025 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888127; cv=fail; b=iy+K9PSAvEOBWsePGFyqV5sawUFqarzEK2tIRXlfPdSVsMe9ME2oKrsnqKhL2wCVR1Fs47+EykqHLpPfrnEXhXkW51/F1v2Rs+bCaPIQsUaWq87+RhoVTqOBPvZ343wPlg3IJL27FvIeYZbJGSeCWE4CIowgCQ+F3b5E+ndgv0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888127; c=relaxed/simple;
	bh=svuEINQ/OwP0rEIcpfrhEBBvje/erXMJcQ+T5l3Kppw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CgM7xh/AuJhcZRPCRMRFnO99WzAswOSjBGW1csKVSYPCpuO+HCftP1vYVYDjP8Dn3EULxesujI8g+HoGsbMVC9l8OjK3pBHi2tW9j+/j3DWh7+/cwybn2zc5xlXgYq5QnCf/fjFXEAb3ikHeBlml08Lo0Gu/goh1+zRPUtaRB8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KKhJKpD2; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBoUe1aMxqlvgNIxHWbp2naasEWW+whjyZTOkUaekkhbifPiLeiPogTdBatbRn2YD2Fwj6UXqfEFTH3YHchkjSLamnOqrjrjn2kbM51obSKa8ILPoj2sJKmL4gKwPkCdwMWWrl63TRBbWUMbg2AK9F/q3AwcS7i8t0gnFgS8IAQ/nGGvp03EHpp89nRaZYgvjXIkER/kWlRl1rnpx51HlLB1YKKV85tuQYTAlWYzI6CTzAX0PS3oswudO7IxSooFr0B4cqQn1Qp5yRdYW+ejyYrqcuAMVW+9xeZI3Cu/WVaWI9AKjq0kxEaNqzO/TgFP2BT07SnXGFZeO1g0XkkfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KN9OQXINA8N7hwnpoLwYlaZV7iZzNEkVCoPzuNoMes=;
 b=WIbN2PrKvMYE3+7Tr8aKDe/M7i/bZZ8IWAMvIXyBVt3faRAkCNhFnbhVZR5ZuUaZ0gXWDZt4WmZuZGAv3FQnBAihcSirOuE527P5G8CFuUKNN60dfaYWSfH+m/cVZSoZi/hCwanuZu2SpggCyu+ycVxJ3MsDyTOVlgXDfQZ45yI++OxwNdEL2AtlNqSMAdTgDnY25PbKoVn6nQGptsdRV2RSJ2LyjUnueI3n5FzxGuakxTUqFe+hVFPta/MifcKK9WGIivGlQuDqxzEHfmkn4jw5ZCiS232kT2eGRDUYne1ySNtRWuFIkvzZfSGQ4nl135Fz+9YGuKS5qViVXWzUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KN9OQXINA8N7hwnpoLwYlaZV7iZzNEkVCoPzuNoMes=;
 b=KKhJKpD2PhmtjauDyrGHeePWYurYgx+DmmXsCPQxb5+zI2d0/MIaXSBBQU5eORcwmsjzvKj10QOYki3DCWxE7uFQL0Px/Hjme/U664bAaXKfFsrZnujYlt+D3q4KvyP5wWvLIhpnOGYuZ/+Pqcb0lB/DV8Zmfr5pUKnz4/RXJxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8530.jpnprd01.prod.outlook.com (2603:1096:604:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 08:28:41 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 08:28:41 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] clk: renesas: rzv2h: Re-assert reset on deassert timeout
Date: Wed,  3 Sep 2025 10:27:52 +0200
Message-ID: <20250903082757.115778-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250903082757.115778-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f60607-ab8b-46e5-f23e-08ddeac3e315
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CgmvSvtNBPEuwolzx4PLoEhZO+NHEYZ0jhjKKyYZmmmuDci2Nhc7IKhRo7Fa?=
 =?us-ascii?Q?vawbtGVOZJ24cQ9apNfGqMD3D4q2oJLhBwpTCXpMngxxz9GMq8fDrpNHL1lh?=
 =?us-ascii?Q?7xvoRYpCjxS+f/ljNETwXgD6K2tISgaFnjfz009Crqo86ZvYoRHJVOJC6hEZ?=
 =?us-ascii?Q?YGTzrmL/D7Y0ATJNBfe4GObHdNyP6e8LTmLyS2FsSQV+W7TUGYe807W64Smb?=
 =?us-ascii?Q?REnt1MKcbEJO/Z5cmVlal2o7gzIUPcY+Us8IAyq50s1bCrYenYC3hOASkMGH?=
 =?us-ascii?Q?at+3GLjcR2z3+a2m/k8ntAVfQwjFxGPtxrQjqV2WYDezi5C7s3ogSSvyd7vG?=
 =?us-ascii?Q?Tp9ZQo3eb9D2Gx8sgKBqEner6b4MlUgd7bByLIi8urErPGYsXbHNQh/MSPqj?=
 =?us-ascii?Q?uAKMzWDBz4ynecCW+I4sSVrkVSrU97krrEjv0F0/NwCgHGPX+3ZZEjflsXWJ?=
 =?us-ascii?Q?PIHJvYnB/yJmNoSez6OXva0felqvgoz+FJDsmQjoRjSzKrUf3WLi4en7shLF?=
 =?us-ascii?Q?n+d5lkABEDvdfXgdGdsIdFGK9NZJtaIHzPmB38R6ceMGUsqXCQ1TJQKJMXR3?=
 =?us-ascii?Q?Q+UVETOs5+55lDxhZ4EydJE11ZLEzXvE/Y812349OiyRjgmf3spPkvCfJA0h?=
 =?us-ascii?Q?7ijghxFrxMjJtaWk6pZSoWQGZIYZl6T64PUi1/m9h+aFujoV43C8E/jdsNXu?=
 =?us-ascii?Q?7TjAmj0DA0UFCUaO/zqv7wSRr51QCuRp4nbrdm18mfb70zEtUK3azMCdxjkX?=
 =?us-ascii?Q?fE2cIPTITwIi4Zo1WKPsfMPiqxC7K9885fv1/boOd2QiTOmYpVeGDJbyznFE?=
 =?us-ascii?Q?R0/rh1oBQfeQARXKsSgiVJAlpZKRW/tMTgaU6JpFCJNv76I8Mrjshb+WAzOu?=
 =?us-ascii?Q?6d/jWZ17PJ0umDRXfBridyKZBHR+0ErmIzi4gQPGHfBexScujooyzbSffneC?=
 =?us-ascii?Q?zRLHIUNnWEdfpI2Pqcf8AS6SJI4msa4Z26XcLELBiRrue2Xi25XAIXl1vxGa?=
 =?us-ascii?Q?xLWPG2f0rSNFyqzbwOZuoN8D+ApXkAxzlITDUxapD3L+2ZWWlKd0OzGxCGFL?=
 =?us-ascii?Q?LLd/ZVg4pumTaxclfPXAmeF+EjLHV0c1UUYqATyzwjxJWdymUjvrnGuwZGua?=
 =?us-ascii?Q?cg3RDjuqKKH/swLT1D7d2ZrZ5Ys1FrZ1dop+iaa62P2p3EwmAH/yMeWoxAp7?=
 =?us-ascii?Q?fsJqIc/p1IYW34E5LmlBQIldhBJ5Rm/5Vj4zwL3a8FBn+F1mHR96GKWvlAdC?=
 =?us-ascii?Q?YqmHApfn54MTExKjzgxOSCwyi04RVCJOAQz4LduObx8Vg3BawWq0P2PGGVyL?=
 =?us-ascii?Q?J+9g7Ir3hkFyZ+7xScievnMIgv+35j3d1Qh3Sdse9xh36iwaQqJa5kHXMpkB?=
 =?us-ascii?Q?exvnp8rSF3qVYJD9fD63RqXDTsBNJ47m/b6N3yRe1JuS6XkOBOgCg3l+csVQ?=
 =?us-ascii?Q?qiSjWU3DfC01pO8HoK3RMRqDEugF9eFLCWQqUDAnwdU4bKpHGvVUpA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mojCU697peuX4fWb93J1MK89D9yKRdM71dQYCCfR4IJTBuJLyqcq+9zOh+js?=
 =?us-ascii?Q?tCW9DmezvUUkf8vXkqHTmqa6MTClBKvDEIjkUGEPptyihAQqOQTyFncwmHtm?=
 =?us-ascii?Q?8/YjGYw9iFfZqwMg8LRzdJh3hejqIn9N8Dm52Ln0yJH6/txb06nWAjhaJ7mz?=
 =?us-ascii?Q?xxTDeTdxvO/6zSuETx1p5Gn/KjsDslqvMsWqAWvPcnY0p+v+ipDplgNjAhDP?=
 =?us-ascii?Q?hqo2GRT4tImiAHL1VFj96+yLagrdmoVJ0Q5RBV7B8ZLiCXtO8r81O3283C8g?=
 =?us-ascii?Q?j7KyxA3lbiyzTCRxk10Krc8XHyNKFKrPSILSLvPyeiAoOQmCJH12xQEWlJoi?=
 =?us-ascii?Q?XhjxDdWEU+6YFOLI+alijSVqjBUZ5K9V+MsMMF3ox0M0gM5Ly1LKqYc5zBr8?=
 =?us-ascii?Q?/U/VohVnHCFwTK6EaJ7Oiwv8SjKTVSxG6ga5eu9iXMFLzoCIwd2wAs+sAr18?=
 =?us-ascii?Q?wjDEak1iNMvtb+ScRJbDGXthL1Yjq3o1hCkDKfWhRQbUUw0up4vBuTSlHDlz?=
 =?us-ascii?Q?O0O8/mns2XyVLuCStp1kMA4qyTO4ijuA+83W2QOYGrWB+B02QWW7pvnoZsYe?=
 =?us-ascii?Q?NVfSSdPrYz6bNA4iegalMTl4AK49WRz3e35G5PxUYeNToWMskcqIvDw85FWi?=
 =?us-ascii?Q?gj1SmBm4eoVPkpCDyjP9N/EP67qndN5TaMOHyhHztf4b9EQDs/Gd780c9h/s?=
 =?us-ascii?Q?6fhanUNktUHDZl4uZ4uce0b2VpqG3jDUW7BGe6EuRVB5Ca3S/FrRAnEmouYC?=
 =?us-ascii?Q?1DPa+sI50gYmueI8EZxBuxO9dCNBM+pTlXT7SPT6x9XrQCNlJVc7RVNjrlnb?=
 =?us-ascii?Q?jJ32n/+tqVmG/C/ssA9TMj6pZJTngv49Gkve5spcw/HhOd1TRk3WhKg1f7bD?=
 =?us-ascii?Q?rQI7Svxh9jltJL5XKaXIx7v1GuOT84qdR/Um8ocpY72spnSlU/goIS4t4H2N?=
 =?us-ascii?Q?LJTsi4gBP7hOGpucuWihpSK5Gu8VL9UsW3ctOqhiDhfTU0fsqApnEksnCVBk?=
 =?us-ascii?Q?E+llLpLgmYZtpYp5BUyF83CzFYoO/LFQyaLfCHUhJo213yPnb29aAJ8QzLWb?=
 =?us-ascii?Q?X9HE9TQ+wPxbt8ATVWbBA/k1lzY7jReiYJQeQhmENmhdsC+ehl5F4MidJn7Z?=
 =?us-ascii?Q?UCoooujl8wUgBumpZwHNsjUczjCxkNcLrczXyIPjqvuOSCe2M/cPGYH7cL/G?=
 =?us-ascii?Q?tGJGDNpmEPdwHwJ2IpmTbEf4aPqzlvDqQboWr7kZEIbjDO8sFA6afNYy5+CX?=
 =?us-ascii?Q?ggyCh2M95bshNmgaFPf8wlYBv4WHynWcPX24IgYEdYez1zqplu2pUwHp+fcv?=
 =?us-ascii?Q?dNFso/temEX5yETndlP6GYa+4xGv4WltMS7HnTras3olOM6WrzETs6kvw5vx?=
 =?us-ascii?Q?uLuy2Ej05jSekRRMqon9xmPiRipxN2C6QLMHal2qJgTAK3XHMnAIXI0aslnD?=
 =?us-ascii?Q?Twnka0CnD377jYqLnew6Hx+faJrIoiC8kxy+ttbHVmfFH8JbVBi8uyBiiOMY?=
 =?us-ascii?Q?1CXyC9E0ptEnSM947flGDdVWQoZMsTS26FuEA9bupm6s6NSi5Q37j9tChMRQ?=
 =?us-ascii?Q?SMUD1fZgXPbqPBq/vlWmYy86k/hF+tehILBSSQdYOxfZldu22luFC3D9Ahr5?=
 =?us-ascii?Q?t0D4qCgxN2AOMRCVyKA3uZY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f60607-ab8b-46e5-f23e-08ddeac3e315
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 08:28:40.7349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvG71z7iH6EKt1mgFdWC/at6u7zoA9AwUvzWpEnfujyZ9+o4Lq4ZW5YnzJjjZsJTZPGb8th/cHeGf/a96uiMa46mt5+Y4irmLqlqpw+fCQuBZ/G8GZdEh8PPOcnHAU5Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8530

Prevent issues during reset deassertion by re-asserting the reset if a
timeout occurs when trying to deassert. This ensures the reset line is in a
known state and improves reliability for hardware that may not immediately
clear the reset monitor bit.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag
 - Removed dev_warn() in __rzg2l_cpg_assert()

 drivers/clk/renesas/rzv2h-cpg.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 58ccbae0f9046..35c5ff38e231e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -854,6 +854,7 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	u32 mask = BIT(priv->resets[id].reset_bit);
 	u8 monbit = priv->resets[id].mon_bit;
 	u32 value = mask << 16;
+	int ret;
 
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
 		assert ? "assert" : "deassert", id, reg);
@@ -865,9 +866,15 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
 	mask = BIT(monbit);
 
-	return readl_poll_timeout_atomic(priv->base + reg, value,
-					 assert ? (value & mask) : !(value & mask),
-					 10, 200);
+	ret = readl_poll_timeout_atomic(priv->base + reg, value,
+					assert ? (value & mask) : !(value & mask),
+					10, 200);
+	if (ret && !assert) {
+		value = mask << 16;
+		writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
+	}
+
+	return ret;
 }
 
 static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
-- 
2.43.0


