Return-Path: <linux-renesas-soc+bounces-26275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 258FECF2C7A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 10:33:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B230930065B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 09:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A2732F77B;
	Mon,  5 Jan 2026 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Eeti6AWu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA14C32E142;
	Mon,  5 Jan 2026 09:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767605591; cv=fail; b=sAkjAKmJsx97roHbAYT3kaFqYGk3gtknJMlebMfAHE1uuW7zNJEkIqXQSRiFCRYaWRnwe8V7XxSHrVhAnQMh5zdGbv4chW8ESNlkewHvvxyiFaNGbe274FxJ3IF9eFJQ/im7WQMcTWQuTOzc7m7etPQnAUuoUtjVG7iMS6dLt38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767605591; c=relaxed/simple;
	bh=z8OvzuXb4pQI3QYHJJBW5+h60lGlUozx6UDuagTCHlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZdJIz7prvROqP3YApnT5OmlWV8Mz1JevGf+zeKbOqRnP1jrJpRdc9ClZCZVqFNfbSRr0lVTRNfNyw30qtM2HOuQmYYZCNXc+eaJGic5FQ4D1i7KzQ4xZknG9XTaKZFA8AYpDg7SjvurzAiD/Ovc1p51MPs7sjzhJ/7CTRq9Bhl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Eeti6AWu; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5UHymZGhMg8g69wnH30b5K0H3Z5u89JFXmux8kcQkW6IhdG7fzWcIOfRYZ2nXgwXt8ex9PqucZNg7diez0AuFK74vJZcIR45ChntvwV5govXPkKl/G3eHg0c53vzLGhfzbyf9aV5XcGEOQd4JLDq131dx4/YQdKQsltgTi6F/GcE4EPXFDR8SJkuQbJCK7DDgqSQhkEMUUy+ckNCVZcCCIJZmsN0p/tlcURKy6XtZr4sBnqkK1nQCue+2W04lgvoaflpkJdhY/vV/GgHuaWPdeMWSE8zGhg3TILcmVM5dW0YKufa3Vggl+1J8juoy4LEagpQOTjrQoIDOoTXtz8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYbL0rNfSGUyLWrwnEIbqIYCon3L82kUso7CaINgESE=;
 b=ogf3ulaPItkKnOmoKC1dqVpCrUyIMe3X2pUAdcWCArVvL5yAKVo1cfjZ91XP8LcPzrJ1HMkxveQb1l+Nja0vQXKXI1603EU8daYPQfPLzX9JQEmJCspIUqOW0xI1DpsOJwCizpuveNJtnQDmyXpnLEtHevwT2YGLpck3T/0OrpQFezshOPEx0Q1yMfgLa2IbhP6fma5O9OcXGBDfQg6MK+jWlIAFax/UW46clNKv2JBqxXrLokiEJ5ftK9wlWR2H6KYS8gi2GBX9LQy0z5moOhQ6gdolmXOr36QVEfdQ7i4PV05KOryYb5MXICo8HeZhjRX34ete1tNHJZQhAReAtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYbL0rNfSGUyLWrwnEIbqIYCon3L82kUso7CaINgESE=;
 b=Eeti6AWuKZ+YN5lIMhCdhvEf6vv/BNwdco6YLjf9L9n07cDCv+MKE8i7xH15Uyt86TgMjLbktmn/7xwwSixUc3GGSZtX4XvXpZEoYgjE54ongWXjzc+Vb7fDa1xW8tldK2SmMhOEqOeKEWRKDNz9G//hB0G6LF/yEoBxS+32mM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSOPR01MB12153.jpnprd01.prod.outlook.com (2603:1096:604:2d9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 09:32:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 09:32:57 +0000
Date: Mon, 5 Jan 2026 10:32:45 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
Message-ID: <aVuFPf7lyG4dQvWw@tom-desktop>
References: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <bccb1a911e76d771dc457012bcc1b943a8c1cdf5.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
 <TY3PR01MB113467FFD21E457C2B06EC8EC86BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113467FFD21E457C2B06EC8EC86BDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: MR1P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::22) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSOPR01MB12153:EE_
