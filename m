Return-Path: <linux-renesas-soc+bounces-26313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4176CF6097
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 00:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6628302424D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 23:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7D92868B2;
	Mon,  5 Jan 2026 23:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gUj1TLj8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4182258CDF;
	Mon,  5 Jan 2026 23:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767657160; cv=fail; b=QaVsmhc/GYJ0ZpChzRDIqJ+ccYVgmZSpMzbpz9/Z6jA1fULxTGDQUqLdjjjVvJavTDrTau/X3S66US4y5Qf8UMVKRfrec2+imlZPk96poDX5ybxVSs6LjCBOQVvQW9POlS9bzAKyIBSgJ04mL9JZnSv5YTChxThBtaBcu4TFhpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767657160; c=relaxed/simple;
	bh=55Y3shXu9QdqLSMBzkFX1ppaBYPrmLBsPUYZPaLjf+w=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fHYk382G3eVhK6rpXyoXRU7eLdCrhpq9c/C6YGcltPXlOsdmh2EuDxsm61kYXN6CkdHDYXxcJrKLbeh5cR5Z+F5vLnaQO2pskUeA7OFbkEjYZzy/EtyKkdsg8Lm+VBUueTgJFNWDvQnwBC2SW/cYlvLEa1HtZWdoh2WzbyJchrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gUj1TLj8; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXue4QALm373XFPEij5/m3IdV/HmMcABKTdI8eEligELqVgxErXjHFCouIJTWlo8ki1koppNSxTBBeX2kWmNqwRsutuOiJ0ZWHNorIJGYFp3K6mU1aGZZppZkAhl2ESsb5Blbpf3aGTPlIh1wZqLRYl25RB6GfsON1jH0FcPHegTKN5ADmCuqQeOtWsWO/ecnX7McOJJ0v6nOHhoOp2HR5n7bBrWpjVfwR5qIm9WVM5ySjDwli4BefmWjRqYfPgVqKWNPvvbC8zxazL/YuKBCB43HgCmmka++G2Pdr7F0Mqirc+2By2awpDxyMzjMiYP7qZtRwrJj3TG6EkHyeAldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZTXbyicQ0RTvinW28ztrT+FUfuc9982H8TUD1xDZ7c=;
 b=qxFdIJ23UWdSS/L9QN9kEmdcgfnZdGdJEpL6F6UYvxns0f0pjrC8ZzhqvUo4eY+Lgy353B0thMI2qOjvhBV/gSXcDUPKPnmDBFNkMoI73dtLZaYfWImXTn6xVDYbKaxzGpr91NAS3sxEqwsErgLCXgMms6MfopFmo7Ssr9MrAWy1kBE047JteqIelfkCesiesQbRJL+3FMXS6jBxgQMWdrmzh7AtaDK0J/nnjEitUTbnVNPCKengmqG1K/TDhc/H9uJS/UuifWPrbq/i4r/4C5Sc1pcORVLePFSaJacpre6JHOq5QMnuAe1sVtAERFebrmVJU9v5oGb/CsLXVrUiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZTXbyicQ0RTvinW28ztrT+FUfuc9982H8TUD1xDZ7c=;
 b=gUj1TLj8HFrGaIDzGMUAd2AFwx2Y707nFkmfHY9OEu3YqzFbm2tX9YjDVhEjLrsNzXDMvRY922g47q8Top+stIQZzW9DcePEzSv3OyKc7kvEwJmkV+t5pnF9JtYJ7SwYtda85vPrwu4KNP/jYorzP77bkAi5ZgzIVaREMlz/Tzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY4PR01MB17884.jpnprd01.prod.outlook.com (2603:1096:405:34b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 23:52:34 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%3]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 23:52:34 +0000
