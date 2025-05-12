Return-Path: <linux-renesas-soc+bounces-17018-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4BAB47E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 01:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40EB4A1B2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 23:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2956A268685;
	Mon, 12 May 2025 23:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Nm1pxOFx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB4723C4FF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 23:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747092523; cv=fail; b=r5Q1TR1Nnv7d61gDPHnbzbQtS4JpFKXUbdtIhiyYk4Ajb2jD+PWdXystxlMaxkxCbn7nVx8xqZtMV4QggeHlNplhg2zi6Mx9qmlr+Bci46i7p5MQBuya2hhRmgsoOt9JsrAL+PLyBve2NZjn5pesrGd6pDCaL1FuO5I6wiyRXBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747092523; c=relaxed/simple;
	bh=g7fbwDImTT+nixDQTpX7/ceZlhwyQIza9zqop0oRq9E=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nZNVtBrFhHb0fjrgtOvTCk8TxSdQHVEBwgoL3ZKUOPQ+8SIjMSUqfdr/yMxDRHgw4wA98q6R55TWBi6Msfb5z1t4G0BqFfG0VvoeiAENHKjb8G/8tvkkEt3A5+Aecv8nY1/Cc6VMiwUzV1dN22SUlBejZTpVt3eufagvA26BW7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Nm1pxOFx; arc=fail smtp.client-ip=52.101.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdKa+SopaP9vEhKn/M2uV3dQPiiHWuntNpRKJHrDGCWg2vlbu+jzyyAq72XsdTxT6ddj/GFaa5iidf2rvaDQED0JJzjVYKK50F1pBNe4QPXkix4xoOBmQMqwgLjBiOPpKpbYOLLvGsow3Wasc4cyq4NVhhOUkYRijwnezxVEMzKlrf6hIbiotIcInQMHEiTbdHotuEQCcPAyBPoJd7SadOFyGcuspDoVQ4nqZ9MA49n5pG/MPkBQ81hwiETIDg0LUcOwW0Tl8Cikjv8CBvR7DqZ4WP9dJ1gmfjZwhdAGDCcxJ31ltt9nDD6Ou1jSaepDSfPCmGUFWfcy/+ppnjSh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sre+pKJMo66lK7RyXZvMfKP5l8u1MZk8iy5GCVcDtzE=;
 b=rQ4LvFg1JpaUDcmHEdF6PkPGGxCSnVfAFqhDHoPj3iQAP8/xPNdcqKGRt8iSyh/i6h9i8CViJ3IYUewQAFmdhl9fYLseQ5DlE51cJWfKwnQZmDszPJffVs634/b1YPqO6TVzyoH1eSLDE4P89FW1KH/4sPK4Vem6CzPgLXAlIv9NtrSbFQ4O6BamwSUUHW3g/4D62XgzpSQs3P++tggvTbhWf0Pz1q4R1tAZpgYuPo3pmitKkdrrT7GGuTE/kA2FP0gFQ2jv9CTQs3GOxOll510pGgYUFLf759Y7BnZHEjaFgPxvpFbOwUfMa4lhseZkSYlRsYquIKwptCVh8s71bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sre+pKJMo66lK7RyXZvMfKP5l8u1MZk8iy5GCVcDtzE=;
 b=Nm1pxOFxxOIiNooBHHn4iUpOpOXpsKdjjdFnKDxRf9CM9e15+MjDEktTIVuLtDQ6RTPL71tcsLf47+42fHh+32tkftKa7gdLRaLhLi47x1nzdpPTlDgT08P09G6sowiHMCG0KjhVv04PZ0+bF7igAvvxeO9IigmJ6lFZ6VPdr+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15203.jpnprd01.prod.outlook.com
 (2603:1096:604:3bb::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 23:28:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 23:28:37 +0000
Message-ID: <87tt5pe7e2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Rob Herring <robh@kernel.org>,
	Magnus <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Linux-ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Disable dtc spi_bus_bridge check
In-Reply-To: <fbad3581f297d5b95a3b2813bbae7dba25a523fd.1747039399.git.geert+renesas@glider.be>
References: <fbad3581f297d5b95a3b2813bbae7dba25a523fd.1747039399.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 May 2025 23:28:37 +0000
X-ClientProxiedBy: TYCPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15203:EE_
X-MS-Office365-Filtering-Correlation-Id: db96d2a5-1abb-49cb-2496-08dd91acb88e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jzMXs1EYA/lVsnej6YHJ+oPUjbsiq0NOhZ0HDJEUv4FLH4nKuQfSWjR6RjVo?=
 =?us-ascii?Q?bTkuo7/F/8SZVb/+N9s6vBmtLffZuTd5rSHNtNjOBfEaoJSsGocOqr+w+xxb?=
 =?us-ascii?Q?fEhuY7pbmyiOmQGAyHHaQVzQ+XKWTujSjnnLdz0Z8GAS4LWK6NYLXEpb22t7?=
 =?us-ascii?Q?we4L3YIXllOE0MXVM3EhmHqvygGjXW61WzfoITfs1iiwXhQ5P2XIqvXj+cTk?=
 =?us-ascii?Q?GMZUkbCZvagjZBtW7jDr+M/p6sHxi7JTMJ86ONcL7GoWFAod/yn+ryLZfnfR?=
 =?us-ascii?Q?5TCcBa/K9mENpTzV2yyQ6JpxG+8t2St4CWOKVgSIl1CShjpaNm8c4baEgtpZ?=
 =?us-ascii?Q?DOFoD9ryCIbYP7fD1aHLEorL8mlNuximcm95Y6ffQsZ9plMwz4JhsK+sDxfA?=
 =?us-ascii?Q?B3AqvLde7y1d4jSLbOEb2a+jj5xLAfmI+Xik7Ouy55x7OnTKWJc+W53Esdxn?=
 =?us-ascii?Q?s/roar8ocZ1slgi6OwWoBTUn2j1nzb7Jjo0Q8/ViFj2FMMvaU6hGM2lTuE9H?=
 =?us-ascii?Q?L3HHAPAeMpBwQjfkgulMtoiIYvePMfMmkaptVj3HScS7MihXg4Beo6tHZ6ai?=
 =?us-ascii?Q?BUqXjwamI07kdmJxIcoHQtdASb+M3TtRv9JwtkvLLgMTd92UnSXIuq5ynXwH?=
 =?us-ascii?Q?50daC/H24DzoMRf5VrD0+4Dd52TqSx2UTv3Z9YSPLMSjzH+Pmg23HReYGJtv?=
 =?us-ascii?Q?IPsiGuSCaefqh7goL6MdBWOzvmE4ibPHoRhOUG9eSrOw1EnP0y4QNoF7zhM8?=
 =?us-ascii?Q?1JkJHSP5k+h5LtTpTtOfK/p78wIlE1fqhFk0KQ/taEnhgQUubEgZPQfj8S0I?=
 =?us-ascii?Q?Pq4HGIBkTnmDhaFbROD16dSrCvg3R29p09Bn3qxE1M2N2Iv4ej8yE+t1h2bd?=
 =?us-ascii?Q?GSrEGiuKORRspSuXcJxhVxCDEY20ex4B06h7eiYGl6uNrRGwu5s9ItRXHgVQ?=
 =?us-ascii?Q?z1zPa1FRe5yL9fJsEVusSLqvgx4bcTzTsJdw+bUrh9cjV2dcvP57ZZDLOJ+M?=
 =?us-ascii?Q?3PJJ67elZSSFDh1cHgAeinZ3fdkV9G5szOM+TaMSo+KRT1kmuBasOOmSJBF8?=
 =?us-ascii?Q?OQU7sZ4tGlZ+2spKIcfEu2416GIA+Poy6F0ZB8Q4psa4M/oR75X53/RnWFx4?=
 =?us-ascii?Q?MUrXkTuW5qYQIGANgzlyWQEhmQFSuua6/k3S4XLo+xTsM+a+bpolJGow5UPG?=
 =?us-ascii?Q?asqUQCOK/8MJ656c+6HUlBCR086Qvq32Lvs2cr11huOtZ23lpQ54Xp/yjL9m?=
 =?us-ascii?Q?77nKakGyiPWJjRgqGrj051RLsX2qAQ4FR3Po424hOzNEocksjfkEu47ElIpV?=
 =?us-ascii?Q?tHYS2DkHB0CR6PeRhJJJNPzeNbSPxYZNan3pEeuNPruNiYBw86U7DpjNrOjW?=
 =?us-ascii?Q?nGwkgtOuFdFG4UWVrvgE9tm/Gm+qBb08UW5xdprxfH+qAmWG379VXsDhGO7h?=
 =?us-ascii?Q?Gq+k7epZo0Wp4KM06Fhm0oUmhpqWp9hfWqDKYhXJ1vEvYPUsWH0AFjDxqhym?=
 =?us-ascii?Q?Dopqt/UuKQplGRU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x265xeLnIV8e+Iz51nEf+Y/9WHNWTB77O5u0bROWGCm+yrAchDGdWf6RWMZ2?=
 =?us-ascii?Q?iDNa6sfIhLfYU6KXuddciVtSCxS6s4He/0x/cFKQaALcVrYboYjyzBveCRHu?=
 =?us-ascii?Q?0pFWcPhB5bVujNYPgNKoyKi2cT/uflwNen18Z7xYXp/Jl3EKVvLycc4IErxj?=
 =?us-ascii?Q?5pTYwLinDXrFv+D+PRyE5kdZoQmTE+c6jnHVocAlusJamsOxV8Cpnk4IDjjC?=
 =?us-ascii?Q?ohsZdjQJ2escfvckyAPzZldYXAoHhibbe5h8fekYPT1/evkMAhDiNnyj4OzT?=
 =?us-ascii?Q?LbVw8OKO/kohZhK9txodOh7L8D0ZrUSr7enC+2XuOaUGmos6zbjozMNM4V3q?=
 =?us-ascii?Q?Q9RepRMc6JtroFObxL+JJOSlA9AnDCeNFd20YQUJpcsF8hlif35QWQ8ZGccl?=
 =?us-ascii?Q?L0ix2ydT/5gwrOx2BIFqsGRTy+uS++2bkoTe5oODSpOmJcV0nz7A6ZJ+XKAj?=
 =?us-ascii?Q?cEs36jCC7EEJP4BJ9qoKY50kgnsazQut9CeApUxAcAFgCSYR5LzJ2btbwvYi?=
 =?us-ascii?Q?dgbF9mWaCHWVM5AvA/FWW/2gYugk/FBPl06Bop9LFouU+cUgIPrmGKFPmO+L?=
 =?us-ascii?Q?k8G6rQHG6N5cLsLRgDSMZPOPyGMfEwSoHCUezMgm7DgITKl/6XJbdjFMPXii?=
 =?us-ascii?Q?fmSWz3XrcurML3hidTN61sURzCq8hBPHRfHuhV6tRS+SAH0nbLJkK4nPvO9i?=
 =?us-ascii?Q?9CIXBD5/y4PJWxAapZagprXq9TX8z9x9+wiNMVcKEyy97uFzh04uk0ZkSbFy?=
 =?us-ascii?Q?HMKuEDBVP/3jhF2otVxuq0+WmNGYhsUa71o1v0K5aZUcjG50eodAEhiSjJ8U?=
 =?us-ascii?Q?Q99F1Um6NZ8KrtSHRJCS8XcAHrOrEIsJ3293T7uEGFJgqM/Xv/RM/7qRZ56w?=
 =?us-ascii?Q?ehZvYSVMqSv4QZcI4zRDlczt+aLGmGiNnd3UKbgPFmoKJKGNcJzBOhtYA7+e?=
 =?us-ascii?Q?sPdzgkQv7ZaqqrZpj3hhknLd4ByFS6VJaHONaki5u6hFmXeFxRFop36jkEDT?=
 =?us-ascii?Q?geKCRIDPt2PtCeWg5Z0iwl/yAJ81f041Gajo/wzaX77kmeQhmNG2hXhVjCer?=
 =?us-ascii?Q?eeRagjz+O06//6uZMuvcV4O35g0TSIwuAVMVd8ZLmo/X1zPVCR9+JePx8qES?=
 =?us-ascii?Q?U8KTjfM4QI3X0Sa6XpbWXZEpYtnfpKeWX4RgnfCrNLXZ+/vMrD68Zx8+nFgf?=
 =?us-ascii?Q?OuoVaolWLHGchwtCQDp9pAKOsbJSWwBcMjqNQLuXLXI+uuvJpwik9A2VjkNC?=
 =?us-ascii?Q?6RgmJIZosoCZ8UDc9xWqTDqKFP8rGmTKjoOwt9XJrhMPKeObOwq78hJjtwe5?=
 =?us-ascii?Q?iezREFEYnFOtmsuY5uROHr2sEFd1DlDRHXkiTNQBFDFoXhBeLdrm65jvm5FJ?=
 =?us-ascii?Q?upqmE4mN8CPJItoFpulqN0Gk143ySeGG06xWzk6qYTisDIelImXRsIpcz/Nn?=
 =?us-ascii?Q?Ls+r81ID5tIKUKNzniwjx44suZdNLUwMirgKMyMeAlVM4nn+16uzz6083T6S?=
 =?us-ascii?Q?/JwC3mEuBReDeUCucrJ0E+DAZHrtUo18T3RJOIIcwN1sYsTaK+vI1noUUTIm?=
 =?us-ascii?Q?tAU703qFdjOX1nNrqzk7pfThfeOtrKd/ysqHptPmKvMs2St/+PSkWYbC7PQd?=
 =?us-ascii?Q?rVj7gym4Ud/FcpRhjCpQlJs=3D?=
Content-Transfer-Encoding: 7bit
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db96d2a5-1abb-49cb-2496-08dd91acb88e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 23:28:37.4677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZ+JG8A4/sF8xfZKygVdKThc+NNJ+dmwdZB1v7RYTP6PApxcYRip5fGzVbexVXV/AM3QWdkpxHHk98Y7WO2RhTMSKsw05xY9nU5ZFi4qphZg3Aaztvn7KGRZWtH7USZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15203


Hi Geert
To: Mark

> make dtbs:
> 
>     arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
>       also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
>     arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
>       also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
>     arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
> 
> The Sparrow Hawk uses the MSIOF module in I2S mode instead of SPI mode,
> triggering a conflict between the SPI bus bindings and dtc:
>   - Serial engines that can be SPI controllers must use "spi" as their
>     node names,
>   - Dtc assumes nodes named "spi" are always SPI controllers.
> 
> Fix this by disabling this specific warning for this board.
> 
> Fixes: ca764d5321a2cee7 ("arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/20250506192033.77338015@canb.auug.org.au
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
(snip)
> +DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge

Thank you for the patch.

But I still get the same warning. I'm using latest linux-next/master
+ this patch. And run this. Am I missing something ?

	> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml

Best regards
---
Kuninori Morimoto

-- 

