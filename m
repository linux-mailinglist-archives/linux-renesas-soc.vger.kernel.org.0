Return-Path: <linux-renesas-soc+bounces-11425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7743C9F40E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 03:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7869168157
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 02:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691301DA32;
	Tue, 17 Dec 2024 02:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kMwG0b0R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDDA18035;
	Tue, 17 Dec 2024 02:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734403096; cv=fail; b=SklJg/5IRVwA3K84qcHpmPyRNI8PjFyUHzmnGisqgSzPZlvkbfiyOeRpGd36mXHaMSvN42H4MwdV1tKImL655n+ULwm1NUPyfllP8OZ4iTZbNTc6cl9uB/0sd0xrNzu9P+ckcCvRFT0vZB6VBWx4ADG4PsaizThLATDc2d9DSL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734403096; c=relaxed/simple;
	bh=id2sPSpsjuaPxve1vRiTOFaYz+gpSZMrgrLkhoEpbiw=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HQbxh0CoHZ2GedvX00TwC6KgItDPuUTAg2ixI4JtdPvz04rfCLYOspP+0fCrb+ohMSJoH78d9iSAR3bIc+7DkjbADY6XJ3U2xxumNuSGW1c2dJBmwuug42//eHC69y6fZlukdndLV8+Z0xsUqv1kt0wNtZBuixE5q2w9NGFuWVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kMwG0b0R; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REpTzi5BGtsQQkk+JqVHCXwb4EBu3BdbONjUuCSLnXFfJkSK8Yi1RPuqej0jqPlpMr0+PjO7YXT5SKXfYfQMuwJZ8rzBggmxJo4rEFNt0Jw9bDiFS1oBQLcZvWHpP8vSaQGlUApCXcWBXGJagZE5OwTHcywTXksZWerry9Mff1nRkI4N6Fq+WM2NEvUdR7luOGvcEyzW3MisU5qn6Msfke5QfH2ku5k1KGGTh8fhnDu1XQzUkYPChyeTVG9z09makvtHRD8gt3oIuc5b1j/xQ9CN1uBJAKoDvDdhDyOk5/xAbNUmt5KPnRsDJSuFah8mrvFuQMAIxsLLQS6Uq/NmVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/HTXcaz4clSwMnwCojuxcyz17Wd+XkPk7Z5rCpr3F8=;
 b=ez7nDV79zP9G5PbVhH2xnioL0IuDDd3oenjJBHogkMdo9xCobQ2dK785BsPcSQLFqm6Ljd09eFcsbeCX72aurAbQyc9PYwnDdd+ypb8hLNb83KRNOWOEywZEBzxgHRmUL05ZL0gznUCjr7oPqlJCMyTSdY/YrmAYWZQOziESpRZggFJjbqIQBRb65S/5EcAe+C5n/jDw3NOjjIJo9bo6qdH60+YfXIVkq0kLnebgr13MWn/fG2GIxvpDie68KZq4zGTZ1JIIeV3Nn7Q/B3YDSoCyeo+aXhnLvCH2LI8Y2Rd4JupJahZjWlOUG2rb0nwLab7pOGTO+wVy/O7wmR9TDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/HTXcaz4clSwMnwCojuxcyz17Wd+XkPk7Z5rCpr3F8=;
 b=kMwG0b0RTOcJGNl1Rv9B+SKQpA19HSRTt7xSDunTssEQcRVZK0E7i/hDsiXVrdumd/7IASBL2H+P5JUhBmzUSi6QIWTejGOLrZsudlVFffoRYx1codZOTNMXS8LXQUh5pfhHo3D/8GWEoxfDhjxQMcxwF5/0LOROnp3RQz5Mb3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11993.jpnprd01.prod.outlook.com
 (2603:1096:400:376::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 02:38:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 02:38:09 +0000
Message-ID: <87seqnm3u8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-sound@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: rsnd_adg_clk_control() sometimes disables already-disabled clock
In-Reply-To: <CAMuHMdVUKpO2rsia+36BLFFwdMapE8LrYS0duyd0FmrxDvwEfg@mail.gmail.com>
References: <CAMuHMdVUKpO2rsia+36BLFFwdMapE8LrYS0duyd0FmrxDvwEfg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Dec 2024 02:38:09 +0000
X-ClientProxiedBy: TYCP286CA0116.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11993:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa97061-a65b-4c49-a356-08dd1e43d835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?um2LrDK2BIlYIM/h5hp8zq750dIWXHYNUxzwUBoEBFwlKO+1bclLFx1xa8Mn?=
 =?us-ascii?Q?6qdLQFP/1CA8sGPiJwJ47lDtNY2JT4yMsAwWeFdVMasjhK5K/rJLoD9Dnlut?=
 =?us-ascii?Q?7G72vV8GBk9FBBNqIJrgv0qMoXn/XX+QegJZUl8nAR/LUeM20KQR69auSNmT?=
 =?us-ascii?Q?lJ/8ckkwEM7GBbcJ3r0oPOv3gLJEoS2/x6mpUTkalztGuCib1U87HwSgk5j9?=
 =?us-ascii?Q?Xe/R0S7d9Jep6903QxYBORGhmcDlN6QadDeMzny2l0hqVcRyul+TpzdwEdQK?=
 =?us-ascii?Q?8BG40Z9oTQBGkbu2OEWmq3dueb8XyMqQftTm6l2rF32H54sKI4QRj1mYEkz3?=
 =?us-ascii?Q?UxlKbzHKCFJE0J01DkeiIAklqUAQ9RU8YRycnXcwpr4reaCCfu9pfeRNdMou?=
 =?us-ascii?Q?xSWouD90B4D33mCAHO9yoStuYS5VYn+CjscOLLSskBBKnZF+L8fmjzfJDzBb?=
 =?us-ascii?Q?uK+5muYZ2Mc6ixDjy1Ax+Am27xY0fphqvLcyqYoUdU7nVVdoRBBt/Qtps7Y9?=
 =?us-ascii?Q?gPhUHJlpwj+tq0cSlPm7o9CD0D9iKbkxaKx1fuQc7NByS4QyyB6/YvOF604C?=
 =?us-ascii?Q?MvHmvNQnwEjBzLyk2n31LUBqZ6x3PbstLiHSW6HAKszlNARQGSGEgLAOaAfE?=
 =?us-ascii?Q?qxU8hxGQt6WB0tStgACPGX+IZrhoEPr0+RkkTnA0qBchiNOfvtnlYR9FNZDE?=
 =?us-ascii?Q?5F3GJ6QfsxSugPuiQIXr6/BnRxEuhpIV8QNvwbNmKe9uXulkICZ53s6Tlmh1?=
 =?us-ascii?Q?vD/iaG5QTNN/OCrYED1SKVF2aCAcO+mzAr1D4Dda0R9UMedO9WVNAbfBwEhE?=
 =?us-ascii?Q?HDXUd2YLwNpgLlBymmVOOZVT8Wa3pD/WO/3n0dW+53B/UroaJdxH9WSI2gSA?=
 =?us-ascii?Q?g78UMyvIJofYnftSi5KNDGsnFvQ5fwNcantpE4BefPpQGBy3YVKTzUtNnomX?=
 =?us-ascii?Q?/XTSvbuyelulJGRs20yZGLLcC33w8OKbKO8CPLSnKD7dXZ8Jvgc5eazK1/fV?=
 =?us-ascii?Q?HuxdqCeZLeBGa56xmnAJJ5ajqlYXDLv8WypPky4eTIpY95PgzkT9t1UDCZTY?=
 =?us-ascii?Q?kfNOESiFgv6DuO6mnwuruiGePXf1dAPRNmn4yjAvGkHVHlJMj7KHj+dJTlpG?=
 =?us-ascii?Q?Mzo8WX4hE746bVWSATgjFgw4xTCiXIcfCA9B0bq8L50L4GI6p217513WMPy3?=
 =?us-ascii?Q?099AkDqNPsZA4evKV3e8oLI49ZDGCh7aAbO0bAsoU/LIhM2K2eZ2ONg6IbKm?=
 =?us-ascii?Q?umqG02+cagc311vucFKhsOOACvOR7PFbz8IYVJLVllxMJK0HqvWbicjwDPU/?=
 =?us-ascii?Q?sU9l46xOCSzw282OxfdBfQAb04QdK8sYl7DZ5HA/L1llAORWrCXykaopl94W?=
 =?us-ascii?Q?OKH6fq79xyb+1s/UnIzB6LKmp5nDJlWu9zuhxQM0gFTWDl2FHo7aq0qQ+sJx?=
 =?us-ascii?Q?KJhPZ6ZRd/UgaeRVhylQ/StlpBOltx5F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9CA90S36et+kIHJGS5qN3ZTrLEsVjY9lVne7nFSW0neALgZm9NUMVt7QSPkz?=
 =?us-ascii?Q?aKQfp04Ngytpr0doqRas34v2wwV72Q/va8/BytBgJiABaPrK3FnhH2b2rqhp?=
 =?us-ascii?Q?RewXn1Rlc7bq48QmkufaiRKmUn6VTS6SM5PigEWbjJ4MKp7qjb7Ip3A42lD8?=
 =?us-ascii?Q?OyuILlm6e/LQ2q468UjNSY4p0wQFR86mgP5U3ZIUvcdRIMH7cp2Sbf61XGUg?=
 =?us-ascii?Q?pPZGu3fCOkn8HYC50eFdmsCczfO3Be9MOnEhXGhH0d8u4ITTNshl8g9/eYu6?=
 =?us-ascii?Q?aaHCZtl4kR0DGGXJJniiTdRYiTcAgvZk0p5ttLiyjOxV9J7dnen4DiS8pejP?=
 =?us-ascii?Q?B389w+FpfKqTvYinyMTC7HqMI6qB5VQDH/xSsTFahXmJx9S8+JbADG7AC08d?=
 =?us-ascii?Q?xReZwBI/u1bLJmD4UG13Wr2AQH3s6YxfdIyhOh9eEUhRGDEXLa8rbeWpAwVA?=
 =?us-ascii?Q?LSVYqotXr6syt6Yhecch6Dhk3NDobKfCsQVUrY0xBfXK7dFOI5UdrEjYqusc?=
 =?us-ascii?Q?h4triQHG4mSzCbDVbUlg0FVv7dZ3qwyowV4Kex3TYMgvYtgAxBEm91di8Usf?=
 =?us-ascii?Q?4tfRTMcuIRXnMq3VBwSEn6VodfMvTB87vLtQXi1iUWyvWDMd2a9jM2TN3k4L?=
 =?us-ascii?Q?ewA2OnRGIChmXCUubDk/iwV8f+S09Mx8oO9d77jpoKSWAyX0aJnunQVvDsep?=
 =?us-ascii?Q?xL07TBxRSX6VwaPmS0YEPF6JXDNhtM11bBDgKB0u1c1WDwJ3f+C8vZsVut8+?=
 =?us-ascii?Q?PuJYhXHBNED1vOCi2IgP4OcBDkIvQy15gWm8K31Zy5gIp/72dPNVPIMLjgbr?=
 =?us-ascii?Q?CKhvzmBCE8Y8DrjgZZrPTtJIFN3jN7IsRhTA1q5A2TsofMCY+gTQ0p4X3hZA?=
 =?us-ascii?Q?0Ce/DC/xVa07Om66ZR2Emxuuk1zzkTCaGc2OPkVD6e1jyeDhg3tbXL7D7II9?=
 =?us-ascii?Q?3cC1YSpHaDXLGwg9peIKvysxmzm50e2C/MF6/e3X2kyglY7uhXWUSx1NkmkB?=
 =?us-ascii?Q?LqJi4sRyohVyTmSygS1cy5a7T0CmI2Es+T0GP3wzluA7sSrgnXV1ewIWV+8d?=
 =?us-ascii?Q?rABxgBXbyBJ96gv00MOtANw1MLo19njiMf5kP96cRvl2xapakLhWfY2oZoAQ?=
 =?us-ascii?Q?UDxASsvd6AhcIumYSFl8/n6r+6Ys5zsc0Ax30HPieT6iC1wgg0RVmt9VE5ds?=
 =?us-ascii?Q?Om9hhEuGr59Pa8lWX75JM7Sd+3+LUicRgYlqVMtdhFsIvSK+QpO3l5AllyyN?=
 =?us-ascii?Q?E8T/HixdureEa3tjpRjY2ROopW68NC3PTNH+M/vk5bqumxPuVaIz87ExMj5W?=
 =?us-ascii?Q?QUMp5lcHAJ797xUCv8cAi6FWO0rSvKKqAWTbmosCyazlB4BOA5jcP47GAi5V?=
 =?us-ascii?Q?EsF++cTNH3wCxMNm1OAfxx01SbfxObjk3lcUy/BNesBOyUtD1Jj/vjcKetDo?=
 =?us-ascii?Q?RzejjuTgzL3ZnUH2QGgf7ehOcR0gtZAJI1mLtPDw1X1wz2Q6ppV4iqdMqvh5?=
 =?us-ascii?Q?QbOx74xwwru0nKbEj76AsleMQL/Z921wkjf7hIqBNMqVjSjvuRklP/+L40Ox?=
 =?us-ascii?Q?8PVo89P62UtYMvAm/oMwW69iCw+h99NZdeoHE6EQU2v1K5LBEQfXbiZ42GC+?=
 =?us-ascii?Q?gwAXopmP60tPeh/zLNl2rUQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa97061-a65b-4c49-a356-08dd1e43d835
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 02:38:09.6834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rt1vkzMRZIPRimtl4pIAhymdbSgrEust5Ga8FfTdt0pJcAA6xslH/E1n65lzM/YZriq1pDK+UXYH4lNhT3fAxzPI01DcvEOcZ3epLv6gKSSeXbHq5NEKi8E7V6jW3rrA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11993


Hi Geert

Thank you for reporting

>     ------------[ cut here ]------------
>     clk_multiplier already disabled
(snip)
>     ------------[ cut here ]------------
>     clk_multiplier already unprepared
(snip)
> Unfortunately I cannot reproduce it at will.
> The above is from today's renesas-devel release, but my logs indicate
> it happens every few months since at least v6.1.
> So far I have seen it on all Salvator-X(S) variants, but not on any other
> SoCs or boards.

Hmm... I'm not sure why, but according to the log, it seems it calls
clk_disable_unprepare() without calling clk_prepare_enable().
I think "clk_multiplier" means "cs2000" on Salvator-X(S).

Basically, I don't think it can be happen. But current rsnd driver doesn't
check return value of clk_prepare_enable(). So if cs2000 failed clk_enable()
for some reasons, indeed clk_disable_unprepare() might be called without
enabled (It is another issue, though...)

I'm not tesed, but can this patch improve situation ?

If above assumption was correct, the clk WARNING issue itself can be solved,
but sound driver itself will fail to probe...

------------------
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 17 Dec 2024 11:30:46 +0900
Subject: [PATCH] ASoC: rsnd: check rsnd_adg_clk_enable() return value

rsnd_adg_clk_enable() might be failed for some reasons. In such case,
we will get WARNING from clk.c when suspend was used that it try to
disable clk without enabled. Check rsnd_adg_clk_enable() return value.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/adg.c  | 30 ++++++++++++++++++++++++------
 sound/soc/renesas/rcar/core.c |  4 +---
 sound/soc/renesas/rcar/rsnd.h |  2 +-
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 0f190abf00e75..723dcc88af306 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -374,12 +374,12 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate)
 	return 0;
 }
 
