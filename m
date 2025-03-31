Return-Path: <linux-renesas-soc+bounces-15100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B42A75E7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 07:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67D203A511B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 05:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA52715DBBA;
	Mon, 31 Mar 2025 05:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WbgJ0xx2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F1E610C;
	Mon, 31 Mar 2025 05:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743397951; cv=fail; b=LcSz3uGW/dnGokwChkRXgBZ7K/eD+l+oABBmrU/Bc93voU06SB99Gw3lMrmdTs6R84FUivZ6mZfVPE44uPyIrNoXSRxgzlq9KLNZdr81ADB82LI9qCmOn0sRlwZmmslEYhJRpdg+5NJRPCa9Wzds8xsxj3mKv6YuwzKr0nS4C0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743397951; c=relaxed/simple;
	bh=JqrYTP3I8kwf4Q3rtdDMX6UCs/M0PnS482QOCmZ6ukA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KMJQL2YqpoW9WTUBmW5P9Tm3nQYehMM502bCLhJWBhEH6RH+2a6AuPPXwxfYlsFSNySrVtZD1JfF+AYXsYeqByRNhe2TH95q2Ml99Ui40a+JR6F67OtiCFZ3NVNwm7360JRPsUoIRsvbOb8VCyA57b4r85IqYFi/1HCzIq7k49I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WbgJ0xx2; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3jwI6Q5SKXOXwe6FqRwkTFGwt5wuZg1PB5TIjF09Ax+UMor/oIY+QDqSwAFd+1Bq7Qcv0F94tq6HR0MK1pAVQtCCOV01UfbCPc1cTnPlgNanYfpy+CnGQ1QEqQISpXaWE4baPVzcy47ola4p5IkskOBZfC1QPWi3/gqBK+9NWUDF8SrEzLe/cEW5Xm1NTnC39Gy+kyWTi8GCirSkvnxIhXxa12jOa5/jGPGtIbYLXMBTlgS2s5nUcy96jG5mdfo319kv9+Skio6oLURUpyKPoG0tE1Rxr9axm412YWT4UjsEAhqu904KgrWycKxIgeNONNuqgQ88wO+s3fQNB6mlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mj0D/6QqLBw6Xont5RLpDsT+UswfyagSjZZy4If94pI=;
 b=oajMmFd62qulk2efxJQ5hfNKm4pmCmdAOqww1henjColcd+WtwGVv4dLmpQpKSWDO22atQ8YOXvV+hapHZnR0UWjRzlyVgSMN+Iw1v9ekkVqaxEI2L4FkvUDyGdkSGmnQaWO9bgBlbxGuSH1fTfm3WeGc2PNOFApfs0TBAEqthbJUiUBSJBZQM52zlLIxsYXbZrtz+7Ma1E5ps0Qp7rM6+KtUaKdrC6uXWcWCisA1I9t9KIHOTtqgKQjLdNF6YSYGmn7SzDDiymvFbgKX6GTP2ftec/TeYjQzAG8kRUiofMPJ+5b/B7iImHmWAFE4rEmrJ1BDLGgtcJ5G0JDifunYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mj0D/6QqLBw6Xont5RLpDsT+UswfyagSjZZy4If94pI=;
 b=WbgJ0xx2537BBbNyD99108EbZ7VbTHyNNqFMQMA5fOKF4nCzOAyE+nEGP5AhucBIL2Lg12pNFByX7njYxQvFJkKSca3EOtJvaP+MuTrpYz4G6T1QfDcAO7ftET+0N8VYTFyqfQkNM5fujHzhgz6Z0md+y8IPGsFPJ9HNooDukhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14769.jpnprd01.prod.outlook.com
 (2603:1096:405:25d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 05:12:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8583.033; Mon, 31 Mar 2025
 05:12:26 +0000
Message-ID: <87r02dzsue.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Niklas =?ISO-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Conor
 Dooley <conor+dt@kernel.org>,	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Fix graph_child_address warnings from capture pipeline
In-Reply-To: <20250109150327.GA3352888-robh@kernel.org>
References: <20241016134819.1434340-1-niklas.soderlund+renesas@ragnatech.se>
	<20241209153536.GA74826@ragnatech.se>
	<20250109150327.GA3352888-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Mar 2025 05:12:26 +0000
X-ClientProxiedBy: TY2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:404:42::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14769:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b1596a-550d-4554-53e8-08dd7012a083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NJhSrUIkY66Cl4qb9NqGVS91zDq/3ctvJ0t3rvsyG6Qm5qCAC+/Pdb24bQ7a?=
 =?us-ascii?Q?BpRqp2ZaezmgzDr9vMwebmHVbNFpskIADQuHsqKPhdGk7E39+kgetz2gjsBU?=
 =?us-ascii?Q?rYaIKjIU/nwpL08TO82pfVY8ntWE6QNJgb6cHozH9MAkSG6RLAcl0dbh3m3D?=
 =?us-ascii?Q?Urwc3OX9WHj4Ck6CISzJDa4BkHdXT6F1QQRWu5hbwnk4BJZrAxfw6SYp8L+A?=
 =?us-ascii?Q?VsgHxS0M0w+NjmM3NWKsHPrM7MUaQsATnBEarvvWPC60E3xME8Xd+aNY4ojP?=
 =?us-ascii?Q?bzBSKoj1DUcYTW+1y+doda/ac6gi3GIn0J+Vd0zMeOEXFS34Lf+pRKRueR1I?=
 =?us-ascii?Q?exSj35IJLUlAHXB5vySVvoYb8Db1BQnfjJW6/hDs2YN9hzynkQ+YctLDZdhP?=
 =?us-ascii?Q?9iIqORMTucYA2d47CBxD5LaaykoqkyOoXb/qQNs7S558TXhdImRRHoOZYKmh?=
 =?us-ascii?Q?DyvJuoy3egWXvGkqzQI7DytQIXHTol9da2Fu17RSzj4PuYuIBQw37JmeB8nT?=
 =?us-ascii?Q?Hh9LHyH7LfL5SwDJBTiKGutRamcqXAqmsl7yZ4yIwGpLY0KtU+0tYiLVv970?=
 =?us-ascii?Q?wIhKTH0PQ49Z0sNRGh0BjNbTDnfTOrkyCq8iLpnkJQnNTPDaEQl2EfwVn9po?=
 =?us-ascii?Q?k9Q/RKpfjC3JrBXqJyy1AD2XH4Fnk4qyXdCq06izTEL+gWqS6V780l3Z83Jd?=
 =?us-ascii?Q?FiSMlQFyyohJQF0UuUV86J24K0szTR3T1oLkDP7DmEJvLkn1+8za6vP516sO?=
 =?us-ascii?Q?lX8Wj/F4wY56rIwhiRxfuJL/64mIxT4ZHIJdIQMg3AzSPojKDAmcoQP58/OU?=
 =?us-ascii?Q?/2pAykNzfxQo9k5NEnArMFozdMQLmVLIHmLF2eOglqbZNvkgvOAENDzH/nVY?=
 =?us-ascii?Q?yz/R9cYiomzY1aoDQUT/zMI6aQ5EhbD2s75rGcEtFKCbuJfTbkIIJu5mBjFG?=
 =?us-ascii?Q?utfOAhcct1lzemGqM0tO6x9izOazX5OO/tVxCzh0RjogC/jxaZgbRHx3KUXR?=
 =?us-ascii?Q?1BLNkrh6oBERjrd7MieJafJ5R8ietVG7oxZeqj5IifJkfuWBZnmdVeywxX7R?=
 =?us-ascii?Q?bjvhwbMKzwU8pYWiz0MgiR3C0udDwwPQKiPKlp3jhZddJLO3SlE7UU57LO1i?=
 =?us-ascii?Q?+UGsmrFKWi9feTllM7zjZ2UXhqJGDQaQK87CBSohiUBcmeHieSMNA2UZH6dZ?=
 =?us-ascii?Q?QmfwYJFhCa1iuvDP1WFgeI1LX1G9Yb03EUhivvXih9QsgJDrkVjuH8WX1f78?=
 =?us-ascii?Q?YnKSfWsl9o188cT+k4cR8qwe72GJHY68ugIhUAoAfXpUEQC9LzZkv5EPgDMG?=
 =?us-ascii?Q?XKuCqCfE8lKRp96LjkO0yDyDNh5nY4RuBZfcOGVnDVT3oW3rST4mqj5racl+?=
 =?us-ascii?Q?t2z3AxOVdF43kuxDdQcI0Hgq+XnZueGm/Z+Jr2RRp86tMDiOfW2i0sgYLOZ/?=
 =?us-ascii?Q?ubvfWMFURuFCsTiefjR1KeORm+PMg9TQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i7XrWQjL8IHQPgYm8QB9MELmfhjrgQqnlnpicFELErazjpM1cM5LpjaTyJO7?=
 =?us-ascii?Q?5zDr97UB0DZwOMoteSkQHpk/pdCo/8ryXRJXqGY+jiqmiigy2oVUKaUmr3Cn?=
 =?us-ascii?Q?nmLa1BXsKDDLHF7o8lP6EeS8E8A/qnvCDfzYzee0QKb/vzesDLhiP4KjwS3F?=
 =?us-ascii?Q?ykSPpT4jK+NM1McLzSrJEJX6Ze15ftdumHqPt1jYj2E4QMgI2UBW0fGB4fnx?=
 =?us-ascii?Q?r6nndH0XcERDlFceVGRPyNrQHRJU5buBSD0Hyb7LEDqzgNUrQZaQYXexFDys?=
 =?us-ascii?Q?q4l54y6UOmZMY+PQ9JMcLbS4yzhhPFXtLzu7+GWNe33LGEcEuqR25lur/icd?=
 =?us-ascii?Q?G0DhaI6Inr2qVJwltEmITZBMMogxHg7/YfRE0mbDdyul+x9vXx93/psIdMLU?=
 =?us-ascii?Q?f8g05PHO48mbRTsEWUP91TqcqYDRDKsTOQrbXHVYTdXo4mBhoQkwOBeGqxyf?=
 =?us-ascii?Q?KXZti4E6FPYEOvSou666lNIqtp0pW4qq4d5em7DYOpi9ZqoxChi7yjQGK4IV?=
 =?us-ascii?Q?9jwRcu4fVZ2jJcB8g2Sa70Y2onckxxN3w041G2MIaPGF6gCVZRjIYnog/P+P?=
 =?us-ascii?Q?4Zs3HfRXXCc0rx18l7syFlrGkAPlU9nmcYlRz316l1AzkoDpPk/HT5nhUOVj?=
 =?us-ascii?Q?1aAEIhPXntWUqyObRUI2s4l2fbVNad40Erw48DO+BxgtQwvfh6gBpmp5PuHo?=
 =?us-ascii?Q?GtEqm5pSrGOxALidADbSQ47RzNaXMGA5JZ7oDDBKoBkENiI3eEv3TEZEKqiq?=
 =?us-ascii?Q?oFbTBSdktL0x3QbNu01ZXFAqPYOZNF88jts/PccGwQIDPEHmGFniYAoKQf93?=
 =?us-ascii?Q?CbrlxnIV6us0zjAoz+evlGUE9H5FKJgcf/c1uJrCit8lyXir8wuAiFgPPx+D?=
 =?us-ascii?Q?hsbAXSb0foUw5A7e6EuQIl/PvX5APsDLsKkqqG9cMjr2/4VrWaAlhMO0ore0?=
 =?us-ascii?Q?7fpVTXUydHuAVDO7Zb41osBcRZR5pdb1c3MH6wbWuEY+uWL4CtuU5a3I+9vx?=
 =?us-ascii?Q?vVLM36oiyXoXfLfK5evl44aBnGRmiy5PEIscBFuVpKdUzNccBNMYTkpvZU7j?=
 =?us-ascii?Q?/4IAr2HmbHPqoqeyFncn3aBJgI0Qgi9uE7uObWvnOG2rc1RE7Irw6ME7XN27?=
 =?us-ascii?Q?NGWVC3taH//98Fx0L00UKvrmhLjIZxu3sTj0OV5tBjIVOJFedcOVTzUGCAl3?=
 =?us-ascii?Q?YsV+0V6EBSmo7RI3O7boL6XwlaLJIMIHaU1YJK2O4WAm+q39v74yNLAYeMXR?=
 =?us-ascii?Q?3q+xteYx+U+kaM4qXnknXfhevpm30ja7LhvLHRnBoNG+pXwMWJKTwY+6BBXm?=
 =?us-ascii?Q?R9pSOndeqavsaqrdkkkyS8IdowY5cEAuvRitYOG9jx1Ydeg1XbarM1hAHztu?=
 =?us-ascii?Q?+AowTQBhg4vWq07L7FpmgNLjTyyrIbwhemHfiPMGH+uxpXOd+qpE2Kvo5mMA?=
 =?us-ascii?Q?jJ9TuEE3+l0TFeSGTXdIdK59OT8Sm2USHGZAGvnXQnl1mPq33IH3RA6ptvOa?=
 =?us-ascii?Q?D+S7yZ/g8puD7jJtP/hNmLksgrv49rVV10bT606UwDrCGotGA58pTlK4KFhj?=
 =?us-ascii?Q?f/IWv+xKdSh04710d3ct0g9nuFHKnMbfl4OnQhPYZQrzrkIP3AmncZH3DvFF?=
 =?us-ascii?Q?UkLCOSwUUvd990FOsIfxM1o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b1596a-550d-4554-53e8-08dd7012a083
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 05:12:26.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqyKUdp2KXebibLBx6F7L3hVac3UbYbcqZSqaCo+EpNR2X2Z2P3BOShJG9qawfX4xjUpj4dtc78KJcgl2hd6DiKmN2ztdIV8MI4TiNUWGZC9AOi3ckCi35fIxIVXxyel
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14769


Hi Rob
Cc Geert

> > Sorry to bother you but I wonder if you could help me understand why the 
> > dtc checker warns for the issues I tried to work around in this patch,
> > and if possible how I can improve my solution to get rid of the 
> > warnings.
> > 
> > This patch addresses the same problem for a few different devices. I 
> > will focus on the last one (/soc/isp@fed00000/ports/port@0) for my 
> > question, but all warnings here have the same issue.
> > 
> > I have a port node the represents a sink for a video input. This sink 
> > can either be connected to source A or source B, but not both at the 
> > same time. So each possible source is represented by an endpoint in the 
> > port node. Each endpoint have specific register address on the port bus 
> > that is described in the bindings as they map to different physical pins 
> > on the hardware.
> > 
> > The issue I have is that not all hardware configurations have both 
> > source A and B populated. All combinations of A, B and C are possible 
> > depending on the platform.
> > 
> > A)
> >     ports {
> >         ...
> >         port@0 {
> >             ...
> >             sourceA: endpoint@0 {
> >                 reg = <0>
> >             };
> >             sourceB: endpoint@1 {
> >                 reg = <1>
> >             };
> >         };
> >     };
> > 
> > B)
> >     ports {
> >         ...
> >         port@0 {
> >             ...
> >             sourceA: endpoint@0 {
> >                 reg = <0>
> >             };
> >         };
> >     };
> > 
> > C)
> >     ports {
> >         ...
> >         port@0 {
> >             ...
> >             sourceB: endpoint@1 {
> >                 reg = <1>
> >             };
> >         };
> >     };
> > 
> > For option A and C the checker is happy, but for option B the warnings 
> > this patch tries to address are triggered. While reading the 
> > dtc/checks.c I find check_graph_child_address() is the one that is 
> > triggering the warning. And this function explicitly checks for port 
> > buses with a single endpoint with a register value of 0.
> > 
> > This check was added way back in 2018 in commit df536831d02c ("checks: 
> > add graph binding checks"). But I can't find any information on the 
> > specifics. Is this design a bad idea for port buses for some reason I 
> > don't understand? AFIU this design is possible on other type of buses? 
> > And do you have any guidance on how I can dig myself out of this hole?
> 
> Don't.
> 
> The check is only with W=1. It is for cases where there is never more 
> than 1 endpoint. dtc can't distinguish when that is the case, so there's 
> going to be cases to ignore. Perhaps we could demote it W=2, but I'd 
> prefer not to. Making W=1 warning free may be a platform goal, but 
> that's not an overall go. If we fix something everywhere, then the check 
> is promoted.

I get this warning, but I'm not using W=1 option.
I'm using v6.13-rcX, but which kernel version hide it in normal compile
(= without W=1) ?

	${linux}/arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1189.12-1199.7:
	  Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2:
	  graph node has single child node 'endpoint@0', #address-cells/#size-cells
	  are not necessary

Thank you for your help !!

Best regards
---
Kuninori Morimoto

