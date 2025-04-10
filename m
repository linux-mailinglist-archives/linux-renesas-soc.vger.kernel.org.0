Return-Path: <linux-renesas-soc+bounces-15690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C63A837FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 06:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F6563BE60B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 04:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B731C32FF;
	Thu, 10 Apr 2025 04:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="f+Zthjn1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010041.outbound.protection.outlook.com [52.101.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFFA4A04;
	Thu, 10 Apr 2025 04:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260551; cv=fail; b=IVbIAfCSj9uvNnd5cIp7F+YnlhhyxCjnA1p/CVsZSJrUzibQO1VsjensZzowY/MPTLKu8o9CKdKe1dmadiAWocJVJGrR+EO0TiYCo5dzxcn0drgcPQf7Y/cJTgUK7DdjcrcwRMbhgrf57/Gk6zMN0/LTJUTcFCDWEASEhz8nbB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260551; c=relaxed/simple;
	bh=4d4j1v7apmBah+csWQk6VVJ2EHQhN/VwKw7FBF58eZE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rqDq9FN3Vmd4RcooHy9DxyM2f533z7HzK/pef2NP0Ag4P0IVDlEr1Gl+6J4iOJS0D9oZBzDnrliyKrhe0ZVD0+rWg+fJOuoN7MdMJOQvHnUt59n9nFOau5oXI/Nz6Zk7b4tVC8n3sShAARGmSh7/ZpDzqpc3mJGFlZEraCjDDm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=f+Zthjn1; arc=fail smtp.client-ip=52.101.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhaZ3DrsRPU2bqWTgxKuUa1I1XcIyJshw4Qnqs1sZfyV8FBNDyhtSKFdYx2JMF0+2QGU6oAaJA8czzaE2gz0AuPK9Ywp3GAQFVF/4FfzD2D3K8nsPSbpq5KM4+BywM7J41K0iCq1qYXvB990MrwYechE1Ckdji0R6dalYz+Ljc8xdGEbvLP03YlqqYoL2cG3+tmin/A5s1kssGokXITIZTV1guP2bElS/53hOXRJcuQDN1Ql18UM3ZjnOYAsxSPdlWQGBlcIVhqlbye2KSOxSkQWFtJqcQjWlA0bh5xKbM69SmVsUDYpJT1Y9yT8czB4Q/LLo5mjzh1G3dHsjCpeMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=904KDUSkcJt1TvUFUD9WBZ32HLxOoYZoIZvqzbxTDGs=;
 b=g22dYTAUK8tJEDQAogswVrFupiMPWLOuBnLqBz4wFKHx9DpUkxBGSBKaIlbNuhAZtUgiwp/OaKRdHSS7sTj7j8NibkQyqUu5Q+/HUAIqW0QCF/FK9gnaSFDFzI4aVYdleaC6M7wqGaGKrHrOavHkwTtiZfZarLWR3td5VsMNTJUGuEmC6pmcaaLwJxN0y48lpn3PlW6h8slkjoafNJpuRExxULPq0nLG5jIou7jkx3TvjoM4xVEN0XRai8ZLT1xXPQzw0uEdAGUpfZ0WMTLmqVgwoTZWEkCtTYTh0ATe/ID03UWWzPLj6Rwzenc0kZDaSrcb2ZDMSilcxE4il3U/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=904KDUSkcJt1TvUFUD9WBZ32HLxOoYZoIZvqzbxTDGs=;
 b=f+Zthjn1OwR4vbxwCS3+PhgwQlulsVPSBWaSRTgLnWQs1adt/xpj41r7NSQgBUaznyWOqZdRTo3omTBnFOgSdov2jPNr8OOnlVNlx4+yYox9H7dm/05qjbHfovK8n1X5S5OGznNl61Dv7N668ivfzpyIE+L/5DqYr0dU4y3J42I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7097.jpnprd01.prod.outlook.com
 (2603:1096:604:13e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 04:49:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 04:49:02 +0000
Message-ID: <87bjt4liyr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: Niklas =?ISO-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Conor
 Dooley <conor+dt@kernel.org>,	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Fix graph_child_address warnings from capture pipeline
In-Reply-To: <87r02dzsue.wl-kuninori.morimoto.gx@renesas.com>
References: <20241016134819.1434340-1-niklas.soderlund+renesas@ragnatech.se>
	<20241209153536.GA74826@ragnatech.se>
	<20250109150327.GA3352888-robh@kernel.org>
	<87r02dzsue.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 10 Apr 2025 04:49:01 +0000
X-ClientProxiedBy: TYCP286CA0118.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 38dc7654-f216-4ffb-e240-08dd77eb034d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tEjpPPf63d6hQUpHKOrPAzD0Ci+3Z9CK6qb0ArcQc6xQ89kD7p9DkNCWVn7h?=
 =?us-ascii?Q?+7cEK3yoxJ/4akbxXzCtb633+aYXpDpVYW6PxMhIhlu5yBlQ7wCuirsHEv03?=
 =?us-ascii?Q?5QtksClflYrtMIqb4A9y50ciChbLy0/dtai8Dwv4JZB/77PvClrNSjMnv/Qd?=
 =?us-ascii?Q?GS6Xz+4OTQmIY10SM/ZM9FxDvGBAMq22mhldEyg21bCmLgW41Ef3Uqk8YK7S?=
 =?us-ascii?Q?BVkl2D52OJ2BUKaUFaU83nAQgQjPMKv8jPn3ZZ31rC2Bcgt1c/CNZ8kbBRYv?=
 =?us-ascii?Q?FR6AqL+k+pNSkfQvHVPXaZL/rM9ng3tkmo7HBop5AOcTaBf4k+3+UVDokZ8Y?=
 =?us-ascii?Q?K4502RL1A/uYH/z588/4OxIYDGfr+M2jTclaLpzED7kGvzH11UKc78wPPWTA?=
 =?us-ascii?Q?0lzl1gpl/GBFM7GpV9pXVPwdR3dKEKmOdULjRPLj6QQ2TXlALdco+Rl41sp9?=
 =?us-ascii?Q?R8iIoGc1hOrantr7uzqUdbFdwYoif8xuPh8X5TdCH8OmyQkshfGXB6tKpgVD?=
 =?us-ascii?Q?vMoO+KGIUdu3GPJPltDu+VqHDlYYYTUKBj9ECI7FfbaTRS96KQLGNjTRo2su?=
 =?us-ascii?Q?ZY9j6j3q2lWPYgXw5fsi8BlyPuezt6t5ub4hpttNIMFNkrDMD9uNiVJUdehg?=
 =?us-ascii?Q?gUJs30nZY3e6V1QyAdajWFjgfdvsC9ZGZ6gaqQHLxwh4VBFtnD3MhS2l7FqP?=
 =?us-ascii?Q?f8IkAuWtB98iLP5ahj7KP0lOA/45frHk+3K89nL6X+Ve1Y51wX3q+Q/sqBVw?=
 =?us-ascii?Q?Faue0fX7blCIjmBI0Iuy+0jnXdl0U654ZoFO9A5lK2qDTI073jnI2ZJelNmL?=
 =?us-ascii?Q?BORq9cH/XlH6nZ0brasB3UeHxBKo+TvbDGYIngKA4mN42jAlsNYAFPLYW8O6?=
 =?us-ascii?Q?/M5A2/zHeQeHyHgUiEnjzFj9hKH1sXhsay9bUlHxeDmdExgll2x6kceXMXAF?=
 =?us-ascii?Q?bcROIzbEWl6r56Pb9WXtmt3vFuTjZ6fUnAiI14Fc28NpJb4hwm0+Km7WneGx?=
 =?us-ascii?Q?Xsa/6Dpjz4LSl2vFvMEYDwAAUKT0hAblj8EoX7Es+JSneySoVHzsS8FxBSzg?=
 =?us-ascii?Q?03ljXCPSW4losgqfWMpZixMNaWryJ50y2zFuEB6GwJcpMqWpnyr/FNjYDkvh?=
 =?us-ascii?Q?f1hWQpKLYAYONGPTRDIVxvBK5ywsRULi6y6vyEoFgWLsxBQ6ieI4gSKkfdkA?=
 =?us-ascii?Q?MBjhxI9XCVNmVucyB0Z9avXZgoc4/lpJvChuaqkkriAnM3BQ8CCgWiaTf5gk?=
 =?us-ascii?Q?P7wquDR/0KPPLpyRLmctpVejmVMUCvymKzAjdGsv2YskOcup/iQiiYWqfLQf?=
 =?us-ascii?Q?aZCXXDOp97NxRf7Nyqav4rUImxsotifhXDJ4culd+Pm6wqe9AGwgkW+0I0NI?=
 =?us-ascii?Q?oCqUJSfwLOSeI0fp9fFfZio+snPLeLywYWdO5iYuXcqM4PINHmTyqzbx24mg?=
 =?us-ascii?Q?nTuhd9H1XM8khVGktL9mxi6lSA077lPD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sDbpyT4m9DAzT6kR2Avm7D0ckHgEi1IJjAEzTdKgbBdViYOUpcDe4Ik/t6g0?=
 =?us-ascii?Q?Pk68iv+aX4HfMETmKPykAgy0pAt9yXFUbExi0QvSKDUf3mysZ5RpuHF0JoXH?=
 =?us-ascii?Q?FcYTv9oznOS+c7ZqIoMdYyoc+nsFPbLndQtoiAbUNr6ycgnO1b1ZgY5cKzLM?=
 =?us-ascii?Q?U9300pzFDdN1bg3ipTE9GgFj9YTVPAb0Sq2tlbsC/NCKXDQnwjX9b+R18ORU?=
 =?us-ascii?Q?lKiiJDtuG4nvIghZRxhU3fy19L4vmA771HJtVuemd8EyzMW3KFTy27puxAjw?=
 =?us-ascii?Q?t7hryM7PT2oLAzDc6EYURFh4u3mqH2kpLdzC06bZXdE6Yxd6voM5IOpOcs01?=
 =?us-ascii?Q?qT0aDXW+W58VuqPirBIgWRf5w7y6mXvnyJpWdzY8R1/XhGmA4HlpV92AHIUE?=
 =?us-ascii?Q?wLrXgVaOib94Ow7HbPiBD2pL29JSYX7r5TtoOTMTDTbfqI/aEE+g27ETEIDt?=
 =?us-ascii?Q?cm8jY2MoTpXOo/pcsQUCW0yBZFnV/gDT6r7jmQRxt4YhkiZM8+R36mcUuesg?=
 =?us-ascii?Q?vL8+3m1xJeM42Qi7M1HHEihO6vBzTHu/qAKYhFHfblU71VHRb8nwEYnAIfat?=
 =?us-ascii?Q?qNj3z44iOJbzWQzoOXZ/0ovAZ3MLZXnCtmlwtArAic3V6EAKKecbyvG0ByjV?=
 =?us-ascii?Q?H1YhFa5CF9S9ed2HTVKl64DPJvXTriuV9G8o1Kh2xljLZpEfZqfKYjZqREwh?=
 =?us-ascii?Q?zF9XOgbtv6FnEunH318vdBaUcI28CxdBbWZK/V7EEsqrKdo5FBUj9JbDMQva?=
 =?us-ascii?Q?NoSWBrOONp1caT6U/GVkzLk0DZVd/cSc92PruXWyCPSOwOB/6oDvX98e9Aqc?=
 =?us-ascii?Q?FxEHIQw6PtRmM+GO1Pvn/V3wh4KC/FcIfrb8NRsmHCgsS0ig/x0puEQIaJOe?=
 =?us-ascii?Q?SCfXL0tZP7D6vQzOU9Hi/syen9mWD2JNrOhh/iZ0RnODc01SFbEk+tslfi5q?=
 =?us-ascii?Q?EpILG05Q1Yq8V7kwZAXQ7ZNtxtu2DzRGaqqjb9yahFNFsDqn6w2E9vr4XEZG?=
 =?us-ascii?Q?5KBwSUbctxa/fLIz9wD6qUNbuhtBtpP3x0+j6r14PT7o8hUDcIsA5DFJ655j?=
 =?us-ascii?Q?KcMbojlH57ngyZgC1rrzToVr2hmQ/xNl+QIvZtoB8SqDCBzpN1Yhl/G7wWwT?=
 =?us-ascii?Q?y0Mqjvnfeha7+YFygt8bwh1SvXfVtvY9RTNsEh53xY1vAUTqWwYRy9Fh3N0w?=
 =?us-ascii?Q?po5NaVyKkLyAvNFMPbH9jm1SxQsCZou2cwlhSIZln6PZgKDOdVE1azvvHHeQ?=
 =?us-ascii?Q?G2K/VeQ8WKDDAKIn20cNwwmKZZqk8ZpV5SV0n3RxwVH01dGyEunWbDuDKOzp?=
 =?us-ascii?Q?pcvGjIqxEMVdoitFLW84r28OEOBkx7nNVlz9w3M4Bm4zPUkSA+Bjz39oYJ2k?=
 =?us-ascii?Q?ia4jfsybLgcRAtmexpdabzzQw/PyHPD7yw6Y3X9sWLf0pBqdARuVicOiClTB?=
 =?us-ascii?Q?81kSFz5ZY4pX0oB1+LYUrw0G9mRCilHJmnEnMTqBhjgcRV2JtLalDxAcnqDi?=
 =?us-ascii?Q?XMoIxTvlL8rRudzpbkOeeLP5Tde0BOHJX+Rh61xZSqLD1QOtjBNT4cRmhq6N?=
 =?us-ascii?Q?QOzulHQ4riIiWWGwZeTsGcQBOPnh/sEwdFpsfmi7K9+5HzPvilCm/DNhQeRs?=
 =?us-ascii?Q?XVVV0dnEtQSSpqB+gZM8+iI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38dc7654-f216-4ffb-e240-08dd77eb034d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 04:49:02.3645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vt7h5tdgCstAGFHl1AeAV21k8E6uBTou//xiZaRlD5y4TZ+9vU2df7EQk/6/+PmmaDYKO+KQR/YUv4JC91n11C9B14Mt9kCvuOjLvxv1zuvbzgIP0yQKGHDw6XcTDS+p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7097


Hi Rob
Cc Geert

> > > Sorry to bother you but I wonder if you could help me understand why the
> > > dtc checker warns for the issues I tried to work around in this patch,
> > > and if possible how I can improve my solution to get rid of the
> > > warnings.
> > >
> > > This patch addresses the same problem for a few different devices. I
> > > will focus on the last one (/soc/isp@fed00000/ports/port@0) for my
> > > question, but all warnings here have the same issue.
> > >
> > > I have a port node the represents a sink for a video input. This sink
> > > can either be connected to source A or source B, but not both at the
> > > same time. So each possible source is represented by an endpoint in the
> > > port node. Each endpoint have specific register address on the port bus
> > > that is described in the bindings as they map to different physical pins
> > > on the hardware.
> > >
> > > The issue I have is that not all hardware configurations have both
> > > source A and B populated. All combinations of A, B and C are possible
> > > depending on the platform.
> > >
> > > A)
> > >     ports {
> > >         ...
> > >         port@0 {
> > >             ...
> > >             sourceA: endpoint@0 {
> > >                 reg = <0>
> > >             };
> > >             sourceB: endpoint@1 {
> > >                 reg = <1>
> > >             };
> > >         };
> > >     };
> > >
> > > B)
> > >     ports {
> > >         ...
> > >         port@0 {
> > >             ...
> > >             sourceA: endpoint@0 {
> > >                 reg = <0>
> > >             };
> > >         };
> > >     };
> > >
> > > C)
> > >     ports {
> > >         ...
> > >         port@0 {
> > >             ...
> > >             sourceB: endpoint@1 {
> > >                 reg = <1>
> > >             };
> > >         };
> > >     };
> > >
> > > For option A and C the checker is happy, but for option B the warnings
> > > this patch tries to address are triggered. While reading the
> > > dtc/checks.c I find check_graph_child_address() is the one that is
> > > triggering the warning. And this function explicitly checks for port
> > > buses with a single endpoint with a register value of 0.
> > >
> > > This check was added way back in 2018 in commit df536831d02c ("checks:
> > > add graph binding checks"). But I can't find any information on the
> > > specifics. Is this design a bad idea for port buses for some reason I
> > > don't understand? AFIU this design is possible on other type of buses?
> > > And do you have any guidance on how I can dig myself out of this hole?
> >
> > Don't.
> >
> > The check is only with W=1. It is for cases where there is never more
> > than 1 endpoint. dtc can't distinguish when that is the case, so there's
> > going to be cases to ignore. Perhaps we could demote it W=2, but I'd
> > prefer not to. Making W=1 warning free may be a platform goal, but
> > that's not an overall go. If we fix something everywhere, then the check
> > is promoted.
>
> I get this warning, but I'm not using W=1 option.
> I'm using v6.13-rcX, but which kernel version hide it in normal compile
> (= without W=1) ?
>
> 	${linux}/arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1189.12-1199.7:
> 	  Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2:
> 	  graph node has single child node 'endpoint@0', #address-cells/#size-cells
> 	  are not necessary

I got same warning (without W=1), on isp too.
How to solve it ?

linux/arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2291.12-2301.7: Warning (graph_child_address): /soc/isp@fed00000/
ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
Traceback (most recent call last):
  File "/home/morimoto/my_python/lib/python3.12/site-packages/jsonschema/validators.py", line 966, in resolve_fragment
    document = document[part]
               ~~~~~~~~^^^^^^
TypeError: 'bool' object is not subscriptable

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/morimoto/my_python/bin/dt-validate", line 8, in <module>



Thank you for your help !!

Best regards
---
Kuninori Morimoto

