Return-Path: <linux-renesas-soc+bounces-20981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F37B37580
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 01:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 556CC7A3849
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Aug 2025 23:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CB82FABEB;
	Tue, 26 Aug 2025 23:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hfN+BiXV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827D61547D2;
	Tue, 26 Aug 2025 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756250671; cv=fail; b=gq3Hc7BkYcUbn+I2qYJiMkV6S3ohRkAX5dHeNoyP1lGIA7c9n0yybpWR8myJ6091KMw7rI9z04UjmNg0+JYTLnKVaCUnny10OnXYh6G23Q+Qo2WKIo3A8J3H2lqulky+FpKO/6fAeJmx/Urcif73mQfdk/BGjXKzYHH4GUuGuxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756250671; c=relaxed/simple;
	bh=ibS4iKj6Y88JqExISs9kbyySyYzS7NWToyIkT/QYxiA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=JAWdFIzohJ+DQ1iLeK5852AHhIEBoWro2Gc4rNKtaXERRpN2W7yomZjYGTncXCFAFJa2Jf5WJPPdCveb5LsJGyCOE6Y8RoFJoP8SMv6aJS3tBbIp40q8/gpZWxWaWttLoG/igd4ZYJ/6Kx/g75heVPeofrwO5AQNt8rbh/tHFS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hfN+BiXV; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8ZQVfUu1nGPYUNkhOLSc5CSo6xUCOWPp6HPH7m59L5UQZ74jFudD9AkpOOHvojs7P5eh5/dqFjqL1s0O7h5aNpRwe/0KR2UbnMvGQWKTQj1ZF6edOYMcJUVGJQa1al74iYfPqdBW1WcxjGtagL/XBoMVmDDvRHlZ43JU12xAy6gA8GyN9rM1epZJ60tWdaOahlWN9YuGUrIDXyV/17VQcDeyVtTDEvugnzt/Af+sr57eShipfl8mWyE3Gz6sllR6EOA7qhO8Ah4n4QpGKo95hK02IEVXPDbah2H8aIBYR9nhqmT/B+OACDk0d0ba5ysw6qHeaYP4B6IduxydWVBLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WReX2RM2YOiMMruxKGkjftY2KDLUMnp2KzZEalWOcOQ=;
 b=KQZIGdbkq/dqnOkXeKZHvkqvnn/J+Q9paxgq1fE28BLh7hIe53D1t8o2pyW47b65ApAPQSyKlD+y11Bh6ukW/3uMVR154VBFdtqh2spsZ5R6X5uLGyAvmxB+kPGLRDQGnbZFIKaxBlkjyEMsAvvlJ7KInIljIz2VhG930qUnVT1AzwZYbGsQjJo5sHCNqlfcAUFxkk2OHrHLarW+VjSPXJ5/5lcYtJmlsVmQqrM5VcqK9hap9995WCeWOnkHvzb2QZZA6vzRpoAxHtM4/ZhuwO91OQLDftyvtr8udbBv8vwjrv3NiZrW1v+1/zZFtybu6tEG2pRW4sxnk4+D5ZQujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WReX2RM2YOiMMruxKGkjftY2KDLUMnp2KzZEalWOcOQ=;
 b=hfN+BiXVeMRi4evncRDbGsHfY0o+6jCSCX8MwRJdtdNoFymBF97Q955wAo8UCJeoqaOXoLYM40YiNTPRjfg5CN5hJD1XQV+CNDvhQFaHFqSwTLFdQj0+HXNBizf1XnOgp1iKTYl7lvhOyY8R/zh3GZ11MXdG+/eNiLbgMgMJDEg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10410.jpnprd01.prod.outlook.com
 (2603:1096:400:24e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Tue, 26 Aug
 2025 23:24:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9073.010; Tue, 26 Aug 2025
 23:24:26 +0000
Message-ID: <87a53lbr9x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: renesas: Document R-Car X5H
In-Reply-To: <20250826-pelican-facing-971a7bac1cf1@spud>
References: <87cy8jx7yd.wl-kuninori.morimoto.gx@renesas.com>
	<20250826-pelican-facing-971a7bac1cf1@spud>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Aug 2025 23:24:26 +0000
X-ClientProxiedBy: TY4PR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10410:EE_
X-MS-Office365-Filtering-Correlation-Id: 257d03ba-2352-48b9-6b18-08dde4f7b2dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?91cVwvoq3pXT9m6F5bkxcSgCzmvvSanYgYuPX+NQ9BiiHMaex7SURL6QKTfF?=
 =?us-ascii?Q?BQ1q/4ZYIdMxHDBmTCHq+DguzXAfiBWLV19ku+glIvaRkTcE3o+vxzajcLuy?=
 =?us-ascii?Q?SOHaTb6+lmQ+JZAje1oCADn3MhUZO0aH/poOkJsxhPmCJDH+/iPyMXspuMoB?=
 =?us-ascii?Q?Oe6PSuiA4mHLGvo5pQ2JidG805Avo3kRA9a4se8jgaSjX/FY4UZGe/pcrVnM?=
 =?us-ascii?Q?bSWx3x+/eeRyW83DfAdaUzxvJNLv3vOrpEauZPvxu+BgCMN5N1lk1pxAQ87J?=
 =?us-ascii?Q?e4KwRaGii7ZodEv1qGxemK5e8V7S8dKolBpKm323Q+JEnzjthFY+YADyfbL5?=
 =?us-ascii?Q?QVPUjoIxgs8tF9PMgxtF0KvmWaUYAq/hkQgUK44+HpyjsIxVGHw/X7txvgN7?=
 =?us-ascii?Q?Tw27KTUe8VTh3BKg4Bocu/WhO1oszXwunXgCGRVtoZdQ87tmwfJPKV1UXrDo?=
 =?us-ascii?Q?6LyejjNxGS97UfZGxDbgtZsfqOiIYyrr4Rq0UHC53GkgAnH38kjtNJWVcUQW?=
 =?us-ascii?Q?FA0saxdvuCZDB2+E7dvBA52jUjz0eacy0lswhMDji9Wa+yMJ3rue7hhk6rkO?=
 =?us-ascii?Q?tKwfLw+Iod4qElKg4TW/+fOmorZtKJiCo5osUJJJQsS3T8XuTA3dbA3nIgqV?=
 =?us-ascii?Q?TO0od9TaNs+0qnI3y/SQgjpEUsKEof4VahlAjQEo+8xDn+LwNEpvh1ILBE7l?=
 =?us-ascii?Q?W93uiSGmoOokTOaBnaBWZ5eOhwXLHJKLY8+1l3DAzsqZmN40QjM7/wss5uLR?=
 =?us-ascii?Q?gQQ0dwrwFf+3yFBT/R3OLzzd1Nym8WkTG+CkrTUQ+9AGHIXaMxYZKlwBgtbe?=
 =?us-ascii?Q?YOCUUpGQFh04IlYGqlrIHyHPEh5AWgKw2enOpLI+UAKHAOyS74lgeUEQNLMU?=
 =?us-ascii?Q?6esuNTBv998d0wQUNWaTeSee3cLFey6oToev1jh0bj9G0G2NW2yprDu9EE/N?=
 =?us-ascii?Q?nt/e4Ux/VH0zmiAvkFB2cRVuu2aC7FjomFGaYIivTqYpRBOIghugxtEqLVhK?=
 =?us-ascii?Q?0SYlMbBlkyd4DSfkwNp74PmAjLHyeX4wp94reLD5sa85uw+qjivX3cnVenDU?=
 =?us-ascii?Q?DY18ans/6/Ezhspj+1uq8twVztuVwsL5f10+ZxHicqiePe9M0ZUb+gQ2N+IR?=
 =?us-ascii?Q?UFbiLvg2Mm60hxqXqsl5o4pGHt6JpZCDzdYKishaj2SZ4zCJ/fSG1ezIvD0J?=
 =?us-ascii?Q?D6iC8cZUwG77+1lsw6ZrPe5UkUouiO815TV1NEeK+vu9qzjsEtQLlf3Qsoo/?=
 =?us-ascii?Q?wmASoPXXlM2GcyiDEOUyCspR2AbvttgRssyaYRnsTtLzl7aXDntOqghn/LqP?=
 =?us-ascii?Q?bVWzQG9FlkUoCoFXqUPg/vJ410oPMuk9w/fvOfJoqSYlhRBmJZ7fH24NZ+le?=
 =?us-ascii?Q?qNqEtRwtY8v2oAo/efcnASaAsMEt3Y1bLgmW0FQRDf3kshFrGM7/usQ1YEr1?=
 =?us-ascii?Q?fyHsFzbZXDoNTLl/z8lInGFOMOtjrXfhMudc8Pk9ycaECr968q7YdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XTH7qDgivg7RifjkfdtTC0L2HMHCaYe56RkBMPr7d0AIPA+FXh95FzaOgjDW?=
 =?us-ascii?Q?qoIVRD2RhTbf+7eX0gnzhMNVTkBsfTsRMt9uMOZ2aZAp2/o5TUT1NjX5yFej?=
 =?us-ascii?Q?KHFDKf6B5X1XCbAw6A34X8wcyyC3C1oFcvuyT9YtUszw0UtFYZg2yJb3fzW5?=
 =?us-ascii?Q?zge6+S1kVCOgRZ/EX6YgUwjpv0Hw1vd8+pLGZLXd4ETQV13Xn38F9JCcVtqv?=
 =?us-ascii?Q?nDByBi6vvimFCWS2QcOr2CF6cYbeS8y52/g3I63Rneu75fLJPTyTqWQJY7DQ?=
 =?us-ascii?Q?Dz2MYqgGCOlhFvaTlZNz6wrNPIXQls6VVH9/fGYqp4oRC8AvFmasOvihMbsL?=
 =?us-ascii?Q?xA9z95XDW+C0ZBCJBX5aRoRV6iOJHXAOYTCrPmludA75GoDgaUaO8xXLbKN4?=
 =?us-ascii?Q?Qz5EBPJ92SQjx+HvDZyf6Q1q6e//izhyb+OreNdGRFBdy7rDIGNy4gQ8XzLO?=
 =?us-ascii?Q?zGUNT8lskYgCtwBmg3IB1AsHS561UtMdPn9Ri0jcFTweVQyYgpmzMGdtPMr1?=
 =?us-ascii?Q?Z/neBKlbspIlxmgtzHniDgTqEqvx03aFFimUF+kazTMlUjvFNo4CQSi7dSnN?=
 =?us-ascii?Q?vtd9rbOoTRbXY8g8LWthYLFeccc8uH5cwDLOULAB5Zm5Y+FbGGaGT9Rgr0uw?=
 =?us-ascii?Q?w4q5Xk82QvQvTuMlAlH32emdNw2ocjXuLXy0/Gi21S6QuL1gCQe3NUtlSFfW?=
 =?us-ascii?Q?ugOfOSUy4D1OEoErbt4Oq0JT3BsaGZeaFwnUUhRCVU8tKVQe5tl637ogICJ1?=
 =?us-ascii?Q?/eZPLE/KW1Fobsxk85rK6oWoD6XRFccUcmmaAEgG4NVp5nf2wjnVvo1ctQDP?=
 =?us-ascii?Q?mfZyK3ONzBpf5vmeWDz1NVQtglUZWYBAHkgQAfpwI5BNh2TtA4sPQ0dztSJf?=
 =?us-ascii?Q?/1DPt8RM8EQjySlyfdQ+PtzPQw1or54kRU2cNSps1ow6/35rKvMeR8uaWGRE?=
 =?us-ascii?Q?5whDqEpHKE4gmzdX2CBvYh7s7coThqUQxym9Ks8+4IJU+163ehbm26xC9tSR?=
 =?us-ascii?Q?gpPnyC2r+onBDHtaffgrowY4moyp+tz2Eko/6Ro9zI/59BJVqIPtqapp6UOh?=
 =?us-ascii?Q?cj6Hr2N2r4DoR0ugaZoeCTlLp1088P79MKZllkCDXYK73iMdrkUjgnrIHE7t?=
 =?us-ascii?Q?Drx0qZzSWkILCx2Kesm1UXt0qQ5Ra3EX9JrJLusDNL1JwhnMUFvRjWyTBbAt?=
 =?us-ascii?Q?dGaf1H9W7okzOCEU1abpdwLWqh6BdePcQOknELIydsZhC+9lBb5FVWVTzqJF?=
 =?us-ascii?Q?Qc07JnKMX7vIgoeZb9Bd44vIOO5jQ6uV7TvaEh0SVNb+cX9nsMfIEMAJpnkq?=
 =?us-ascii?Q?M57uNw7iehcreLNk3JhPJMaypdjnaVVETMKw1RMGfozOhQojzCEy6dLGRx03?=
 =?us-ascii?Q?+ZY4ik850BntH60ouNefjDi6kzbmB5fnSXa19USvMY8X1NqQl1tVwDKMXjzj?=
 =?us-ascii?Q?vCyYnm49UOtjoOvcrcE8voU9Ewf9+gwkTc8zDR8SjUOhkxogHtJkmdIzvwzc?=
 =?us-ascii?Q?60fRuEy6yK7jhzMeFEHzrp8xTGUZxPMCONpJSe0w5d+bYvx+Us7SvOhnPuVz?=
 =?us-ascii?Q?GFYUIcD7bZQbqhrPxHItyq1p9Tg7TqrhFwHY4IhSIy+FaJNhOOEZyER0sYO3?=
 =?us-ascii?Q?oT0h30zgWYiyAVq/Pw6G3S4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257d03ba-2352-48b9-6b18-08dde4f7b2dc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 23:24:26.6608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eKjt/SXgmg+AV3dsS7s81I0u1hlzYIEwqF22ozwNfzYczuS8SN9Tu3MoHf5BJKyxW10TpO9WwDLLEHlKIH9NBjUCeO3TWTHVamahHer5963KS42IJAL0g2I3FUb0zNh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10410


Hi Conor

Thank you for your feedback

> > I have been mentioned that I will post DT-Doc when I post board
> > support patch, but I think it will be postponeed.
> > So I will post SoC part now.
> 
> What's the value in posting it alone, if it requires a board to be
> actually used?
(snip)
> > +      - description: R-Car X5H (R8A78000)
> > +        items:
> > +          - const: renesas,r8a78000

I have already posted the patch which introduce "renesas,r8a78000".
Kernel will have DT check error/warning without this patch.

Board support patch will be posted if these were accepted (and ready
to post).

Thank you for your help !!

Best regards
---
Kuninori Morimoto

