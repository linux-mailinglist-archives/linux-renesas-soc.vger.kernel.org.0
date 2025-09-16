Return-Path: <linux-renesas-soc+bounces-21885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C481B58A2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 02:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB90416FFAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 00:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394F01AC43A;
	Tue, 16 Sep 2025 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KInWUDUG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2064.outbound.protection.outlook.com [40.107.114.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5458EFC1D;
	Tue, 16 Sep 2025 00:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757983954; cv=fail; b=h3XrygmVPzBtjcc7OjdRZjNLcMzfpDiwnLZCYxbkQ7PhpEgSNPZFsMDFE/LkBwFeZOGfeCdskImeL1K77BeBYn0wDxZeTEOaE0Uet9oK99fGWt1Twknq24mQBQ30BKmWA7/fMf/Xuq6mDCTsamdTuntAlCvKgna2a4jyB6c5GI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757983954; c=relaxed/simple;
	bh=nGdWZAlrFGzMW1U2jPNEl6l85PzP1oqk8aX896FnL4c=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UxfTzyDDgH2gKqWEuDKkmQDSFRliR0qvTK7/ilrUFc5NgB7HhKHSxynjfetYy5CspSRFRCs3mPz895w5pWdVLxVL2njv1I0ccqBroex/dompgpMVF4DCmqJd1TBGwQhdJQ9ceaeM7vkh5VioYVpwJ7rQKRZn6QYtlaywvSNM/Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KInWUDUG; arc=fail smtp.client-ip=40.107.114.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcTMhdlHfb8zuUAmUWZm8MIa8PzRMTmlB6aMSk/DpoDFIa7uFzuFk4OEzv1Js6NIBwsYO3JBjdSfOPSE8+xGR/uAMQORzBQYRYo18k1AtIfMCSJ2MOIvNJXElq8PhgNvgClaPojBvmo6rQWrf7tdNi7DLGl81tkLfK39mYa4Km6lV0/n/I4wvuatgXM2/1DpJoPlraKcmkEBVTLI2nI0LiQutQVEvVNg4mLTxUDZYIUNGz0uVmYn1UmdCZL4+7IrGQBOpgm7xhi4FbUuwxaP7GDbe/RfhtxsTacdGMihCajSoHezkn/f4oNVRa6gauK+cHvyxm5v/ZUL/wKYo2C7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLP67tq++8rOTOjLZGuOkxEbtytrq3OmVu1YSOp4Zd8=;
 b=atDb4oT8ay7w7SnFjuxBoaR9Q7Gz2ekAX5bJWKp2M5VqTzDNN/5vSWAewh8VELbE6McBnBHLLr/aVLoLuxivshl4e1upROsuRRUKEy7fmYqipDu/QEJ8zVdSJD3YPg/XlyvGrAJ277aUUw7BZFOZusR0jI6GQamMT05qXpeie1TjhdriR8SlrYH3l/kmAtGPuPUj8E3glrA1Ngk6lg733lY23KnNZtjwDJmBQhkZQ9s7qiUCAMVow1rb+lkQTIqIp8D+J/3rDMaHweQsjb7mPILm0SqEALAmaMVVAK4dhz9vwScWASTc/klpTuE0/WCokwZu4qVQeP7lgX5ef/i8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLP67tq++8rOTOjLZGuOkxEbtytrq3OmVu1YSOp4Zd8=;
 b=KInWUDUGkj1ldEqqwDYkCHlLpNBOJqAI3P2jaXj0Rgwiv14xtDrrXRo5BVBPLE+KU279LbkGLPn8quKqdJ11KTL7hgB4FeRcJWophHh94qP2RaaRhkb3Wp4RZS/fNzWoLtv4WxoGgjChMsjvtGhuZLKQ0WxG6l7rh3H4nbIr3gI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14764.jpnprd01.prod.outlook.com
 (2603:1096:405:257::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 00:52:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 00:52:28 +0000
Message-ID: <87wm5zi5h0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
In-Reply-To: <CAMuHMdX3cviP6xHnGP01kRDwuHRrHg0ZpNLV8Mf29MFS1B7S8g@mail.gmail.com>
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
	<87jz27vzec.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdVVV5tY_iwb=Xn6XVY-Ai6spBY70yXhc5VRxwDva8BGng@mail.gmail.com>
	<87jz24fqrg.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdX3cviP6xHnGP01kRDwuHRrHg0ZpNLV8Mf29MFS1B7S8g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Sep 2025 00:52:27 +0000
X-ClientProxiedBy: TYCP286CA0200.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14764:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e7f8a84-6b56-40b4-33e8-08ddf4bb4f0c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TLnFErxdiCUA7NQC8NIApuhhG8RP8DS2PuBKkaziK+ghyW8Awtru9NpQkpbQ?=
 =?us-ascii?Q?xhdahrAYWaahXraxtnKt7gUj0ta7yCcGW3sM/VZxpIx5WKY1Yy+t3UqwWbXI?=
 =?us-ascii?Q?YOrEc6Xe7UabfjCSW3xYaEEGWEgZJYIeltdKPx7v8bL1XicjPq807sr+9PtB?=
 =?us-ascii?Q?JOpAPHsgd2wB8RbHX9qGtRz7ZTEES8t+u1Icxt4qgX5ea0BbH3AaRYZXXEYv?=
 =?us-ascii?Q?omgDGGrvmx0hRJohDeitN7K8wq4dktp82YgHuFI3nQQiDpc9gRZteXkoju90?=
 =?us-ascii?Q?ZE4f+pA0abLux7xqc1h55PsPXlnv8bsI7iHodLSXQdSNGxaWq1Kk2PKTILQq?=
 =?us-ascii?Q?nAprkHbsVF7zn2+/Ahxz/5KWi+EFt3Bbq1xVKV5liomoAsyo+ur5zRShp+Zt?=
 =?us-ascii?Q?5YMGpdD5Z9jyaH1nBSaDK7hT2ziSMUuedHpCVvBU4IbjTO9dES0N09+hNNmM?=
 =?us-ascii?Q?4qzwsPbb4t7bKNji9fbvaAByWPJqaXJVSLYXDmsfsVcO2F5+IDz33ScKb2g6?=
 =?us-ascii?Q?+Fn6ctRnVDEGd8YOfmpgj9DRMKOJr0JPB0L17tAHccnHDHfGUem58rDYPE51?=
 =?us-ascii?Q?pwqBGOEt6RIx8GfTruSynHbMvQBuOXkXgLtLweJ0IV02+pK3Wuq3a1bNwVe8?=
 =?us-ascii?Q?5aOOfZm6bhAOjNXR1J4XPYLZziwLFAwtmD9T3ZcNZYuows/WA75IcX1QwKmw?=
 =?us-ascii?Q?gwnj6hnpz39D5nr3MyDtK6pHW0hIGHJRfoTl2mJmSnc6pGJ92f7rCCdF1nzF?=
 =?us-ascii?Q?3i84/RzRYIdUchXxie2cwaD8bj+1GaQg1drCa37pWILCCWV8CN+XEna9Knlx?=
 =?us-ascii?Q?SEhwdPep7FX7m4MNI5jLtKPpuJikBVUIKwjGdpZQY12YOIiOhygj6+H050a9?=
 =?us-ascii?Q?W/YbKNWpOg/DZiI8TssXoyQeotV4ufvraYAL4uQ/xi519oOeLMGeclGhLy3T?=
 =?us-ascii?Q?KBvkJuZt/+EjrH+zJz0qEbZ72bsk9+sHNMLE0VRGGV3YjRpg+QfLIof6yUW+?=
 =?us-ascii?Q?TUvClrCWxoKSW2lMz//W9Eae0wwmW34XuUTEXoFdGfxD1C0z6cr0vcRX1M34?=
 =?us-ascii?Q?pvhqDrt+gshber1l3HOvwGp6bsHBldSy2op/B7Cf4mSimwKfANbeIDCjQXfV?=
 =?us-ascii?Q?RVDRVlSXVcYfNR/jZ6mm19+R9mpI6qo5zK++r5cySEneagnAz0L8XSD0UnmA?=
 =?us-ascii?Q?jdVKmNshngAxQqAbLDeM9PbjDdr7ML5MCDWxn0vWgpNsUpDYCeWMhT0qtah3?=
 =?us-ascii?Q?wNcgpMJgax4ZeeIWNajQ9+Uqou4uOc9rbDFeSjUBI40CpNTnvBJv6PqL7x9L?=
 =?us-ascii?Q?iua5VRJ31kLZP3+duO+tuZtCpwPHatGNisAuTYFQOUOXnxmGga1cqE57uPPg?=
 =?us-ascii?Q?Vx4Js1I433ke3+WIY5l0NZ1mjD7UlX3XLXOhQR8mQz4VzFn+ibORDO2DGbqs?=
 =?us-ascii?Q?swLGcmu2TLbSUiwFMFWKZOzNCCGPnCHc/ynpGZGyTe9MgNnfSzEBduorfunB?=
 =?us-ascii?Q?DFCoMfDD/L99zKA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qhcEDaICR4fSF7YP6vAI5CR+SEQVBvtz8VjQFILQcGADfd6WlzJi7n3Ca7w5?=
 =?us-ascii?Q?q1Thp6l5QzbGdDESsx/xr6a9bUaamu1DcTrLiWH9wwdEhwCB0I0H1JIx8CaP?=
 =?us-ascii?Q?FRDetM/yFbcK6WhVJ+QzmPJTxyCgoHVu9vGAPvSenfcdTOlKbimfFan8wHoS?=
 =?us-ascii?Q?nYTw6enZw+Zs1dFdqb11xYKQQRp7+yHXn64jZzylUmRjF1RQOk4/4Mwi22pK?=
 =?us-ascii?Q?Pza3HsUAixsdyw4HawB/w37ji4/UxQ6M/qc3Y5ND4jN1z++PDIBoGQcrcFVW?=
 =?us-ascii?Q?8H0Le56+zDTXY/eVPrOCCtxw1fTFkSZiYp739HzLuOcG+N0bgIYCHbthHvWx?=
 =?us-ascii?Q?Ky2ouXjuaw7Fpv+4PKtGNRP+UWXjKZBUC3IYuRyi0p8gBLSAAZeE+KNsvyH5?=
 =?us-ascii?Q?+9kFSsTTRhZMHmqLZE8Wpz2i3EyX/n0v3pVyRpEtgw2gC6k7yK1g6v9O/mi3?=
 =?us-ascii?Q?Lf7sBW9vkksrBVrzPS6iVzvUf473kHvgUf/9N/qcvk46zpqTV/7H6ZaBwDfC?=
 =?us-ascii?Q?1kMTGKpmdITRl5KuIdWvrTBooB6EH3iDTQglsO8LCK8Ik0r9vRCnezjdZQ92?=
 =?us-ascii?Q?FtnBXOE0I6TeSY+D9MCRbhF9zB+Aij39Cgo6EapcdsqO4q9xgXD+sWEiJsOX?=
 =?us-ascii?Q?yEoC3duv/c9OtFLmBjHt23VwewOEk8HW0dwVLKnTjv4Rw1DXTPZWs8efzm02?=
 =?us-ascii?Q?uda0Eb8piH3yJnaIonqT4wRexjheG1I2pXHyHXYPh/Ilgwk8+ZQFCuElqC/w?=
 =?us-ascii?Q?hiMavqxJewcEBGwlPqsAgGeR58tHBByzY18scJxhuYJd2eS8vHIf5xjEMYAK?=
 =?us-ascii?Q?Khl6TfVHnhhccSpZpuIdLhKC2Glw498boms6/Xtp5ptUm8DOZNBk/AAyKllB?=
 =?us-ascii?Q?hveG7b0QojG5tiina7Og15hIIqYaLpVZbjk9KzZql3Rf2ru5uXSdgSTfff02?=
 =?us-ascii?Q?ZVFR9gmTT61suOnKnHdEQ/v8UZRq2GkKG6hIqlKt/RorYUGc/Kh2eW7zZFNE?=
 =?us-ascii?Q?aPj/B2C768EkEAXLwFFpcqZMJehEZ0+xp90gclHBxjVOW90zOrFu1jTQVl66?=
 =?us-ascii?Q?UBK4uTppmx28FjP/519qVsK3Lutb1T2zz7WPMiMsLcdY41zO+Ju7x7+iNdkZ?=
 =?us-ascii?Q?fSKNVU9qRrPTc4oJsz1MtjGo8D+Dxunl9q2weZUgBVe9Ft9mjr7IDmy5wgkq?=
 =?us-ascii?Q?lMu+5gIx8MDkw+COYCDA0oHwOfl2Tcn4BzXxxb/7+SzsyhGyPwEGeiAZ/qcQ?=
 =?us-ascii?Q?NKZzI9DnG4VIzZDTEdbNUBdr5g/VOqlvNXm9dFlCnMJx1k7Z/tCLdCppNtix?=
 =?us-ascii?Q?n6E+DJV3iHclyYZEpv8bYigjh4vaJUkz8rB/IjJr3A/LBaX8VrW6TNQrrHGL?=
 =?us-ascii?Q?ptmui/WzBkiXKnfowNGp8NOq0eFAb2NMJeNzTblwFPEN1OAaL9pUuGs3maeU?=
 =?us-ascii?Q?9DD8vqO2aPWIkhg9Q11XqmsLppbR342EN0WzpcDW/0Ii2qIuoeGcbU8ftWjf?=
 =?us-ascii?Q?Br2F8gqc7k16n31Yf+diXmxIG2aXv6y69+fvz7yrBq5Gd5UK1T9SycRWwtS7?=
 =?us-ascii?Q?0HZh9z5Ok/zBIW/FRzp5xY1036GHbq3ZzwSSDj5omNa+HL/xb5BgFZ/zecsT?=
 =?us-ascii?Q?RH+TRwANTKHZ8VXeCS/3Skw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e7f8a84-6b56-40b4-33e8-08ddf4bb4f0c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 00:52:28.0977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jhu0hJZVwl+cXduJm18BLWS7my8IMAFfrxGMyG7/D4CA6a4NVG093ITL5Nr+JfpZT8NF6jxuT2ZoeN5z0QVPkw+/zQ+UUj7g3i3FkMsdKuGf9LKBvDmtNv87U5Ptmmpg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14764


Hi Geert

> > > > +                       reg = <0 0xc0700000 0 0x40>;
> > > > +                       interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                       clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
> > > > +                       clock-names = "fck", "brg_int", "scif_clk";
> > >
> > > "fck" on SCIF should be (derived from) SGASYNCD16 (66.666 MHz).
> > (snip)
> > > "fck" on HSCIF should be (derived from) SGASYNCD8 (133.33 MHz).
> >
> > In the early phase, there is no clock control support, so assume that
> > the clocks are enabled by default. Therefore, dummy clocks are used.
> > But indeed the naming seems strange. Will use just "dummy-clk".
> 
> I know.  But currently the clock rate for the dummy "fck" clocks does
> not match reality.  As the SCIF driver tries hard to find the best
> clock and divider for the requested transfer rate, it might pick "fck",
> breaking serial communication.
> So please add dummy clocks for SGASYNCD16 and SGASYNCD8, and use them as
> "fck" clocks for SCIF resp. HSCIF.

OK, will fix

> > > According to the DT bindings, "power-domains" and "resets" are missing.
> >
> > Unfortunately, can't use for now. It needs SCP support but is under
> > development. How should I do in this case ? Maybe use dummy device,
> > but can we use it ??
> 
> Just leave them out for now, but be prepared to receive complaints
> from the dtbs_check bots ;-)

OK, but I wonder does these really mandatory (= ) property ?
I'm asking because it works without these...

Thank you for your help !!

Best regards
---
Kuninori Morimoto

