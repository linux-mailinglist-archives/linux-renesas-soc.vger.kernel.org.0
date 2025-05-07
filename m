Return-Path: <linux-renesas-soc+bounces-16732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C02AAD343
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 04:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E2864C815A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 02:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11208347D5;
	Wed,  7 May 2025 02:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DVRKRkmZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B509DBA38
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 02:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746584698; cv=fail; b=t0t2MZrcYz1R3POTeXNGGaMqiLSTBCfW7HnzXepQINhZwTBABovAB8hXb79DaKXvxm/IpeDgGNQnwcE4/SIitPopJVKtD+CcfcOULkQzZeq2kOqiL5T4XSHYaNTds4cypTNYi3Wi4f6Bj4MHQT2XXiBlM5SIQB2MRx87+IE0pKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746584698; c=relaxed/simple;
	bh=Nv+xi5KYEJlkB757XTIzLjYOzGsHMOTgwL2rgaciaOE=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=qTz1Vc6HHv7DGIpYRLd58iG0EIaTGHUMmIKzhFmtinaEXYUH8W3YVrrPpBNFXkfCNJwf9sL2lzbyQu/P/PJE2e7DH21m7brFP16yLC9VWdONu2WqojtQOfJhBSO2j3I0wmF61PZykMDzJkfLyg0o+UCcgd4fYpLG3tD3fLy/9h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DVRKRkmZ; arc=fail smtp.client-ip=52.101.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxkLAD3GkbT3VSaXZLbr1QcVXceUy06DdWZtfrUCCtGkPyHCt0hrVWAeUu03TN5c6vIAUHy4rflenhvqHBEtL3BWbHzZi+r1tK68xPb00wEJz9G7iJBsDVUHulam0bx7xVgSB8ZjJ13OZH5AFSn0sk50Szz/ABbRkEtN5btZtdu4wxVil7UMZZK5B24M9ZMJxR4LsW1QwHbLbgGqbkX7SxdaFelV2gCezosaGnMx2LndYn9H8yaiKLw3ES+h60qdFeS+AVx9SQndClw9O/7ipyG3I2wCKHP9mxvHRLeEvZiuZKpDxPECJRGb1SCNcoXkTBpTwSyGxPQIujv9okPmEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulgb8w6uDNJBL6E4kc1MrkDBP3xyNGJ1Suh6mLidXn8=;
 b=yBy+O6/089qdcBgHvtyCo2/jb/ulKx77C2uaLfzO2NcjX70vS3Vvb3keDz5h1BtjMv4SjfvDWP7Z5saXuE+zoiuKuPJf6mjTC+42Spc3+XuJk4VOCXV8hghQyPqkdr2xUqn4xkb+M0n6zHarD9XmilAYa9hLjfD2yysEVV2ZRo7uF1S5ZIJEYmLNZT7Zr4NjmOeyTCwrVvea0PjaEvBbfxZAa+H/HxSG9LsMaDQsaIfCj5cpwywfnm2c2Gv4vHoZlFF1Km6tM2Q3yoEp2uelfvWUm1zOseGOkptqljslEyrAdknavk21ELUh+HW7BjEHwIqdD7ZYw1EnZmJwNEC8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulgb8w6uDNJBL6E4kc1MrkDBP3xyNGJ1Suh6mLidXn8=;
 b=DVRKRkmZ3fCTqhxedInTuSGFEwwZ/sT9GxV8sKaLl+mB/0ETEUftoZLHKwbi5P5l11qRDpNuKqYVmEZBxoa3sNT9OEC2fnSYYdNg9pomx9CrlhAH8zqsW0giEvrbcPyTudeXzBzL9Pd9xugdIMk0TPpZrvVv3al4B/tb89QWtl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6775.jpnprd01.prod.outlook.com
 (2603:1096:604:12a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Wed, 7 May
 2025 02:24:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%7]) with mapi id 15.20.8699.024; Wed, 7 May 2025
 02:24:51 +0000