-void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
+int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 {
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
 	struct rsnd_mod *adg_mod = rsnd_mod_get(adg);
 	struct clk *clk;
-	int i;
+	int ret = 0, i;
 
 	if (enable) {
 		rsnd_mod_bset(adg_mod, BRGCKR, 0x80770000, adg->ckr);
@@ -389,18 +389,33 @@ void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 
 	for_each_rsnd_clkin(clk, adg, i) {
 		if (enable) {
-			clk_prepare_enable(clk);
+			ret = clk_prepare_enable(clk);
 
 			/*
 			 * We shouldn't use clk_get_rate() under
 			 * atomic context. Let's keep it when
 			 * rsnd_adg_clk_enable() was called
 			 */
-			adg->clkin_rate[i] = clk_get_rate(clk);
+			if (ret < 0)
+				break;
+			else
+				adg->clkin_rate[i] = clk_get_rate(clk);
 		} else {
-			clk_disable_unprepare(clk);
+			if (adg->clkin_rate[i])
+				clk_disable_unprepare(clk);
+
+			adg->clkin_rate[i] = 0;
 		}
 	}
+
+	/*
+	 * rsnd_adg_clk_enable() might return error (_disable() will not).
+	 * We need to rollback in such case
+	 */
+	if (ret < 0)
+		rsnd_adg_clk_disable(priv);
+
+	return ret;
 }
 
 static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
@@ -753,7 +768,10 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	if (ret)
 		return ret;
 
-	rsnd_adg_clk_enable(priv);
+	ret = rsnd_adg_clk_enable(priv);
+	if (ret)
+		return ret;
+
 	rsnd_adg_clk_dbg_info(priv, NULL);
 
 	return 0;
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index e2234928c9e88..d3709fd0409e4 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -2086,9 +2086,7 @@ static int __maybe_unused rsnd_resume(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
-	rsnd_adg_clk_enable(priv);
-
-	return 0;
+	return rsnd_adg_clk_enable(priv);
 }
 
 static const struct dev_pm_ops rsnd_pm_ops = {
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 3c164d8e3b16b..a5f54b65313c4 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -608,7 +608,7 @@ int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *cmd_mod,
 				 struct rsnd_dai_stream *io);
 #define rsnd_adg_clk_enable(priv)	rsnd_adg_clk_control(priv, 1)
 #define rsnd_adg_clk_disable(priv)	rsnd_adg_clk_control(priv, 0)
-void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable);
+int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable);
 void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
 
 /*
-- 
2.43.0



Thank you for your help !!

Best regards
---
Kuninori Morimoto