X-MS-Office365-Filtering-Correlation-Id: 33422f02-9b3d-4731-143e-08de4c3d68d1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OFc/PTecbxXn1fgubmCrnjqiHp4mHufDLNP0MkpYljFQSluutFpKfPgwpznk?=
 =?us-ascii?Q?u/6G/OZeiIpzpFcXe2iJwJM5dlWLiP6LiQsud/ML5SswFZoDu6umgBrJtl3d?=
 =?us-ascii?Q?IYdNXqt48sGg5K6YzVxmMUHTOf125c9qXMFD39X2Br3qsbDhZDlEU71Jy22w?=
 =?us-ascii?Q?oGrj1xp21pJydiSmCcCLzMq9GV0I2N6AEw8KloJ7IKOb0mHtfhnJo2jndoky?=
 =?us-ascii?Q?Yw5OkuZdLYHepw0KXte7jmS8Bae9lBfmsaHNWC0RVrp+iAa8wlKVvpoNeD5g?=
 =?us-ascii?Q?qJIupsLa01N4LWo1CtlXz/Jjmrz58govZmtFCjM+S/gddHwhvPNb8pY0Lih8?=
 =?us-ascii?Q?KTw0lh/EHe7MQ5tMJfEp0TWSLRvOiaOByMwQOC89Kg9nc6darly0oYeQclTa?=
 =?us-ascii?Q?KHqLE4xItyRD/sY8QSIXWwqWeTdwNlZYc6HR3dKB8Uzpr9XMp80oPIFeBz+C?=
 =?us-ascii?Q?1aqkhlnmPfMMrmcm/nkL7Vljty/GbDXvEaULZyULkyocSl/bWxoGvzXtFN1j?=
 =?us-ascii?Q?VM1GsRjH5gJ7Qp1eBquTViX2xFmpPOrj71JdZlBtTTQaRDhmw+JP/A5joeOg?=
 =?us-ascii?Q?to0Su9zgyMW0NI9tJeOeAvNHwKzCio0cQ2G6k+z7YsWZQzVg62+rG8GSYAU1?=
 =?us-ascii?Q?wQrHoxeZb8A1u7P15EeBet8SQHBZgZFu1PZ9Vi7Lj2qw/xwzVMlvSfWMuoz1?=
 =?us-ascii?Q?OGyZpALQIGfD7bbOBncQAYT8NWvBOI30wZKHpvNkkEBfBilf6TRLxoK6LnlL?=
 =?us-ascii?Q?1+0k+Mo5DqCCKG1LG/wAoA7YGG5dj6IGM4rOdNJLNe8j7yef/C4UDpETfv7s?=
 =?us-ascii?Q?u9tegt2Pz04kU8BFi736v204EvVlE8i2owbqRQbD7R3yMrEPpYPYnwEWuiU1?=
 =?us-ascii?Q?mhVGPWpVla+zcBEPD7VXSpMzEaY1WAHesijgEpWJZ0QePj0gwBmH+wA2w2Fa?=
 =?us-ascii?Q?VP8U9Pl3lmxY8P/mtfC0jPTRqSBJnnK7hChLv/oVwm5q78OacWYeo1hxq+nC?=
 =?us-ascii?Q?EGEWCp7VFhcipsv9f/aNI3sAbL7evf29gH2c7mLIrePCm/HqVhZucCHgcaQ3?=
 =?us-ascii?Q?J0llUBoR1SV+8LZSg50kAxyIMGK94H0ok0/wHKg2IuvNjPDIIjQqoPeL6xNq?=
 =?us-ascii?Q?yuQRAuzvEUowqlcxwTuP/pCKYdujovJr7E2E6KQ4q3dvWC23tCXXtaBJj/4p?=
 =?us-ascii?Q?uDgSfiQRe+beCbKEpPnaa0mg9nn0Szrq9EhajameU5boAQM4s/774J9lQS56?=
 =?us-ascii?Q?hZcH8GfA18Y2gicECVDHyo9ZCngYLYBSXC6iufKItlWb1sWF1alN+AQc2sDw?=
 =?us-ascii?Q?WNT2el2HmG19zHDZtsstMNUzEtP4agW5OABBEw13fJNsywrlw+Lh77vDoLHW?=
 =?us-ascii?Q?6kLD919QyRNB+wWbbBZdUB78pVVi+00N27qq1AE74RmbTGKHE2oWenCYdUCh?=
 =?us-ascii?Q?7JwCR46iKkM+XJTywFCSQ2yXQn3yMGQ5mrWWnEPxXfg1VRRYpTxoP0RQFVWj?=
 =?us-ascii?Q?+mNpJSgUg7O5kBwI/BqzrsYoZacB8T10Q/+O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xTLfEwLB+2WGDfl+qW5RzjKbmcCIYpsAxuGEX9N2W0+nTVZXLW7lUhLGT02H?=
 =?us-ascii?Q?BT0dzJXchC5ZqLITlYaUyRfoCQ+kb4nB7mtofCOnAzcRxcOR7VGzx22qqJGe?=
 =?us-ascii?Q?A2x/Vc6JaVwvZcpyfLmfpz1Kgc/tHh5dvpb+HDu0Kbu/6KtpNRnQALJP1qPI?=
 =?us-ascii?Q?fdZJr1LTcZl3Q9ZtV+HSZHY71mB7tzRPBBVYKkbhojkWEoSnkONoR+LVK0L3?=
 =?us-ascii?Q?QJNW5Tbxow3G6wEoADPe9cm/m2B9znNzF8TQDAphSygMVhCwfJrwCEumOkyU?=
 =?us-ascii?Q?sCiwKTdX6YoMnCfEo9igxQ2VHnSCXCACuzL+TNMN5kaQhZIFBZ1eF2x9aZlN?=
 =?us-ascii?Q?x5L+MZydkwla7LRxsPzVjD2sMhk5Q0mjhHGxtBzwMxLrB9tYsLIBswAPPVV0?=
 =?us-ascii?Q?vCtHc3TaAW7P7chiF2trqHVwXkaLViktiRgv/8P5MTiWS5oc4cPuAAO3Fnlz?=
 =?us-ascii?Q?3vpDWhsXcX6tw/2EoYD0ebakZ8rRxugV5XqsH6O24uEzI77y/jXIbVTkvYHR?=
 =?us-ascii?Q?RA/48e+ShCZepOYuPhotRWwooXQVAfBlNr1TlXyjmJ7vCw2x0TQuKoxiXh5+?=
 =?us-ascii?Q?8dGT9eWKuaDfSUHB/r0xuap7K3XdZnL8sGTq2Q43Fb9pXgnkwM6YopY0COBo?=
 =?us-ascii?Q?k+uU5NHtpf3CRB8ArcnCVgK0Y9FufArsdoZXpr5P6AMHTX+2uWVk3Uj9WwHy?=
 =?us-ascii?Q?rM58CtiBIS/MUeVT4tQdsDVt1sXWcAxwNfNnyZp6G3Nx2PUf0CaKMv7d435M?=
 =?us-ascii?Q?VEH+YaJYgJ4cZvZru9w9JQc/mLu+Y/2Q2Yh5h+WaW1Lvenu0RVwmqmdFHNGp?=
 =?us-ascii?Q?HdDgrFs0KTRxPmxGAZBv0soCL6/RUWRALWwDLU9I5NHdimtnY4t3d4uqI5kt?=
 =?us-ascii?Q?laMmSZvcU0DbHW8FQV4yqzdF2zWBST1MbICIsMWw8LdGwCNqpwZR6B74p6+b?=
 =?us-ascii?Q?wNVLejW7tQQMlIH2lCpe2gydnX0xpq2eeJg23puW6jGs3l96IHc5evMZaoj4?=
 =?us-ascii?Q?XRNz1QbttJCrYYkA0aFqxiflXFZzGPQw5X0/B8ukr1VKTXsY5Qe3F23pxuVk?=
 =?us-ascii?Q?fNb5yu1/6kp9QTc24Yjm0URkojVrou/PuqaB5C7wUKxgBemnVAnX/+ICu+Ym?=
 =?us-ascii?Q?QraW5oLT1TPWJppQZUMjNJPS2Uv7GHosjdmuOY4yJCqW0t1zXb+qArj6va+K?=
 =?us-ascii?Q?035l2QjeeHljJZg0VzlvRnoamtOD14TRGBW7Ak2WizLuQWr73726U8eq8iia?=
 =?us-ascii?Q?6itBPw+gyCOKt4JhRD5ZIhzL6bSYDLoH6U6fdz07nWwKK0hTBYnmce2TEX3P?=
 =?us-ascii?Q?rv/hUcg3m1BdDH+9vy7GAO2cQdmR+d7omnS938Pa13PoMYF4R36ViIne7pP2?=
 =?us-ascii?Q?Q5GXLYcSjtHSUuU3gg1VpQ+Bk0D3Ic9Y8jI8d6rF+ENDi/wqHlVWSj15p+i4?=
 =?us-ascii?Q?9ecop+/vGSQLx7TMxdD3F+5JmFwRuvblqWoQItjQ9XXgkLH9x7YPvvXpIYrx?=
 =?us-ascii?Q?vrirxhQdTg7ZNS/79uVSAGCdVCd+5IWmqUlsBrd+CbcfLjUT2orL+KsH4lez?=
 =?us-ascii?Q?hpmr6PTsTOBbHR/BVVBcNc2wM+15JarTezkE+cylj5zlZTAqpEBxZmviMhTW?=
 =?us-ascii?Q?L/agB0Yj6Zulge18n4YrJ7Oe/tlsZyibpqGq7EsKgFkrPZLyqzVSi//769lJ?=
 =?us-ascii?Q?bW5a9BMR0uVvGMain8PoSkBYHeOAHQqrruMUtNX/bXBZwt2VmYFobTbqIRly?=
 =?us-ascii?Q?syLWhEusXBrkx4TP24rYAb1zEdGrri3j7XbN0zOZMQGwCEyhMsh5?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33422f02-9b3d-4731-143e-08de4c3d68d1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 09:32:57.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsL2whC03Cj3h/SG6NsgPtUs8M+PIVa9e8uhbkFLHNuC0Fkiq+pynB8fu5j/jJ1V83iZMCoIQn8IvODYWZaylTcgVRcQWeuvXRIEVypmPEejX+lNAhufT9Oot3t1nXld
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12153