Message-ID: <874ixxcg3w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: tidyup MSIOF Sound setting samples
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 May 2025 02:24:51 +0000
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f1af70-fbfa-411c-78f6-08dd8d0e58ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RKNHgKltfR9QNBznAg7FEzvHqqm+IwIZJ0RQ6CHBobYD4kB5bNR04/50LMK6?=
 =?us-ascii?Q?TrVxhYsO12chjsR0U/jvvB0SDz3peo0PkKnt2IiHh210J+y/V5vXfZ5tVKPD?=
 =?us-ascii?Q?cmb6h2xt/RWA6FPuwLJObUFgE7Y6E6QFDbO/j7gwwT40zvWnUHj3faX+f/SN?=
 =?us-ascii?Q?Ju5RWPPWgGrT5fTX1tppCcVeyeCJ5rPz/B2imj3U9P8Ac+oTzyFqGpDnK/bS?=
 =?us-ascii?Q?y9KfOU0fyLumHXhE1hNGVt67r30vLAGf/jJ0+WhHQOK+Jh8MKwdAlBqhC3jl?=
 =?us-ascii?Q?hgVRDZeK45zxisEYoxG5QpoBwgI9Hmhntqj9uU3ZONu48Lt+qBNSBhGA4YXT?=
 =?us-ascii?Q?yDJcDoxcQ1KIAiid61NmG7HBISGwlENzviQhw8HC5mwDG4Ra//arA6ZWPz9d?=
 =?us-ascii?Q?04h48AFPNvmfwPujY0yYPqp06hCzcWPLUj2Y37TZa22pYkgNCuVQ58FL59Y3?=
 =?us-ascii?Q?03U9JpOiKJJKCVTXpI3eNc/LS/hYB72WJltsnyi8+3fyd6i1rNFJ3VIK2zYR?=
 =?us-ascii?Q?yVWWJkt5voXt2yljdkFXiu1/96NflTmA2ME/9NUNEqPapigx9PrKg3+PaLv8?=
 =?us-ascii?Q?GYDjb1Mm8jASlJl274NDIHemYiJnCqDr2vPDbybtZOkHATBYynyJWjwav5wR?=
 =?us-ascii?Q?HsmsS4HO8o8Rvq+ZUv27KLFUtSU3b0c4PLwaZKMBWpb60tSy0PveQnG+KZrA?=
 =?us-ascii?Q?sXFooqKKxTEsUu2CRHgUAFOqOg+YBzOzKahoviCGdiX9ec3iRAjY/n4sTbmh?=
 =?us-ascii?Q?v2yRQxQr7fiv2917I55Gu/Sitav1CVQz6M3XWWJWEa0xoYFwXNVPD4g/wu6q?=
 =?us-ascii?Q?R41kPDh/9Hh0LsPXQoCDhOBEroi0PDJdld02KUYQflRTjECVFrOx37Fg2SQL?=
 =?us-ascii?Q?mDPkC0MV6bDBbtwAGwdsh6XmqLGz+mdwbVeYTmu4gg5wkBaOeJFI9XvSkZCO?=
 =?us-ascii?Q?v/8ZUd22vLSOTk2HEpEzqT6zmxVlb3lDop+LaCl40aJWjHejXatV+7+4wdnw?=
 =?us-ascii?Q?vOyVSI1AvcU8wtN+dNqevMP2ghyzvqV/8zRQhnSqnHsXGhlR5YLTMvtPr7JW?=
 =?us-ascii?Q?WYSAUxDKxeH/jxZXVzVkxzj5yphxHF6qaI1olNizjWdWbuy1Te8+ddyZy6En?=
 =?us-ascii?Q?718NMh1E18DthsQBVzaAey4Koh2HN1GDD+RgHjPRFdDHkcKvxQ7u5MssrSLV?=
 =?us-ascii?Q?fVPCBdOqeFV1Whq5NxjGP5qxzwCtKYRHCT2NWJUpUWRtxTVU9b3xWNCRgif1?=
 =?us-ascii?Q?Lv0Von2Umbevl53/V/knsZysv0Vksw8OsOQd7wkpFGIOdpo7YgSn79QsprPy?=
 =?us-ascii?Q?Oa4CDwQjYcIOT39jljVFDOlTtpyhcgD3F/tlfZRmfdsB/l+vbWfBz25Iwdxa?=
 =?us-ascii?Q?r35FOLqJbk+Ohh020rxGy/xqSKCmZzUItr9pWlmM4DAqmaqRl4K9qUL8HDfT?=
 =?us-ascii?Q?1cgyjU0nQ4KELQIJHUutAMii+M7eXo28JOCWjnKA1gucfaj35AVDVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9+QWP2ExvwffhLqXEVoaxcwSsda66nu3tCaNUTzNiZBItxfJu1c/25Ar/+P6?=
 =?us-ascii?Q?SU6dYYr8WbFUNS5MGlhekzflqFanKJ/Oi6L5iAAZ9LeOJfrjtckOvj19QCJ9?=
 =?us-ascii?Q?8hIIqX/heO8qPz8+XaiwllRzQ27CDqfLODVH1OQdtCp/DshoPgItVdFZwp6I?=
 =?us-ascii?Q?1Ve6rluEHf0CeA2Ptfk96QRsaVboliKTpi+7uXKYcGi+fUnIErjQAIUp/axr?=
 =?us-ascii?Q?YOmGJsN+Fc/8HKdGpy1HO+Mxwh6e1HvUIfngpRj/EdM6zdoR7at8TEPBVk1/?=
 =?us-ascii?Q?C+pNo5LWe33/H+qe4Dqv5Z4zwFvN+NY7JGnuBCOhZ/FmtkyUXO0Wthwory1w?=
 =?us-ascii?Q?ZxFXIi3Y/PQQCdYTgaz9hcyOzUDWzlNdvrdeOLPvkRtQO9Q/V2L/iSc+tNZI?=
 =?us-ascii?Q?N4NrX6UUlymVcAzUbpi0tp+ufqhAV9RfZVaVVv5sl2RIYrkkw4jyXbWZo6En?=
 =?us-ascii?Q?NvoNVXXFm0Or1h25XO86JbVXXTSCYaA9BRTfhCsqIZ2md8Z9mK2SsjGGSOEW?=
 =?us-ascii?Q?YuM5EJIbJipODKc+RG28No9bcBf4CfvA0mrPhLcaSCMwc5eGqXClQZwEbnFe?=
 =?us-ascii?Q?yV0YFfnhaD2pd4n4mpVTMZsPuuC38iK9fBAD2x6VvxFwe5flEVEQ1nPB/n2X?=
 =?us-ascii?Q?D/c/GHV3qegKxBITMHvnr1Yke0IE5iGhWtf07VcH95N3fleHGHTc98r20sjG?=
 =?us-ascii?Q?f2d8jPWflFsZMYCcgZvG6/rnggwJio68OOBO8RJqI68O/kjJalr+0/dvwbSa?=
 =?us-ascii?Q?d9+wxg16Tvh0qQivpUcL2QG9tae7sIqhlAp++YHN0e+6t1hI8UXilY4g4CvI?=
 =?us-ascii?Q?iKz/N4CL9bHVaWJ71MZDjD+D1THxfbR/Hi0QDA6Wyt8wnK43/FqAGj+H02wY?=
 =?us-ascii?Q?DNi+aaA6E/pZ8pSxDHn0LMr6OKkHpxd64Smv2yWYVmvlrZQ7YwAShvFHKHrC?=
 =?us-ascii?Q?c0C6Rygx9b3LIe87amJotEHyvK5WvxEYYX4LCD0R25dTHASVPD+mWPtY2T0x?=
 =?us-ascii?Q?nUa6PxiLAALbzmLKJz4QzMheEClv+DqozLESHY/5YJS1Xwteyjw1FZloKlxO?=
 =?us-ascii?Q?rfpHlzxvBg7SAIx/O9VmmUeA7obhQB07vBX7cZCW2YHOI7GZKg0pFax1bE1a?=
 =?us-ascii?Q?gkBSpBskNnaTtPlDBBWTQe6XkcsACXTM5KxO6rY291m3vB7X5kUAxDJuLidf?=
 =?us-ascii?Q?nD9254pWQ+ajSw1OEHvl4f79oUWIS8TJzNnAFTF2Dy6oPG0ENqPYBenlmSAS?=
 =?us-ascii?Q?xW8nHsnQAubwBUPRIUythLC7IPLycIS4hf/N10RcL2BCCrY8qHw045g9oZlF?=
 =?us-ascii?Q?TcQFkd9uifK1M4a1eCMqQshKVn+WtJVzPwfiZNBdMrNYw2Bp3a9RGofIOeAf?=
 =?us-ascii?Q?xPbBcL+wVCbKXfRG33UkBKFsJEjMsjYohrpwMikyJvchDWyH5jEedaLgb2+n?=
 =?us-ascii?Q?BfrROFo+6K8HSFVqff+LjR4Efg2wXvZQdzVf+j/5oy0o9W0zzlic6fEJEDx6?=
 =?us-ascii?Q?zT8fyNsQymO5gnuqsiCWJuC2r0y1JZMy5MczmfAjrY/2I6w/4r+xkBdRb5MD?=
 =?us-ascii?Q?oXm7ETFgrvF5vjdq+8Bfeq2Xyp2GmxvyrG2E8JIa1eiIceQwv6oFSeq4MXv0?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f1af70-fbfa-411c-78f6-08dd8d0e58ae
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 02:24:51.5735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mu7Axf6xRKNQYfLzdXM/YDccPr8yci0z/5SfZU0fmcB0hzkDoii8+Gdb8WlYCAc/djlFj8CAxXQCd+g2Q2/GOZSYXzzkUM0o/7/tlYkwcUN6u70Lt0fQyYeWP5QP1+GL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6775

