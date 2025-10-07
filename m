Return-Path: <linux-renesas-soc+bounces-22737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE6BC0733
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 09:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EF5C33417AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 07:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BBAAD4B;
	Tue,  7 Oct 2025 07:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PylPPPwV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF4121FF48;
	Tue,  7 Oct 2025 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759820543; cv=fail; b=NS3GzKkks38vClqmWIvsppmAEcRigonNfDLQCjCQxjUKCSrh1gOC183C2kJXKBNo6xNuDPFeqEXEWvtw17KSFSo2ekAKkA8JwibJLks0yD/znRCg0mWgkWcMLnhCd134p4qdO00S2jbIGoQ5mxkT8TCchLbtpkeEwihV/M69cOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759820543; c=relaxed/simple;
	bh=ZfFebYGtFTsfuPFs093aYv3xibbJpDKNNak2DosUwiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rz5Q5P2yKSbgK/OEq3879XjTYWR7Cn40C7ZoA3hIUbEZYsa/73Q5FFNFIz/ra79E6NHk6Mla8SogcDHF6eRudjK+ZHakMkUXBasaqEDni4wZkvC9xdpBNSM0qPCGrdMPBRHuNcIALUDViqfK7LqQit2hz37fcXkiGFoe6KWxiTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PylPPPwV; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zh1XJINFfltLGpsjyx5pCIqDd5S56v5D39anK9+t1xAqtnSxfvCDvZfa7W59BHjU/zBR6K/8BjtFZafA9puTP6nL2cK6QaAFAjPh2TEygWJaGPRkqMd0g7n4ZE+mDLECNFekXN/j829FzwH4YNeJuC5IJHkW31pox2kw1tsOrjIaVUWUjNa3R1L23H/pnxa4lj+0s0KFJ0khUsOJG4FWC860HylZS8/TetYRyxi6EmW4+LclpcOsi82OclhGxBA/Rp1K2zDvM8HFE5H0BYz0aNRI2z75vH6IzBXCNCTZHNmQxxp6OXxD6EfdGNR3BgPx/giGo7na4Zlnf2zCGRUhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIUnaeooM6rYhuFUyeVm/zgwtEassI0/GSehj2rSm4k=;
 b=q8t8t1CJn5C8kdm9da448eGBjmHLIAO5GEgApStoHBQzUw61J6Eruu3EmdX+u1Tqm3wctWQt+ljUXsAK7P+QwWWDAHCLW0UD4u8bZTFSXfd7ZANEkgh6vE47d+i4m4AAElqooyq/kI0b/9B14OuZ4F5ARpnP2NnGboxff+7uEB2yw0OfmPrMGYSLnMYgqsXP4gV/8jVwS+NHJMnUuG2rr/t2YNnOtpyE64bi9me437jE5/SZDsCdP45wd4CbGzqtymkvH9FmSYPuhwMFxXGw5SNcXEU1pzKuCzhAqI77Xt8S8tCQ/1G0wTwOgnNhNfdl9o3kWMoIl4LYFNsSlnBp0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIUnaeooM6rYhuFUyeVm/zgwtEassI0/GSehj2rSm4k=;
 b=PylPPPwVCBS+PObnGfhYK2y+jzyjivLqQv0Hs8uCOL5F4RNikhK1BTE32N6dOZqhpSo+xHTVpyxV3SO0y4Jvz3Pvn3noIQTquezRwjMUsN8gjWFS3adFfyiaz9Ul1Y/iQUmExyafJkaSlk7AdxDaiENWlRJ0BIjRI0zpkbaAi2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB15570.jpnprd01.prod.outlook.com (2603:1096:405:28c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Tue, 7 Oct
 2025 07:02:14 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9203.007; Tue, 7 Oct 2025
 07:02:14 +0000
Date: Tue, 7 Oct 2025 09:01:57 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/18] reset: rzv2h-usb2phy: Simplify pm_runtime driver
 handling