Hi Biju,
Thanks for your review!

On Wed, Dec 31, 2025 at 09:04:16AM +0000, Biju Das wrote:
> 
> 
> > -----Original Message-----
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > Sent: 31 December 2025 08:23
> > To: Tommaso Merciai <tomm.merciai@gmail.com>
> > Cc: linux-renesas-soc@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.com>; Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com>; wsa+renesas <wsa+renesas@sang-engineering.com>; Alexandre Belloni
> > <alexandre.belloni@bootlin.com>; Frank Li <Frank.Li@nxp.com>; Philipp Zabel <p.zabel@pengutronix.de>;
> > Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; linux-
> > i3c@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH v3 4/4] i3c: renesas: Add suspend/resume support
> > 
> > The Renesas I3C controller does not retain its register state across system suspend, requiring the
> > driver to explicitly save and restore hardware configuration.
> > 
> > Add suspend and resume NOIRQ callbacks to handle system sleep transitions.
> > 
> > During suspend, save the Device Address Table (DAT) entries, assert reset lines, and disable all
> > related clocks to allow the controller to enter a low-power state.
> > 
> > On resume, re-enable clocks and reset lines in the proper order. Restore the REFCKCTL register, master
> > dynamic address, and all DAT entries, then reinitialize the controller.
> > 
> > Store the REFCLK divider value, and the master dynamic address to restore timing and addressing
> > configuration after resume.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v2->v3:
> >  - Fixed error path into renesas_i3c_resume_noirq() and
> >    renesas_i3c_suspend_noirq() function.
> >  - Moved up one line sizeof(u32) * i3c->maxdevs into devm_kzalloc() call.
> > 
> > v1->v2:
> >  - Updated commit as v1 has been split into smaller patches.
> >  - Use clock bulk API into renesas_i3c_suspend_noirq() and
> >    renesas_i3c_resume_noirq().
> > 
> >  drivers/i3c/master/renesas-i3c.c | 89 ++++++++++++++++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> > 
> > diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> > index b065b8d4b138..e33ff16efdb3 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -256,16 +256,19 @@ struct renesas_i3c {
> >  	enum i3c_internal_state internal_state;
> >  	u16 maxdevs;
> >  	u32 free_pos;
> > +	u32 dyn_addr;
> >  	u32 i2c_STDBR;
> >  	u32 i3c_STDBR;
> >  	unsigned long rate;
> >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> >  	struct renesas_i3c_xferqueue xferqueue;
> >  	void __iomem *regs;
> > +	u32 *DATBASn;
> >  	struct clk_bulk_data *clks;
> >  	u8 num_clks;
> >  	struct reset_control *presetn;
> >  	struct reset_control *tresetn;
> > +	u8 refclk_div;
> >  };
> > 
> >  struct renesas_i3c_i2c_dev_data {
> > @@ -609,6 +612,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  					   EXTBR_EBRHP(pp_high_ticks));
> > 
> >  	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
> > +	i3c->refclk_div = cks;
> > 
> >  	/* I3C hw init*/
> >  	renesas_i3c_hw_init(i3c);
> > @@ -617,6 +621,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
> >  	if (ret < 0)
> >  		return ret;
> > 
> > +	i3c->dyn_addr = ret;
> >  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYAD(ret) | MSDVAD_MDYADV);
> > 
> >  	memset(&info, 0, sizeof(info));
> > @@ -1362,6 +1367,12 @@ static int renesas_i3c_probe(struct platform_device *pdev)
> >  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
> >  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
> > 
> > +	/* Allocate dynamic Device Address Table backup. */
> > +	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
> > +				    GFP_KERNEL);
> > +	if (!i3c->DATBASn)
> > +		return -ENOMEM;
> > +
> >  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);  }
> > 
> > @@ -1372,6 +1383,83 @@ static void renesas_i3c_remove(struct platform_device *pdev)
> >  	i3c_master_unregister(&i3c->base);
> >  }
> > 
> > +static int renesas_i3c_suspend_noirq(struct device *dev) {
> > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > +	int i, ret;
> > +
> > +	i2c_mark_adapter_suspended(&i3c->base.i2c);
> > +
> > +	/* Store Device Address Table values. */
> > +	for (i = 0; i < i3c->maxdevs; i++)
> > +		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> > +
> > +	ret = reset_control_assert(i3c->presetn);
> > +	if (ret)
> > +		goto err_mark_resumed;
> > +
> > +	ret = reset_control_assert(i3c->tresetn);
> > +	if (ret)
> > +		goto err_presetn;
> > +
> > +	clk_bulk_disable_unprepare(i3c->num_clks, i3c->clks);
> 
> Why can't you use unlocked version clk_bulk_disable/enable(num_clks, clks);
> for suspend()/resume()?

I'm seeing the same calls into:

 - svc_i3c_runtime_suspend()

Into drivers/i3c/master/svc-i3c-master.c

> 
> > +
> > +	return 0;
> > +
> > +err_presetn:
> > +	reset_control_deassert(i3c->presetn);
> > +err_mark_resumed:
> > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > +
> > +	return ret;
> > +}
> > +
> > +static int renesas_i3c_resume_noirq(struct device *dev) {
> > +	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> > +	int i, ret;
> > +
> > +	ret = reset_control_deassert(i3c->presetn);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = reset_control_deassert(i3c->tresetn);
> > +	if (ret)
> > +		goto err_presetn;
> > +
> > +	ret = clk_bulk_prepare_enable(i3c->num_clks, i3c->clks);
> 
> Same here.

Same here.


Thanks & Regards,
Tommaso

> 
> > +	if (ret)
> > +		goto err_tresetn;
> > +
> > +	/* Re-store I3C registers value. */
> > +	renesas_writel(i3c->regs, REFCKCTL,
> > +		       REFCKCTL_IREFCKS(i3c->refclk_div));
> > +	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
> > +		       MSDVAD_MDYAD(i3c->dyn_addr));
> > +
> > +	/* Restore Device Address Table values. */
> > +	for (i = 0; i < i3c->maxdevs; i++)
> > +		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> > +
> > +	/* I3C hw init. */
> > +	renesas_i3c_hw_init(i3c);
> > +
> > +	i2c_mark_adapter_resumed(&i3c->base.i2c);
> > +
> > +	return 0;
> > +
> > +err_tresetn:
> > +	reset_control_assert(i3c->tresetn);
> > +err_presetn:
> > +	reset_control_assert(i3c->presetn);
> > +	return ret;
> > +}
> > +
> > +static const struct dev_pm_ops renesas_i3c_pm_ops = {
> > +	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> > +				  renesas_i3c_resume_noirq)
> > +};
> > +
> >  static const struct of_device_id renesas_i3c_of_ids[] = {
> >  	{ .compatible = "renesas,r9a08g045-i3c" },
> >  	{ .compatible = "renesas,r9a09g047-i3c" }, @@ -1385,6 +1473,7 @@ static struct platform_driver
> > renesas_i3c = {
> >  	.driver = {
> >  		.name = "renesas-i3c",
> >  		.of_match_table = renesas_i3c_of_ids,
> > +		.pm = pm_sleep_ptr(&renesas_i3c_pm_ops),
> >  	},
> >  };
> >  module_platform_driver(renesas_i3c);
> > --
> > 2.43.0
> 