Sparrow Hawk has Headset (CONN3) AUX_IN (CONN4) for Sound input/output
which is using MSIOF. It needs DA7212 codec setting to use it, and
is difficult to understand for beginner. Let me explain a little more
in detail.

Suggested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index e3684ecc3e04d..6955eafd8d6ab 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -12,20 +12,28 @@
  *	> amixer set "Headphone" on
  *	> amixer set "Mixout Left DAC Left"  on
  *	> amixer set "Mixout Right DAC Right" on
+ *	> aplay xxx.wav
  *
  * for Capture (Aux/Mic)
- *	> amixer set "Aux" on
- *	> amixer set "Aux" 80%
+ *
+ *		on/off (B)
+ *	CONN3 (HeadSet) ---+----> MSIOF1
+ *			   |
+ *	CONN4 AUX ---------+ on/off (A)
+ *
  *	> amixer set "Mixin PGA" on
  *	> amixer set "Mixin PGA" 50%
  *	> amixer set "ADC" on
  *	> amixer set "ADC" 80%
- *	> amixer set "Mixin Left Aux Left" on
- *	> amixer set "Mixin Right Aux Right" on
- *	> amixer set "Mic 1" on
- *	> amixer set "Mic 1" 80%
- *	> amixer set "Mixin Left Mic 1" on
- *	> amixer set "Mixin Right Mic 1" on
+ *	> amixer set "Aux" on				^
+ *	> amixer set "Aux" 80%				| (A)
+ *	> amixer set "Mixin Left Aux Left" on		|
+ *	> amixer set "Mixin Right Aux Right" on		v
+ *	> amixer set "Mic 1" on				^
+ *	> amixer set "Mic 1" 80%			| (B)
+ *	> amixer set "Mixin Left Mic 1" on		|
+ *	> amixer set "Mixin Right Mic 1" on		v
+ *	> arecord -f cd xxx.wav
  */
 
 /dts-v1/;
-- 
2.43.0