Message-ID: <aOS65YC8blClFPE-@tom-desktop>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
 <20251001212709.579080-4-tommaso.merciai.xr@bp.renesas.com>
 <c3e1e3da577de1370e7604560f0b42c0fcb7db44.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3e1e3da577de1370e7604560f0b42c0fcb7db44.camel@pengutronix.de>
X-ClientProxiedBy: FR0P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB15570:EE_
X-MS-Office365-Filtering-Correlation-Id: f09d0da6-a377-4098-898d-08de056f7179
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VTJYPAAY3OZZxBFsFBy7QpI3zcLz9i78fXqrbtR5amq9NTV/QSCLIQ5XCoGv?=
 =?us-ascii?Q?XF1hGsbfnZgVOYdWLkAGxLxRPbhTifQOioy//f6Xb3AZ2vASjg8MWwb6r6vo?=
 =?us-ascii?Q?qAyKDKVol1fV7EmoYSl7MTU1D5Ko0tvSWBXHVL6Ftk0khiz0qO18+Vqcn1Ur?=
 =?us-ascii?Q?2b9xR6ZVpKtvcovf5QD52JnXWWeyD3JdswfdEhnbVdayiBEUBIW5YUjdp1Pk?=
 =?us-ascii?Q?7DG4VQ83cZHJ9aHp12GsjiHncmtGdeCGTJ//oJo9Sfvya/uuEd5VvQ1MqCSG?=
 =?us-ascii?Q?K5sYHNzFXFX7kKjlhFdHZWs3GKhsI8x6rKNCf3bEFRI5EC/QuES4oSa/ffF0?=
 =?us-ascii?Q?KA9Gfke6NQIzJF/UZMm+cYHsowP7dOoFgNU2hoNhsKaxkqwQiqgcFOfDirgd?=
 =?us-ascii?Q?Vrk3neT0guxtWVW+yQFtaUN6roR9erLpT8dU9VLe/VhqzHxIOJkFZAWHyHWD?=
 =?us-ascii?Q?tDgFeGFcOVhdmzTWCP3UF3YePN74G3TPiSABC+O/BcH1kvCKw9MRur93Ope8?=
 =?us-ascii?Q?vWANNtUdktay3BKDsLYwfXwlEaCVWhaBd75TY5TfP6H3s0Zds2fWhQmjAXmC?=
 =?us-ascii?Q?ie+HxGxcLUxIwPS/haXfM2m/JUbqLSK//n5i13ZNbecXTgMDBeHobulID2XX?=
 =?us-ascii?Q?LiUmuBKXhrQLDKmVHaajMLlOjSQ3aOdGYlMLC2Aj9Wl/ljnebylsFyrUljAU?=
 =?us-ascii?Q?1FTuPP7UyaFSbXyKU1fRTThtbzfNLd5vDSLw/FlgxYef4DwKmUMwH67A0Ymo?=
 =?us-ascii?Q?Rl8Wi2g25kbsAMiP3gWXwhjyj2I2FEtcl/CNeFlkvRIsPPyyvcgObGgpp+Lr?=
 =?us-ascii?Q?o9X9Q6dksIA56zrNScA6etOK5BVzAWzl5JDMiCXNIfJ/+B2uNx3O9bLsDDh8?=
 =?us-ascii?Q?3S1G/FiaocCrwecle1HiyS2viBjNbO3taNTZHLIhjz8R6tEyAdov0tZoA5GP?=
 =?us-ascii?Q?c8i48ISW9u7lTnqQ6CROe3VtPxFaU1BsztddPmUeciitUe3AA1R2SOApwPNO?=
 =?us-ascii?Q?rBA+xQy80yefmu7HVBr1OcfdPsmajQ6cNc5oebXGlsHwGuuWBdzMCNlGzOtn?=
 =?us-ascii?Q?t0pJgPf7hfZ1DmukcqbTycmW8uNAR85LGdZHs/Czdzl83Pdn508ZQA1Kfcvb?=
 =?us-ascii?Q?U5suwckAoWhnurADipE8m0jNfADNy2qaIMotDQ3nULDv+1qpsglfjPmPCoBF?=
 =?us-ascii?Q?J9yCy/QpZD/c+QNmIWqyPQXOMCqm4KNAXNEWJoywcPoM+XgNxxaQFMOnpyiV?=
 =?us-ascii?Q?H85e9yE0Qvkj7gHN8o49TKEDbktI25xhbql0He69MTOA6bZsASQYrL4pU1ps?=
 =?us-ascii?Q?A+C2iGmTlrkcbc+xVgNEUYrEedk6+w9BBA5z5Y/8h4eIT33t3oYDIF3WJvxB?=
 =?us-ascii?Q?PYGJn+/S4UB8HzqIwQQwucI7gToxE7uWykkCyklzv6oj8NYhWEQslb6eJAWJ?=
 =?us-ascii?Q?ZpJX3rDdTyYiXXu5anWYxeW94ulYm16FCqvJAOCoB9CbU1R1UqibvoR5XXjR?=
 =?us-ascii?Q?/2NR/7AoA4fLWNtWe38Mq5fr/Lhv5aOB+MXO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V3e1mTYe5mothYkaeVIoU0EZh0A8YF9CVoum9VlRwMxJuANDOYBx8W01VUs+?=
 =?us-ascii?Q?6u16IhqBW/IB2lI/rvCqfTJkdTREzXOHrs1mFCFQ4ndhjk35pZYgnxtlpwNQ?=
 =?us-ascii?Q?cJXjzRfFRz+8GK5PMTreQ0zrN7j6Of/yqzhgb8XPyeb61Id8CPML+DLY3egf?=
 =?us-ascii?Q?8MrTBjctH8P4HngAUaY+PPmj9TacjUAIkaTJx+UCQovqSDJPV21N2o8LqENU?=
 =?us-ascii?Q?qlo0dkV93AbjwmsK3sLC/0xL3KmkjmXr7U3Ghgm3jdkz+Lq7JBQr2tyysYLN?=
 =?us-ascii?Q?juYVteCtD7S8CBNpXoPUpMxiag6+QKV82c4qTwjW8vNH3Bt+lfsDlXWfjJV5?=
 =?us-ascii?Q?rFRK8tUuQhIP5ozvafX4p4ab8ElnNwdLmiqrX4jgPxdggmd2Q/ISgEI2K+0V?=
 =?us-ascii?Q?YwmfOssl2huxVOjf6zlbCFbUxgjsIAExlusnMzL5jx0H9WNwWLWuUQCym3uq?=
 =?us-ascii?Q?EgHXV31OsClEyZpW3ABqWfDLj2t9uBH2HOsHBaCexbHEW3HdM9/il508fBfj?=
 =?us-ascii?Q?Y/QZIrjpY+uPk+REdnwhefirRMBUPLQDrhb6JTOq0oLmcofuAwyN0ggOvvwR?=
 =?us-ascii?Q?UH/HUy7fDfhd+ttwDnMZYc5D8ldnYuqDfKb/Su4XW6X9zhrJlRCbqhCy2B3v?=
 =?us-ascii?Q?UnGkhghzlUiDgO8zbERJjQ8D/TpYRRjPBx0iKEnbO9AE1ofeFe5Kw8l8nNTA?=
 =?us-ascii?Q?EMIXJ5Z041McVi4QKeY5scpAjEJQM/S56wGVtoWW1LMWFdwRAmAfPiOlyUM4?=
 =?us-ascii?Q?pthqO7FCSE/pwYq1ciCu34svt5WodsFRAfXjMfMareNVeqZnmLDg2iVL2Yf+?=
 =?us-ascii?Q?nRO0cZ+aGRPGXQE9aMuvKVgKL7HBWzQr5ZwYFUux4B7rGZlCcoBmjFGfLVCE?=
 =?us-ascii?Q?JBhpVUhfQQ14lU1PpATOcj12bQdmispKaWc2p6ZirIeFfhe/Q2Vbdibjqsjg?=
 =?us-ascii?Q?cfvvYkz+W+Htbdpvc29Mc3ws15IEMftQrfEnwlpxEwQliPxGJonNH2JFSdTR?=
 =?us-ascii?Q?D73kSu2Rs+4Y06svfYYHuc6Zsh/kANG+AYb8MfKZFVQhyVqeRKhlb4oatRpZ?=
 =?us-ascii?Q?q1GAuzepSN+8d5B3oRPKSCMAXle6784XTiuRiKRHz1RCWC1HUvBsdkfhSbJN?=
 =?us-ascii?Q?XWlyBBpR2zrM8SSSW5Iv0vqeLAhcn+zzkX1D4foqdpq4yBRuW3FvwMq5vxLB?=
 =?us-ascii?Q?uITx8YZj+hXRVqSZGQwtjGdQnijCOXdajpt5NQSXfNs0jSfhQEVr6gdufetA?=
 =?us-ascii?Q?0lKyGAx+pecb4z1fCTAIN5aUGbhw7z6po40Is+h0yuFC/Gw81PQZqdcaVtS1?=
 =?us-ascii?Q?GWeAOMvjgMg7+Y3YjL0VrcHdooNkwTLV2X04Zo627VMdfjngAH3qX4mRBEwL?=
 =?us-ascii?Q?1qsBkO3BFr0ho3WxC4fbGESzrOImIbD/AfEiV1G5omtc010qMt9wIQqazppB?=
 =?us-ascii?Q?ZcL93qyniRlbBrpK0DUVyJ5jde+VwiZ9NEVQxcGIc9ncLRqfMfuO1uP+fTZo?=
 =?us-ascii?Q?MAN6Jb1HukrA7uw6k3UB8XRUn38B7Ug1fFw01jfVfl9hoKOUi3F1qjtj65Kt?=
 =?us-ascii?Q?LpcXmNZbw0mjprfIvDurYQ2DLVqx+x9b1vpk6+KaDYxhdBx1yM761bhWK7wO?=
 =?us-ascii?Q?JN2rV/PuV3WfgHYMwQ9Tkpw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09d0da6-a377-4098-898d-08de056f7179
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 07:02:14.0981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0r/Qy/m3dwwWZnicHqVSFpdkvkgx/Bd9V9YAneeft0Fmh0C+gayH6QesK2UkUV1ZYZRBmZk7w/BIQXSzbnWsEMH067bDcKSw9sUZU50HNLq8X+CBiiZbJDOcR8KjADiv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15570

