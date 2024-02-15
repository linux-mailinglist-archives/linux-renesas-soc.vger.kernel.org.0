Return-Path: <linux-renesas-soc+bounces-2827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 364FE855C8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 09:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADDA41F2E30A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 08:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF7811183;
	Thu, 15 Feb 2024 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lQ9rCfjM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2089.outbound.protection.outlook.com [40.107.113.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0671113FE0;
	Thu, 15 Feb 2024 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707986085; cv=fail; b=KLEhA26wfYkXLOS0qMfBIHRJmhnmUPZuJJU/p8U+rbWT17Jq1SNZz3OLOCezru+bPKYIag27F6kTONwqjXcOGIFkF7AfxyWB/Zohnb7hEB7kAiXw1VRYahhZgOHtGkB99Kq17p+oDjJtK2Xovh4rBU5axHVt0FW1SlOlahY07sQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707986085; c=relaxed/simple;
	bh=cHNZvuBl65EqsjENph0ZeFpXonhok3Ad1dgxGXWOPvU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LojFkrtD8lFqQ1ckWyxyqbMQAyPmLIk5EhvQqYMb6KSVije2vX2pBXcJS8IgYSc/DmVRyLgZUHvwKNSycUyfHhuPJD/YDDDuiyZr0ze38nRbQtB/FDcX//GV4+PKqPK2cMjHrbytDRL2V9cHYCEu70n23ma9WcK+0rehfLz0D9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lQ9rCfjM; arc=fail smtp.client-ip=40.107.113.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mk9Rt6JJ/+/IwyfNBhFekaHbupz3MNuHmohyTcg1q1U/5umShdchoSiplnC3VtvFIaijJ/BcARxCt/EQb3DyoDi8Hto/ZdvjsQhHZlPjBPI02P9lN65oBQX7Qv2GdpjfXdNfUt15WjJ0QbCMv4oDRfzjkmRMNo517BGdyAUGVmEtI2pmR+AQIXVtkVNlJ9LXXPKxFUuJ7y9942RMt2obRw4v5lbKLg1/RkaytDWPA9cdG5rfL0F69kJAjdERgkv0yWEMsH9ZumN2Bu1wUyz2kuaTAWue20mMgf8/O+BEf18L4xca76V81LpLC0wEkdSJQiaZX2LMJmqH3nUnn/KHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8o3JvDNG+PNn7g6p52PrV5H50usWqHZcde5xVqk9q+k=;
 b=XjxfKhj5Yuf1NmZGBYAEqTGkJ78oTTnoi8DEwlKqrDl60YkbxeCcV0bgk65EZPjCnfr9hFJx5YZ7/3EHUsdnuf934L057Yni0cbcwj8ptSwtAWZIXhJ5h6wsiMfr6ye8p8RBwQYsYYD46DLWrltlKd9d5qiYUsH182ECeRgwnjv9ZRQDzpQx3cF2/vtXfv5WYmjPU9oP6sY0/t+8korXbVsA39qEy2iJMctpohrLHXmzLLV47L7eCqzzTzdDQFCusnKh6q4DJVQOIP97B0tcejsEB0tnDyfxFKInNG4PKZdnTOjFYhRgwq+Y+2SBj1ZfzhD4xt/SlrFIM1H6EXkRHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8o3JvDNG+PNn7g6p52PrV5H50usWqHZcde5xVqk9q+k=;
 b=lQ9rCfjM1rUI1QVOdmmHCKMBd4ggiFb74KYhVPnhFRK1ukfNoM0/AjnMXZTye0BuiVZYKZYO3pWVnZ0fH5NG/yvCEAYz1b0DES+Ay557SwPFlLHs/6Z0blYk99mPboDhywMH2hR9jTlqggQOEblhciV5JAxhi35BpZtN1w6FwMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8691.jpnprd01.prod.outlook.com
 (2603:1096:400:18f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Thu, 15 Feb
 2024 08:34:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7292.029; Thu, 15 Feb 2024
 08:34:38 +0000
Message-ID: <875xyqgm75.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: renesas: r8a7778: add missing reg-name for sound
In-Reply-To: <CAMuHMdVjDfpsyXbG3ZPJ3YWup71kAUevV8CX+1tcbGmG=80nDQ@mail.gmail.com>
References: <87cyszpwmp.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdXih9g46JKvz_UsjH3h_OrJOJLnFv6ixpYjE6Q4DRxbsA@mail.gmail.com>
	<87h6iahb6o.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdXAbbVs=OOkqsKz11e2TtbUWSMxNAiG+kus_T-0cr_ZdA@mail.gmail.com>
	<CAMuHMdVjDfpsyXbG3ZPJ3YWup71kAUevV8CX+1tcbGmG=80nDQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 15 Feb 2024 08:34:38 +0000
X-ClientProxiedBy: TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f8ef3f-af24-4c90-eaab-08dc2e00f299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gOaKYB9XlXbXtzLGDC/F7btscT2EjtsLjtAvql/9ntk7lgWI3z6qf9Jx57ap8Es1SmzpONK1VkhnfFuDeEugMkhkfgHZmOyZjnhNgkPGUdO/rtDXUpvPuUUJolQY1fg8hEL8O9CxmH0KSzuMP1rANjd5JxPfUFZhbwp61NbajUdSbuSx8zyduWNVN+LuoJN+/1r+VwSHHXIckNmpbC2ZIM2yM2EVcpd4Gevoh2zxZJ216XUKk1cGZtL/vTmp7gzADHaMrAWoQ27x/919IHNowCw84giaBtRFT3BN8gdITR82B8yQR5V4EMkw8QfE1ejpVw13XcRIy2rKV9uYYpZyHnA4wtcKW2GSSGnBlwMyIGGB8arbvfhc3gkN945BRkjkuwjq5XGML2Nba72YgUs1A0R0QegfRbzgGYGNRcOD2IAv3mpZTJjZF428W7DMsTD8T1t1es3UqkfcWCSwqUwVTGWgifyMnOqi8EBadLxpch5mTwWfNLSe5UYb+YcbJkeacfEmc4j+N/gJdVQw/kAVRnMyX7S5MDN4O+d013VTlRzMSNB6Wmu9+kPAeIEilRFlzEOnPgtQwriuK44NbMY/0+uRvIfDBSxY17HxDCbPvBhTplrYVWd9yL4I2mBFaYcx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(38350700005)(6486002)(6512007)(6506007)(4326008)(66946007)(66556008)(6916009)(86362001)(66476007)(2906002)(5660300002)(4744005)(8936002)(54906003)(52116002)(36756003)(26005)(478600001)(316002)(8676002)(41300700001)(2616005)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8iuiDXVduGhqynjUClmcGZ0lYjScROCw+1GoQRDu1rG9FQFztT8wK1QKZnay?=
 =?us-ascii?Q?9LQJpvSsjOBtIMNtCM7Omem5W023bG0uxvVlbjgSGibHVU/IGlLwJGFjUxBN?=
 =?us-ascii?Q?pjpduxQbZ8+ZA8POdUyZuacXcyy7dfG9gq34ZoLSK7p2V00vaV4Ft1p+j0FD?=
 =?us-ascii?Q?q8nLbYEyPMHX5jML06VyAnCbHi77eRYobiexY2JivsNDYhAXTFK3/Dlt9WEM?=
 =?us-ascii?Q?Ua9r8DSZQROifTYpGsZqjiCpIvpTJlBBVExpOkX0sr4FDkVER556Wnj+Io87?=
 =?us-ascii?Q?ARRB8RIj1v+JPSszIFnOI+YxHrsuaFU7uUK0qtlseTuRFINtNWuYjpTxVA9X?=
 =?us-ascii?Q?bigk1NEuR6DbhLNQMfLHr/F0ApzyE3UMYp8Hs5MdeB0i3xEdslGDxuKwTT3L?=
 =?us-ascii?Q?g0Kfcf1lMF3Tp003i4dr1rU5eaEzNsXXe/WxdLOgffriDHkXmuxZUhLGjSTX?=
 =?us-ascii?Q?hB6QXulPq8RD8zM+p6dzdew3A41jGeBpMyOQXR3HgaXgkK3d3s4YMV3SSywG?=
 =?us-ascii?Q?d39vVd1T9RcTqQEk7IvXF04JxdCpcLEr/AzLzcoSBnxMnKCtaapNxET7I5jC?=
 =?us-ascii?Q?v1jtbinr9ViIso5pgAbUTWZkYJpb30ViL1qyN0E0V0SoKvqWOa4jG6bWhq1+?=
 =?us-ascii?Q?T2mcwps22MT8Di6LYYY8QfLR7bjte5DTnSAVi6JEaLQSNNNjP0e1qH/QkDGN?=
 =?us-ascii?Q?M3YjrCyYGJ+ScuFzA2DoA4rQX/KcTcXp17UN/59XbQK6+o2BVAO5ND1Ku2+F?=
 =?us-ascii?Q?gib5PKeqCGySF6Uaya+rADMF+4wSxsUGFjfx1mRJDXztK3fnqQfz4YJzEkes?=
 =?us-ascii?Q?nZOA204TgaH0ih0uMGeascuncgUOQwQ6CZfQs3xWE9KwSLdsme3tKXX8pWmg?=
 =?us-ascii?Q?3b1n0Oq6eh0TULXsBRkMfFCu4suYR3GvCYvUmEv+auIPrefgrnh+zaDweB9l?=
 =?us-ascii?Q?Z1/vU01zdQ618j8tMHUY8+LhaFAiNKVr0ZKNboQDdmSHCZCUlYCYeKKamXOd?=
 =?us-ascii?Q?SuKKBo/dctp5yQc/Ogdt/rCDkX6LZJ7kDEMFRK2JmbL3nYEGBAJ/2In8jzeF?=
 =?us-ascii?Q?m3NtM4XFaq7fn72WMRuLJl9LG7lexl87mWw59UcN0+Z23AF7prwAsZkaDTKm?=
 =?us-ascii?Q?sYGJmG/dpNQ38fyFkybjXIHrUdg7znpBzKKQC5YTCvW/iOja1xRsYwVAlrFQ?=
 =?us-ascii?Q?z9dYSJ0ntMUwFz6Ej4G7xy3rnsV5lVgoJjFfISEIpO5xh58SaaQvGGIeNxtI?=
 =?us-ascii?Q?sCKYVhSvoiSq/Av8zaJbYijtMTsAhUMKZY0/IIO3TQNBZQZ2dzoz5P1A29I1?=
 =?us-ascii?Q?O/lcqovR6A4DhLVH6l7MTFgd9BoLLjeFu2l3BVMM9RLuvHyCaXo1pRCQcODK?=
 =?us-ascii?Q?8BA1bjriWOa8tVHdsvfd6kKqh0TsicLItT/Ac1sehmGu8lLp7m+qrnDygh7e?=
 =?us-ascii?Q?yx6hXPIgc6XDMpKtzgRGllMqNVVg1nCR1jZLqN4PbY98zNdnoCsFtfEZagsv?=
 =?us-ascii?Q?nrlxUa/aLRIDLMeI1lczzL+Ua+hPd6JxOA8zM9tJGBK4eSLG+rDO2i9jGTlg?=
 =?us-ascii?Q?dYN/zatbpnb4s4O0SDsRNpQENyRO/bQ7Wii5VCxleX2j72k41FRLoWoikVpy?=
 =?us-ascii?Q?ErxkZLvGe68HTCeyo2xjDn8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f8ef3f-af24-4c90-eaab-08dc2e00f299
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 08:34:38.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJg0RNGGYXvisOEVR63ErZzBUmEmeXH0pb28zVPPmTu1/FM/u74MnH+vId7CqM6tdSLWy9ZxDk7vyPe3UBsXP8svCffV2dKqObSjZhRBPFroobhtPyxEag37EZqDD8pH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8691


Hi Geert

> > > > Can we just add a line to do that, or is anything else related to
> > > > sound missing in r8a7778-bockw.dts?
(snip)
> > To clarify: adding the line is enough, or is not enough?
> 
> It's missing (at least) pin control.

Adding the line is very enough

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

