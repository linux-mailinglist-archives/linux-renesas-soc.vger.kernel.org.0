Return-Path: <linux-renesas-soc+bounces-14942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C2A741C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 01:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B721188ACB7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 00:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0CE195FE8;
	Fri, 28 Mar 2025 00:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AZ53U4eh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DCB19342F;
	Fri, 28 Mar 2025 00:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743122415; cv=fail; b=EcFiZdFuUMM7CWALDg3BAx1LVgEEn7TEaGeHnMfsJhcmQ4X1Kz9SHLDjnbm0+NhACwJ5eufHBdpZsbwxdoHTIaxzC1RWtFvXY1Yn133zl/+87rVHR9uwxuoTnRO7y2TZs2XSR6bL0SScHM82Qh5TZl3lR9BOyFBqnEINWs5jAjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743122415; c=relaxed/simple;
	bh=2jTAzIUFI9c9glKM56Bv5GaIUwbsKdNaZTlSKZ2AGg4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iS8mrVLaVck5IbMBdG+HD18NpZV0aY17gI+20c6cGTIYNL18HhekGVAHaB5E6rWD+Y2UXbelooMeOAu3gsYaiaGIg3gwA1BVCJTdgRRofcrEsNbyizmF+VOW7/3lzysJ/JulrbSTRPqac7msdBBhSvrIO/O+lkKwmOIIiryUA/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AZ53U4eh; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUWZBzPbviV+Z08xg1wDdv0RRR9colr4vdB/nxtmZrM0s9Pwldn6cBTIQOzju48GPMrc+JLQl0HOUMlhmuWh+kyhQmCPrgISZsFZ2ovStUAIY/35Jt0OrCJ6tqMumfj0jBoFaPCQP5l644b99MHfqINBVU49gVQqLePvtmcjYfj2NLoIbdjFVmm3CENazkbcGO6lsdW99CwvbRJlotCkszRdbDooZnLRmvxH+tnYX52CSQNdgI5JQv70cei+BL2uDa7WvZXLNor0zrbg6mcY/osoSWM6MzxZra8BM9D04O/JcbLeUqNoABHP/qN8iyLIC3QA9rfsf2BBLkGGXt7XhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB1y+6rEK1sfsq9sQRul2vx1dcwSkAYJRjGki98xQoY=;
 b=Y8mNniXkJhuUF2psXOnCZIPNYmC+W+RAsiEi9Cph9lrSh+zApnvK2GXJRe9Gvly5kRl9Rl4VNgLXMb/1x2QF8RdpGUAsUlENAoRAZmzIyoGH2Sj+cEbT0b94Vr23AgmZ5ebdGVjHqPb7jj1AijyHyfiVVIzFhv83GQWCCdybsC9LHE0WND2GT3mOjL4Kw5SFBvqqmJ11foZxKKpCVh3JwnnrGszymWKHWCPGVLwPtQEJqK3tryoNiRzUK8OUBdY+97k8VZZFcWSO6IVD7p8fp36tSSzJwZrKaS7HwyGJNfPzdTy+bAhm/OinuBOP9LJA6E06wXrh9bYRQqCIQQHrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gB1y+6rEK1sfsq9sQRul2vx1dcwSkAYJRjGki98xQoY=;
 b=AZ53U4ehXzFrQrj16b/hqfGJ+0nBEP99OYaoWgXP9a1mPKHgCfBgxcb2HwH+AqB/Id8oza9Q438EqXltiCGSWcoTGakkkSNCjqgxMY39yXzBYxCjMFuu9P1ZQ6J29BRLz5zZeZLQEDERPobQQJ4XAkUIORUtenjcADk+zJkCddQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8351.jpnprd01.prod.outlook.com
 (2603:1096:604:192::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 00:40:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 00:40:10 +0000
Message-ID: <87zfh6yoly.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] usb: renesas_usbhs: Reorder clock handling and power management in probe
In-Reply-To: <20250327120737.230041-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20250327120737.230041-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Mar 2025 00:40:09 +0000
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 9437ea68-a3c6-4d6e-f946-08dd6d91182f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lrGbR/qGrazQopbAsAAUAMOiJZBCjx0zM1et0Y8gk7Se3k18m9uTgpYpY6pF?=
 =?us-ascii?Q?5t5bvHXeZKYFxiBfhfkOW0onASTaCYKVzKpvMghGKIlEKF/ivg9HEJWS06jx?=
 =?us-ascii?Q?F6jbA+GGbehCb2WhUzN3lcE4Rn3wHsS4wTBuCbr7l7wIw7+2EZk7dkDVev7v?=
 =?us-ascii?Q?lrmIS53KQtbHkKLR5aSn6X6N0s2OmA8zD1h+1R+kn84tLLacafHD0RpZkTXg?=
 =?us-ascii?Q?XQc498r5cLkpEHG156h9xwlwXidg8VEqYgYN2v2rK+4pn/XpWlWJkKy59I9N?=
 =?us-ascii?Q?reNJRzG//2ExZEYwxoVjuVrtIM7yCgb8Qij1OoOkQDLqL512yxyQMVv1uNPb?=
 =?us-ascii?Q?iC81p4G1PdkCTwT7X4i7TbZ/Pj5y7gtdkIP4Wc8oJMM4NTJ5s5LzXrwwEIA/?=
 =?us-ascii?Q?DTwfRGqKY5uX6B1EVZRhoZnaTDblB66Wd39PRT+zWYsLHLgKUJHNRpVM6PUk?=
 =?us-ascii?Q?fAlUUYwggbNMMpKdXgLgMiwR7Q2kdL7HK04MJ/vhcrXI8RbHMMHmAHCgmph6?=
 =?us-ascii?Q?Gu7vpni2ov232R/iKNoanfBSL5qJ0ti8WHRopadjeGYt004diUmjylSR9o1w?=
 =?us-ascii?Q?H9Hs8RhvXTKd9n0OhDNMI9wG5TVkyibalgbaG3qGr0BxpmPZDMsMkwYveVKz?=
 =?us-ascii?Q?VdXpG+/MT9rXmEHwehN3uATpofz1Uzu44uvlBH4VFldScWz79qWMuwVoctN1?=
 =?us-ascii?Q?4vEoEY3SxpqUAHVoO+aa/lAXOvRsa7oy2xqYwSErK8YB9jldJACZUgRLnUvz?=
 =?us-ascii?Q?gdYG1KErRu5C3GRVe++puMJG28RXjLBxidGAiapiaEU0op3BQ8NZ6aQ0gc65?=
 =?us-ascii?Q?LRXCEstHg2XXq+SkVLcWqeGgaypdWLgq/fc1zGhuZHd6vtQaqcDRbJwxm25Q?=
 =?us-ascii?Q?j3YZx66pfLB6Ib5Of16jfVYD2u4wriMscZqdCcR5f2MYuo0SnlsLnrg+Jk/l?=
 =?us-ascii?Q?/Wr/Ss/b2GuDetBtvkOSYv6iUdSDYrbxq6M3HPy47Cg20aN+uMkH0E5rtfAZ?=
 =?us-ascii?Q?gjQFrB0jrUo2VsGk26SduQqECzCKOk+Y6jgsfesCjwGffy+dYSTr69+lWZVf?=
 =?us-ascii?Q?P2VPv3DbwyHY7AoeiD1xEZkB1ZxHcU/PZSVj4VXAMPslgUN/EReSiAG2Srqy?=
 =?us-ascii?Q?bgD7zYQZz/iD9plLG3p6WaiFTjOc9E+Zn7aAGf/Xy69cG9gd2MhFeOewV8e/?=
 =?us-ascii?Q?NP/dpWGNyFnKkBfeNxO7zNGBrI91siwKAahzOGNfQIS1kQTJaPWm4i0adM3O?=
 =?us-ascii?Q?wTKmqkyxCQdY6WBWKRy46YPTKUDhAVubVG/lWfcl3DBHO9CHXILHTBxQLi2/?=
 =?us-ascii?Q?zC+tkvdzMMGR0A1mE9rMxURPt1lWiSgTYy3HoS3Ue1R50+FlHJIOewmBQAaJ?=
 =?us-ascii?Q?su338idzMLK1dwf3Sb4HDd/+qK/lJ1eI2n94k3qpoqwKcSyd1aB2XSbrAlES?=
 =?us-ascii?Q?EwzYWiibEuCdKORAxIAcM2JzMwtSVDQK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NIBlNW7tnENnhushCS3wdyMUNH48kWbmA5sKyItCkBYGMm/EmXyEc86JoQB0?=
 =?us-ascii?Q?xWrCtWC2xEN+tB1wOHogt9J405vls/o584ntTe/yi+lo613IV/Wnug9DEbIK?=
 =?us-ascii?Q?xZVMkdFF6HiK5eCZs1+2Q22himOKkpX4xgg1CK5DkpX3X3EW93H3sD46NBg/?=
 =?us-ascii?Q?a7jDbISKsaLuPgw+VfQvAtW33ENDacByEDYt688HqnC/bdzeh1w/JJp5wlsg?=
 =?us-ascii?Q?gxQrPEy3nFoQ5HmKjUZdHTINNYrLhKJ4RdzlMfIlvMuCB7EtEDejmho9WtZF?=
 =?us-ascii?Q?jg/NvpP0Tr/FODXI3XWixMmVEvJEeNJSFG2rdFqTCX29ZoNB5fx6gKdgbB8R?=
 =?us-ascii?Q?MkoovpVcLCercCZyCoQZiedS9Hp6fMUD7R+h5Whm6onQPvqcHsX3ReEFyLkZ?=
 =?us-ascii?Q?eYpkMwJaP7pUqpGSYoKQe4KYT69EoWSgod5BuoNv62wV5q9zAGOjToVKEQn1?=
 =?us-ascii?Q?PqME5V97MDXfIlodV3cXwlh0s64E/5cx8/JumlgN0ETP+Yc2lWcJA8lc3+9w?=
 =?us-ascii?Q?fVEgQj7KBcG2H7Ac9T0NI9gOa5IliiQuoc0Q6koA08qYmBxXtMicF2jHpVTB?=
 =?us-ascii?Q?NYQ04J0v2h97HPcfwWUWc2NO4idLga+pIxHpItAFEsXHE1w90YWH2y4lSe3a?=
 =?us-ascii?Q?sxlb1BPebeGFjLMJh/53oZFAjvywxQRV9t1o/SNJd73aScYtfR8Hfk7oG3OK?=
 =?us-ascii?Q?YudJTbQhovIL67cQeExQVr1d7I1FgrsCskks4hDA5B2NZX8qUIwq6VYktgUT?=
 =?us-ascii?Q?F+NXsxRNRSjyeE7MN7/5lmgURx42ezH+gqpgEMlbptfhLeN9i7pJgdfeRR19?=
 =?us-ascii?Q?KLXbGn/ZKJMDYafFyljYsep30ERcQGkAVvblXbYkLHBco3l8VaXIMjx/Ov8u?=
 =?us-ascii?Q?4apNmQybz11Jql4yvRa3neTPLZ3H8rTGiaPd/j+KPMeceNR19z2U9ENfpBPw?=
 =?us-ascii?Q?QhGkMEBrYmQzBaMhhgLXukebcDDiE8k9P3HuqBdK+fzC6sUor2R4DEKttqtI?=
 =?us-ascii?Q?ZS1rCReIto6ngu1AcWy2zlStqolMMwvlSuFFPkZdG4P9RK57nvkiT85F/0Cl?=
 =?us-ascii?Q?DasYswgUD0b/Q/GmSPq5442vlgebFSbDmkJPBXHWpgS2/O50MFlu+c+R1eos?=
 =?us-ascii?Q?CmkjMwOYtC4A4nuob3n2kjYTR9Nf85+KBDGd9nbDgzOLPKCFeeFY4bqJZTv0?=
 =?us-ascii?Q?3UmrC7o7/8KCulqFJpOo8B/G5bAiAlGbA72UcYTzz+NukWNfz7eT7f5dIFl5?=
 =?us-ascii?Q?rsfdSYNN+bFcEKvnQoUs5y4nfs7BygqHGSQlo1Tj137yTdxJG6/8BFYBxcnX?=
 =?us-ascii?Q?uF0Z9IBvHUeKAUwN0gEqeM7QRTaLNOzJ1yY+U16Chyk9i1IOhQIxswaLz7Tt?=
 =?us-ascii?Q?2m1mDN3xjcRz6VXpIq/+hU4i0qFzd7tcFngB0ceaTAIS4OW7t4q7zQnWPaGF?=
 =?us-ascii?Q?UpIdUFuZ4l33P3urWfkzRX3TubMT8e5zGyXKvAY566qzfWW22wogy2bB2tbG?=
 =?us-ascii?Q?FBCIxJug4zwXaxqj2r6GviiHu0O1US9D/u5ResA1ojzmpy/pf+M09z2kIfRQ?=
 =?us-ascii?Q?p9wRgvRp+mr4ylgRmUPzb/XgNBqkBj1vo0qjkzzHV3wV5tGZH808N2WX2lyl?=
 =?us-ascii?Q?J09wqHpiU7AS6UqSi9IaGcI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9437ea68-a3c6-4d6e-f946-08dd6d91182f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 00:40:10.1434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cn8G4ljisJ1Fwc4axROf1R6x7ygdEnG2wH7zlE5pG8jYPFvmWVXxzypMJGpyxz88ZZEtDU1rxEtWEqaSOZs6ctTMe2qU/OgZBnXQYpucktYetFnBK3R0dyu8KIUFcnBj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8351


Hi Prabhakark

Thank you for the patch

> Reorder the initialization sequence in `usbhs_probe()` to enable runtime
> PM before accessing registers, preventing potential crashes due to
> uninitialized clocks.
> 
> Currently, in the probe path, registers are accessed before enabling the
> clocks, leading to a synchronous external abort on the RZ/V2H SoC.
> The problematic call flow is as follows:
> 
>     usbhs_probe()
>         usbhs_sys_clock_ctrl()
>             usbhs_bset()
>                 usbhs_write()
>                     iowrite16()  <-- Register access before enabling clocks

This patch itself is not so bad idea, but basically, we should not assume
the power/clock was enabled since kernel boot.
In this driver, register access happen only during power enable <->  power
disable (except your issue case), and this is good idea. So, the strange
is usbhs_sys_clock_ctrl() call in usbhs_probe() (without power enable) I
guess.

According to the comment, it is just caring boot loader, and
usbhs_sys_clock_ctrl() itself will be called when usbhsc_power_ctrl() was
called anyway. And more, if my understanding was correct, Renesas clock
driver will stop all unused devices clock/power after boot.
So maybe we can just remove strange usbhs_sys_clock_ctrl() from usbhs_probe() ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