Hi Philipp,
Thanks for your review.

On Mon, Oct 06, 2025 at 06:21:25PM +0200, Philipp Zabel wrote:
> Hi Tommaso,
> 
> On Mi, 2025-10-01 at 23:26 +0200, Tommaso Merciai wrote:
> > Remove redundant pm_runtime_resume_and_get() and pm_runtime_put() calls
> > from the reset assert, deassert, and status paths.
> 
> These calls are only made redundant by this patch.
> 
> > These paths do not require runtime PM handling, as power management is
> > already taken care of during probe and remove.
> 
> Only since you removed the pm_runtime_put() in
> rzv2h_usb2phy_reset_probe(). It feels like the important part of this
> patch is actually the side note:
> 
> > Additionally, the IP is active only when its clock is enabled.
> > Previously, the clock was being turned off immediately after register
> > configuration, which is incorrect. The code may have appeared to work
> > if another module had incremented the clock usage count, but this
> > behavior is unreliable.
> 
> So this is a reliability fix first and foremost?
> The IP must be active to reliably keep reset lines at the configured
> level?
> 
> If so, please make this clear in the commit subject and description.

The main purpose of this patch is to ensure the USB PHY controller
remain in a proper state by keeping the IP clock enabled and reset
deasserted for the normal operation.

I will make it clear in v2 also adding Fixes tag.

Thanks & Regards,
Tommaso



> 
> regards
> Philipp