Message-ID: <87eco3aa7x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Linux-DT <devicetree@vger.kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] mailbox: renesas: Support MFIS mailbox driver
In-Reply-To: <CAL_Jsq+sJrFcAu3AZ7jhL9kUMTBOWOfeirVRdbTcgELtZDus0A@mail.gmail.com>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
	<87ldkvsl1k.wl-kuninori.morimoto.gx@renesas.com>
	<CAL_Jsq+sJrFcAu3AZ7jhL9kUMTBOWOfeirVRdbTcgELtZDus0A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Jan 2026 23:52:34 +0000
X-ClientProxiedBy: TYXPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:403:a::25) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY4PR01MB17884:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f57c7c4-7e6c-4cb1-3ee0-08de4cb57f76
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XIqUF+vXDALsZVx8MlJpHJOsuzKOyysIg/fmuVEej5FNwigjK3TwiNoqJ4kn?=
 =?us-ascii?Q?a/jJdrhe6/436JAC/rUZNLA+87V30xIR0RjNAZuypLkcpG3bfEu+Q3Aasb1p?=
 =?us-ascii?Q?ZUmv7yK7B9MCGDOI7gjYXUBTQLOgaGJXrP7tcXIgSyr9dhL5gUWSiMYdYaa0?=
 =?us-ascii?Q?2pmoJWiJekc4U33l3ItX58IgRotKMmMTmghM4rWFkta6xbzWuVAuLK4wD87n?=
 =?us-ascii?Q?Y1elgDlOJohzlCT+NW+tuIBJb6rycUj22Di5hDXarh234sR6nvE7Y+WK5rWb?=
 =?us-ascii?Q?6s+QrzFckFE3NzTHcsnuTAlBCrtsXEyksiMJ6qDmrRpHqcIyQeaQLJf5Rula?=
 =?us-ascii?Q?NNuK/HFCCPAZZV7oaOwllgnhdZJJp3pz8h1Y6Gzl4oaf0CJJS+m1bMyNd7e5?=
 =?us-ascii?Q?3u5T8meJ9xGk/UMPcdC5muuo0RfZQe+vEVWkWRTBa3PrE2epNawtMggLogvn?=
 =?us-ascii?Q?0pVUMWPY73dj9ClJdp4KKfpAGuDaMqaYFqTiUCCCY7uVm/ztszd/JqoMZlM6?=
 =?us-ascii?Q?8eaxNUhTuNyZOFGLyabppabCs0pwip6/B5DtOlv+vhd0G/PuB8TuVCYDB0UQ?=
 =?us-ascii?Q?YpkBRXoHCBos40gfrNmkme3GGoWmEQGiwr/E6F5S14K/cCROEwELb8LApKaB?=
 =?us-ascii?Q?qtRX2LopdvaKpQ5NJdoikjYNr33KoyTCisLSKrmutg6k9rog0p43aGQ60Eq4?=
 =?us-ascii?Q?wl/xa/mR2C/v4YxYyIMtzgpzdwFrHqImGxtQBPkXmBRC2IkepQj3GfeipknS?=
 =?us-ascii?Q?EaCWxujnJYFgmLv7Gjrg+JlEslPLn33mQjTItwWbcftVnlRr9mujnLO/wnwo?=
 =?us-ascii?Q?MjEx4u1hdeyZqSSpHQquGpoaTAryPpE/+4tFccD/VPAN4BiTirkFAfOO2fid?=
 =?us-ascii?Q?xhvuqSV9nJag95N96LfdX1rauW1xUmnI44Oti8LPot3+tKh2rj1Z3UROHnGI?=
 =?us-ascii?Q?SAdljhNFKcGxiINR+06mr3oQLItZ5xaNzJm721PZAggnBwN+uN8UOnZNnKNy?=
 =?us-ascii?Q?9h+hL/JBKRoeuJq4HhcGIZpzmiw/FVQxDbE5fa9oN+wVpZftaw3KdlfqsjDe?=
 =?us-ascii?Q?hRGiD7vu46KYl6JUvwWGoA9SpDbr95pNQIyXcq7cjLYGQZi+Ba7+i4x8B+xL?=
 =?us-ascii?Q?7mvNpWoRJZ/r2v8M8rK5gzNu5xxTs6Jk/0l1xPCh3h9zF2zQfgW5eG1F7u2p?=
 =?us-ascii?Q?8pYVD83zkLJHcYOVOdG7NMNigG7DdTy5EopBSlfOn2FKWmTIB2tyvt8f6DBd?=
 =?us-ascii?Q?u7ldKzbYwh+5DZhoT9w8pl6CYEWLCk3S4dvqsC/UJmAovK7IhuFO7cnCpEpz?=
 =?us-ascii?Q?tOkaE3ev2LX0/RPy/IlpVKOkeI4RFWibTNyviRXiJfZNRvidJI9A0SsdjdG5?=
 =?us-ascii?Q?uxJWR5oRCh91SBXoGy5ZHEdmuMA+bobA/CpmpJ5VNu9nSIYMlNAfD1duzPUI?=
 =?us-ascii?Q?vB9v864OasXtdbrZOeQSKQ0hhK7Ul2Fc97M6IvzQb+Z2Fw0UOGkekvkdCLXr?=
 =?us-ascii?Q?rGcywGtK9TtK2vNnKHDe8Ve4PcKU35UPru6s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8IoZw6h/wKpF8eVM8qk2eLfCEPkjaBSUM37BgdshpF1Ovg4NP9q9LdQNFGSz?=
 =?us-ascii?Q?hXPTr835JzN2nUxhZ7HwgDNsGgBXc1sY6e867uGFGfV0pTnl+kGpQjDBdw9w?=
 =?us-ascii?Q?oJxZMZKIM6MB0IJARBcxb3p0y5qElBkOQ0wLxGa/gflmRXsuXoIKn4gDrXzV?=
 =?us-ascii?Q?UhMNY2YSVj28wowWTnNifO7d/BAMry9U3NYcI7naLctPKg2no4gu1FZrjzNf?=
 =?us-ascii?Q?Hubw2rBr9mh2rkm5ngcRZg7UtoiENBdALmYgGz81nu08vcEd20X1YC2PR3hK?=
 =?us-ascii?Q?mq4iXMk+FWsfdY0R+ul8o62HGtszii5iUUuKIAYUrj5w8gL6KeTMdhMMl61a?=
 =?us-ascii?Q?WphWMl4q5E5BSr1/2bchwUPU/O/MsKepns88h7mMqzABOeYXysrccwbMUvX2?=
 =?us-ascii?Q?J8k5+E/5dxOm12mAddYGY7y6uCrW6gT1j274etBvUz5nzKu7Hhst9Qcx9cqJ?=
 =?us-ascii?Q?kE5e1JcBe9i//UTFmPml+YMQIF7ZbjoQRuNjFwKmI69tIA9EVad+1m+m0+qQ?=
 =?us-ascii?Q?H4asBMvLiQav7o2GfwCVsXrrwzUOORLWiPz6ZtqHtiQrRAGQM9YR8XxiUlV8?=
 =?us-ascii?Q?iLjTfSg1pCR2gJnmZZe3Pbc7THw+hrtrHNmFtz0yvHdLATMymP81Z9hGVBDl?=
 =?us-ascii?Q?G5XTQlJ3LOOIWVex/d15fU7KWpOvqEqUS4uD9ooJGR3uiLtNwgdBBVyjkFKv?=
 =?us-ascii?Q?pTqTgpgq0PJKU6FdVSLpv4pXqPJYIHlh1h/SIkxmmTs2WJh7g5cUV66XWe3f?=
 =?us-ascii?Q?BSGNQbNatCNOqlclf8uufYXqoQoae7dpPcB2WJHwVH3EXE959Oj92N9YmTZF?=
 =?us-ascii?Q?LdfeqHYD1mf8ccGYgDzIR6QkgCtsXcYI7r6nQS3lq6DvW+hHdUnYtc73XVt0?=
 =?us-ascii?Q?KzZjabGRTc67pIdf0tbVDtcSIl6qihTn/3SuWyeu84BQSTFRAkvg7wqafvQ3?=
 =?us-ascii?Q?EvgUu0nb/ljpD8zfRuNloaC6N2jcjYoHp4jnIEOsPHHGYAxPyO2CTJU+3YJS?=
 =?us-ascii?Q?4reDG7/vfApCcCGwnkQIrnnmPhr93FVk0IrQ1WnW48rzOIiHUGyFBiRpTnbA?=
 =?us-ascii?Q?VNVfLAylT5Qhh+lt+DqMbIwq5pSk4HM3gSawdwJxGW1cj4wvTDUU6LoONDrq?=
 =?us-ascii?Q?mJwHISdsoevY6wSegceuZRhLmqqnQQbWyfr+fqN9DOhd7tkvsgjcS5xQvRXt?=
 =?us-ascii?Q?1fqIJ6g3RcQ2iND9R9Q1RW4eY8Uap6Of+QMowaS4IN53vEc0v89ObVKkicvD?=
 =?us-ascii?Q?FMJvqsymSlcXqb45PNQFeitpWNvHPKybfkxZm8pLUpTZkvU9sI6/bWGujfnB?=
 =?us-ascii?Q?VUUCfly+n7gXLGn5+bQtxemc4bA17KLI2asSxMazkH9Ish35sUij4kbl0+5d?=
 =?us-ascii?Q?LUYEQV4ILgHDh0dNyHU2UeWKs7x9k4uEbqxMgeNo6a7UzHogtIw24JqP254K?=
 =?us-ascii?Q?KOadz9nQfYTngmklpIl2CjD9QKtA5mrVvTOSMkSm0QDB7/gqMui1adsbrZk8?=
 =?us-ascii?Q?+NEGiBtQNCOD5XHemuclUQ5Oc//BruzSd06Xtv1XMRKk9giBFLk2jaXFktL2?=
 =?us-ascii?Q?Y7M7RjbfYkRFhKZ60ksngFh/uome/4sLnFlmhvt7gj9MFNOC7iNjf6CqqoJi?=
 =?us-ascii?Q?7FBcDfjJRsvuq5A/bFLx3goefNKSObxlDU2a3PXvMRvFOegrMxzRhDzSFbdT?=
 =?us-ascii?Q?zzheMQya75tdjwCugleVt7PH5jB5L1uwaHf1rUQXtHkVexTb3luHrf7B2pQw?=
 =?us-ascii?Q?aZv2unlCdWjp2Z3LXOxUaYOTcT2PcqVnQQUXxCJAM2lg+Dn8x8wz?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f57c7c4-7e6c-4cb1-3ee0-08de4cb57f76
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 23:52:34.5902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG5tFN1nw73YRr6ODHXQGgUEnuVRJxX3VBUkSJ0yi7sdtsMemNGGtZszHx2l+bdKTKQkCyRcR7baDUBfUwCYZa0Iwz0Orbfj4/vN+WiAfDXfAo4XfqdlyyRHV/x1frRA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17884


Hi Rob, Jassi, Wolfram

> > Add Renesas MFIS mailbox driver for R8A78000 (X5H)
> >
> > Signed-off-by: Masashi Ozaki <masashi.ozaki.te@renesas.com>
> > Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  drivers/mailbox/Kconfig             |   9 ++
> >  drivers/mailbox/Makefile            |   2 +
> >  drivers/mailbox/rcar-mfis-mailbox.c | 168 ++++++++++++++++++++++++++++
> >  3 files changed, 179 insertions(+)
> >  create mode 100644 drivers/mailbox/rcar-mfis-mailbox.c
> 
> Seems this was applied even though there were review comments on the
> driver and binding (affecting the driver)? And the binding was not
> applied, so now there's a new undocumented compatible.

Thank you for pointing this.
I have also thought that v2 patch-set was ignored/rejected because it got
many reviews...

After posting v2, I have talked with Renesas member and now we are thinking
that this driver style should be changed/updated to based on MFD driver.
Wolfram is developping it now.
So I will post new version/style of it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

