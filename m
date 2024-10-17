Return-Path: <linux-renesas-soc+bounces-9808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D389A16DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 02:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F23DB25038
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2024 00:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA683161;
	Thu, 17 Oct 2024 00:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ERDsxfo+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96398184D;
	Thu, 17 Oct 2024 00:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124569; cv=fail; b=HdllznrmKPYC0GEtQUHErMDNnEPlUDjFdoHsxusPAC6xKbxac4xEi4BfdAqZioblK18omCJl/IM2Lfx8CEns352Am+ZZTsKIW7b0/h+pMLFPOKifVGSrDSIa86Gs8pHsUizQ1Yvdqo+tQs1XBI34KlsQ8w0GMHaPLZ08jtjVbw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124569; c=relaxed/simple;
	bh=U5+7YA5OxsEO4pAFxskw6RDmhxvAwcREX9EbArRVWBE=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ujlB2hrn4Ao3HhKrBVut/HLaIKaR38K2uPfTloO7c79bM8Y1Pzob12HEEYridUJfEx8ukoAfPGB9DOWTr47pl9e2c1emRmq97KPreMOJHrD41c/T+fJUI2iabYIX1TIZkagn/4GTxSvBa4SUjdJfj9Mi3mn9OnOvYE4yBXZf+Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ERDsxfo+; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqGTxaUmVYA+tURdNJLYzJhdwwMhwjS3IOnWiaYMGIuiB8s39LxoguQ9lWVos1e48aVedy0PUioVHX7Y2iJODHgo0EjU7Se5fhV2eVUcVQ+5kcUGI+ehVHrG+24RNRKKnq1hxWdUrLavjNy0vXYIJf8MkfqpG2ghK/EiUErJ3gSdR0ZBRNhf7OmoU82NXIdtrtw1mUgRusIzmQN1CWYFVcxrW4XJJLnQukC9sbFIfqbTJacT7IJkysKGd4S+77DjpeJB/bJxu6JK13btt0g0QrV01tQlLUMeDj3JO9Q2SMCVfu9JGVIyr97gUzJoB+wfS6XK7pQb0OUGFkHQZ8DhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqN1OwwSrp689EyFHA13wvqgOcq7fm8UVO8ou8Dtqag=;
 b=Wvf/Xlxkg0tDihj+Pc4WT1nNclwozSwOLw3zV7gCpvWPxEAC31+/aeIyfsAuILEKqV/IrT1QB/rXfjJCl59q9uJcC7vbSF3cNGw556SNPPPSb7Kc2q/ewFi6n/1XX06uwJrpxBtjgVjcjYuetN4SDx9gkYGY1uWFPiI3pMJmreW23SsveZD93qI1IRTh4UvDlLwxF+RWI+lIVYDilyuyCR0hwmcfaetlJ0Z6wr/pLwZd7fuD6YXiCyAAIzrZ3m3qhhP42jXa2uP5NAxpW9ClfcBHq6CzyfqYmHV6KeooZbYnVTd9ZY5IQXGiEnmE4m6sbMgfkLBXL/inKjFD/uN8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqN1OwwSrp689EyFHA13wvqgOcq7fm8UVO8ou8Dtqag=;
 b=ERDsxfo+IoMmGxhTd0yVsN9ExLWQuorYib2/Pw9xJFnYNLHSRwd5gTzBYPfz/WWgCdS5WmHcWxo8YuPxNgCO2TkmVddRbCyl6atbZuX0rbfftLe5S9wLKpBs3vvM4V95VmSPHPZHG+8MKjXhFVSOYvOPZRIrJzT76Imz/j6GgSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12518.jpnprd01.prod.outlook.com
 (2603:1096:604:328::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 00:22:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.018; Thu, 17 Oct 2024
 00:22:41 +0000
Message-ID: <87r08fshm6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/3] ASoC: Rename "sh" to "renesas"
In-Reply-To: <242a31a6-8a0c-4db9-97a5-8a9c9f5c29b4@sirena.org.uk>
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<CA+V-a8u8bkCjL-YSyMOiKOtfZC8upBwGzhrJ0o+EmZ9S3z5hGA@mail.gmail.com>
	<87h69cevrt.wl-kuninori.morimoto.gx@renesas.com>
	<242a31a6-8a0c-4db9-97a5-8a9c9f5c29b4@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 17 Oct 2024 00:22:41 +0000
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12518:EE_
X-MS-Office365-Filtering-Correlation-Id: bf9668e7-2dc2-42a4-624d-08dcee41d054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72WS0tiVVsBp5khKBw1zsI6DbIfhRAu7DCwJXJdLBH3Ppn9+EPzi5GWMOy6/?=
 =?us-ascii?Q?5A1YFBi0V8yCMvaTcuCs05lYysp0OSM1e0dV9zWlXybF51G9xwjtPXMj9vzA?=
 =?us-ascii?Q?AOzgF9NBTtfFxnGymZD4ERA9sv2kICcX2b4C29IFgPDavMqtBbS0bGXp6aNY?=
 =?us-ascii?Q?vQj+5QJb7rFJStSDblqZfyYYZ5ZGID8q7Gt2cet+4uAtpoGdEtP2JDsAuMMy?=
 =?us-ascii?Q?e7QwAX6bx8s/978wzzfazdQafhn9mpy+3E3H6wQCvSw35mWp0t8J/ilQWpmI?=
 =?us-ascii?Q?9i8d1dofTmGRl5X+AgGn0Y7xJE8kB6kIYq8huAQYja+K6NZaJkQlr+9rWuAz?=
 =?us-ascii?Q?umdrLeDC2CwsYemQ05WsjtkyWZI1KRH1fzTOOmlTPMD1P1tWDydnfa/2VtP1?=
 =?us-ascii?Q?EvkdANLW5/6X+bOKxEO/BXTBg3OD3WTtwBtzk7oV5Z23jc0y0HWMgj1W5v1N?=
 =?us-ascii?Q?ZNRuel/4tKfS6vcYKjb70YeJZljUA5/I2TryLKYvsLAqVk0tUz3oM5Lke49D?=
 =?us-ascii?Q?DpTmB7qfK9EytLjn4hXn6uL2Wq4tzMc57g65AraSJ0nbSIwunuoqE70nUlnc?=
 =?us-ascii?Q?SXCmWsTC21DcDOrf2CCSPsYv2ZNHzNU00kG+6GDznSx2aoQCydeVHRws0Gil?=
 =?us-ascii?Q?YjsyTykht86WCk57GyC3zTG+SSVGTSGJNtsatGwW7XlLnJ3/Rg32h8a3oTjw?=
 =?us-ascii?Q?Cy17UVJfP1vQ/AWlrH8ijb3HDOtgrMkIZgD6WslJCHxA9Cea1OYWLfMRqd5c?=
 =?us-ascii?Q?3kz29sKa0YSKQuF4gz29cftYaGEaVfQLeFl/AnTD+YxcJgk6v0ZKNZRsriVg?=
 =?us-ascii?Q?VXBwgJi/Ka9PXZYYtCdWotPjdI5cR8adl7n9wc38R6scMh6CQl3z6wloJSzR?=
 =?us-ascii?Q?9Z1NxVJsAkbZu64eSElMqRGsOT9P18zeLnko2GFMct5rb/vebKMWLUwoFmc3?=
 =?us-ascii?Q?JQegJ6keJ/YEYlwIQYPRoUZLlT5Kk+O267nQ04HwY7xPYLjo4Ty3BjFp02s5?=
 =?us-ascii?Q?SCZr2XzQ16JDx9rySkTT6e8DGPLIiXBrC5BsaiJ2VKf5KX1nAITJedHX6cas?=
 =?us-ascii?Q?BDOsjcwu7FVNmVbm4vw0m7plgC4NG0eQJtJP6o33Pm9gs0sW0IcbUOmQmXXd?=
 =?us-ascii?Q?kXNy5uF24/s+8CjNqYyPP0HVFxIru58qo1N3eBNIrWDTBvyDRZVc0CEVL86F?=
 =?us-ascii?Q?Th0J6FbDSSKlgxgosDWI0Jas9ayC2ZuYMy03NVOtJw5OcTOzMVY+IuXgNpth?=
 =?us-ascii?Q?argnf/lx5q+4Zb3KozE0Mn+o9/INEHgito0Z2mCKIkEQWFVbTwN+hRq2PNKr?=
 =?us-ascii?Q?G5BmKkkktdzYyP/KuqVY1RN8BU9kN3kY2WLHB+Gz8HVt81m0I6Wx79bRXTUe?=
 =?us-ascii?Q?18PcX8A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V4AxM/min2T49qwKQynE+FdYQajGyPp1eD6IE9/kvXwheM+fJqtINuYmd81w?=
 =?us-ascii?Q?ICsFpk8pxDSvIimea0HUcQ+UK7zIHUl5hswbL/nJGc7ZwcwLtX3q9+LT3D0b?=
 =?us-ascii?Q?C68c4BZqv848vBXClrJ51Xq1i29J4PY+uqiPz4lvnvCh9TbMpUO2PAQYjWz1?=
 =?us-ascii?Q?w9IG7cqFXBG7LUlAvm2ChpboCEICa5R7yt/xPJUbN3b6TFKTRgOer/zy2eNs?=
 =?us-ascii?Q?UcQMJldIUwEmNp+vcKe7B+d66tMqh0mLLfMzgJK8NK4oUbc5ixxs24bz2XRO?=
 =?us-ascii?Q?EQbuS8YO+GgEHkJyfFvHEki7v4n6BSENnD06h43jLk+cOQ4d8p4+M76I1oxf?=
 =?us-ascii?Q?gXc+wW4mMTVimcH0Lu+wLCmzFK721XxlzQJ7JK108FTs5By7YUB9Giguoy4U?=
 =?us-ascii?Q?OADXPnzDbXwLxjlhh4iyy4knRZRXkd7txemA1Jmtr5LJYjHbBEguTKBsJ7WQ?=
 =?us-ascii?Q?mYZR1wBFohM0OYGuOfvfVfo0UC+I5mCP2ECcKM0INUfsjqXCO1VQmn4eud4h?=
 =?us-ascii?Q?drpKvzudXtmUNepZ+Kg3XzG2RdSXLUc7N0kmYmpig2vJjsCBUIsPGUEZVNRX?=
 =?us-ascii?Q?IMZT1NMlaw34n22f8IRGun6iPgx2td163FkBk7nOsSYDLYeSJcX14oRYkbLu?=
 =?us-ascii?Q?j0cwGUL+17BwkQ6VzV5UNPVdflcmhfEYTAtK26ea40dl2Vsx3yq5NI6Ds188?=
 =?us-ascii?Q?9K99vjhgHSU5fsYwAbufA7ktKLL8xfQveYkAaBTDLNDB8iQScbKsuk/hUkpk?=
 =?us-ascii?Q?V7uJpmEL6Fg7TeylERanSXp32dGkNXDZRZPIRcneTRiFqpVvg3jzOiHUXCfc?=
 =?us-ascii?Q?WVCKsuc7kEZfvt0gfDtf8rQxR+1bC7TJ0Qrl/Peuu1bYfBsayM8TS6KwUHnO?=
 =?us-ascii?Q?8jTPjVf/GBtyOlZTYczw+N0W8jivHQNH5TSw30nbPMu4hx9TGb2na5nOhMwi?=
 =?us-ascii?Q?VIfHH1vj2DUkH66V4Vn2xWOk/gnaBzxRrD8iBvxo54tR3h5H+XJqfx1EU8Y6?=
 =?us-ascii?Q?3C2aeh7pynuxT1I39DFJIeR8nNKXTSpxwy1j51QgRlvNsENEKvAZ00j5aW28?=
 =?us-ascii?Q?ChykCijF+eSGEkdKSL3c55Ym4oSZu4rcKIDY9IzIO52bQ2rT62uI8YjgidQN?=
 =?us-ascii?Q?AdV21d+t4/FVTy0c13P7cHZO8s4pUl8MVGzC6vC00FIwPew+WHNeV0eGBQMC?=
 =?us-ascii?Q?UKl27yDs9PTYSLzxeW1U5Sh4l909TkliChHpdXe54LGZHoGgR7fnq17mZnrZ?=
 =?us-ascii?Q?w6TaOGpNSmT1QwXbSMA9IaVBul4lCAGMMNws9Ew54UxlI5MJLybnrCd/RAeQ?=
 =?us-ascii?Q?0xjX8xIKuie8DRkJBQNL3QhqxSfD3RbyXn5eMj5GgoaAyGEBUMD8/83nUnX7?=
 =?us-ascii?Q?je4JzfSTLrFVIKVZzeYqkaAz1VXulMcm1JSCVlLqYXuGD6TA/+EN08oK5sdl?=
 =?us-ascii?Q?AnzECW7EfbNTg5ZZZC+CiffWSQPlQnElTJLOBCtkjE4Eu0tQ9usWFe/E6/D5?=
 =?us-ascii?Q?cpBHjy2uwHPeeurdq0s2xBB+Qjw2m0O+eDwmebHSeMV2zBdqKInq3tY0r0D/?=
 =?us-ascii?Q?Ni6A7rohIqdjoym/L9FPO48oEmywjSb31UMprvJj7+6ftgijHGj+iWO5rS4V?=
 =?us-ascii?Q?jsFcG8iCnAuRqiavpC+ea9A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9668e7-2dc2-42a4-624d-08dcee41d054
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 00:22:41.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCW9xxuBB4Lva4caw7ETmSSBgssaiClzIOfEYVGMSwsEIb7e8R5QjK8j3/oOD6yuPOegLphqBIOGTBhS3gUm3nrLrrFXCP1x3sQMWjMXvAzxyfrPLFVx4bVS7cODeaJj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12518


Hi Mark, Prabhakar

> > I can review / comment for Renesas driver, but can you agree that
> > you continue to pick the patch instead of sending request-pull from me ?
> 
> Yes, there's no need to send pull requests.

Thanks

Prabhakar, could you please continue for Renesas Audio Driver ?

> > In addition, I wonder should I be for simple-card/audio-graph, too ?
> 
> Yes, you should be a maintainer/reviewer there.

Thanks
I will post the patch for this

> > + L: alsa-devel@alsa-project.org
> > - F: Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> 
> Should that be linux-sound@vger.kernel.org instead?

Yeah, Sakamoto-san pointed it.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

