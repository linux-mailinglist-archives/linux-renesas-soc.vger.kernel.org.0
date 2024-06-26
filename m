Return-Path: <linux-renesas-soc+bounces-6819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED008919B6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 01:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAED2B2242B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 23:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3A01940B1;
	Wed, 26 Jun 2024 23:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="T9v4sH3n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2064.outbound.protection.outlook.com [40.107.113.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBF31940AB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719446010; cv=fail; b=twCWMy/sIhfl3VU6Uuq5LN+Y5+apncUyPJKkbwRW8w337mM7gYl93LfWnz+q8/acPAvCUdCp8XE38tf/uJ/54ke2yjQ0+BpXSiVZF0VxfbSynmvTacidYrQFyLdbqwf2AOOOW6Gd8MQG+StYcxvOiDsQ2yEXdVPo+48bFyj9A8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719446010; c=relaxed/simple;
	bh=UELvRMzZhCpPFGQsrUdHlbyweV4AtqaK34Z3+eoAf8A=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=f3wrH14QXBZP/NTwwo7I8+HyEloJiTRODoA6Ye6PV+CDuw6y1XC/u6SE7CajL4xcNoc8ErSB2fhNfGRE+D961NuFZ/ibU7FV7ketgZW61emzvrAZB8b0yii3TzF3/4pPhs8h+S0zX3avcYGdCdC7xtUEmHMSB7+vFyzTxX3VKQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T9v4sH3n; arc=fail smtp.client-ip=40.107.113.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6oZFSQR/9s7tBpmZkaFwJixIpWSUW+X8zZjibJ7fe7f/IqsGhIx2bQKQpROJYsNrjBW/G732XzE1m6I2TT3Ko0y6qcDQfZ8IYXMpBht9QBklGuuyUA40bwD/47qAb93XXYk2IRXUZSL4UkQkBMgyTljkAGgUwWSbQHzgUZiqA0hX5/+e/aEzDnfnRuIPWArSfiIyA1pcyyrkpaTdA86DiBCIC4inJ6ORiuaM2/msDjnOZEl/xMiCY2oLVp38f7K0L++00WUCVPFj1o3jgFzvXGxY2Eu6vH+U0jxPct+D3MoFE9Pr1LDjjlQ6TqfVF5PqvOXXI8dwx0Gkf/SJh/ZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtiVR/VovDGnBq0tbmD+RP3quAAQRovYTidLR2ABXn8=;
 b=XNQ6v8atOHHKxCGfc8t8xLxvfvRMOtkcsrhSJL1i88WF7szNwS7DxnkfFr/jZgxTuUKSpM68ixm2xtlZfI65AVAPiB+hkLZDrO4+ZxMkASRulxSIGuHN8cjgnnLA/dlmzGH+X9PwxtzrvQiQSP2UgU0Os+c55DdRBbc2ZxsQ0p40AbBfIdqTGpB+xXn++3xLzzOBaPOfBDXS/56GvUQ4dAfk8RxDlcbRiAUWlXOPbkOay7CX++mF/PMqvKfke0oujQy7bSmJyvxUa4fLERlNJj2IoH/IyWpfuHispdJmDdA5EyPOT1vuxinenHUAi6A0S5HRwrJsEAzJdJc8SjzkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtiVR/VovDGnBq0tbmD+RP3quAAQRovYTidLR2ABXn8=;
 b=T9v4sH3nnzhbKRShJRPQTz9Wc7WTME1aSog7drp2RAW/UYHainCfbNFzYNSl8tRnmo8bHe6olUOCc+IQ8pTP44eAy1+PCXgMxMvBjvnjoiwp6sN2tIt15yRgYQVqFBsZVpZntCZgAKSk33ucRQO6UOCPtYNJ5799aWag49bDJbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5882.jpnprd01.prod.outlook.com
 (2603:1096:404:8054::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 23:53:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 23:53:23 +0000
Message-ID: <874j9fqn0s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r8a779h0: R-Car Sound support
In-Reply-To: <CAMuHMdWJGdSHCfGetZz57s+EwPPR7dMFnZ5V9wu=HXztp3NytA@mail.gmail.com>
References: <CAMuHMdWJGdSHCfGetZz57s+EwPPR7dMFnZ5V9wu=HXztp3NytA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Jun 2024 23:53:23 +0000
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe665df-99f8-43c7-d14b-08dc963b2a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LoGVpfzMQwxRvIW8mHwarJScYOz34CeLVndJjd/gSwBo+A6hJJoeR2hsqcEW?=
 =?us-ascii?Q?0eg1JladuUSvBY3mRlsvkwD8utpCh5aMLhuNv0dM3lZGqRD0AGF1zO8ciNCq?=
 =?us-ascii?Q?t+rnuSOKR6StsGmN228Mhy27AN+3Rbn4PeCHflV8PbGQlkk9mDq1HrobSU20?=
 =?us-ascii?Q?6uwWwac0Rs6FHJn+07YBy1qlC2mAufwtatTIMWoOjPof9UBDR5HtDrEYXRv9?=
 =?us-ascii?Q?cMJJdykglC9nS2m+xW25jvhcLo1en1+Grma6pas9h5XXur1pAUnHzYCQVouN?=
 =?us-ascii?Q?AQ+e8zV1h/Xa5n9sRP8le06aGZCJO2AwCl3rXXwbLoR/KW57hubUKsJ5pe+I?=
 =?us-ascii?Q?in+xwAEfhRjuBHRpjFcLUaX83PFEOgyFadYzCRq/gBmPIHlyVpNkY4eG415t?=
 =?us-ascii?Q?1bJuYC0Oee4bICP1iYUj6f5hklicct+OWkom6xdVICX8IDE2ci2lmN7gCONZ?=
 =?us-ascii?Q?jCqt3dyeWw1Sa2rxbvTZyD2965sszMr5IjzXKM60qxbmgYbrKFL6IqAzJRCX?=
 =?us-ascii?Q?KLFCIyYwNNynR/NNSk60uEiNIBQmfMsdrejaSnsIBMdJXD1AEzfd4pt0mtkF?=
 =?us-ascii?Q?KaWOwBKSfPtQq7JB3x1qjhQtTsi3n1vIA8Xhik5uv9ue3mhjxscuHSG/hQX3?=
 =?us-ascii?Q?qgPtRa6BeMtkAXPpb1EbI+TciwRJXAqj68TWY6XUjCGP6H2A43fN5MB3PQxk?=
 =?us-ascii?Q?h5CxomPXai0lPF1+uaqNBfjqhjH522k2/mjM6mvKCtg5OHHmdDiFboWQ7Cnx?=
 =?us-ascii?Q?YbRuuaIPOndZSZK0KgTu3IS/19omYofCizN1KJE4Y+HFxmulIAhIOdF3viBL?=
 =?us-ascii?Q?33jwwkn/BiSV9x5/0mks7PdsEdNhqWimnRrhuklIpEPFlb5S1JF0dXDWr27H?=
 =?us-ascii?Q?qo7rLOXRpmfNKVwmX3sl+qwn4AiHcHtWwNqlwY8XctnGXbkVD6/Frow159DP?=
 =?us-ascii?Q?4y8YuN03h27PGNk9xbfvTIhcLPPBWcgCImkwSM7WrWeWQi/Wg6+1os5M24Oa?=
 =?us-ascii?Q?ExPtRAIqYvA78vgM6hY5xzKOD/09ZNCGe9TZUmy1XxCGyYyQnncGzNktMyOb?=
 =?us-ascii?Q?TndhnvT2yFUQTVfEsILJM5qV2p3Jr//ib20K92Q38D0/zrCo7+VkbJzvoiux?=
 =?us-ascii?Q?NEFnQCCzBkIYSZ3ZdO8htOP/m7+Ig/bPsPeYtgL2SjCUnlqie86PRXm8qWXS?=
 =?us-ascii?Q?CJBpywnNJMJ4AxPL6vDKjrYWyC+LYzyc5YqU1BgSJ1kPejHicrQ0uxeWdXxp?=
 =?us-ascii?Q?m9hSok3iJHtf/xPDYiNHgrjyErW5Opwxm0Uho1kJr8/NmsmdG8pb3yd7RLuo?=
 =?us-ascii?Q?L0BvOYLBTu6Kk3mvQUywqFFHJaBoq41mwJ6e1pTtnHbYOjg5C4nvXBRe2aRm?=
 =?us-ascii?Q?HQAMoRI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7KZWl8Ir4OiR8VtFAfgpl+wkFpyyRfy+fCBogQXPgnVlpV2aaBNLW4V17fog?=
 =?us-ascii?Q?wYH+iOa5wAhmN563/gc5WcZWhtlUzIoolVMmdxn8IOctEh6XRlrnxQueUrW8?=
 =?us-ascii?Q?EiFufKj5AMucKRQAN5s57nF6C17YrxVOsPyY38IqkVhfo6i7yAYN307l6uL+?=
 =?us-ascii?Q?mbtDEjkqb/RbsO9iFSHa0SlOK2czifxwYImlmX6FR2h5y7zl/IqfmsHPIx5I?=
 =?us-ascii?Q?3n9EO/84TqVzOqNaoTGBA5VePwIBjK6NqrkFnrc/K6/ggjR3szSwoqNpMg5R?=
 =?us-ascii?Q?oBmLiaW4hCVU4EQwdogVC7JhW6xhOENgtJByG17Yog+FU31u5zua+ximbv7q?=
 =?us-ascii?Q?P/mQU0/QR+PtPiU+fTA4GIxSt1FMqhS7LDhLo18HiwHJQWu90isdybIZAgOu?=
 =?us-ascii?Q?2N42YzdphW4Erh5DUEvXF6J5zguA0d9BS63/004zTaZdJiHrWCPmX+HIYQ3m?=
 =?us-ascii?Q?VTmdaCewITAMM8Bsiua3NCQfGmpZRkj52SerbR8uPYR/T7pMNziWK8BH09Pl?=
 =?us-ascii?Q?XskVtWN5hoQVs+VP3NEjFFvH1Yu9qKT82NSBRoOR/Zqt9nAE/4xmAvmqr1Mn?=
 =?us-ascii?Q?TcQykh+hfZC5o0vdisD6hyajFO/csibvNFGVfeSXs45gxy+tJ8b4O4zCFLMn?=
 =?us-ascii?Q?/UrzV33NEvr5eaKUkA4wDKhXwCRe86eP8lYYbPrGI8EgjoAq8kiHcGYp12QT?=
 =?us-ascii?Q?V8wKpY6RY2m3kY9RliQFpViAlT4m35jVsFCRtzFkHYssj4f9tgHWNUrAyN8+?=
 =?us-ascii?Q?Clp/S+cHkjk+502OX6JfTIY6npOEDdnGV7wWiB4/cNXhWd8ma6bixGSx3pHQ?=
 =?us-ascii?Q?GDulLxu7w9lm8rzMUGD1CS4aZv8sxWZPa06C4KLbcgKdDjrsmyUOZQuep0/W?=
 =?us-ascii?Q?FwYALrfr1rfYehjUjMa4aKgDu6LLBRsVstuMN3rYdjkQYSnR07MT7Y/fAhcF?=
 =?us-ascii?Q?W0OW8SWfvwelj4bXaJiJSVD+KYDcyJJbSiM2gOJLRJY6yfrnrqS0lEpDaLM1?=
 =?us-ascii?Q?x3arDujKy6TGiyqvmcKmGAXjGcx9DrYQHhrJtrKk5fliNEz2FmHMkPLAZU7A?=
 =?us-ascii?Q?S5i+2sfkO7Hyn5NjKNbhw7NLA3KOMXKXfdav08hn6IpiiCkRDSzhNdE9Qsws?=
 =?us-ascii?Q?1jNrv4DFcCXhi2K0MDvGBD7jbyvGIWoiQfz0nBbmBm3s/tnBHZ7yxvXVoF/v?=
 =?us-ascii?Q?MmhoMSTqzHsIMmj48s+uIBmRpcbk0JMZfh7ndAQQeU5xg1gwP0BKeZ8UkdJW?=
 =?us-ascii?Q?Ug6HbP4OelESNhkTg7FkrRmmhv6skeQQ4Aetl+XtYBnR67hYAgLPZTLtIq7E?=
 =?us-ascii?Q?3Ymap+9JqU2czD5+zQCnjQ55ivcEvbsiBYnXTgwTDX8jJHn8IsYGhGrV8pMO?=
 =?us-ascii?Q?a62SxmIKdMpfgjd7B+K6yI2gFoCZZqBZTGwMPg1t+Bi3rH6vN0mkjlzWWiJE?=
 =?us-ascii?Q?u4U8IYkmsAZKavUc7XhBVZs1gTEOQDbOzwUMBNrFW5kuJfkbWUhxaqnb1jrw?=
 =?us-ascii?Q?jwnl5uFa8n3dG9byT/0G+Zpjnx+GimykYhCiUbQtVmcvACIhnT9SzAV6uq/I?=
 =?us-ascii?Q?iR4XJk0xAFfkZ7/PObvCO5gEdIcIG0vaTzo2z6miAsAD6ahNwf4LEFSJiCBd?=
 =?us-ascii?Q?ERd5s1Mc5i3fdPg+6grDd/s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe665df-99f8-43c7-d14b-08dc963b2a60
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 23:53:23.9017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tY93b5qzNx6bk/YUR17XIrGbDntaaY7xIhRxvW17r6L9T7bUQ6t8q9A2p75VIJJwM17ArKlSefIIqSBkAdpSrR+F3qMR4bPGcqbyKJ3FHq62jiVSYp9kSJY63AWbehxa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5882


Hi Geert

Thank you for reviewing

> > Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> The Sob-chain does not match the From:.
> 
> Either there should be a "From: Khanh Le ..." at the top, or
> a "Co-developed-by: Khanh Le ..." before the "Signed-off-by: Khanh Le ...".
(snip)
> If you tell me the correct author-chain, I can make these changes
> while queuing in renesas-devel for v6.11.

The original code which written by Khanh was for old kernel,
and based on BSP kernel, not upstream kernel. I have adjusted it to
upstream code, so

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[Kuninori: adjusted to latest upstream kernel]

Co-developed-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto

