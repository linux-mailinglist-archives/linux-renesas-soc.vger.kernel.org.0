Return-Path: <linux-renesas-soc+bounces-15793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E37EA84A29
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 18:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D9314C53AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 16:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6820122D798;
	Thu, 10 Apr 2025 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CzuvPdLq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011029.outbound.protection.outlook.com [52.101.125.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F0B1E885A;
	Thu, 10 Apr 2025 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302806; cv=fail; b=Ep5fGpgFtL/wX3RXj21GSejWKQxcGCL9Ki+ZUDn5n3ZJXwWi9hoya3vVzAUsB73rE66XwDuFSUBkm5vmynKziI6mv4JSwDsEq+7gqW2nxfWNvNa4hzAkrOqu7nsNb5g6gZKcEO/NzzDHT0dRVfVFN9ZvTOvL+BiLeeiOcMXHQ7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302806; c=relaxed/simple;
	bh=b5LsKWPF0u6Qi6x/ru0H/IWJWpUr3PRIYlFJuWnd5fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uOJtI9wyuGR2w7D1HPR6X/jPqTrhWPVJAiVJ5NJTDb2aeY1sCc2Luyy6MVtWacMmk3dzEvNQ/YCtb5cAKCETJqJTbf2n1I47H0D0ftzs9tq3UfUzxeECmolMQHs5rpCUZqZdCeC9DCGdTEi15cgeP2bPn8e0kF23EUOmZAKBaPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CzuvPdLq; arc=fail smtp.client-ip=52.101.125.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZT11tu6K69l90oHJFIQcWEirBqvJeLGlXDFQ0PZ8Y27Cg33RrHXdu81hoKnFR8POXaHS3Vz8JM44Tf5orJMYkTeGaobe29G7xtYpgtSdvhJ2EcV0SgP++HlZRhkB/xzJQdM0Vyz41O6WU/bUqZHsn33q0TjvbTBWXOO+7ISjxpypAobBL8v5kR4azwIVbooHLQi0ERjr3AHR8ynq9T3tbd5xAE0Z1aF9Huf08x3O6xczFD6YAFN3/gSwAPO6M6FF77A2DWb0KBu1kLPlTRITsFkymWe+SYkm4xjx3nAc/I023y4DkjfxOOiX0gAXGG+L2+B00za/FFvd/fKnoHQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4OriuUHE9Bin1Ux0ckeJ98fDRjE8R4blJpoEmpq0us=;
 b=gbG7krPueR0UdxEaUfwMkzhpmQqXJoCU6cCBJyhsaRHKq+oRIxtGaqNx4snw9Ch6Jyk62TSipIDC5irdbPCoujkSGc4uvSew6jkqd9UhWhPkv996BlsvtmYmt3YIwh/dw+9gVKvCuTtqfO73MRci5E8SpkIVp/R7rcpJEcuEZG7mHymj7/WE5qmgnIs6qyPWzej+i81kF2YAHv1Dn6HxEuCJZAeJFqEc9NZfLeME4t+krHXOOTHR/0ESZgsU8NL4vfn5SYbH13BqGvM9rBodswbzjMllbUBYqjFYr8nvteagle6oXBkoR1JFAopG6r8KlUudrjfpn+8xcapVp0bTWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4OriuUHE9Bin1Ux0ckeJ98fDRjE8R4blJpoEmpq0us=;
 b=CzuvPdLqMVHIJpwPCaRxRZVL3x/RrgXWHoqgG/h1KLNkMlYX2KCF4+oeMsMgds3yo5jIGMk1HX6jtXXXlHF8TLuqFcSgWwzkvkCNYNSrS6k/h4RsFCLnUDFYSFZVh7wH+bO0FGSv4OLZr9CBX5yfXFAfvhweabZdS4/8nc+0mXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB12055.jpnprd01.prod.outlook.com (2603:1096:400:3cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 16:33:16 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 16:33:16 +0000
Date: Thu, 10 Apr 2025 18:33:01 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Pavel Machek <pavel@denx.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: renesas: rzv2h: Simplify
 rzv2h_cpg_assert()/rzv2h_cpg_deassert()
Message-ID: <Z_fyvYse83Fj1IIK@tom-desktop>
References: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
 <20250317083213.371614-4-tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdVJqtLKBK6hf0iGGHcPaTdZm10GiiqcBpkPrJSq=KL-cw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVJqtLKBK6hf0iGGHcPaTdZm10GiiqcBpkPrJSq=KL-cw@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY3PR01MB12055:EE_
X-MS-Office365-Filtering-Correlation-Id: ac7a621f-c695-47d6-3528-08dd784d6524
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QhAW3EZt3hxaBn9F6CHjQYd5SUqSda698/LcXPPO6ZDQMvI6srvkvPYBrD1w?=
 =?us-ascii?Q?3Fgwvkms+9Qzu4GgDwHBdeoqCXvkaibQfyK3FLUG/Zwan+BcjcqZvh4hj3tW?=
 =?us-ascii?Q?TZfW93CUzE+nuAsx8Jo/zJTfwEXKD2Sz+idUQTLnUQjPMYbllr3rMzvTRnt3?=
 =?us-ascii?Q?AiYwnjU6y6CtIhHttpNyqsatnIu7xW0YmXgB/R+CAcfBNNy991sB9B1efdKT?=
 =?us-ascii?Q?SdKtzeZZnEBsvW3nsoLLigrOwZsTettSOoHA0gT9sdi/1rUU0FlqRERBib7f?=
 =?us-ascii?Q?2pPykebF9qJh0VzGwNnQClrI4SP/j3QTADSUxE5Z20WG0nEf9jU3WShpDOWQ?=
 =?us-ascii?Q?1G5LAyIf4gaQ/Mn0WT2pXj1lfw4cn/FgIrw0Binp1psEAJfIbg18ktVvCD3n?=
 =?us-ascii?Q?8Mzlfle/VvM0QeRemPQWjMkmN7PkUF7Z2B5VLihdP/yHND4sMPKeN7FLPN0W?=
 =?us-ascii?Q?YNt1HzArAZ1vJhvVIKIHcUBP86WsUdf8VSxIDB4fxVgIjzs6LYMugy/Bc1Q2?=
 =?us-ascii?Q?cVxRmLSv4V2U/5qX8hGoKjxYEqMOUHIaPzWVcSKcROQAFCl/dx0vQxYs8+BM?=
 =?us-ascii?Q?uJS0cyKX4WY11z2Erajj6ECEtIPh4iKGXzmr5JKwwNoHswCp5qNDDuG1xIN2?=
 =?us-ascii?Q?wM4/RQNl7f2zrma3hCAOstR1s1E6RKl9JsW9rREZKQ2MFbRPgfs/uJgpHglF?=
 =?us-ascii?Q?GFCqYhy6Uou2SO81W1SO8/kHd2R0uiu6Leekl11yPdX6B3MUuc8G8K8eeYdX?=
 =?us-ascii?Q?8UrM0noFB9JeNaXGJ9f79HeP14uGegQudN7edvKOB5BPE5Fml9JcSCwT8u2G?=
 =?us-ascii?Q?EomcP6EAf7jsnm93bfmJuQPVHyrH96svd2rc2WUOH5Vs/DkMqHnxWt+HcEVh?=
 =?us-ascii?Q?wjwGOcTwFfE3elTcgkvwaMLlASR1aop2Ygz96TzKc2gvGiPuzn6xZDY0bI12?=
 =?us-ascii?Q?tPve2ph0jcTe3Gw9hQg1j83ImchCge+JnMvNiMCuM0upoF/n64dW7eEOFaFW?=
 =?us-ascii?Q?kh1uWsD+R9xoKrzQoTztjHSZry+NCbOMfphALT9eUmiH8qpLsrASRnr6Ufsy?=
 =?us-ascii?Q?e5tNyXUPU/mcRnDql35t6i3v8UlOACVz8VZBEiBAvw+9HrLSlL8pyPMxRVdd?=
 =?us-ascii?Q?/FZ6opR/g3gi9QyR0eoV3YVdR0TODVElgoU/vobMtRzVQMKJgAo89rZxkWf+?=
 =?us-ascii?Q?4Qy/4XoWdFsUv2NHfXVHt1F7TWc2x5MGlhPRXwY91Z0ooSIBKrTAAYdGOQfd?=
 =?us-ascii?Q?ZFTW/EJqLebppYj6NSObQFwl+E0f3CH2WZghSEsuFWZ1d0K+8vSFK5y5k15g?=
 =?us-ascii?Q?PrCnfOKwdgtYk5N4ecYUUrmHTUu7N9d8gWgv2FMjmpi8rCNncTULB5PcMIHb?=
 =?us-ascii?Q?lDPoXhsR9Oxm5Sr5yRCVFkYCCSFvT6ChmmCyMEWBG7huAYzMYK1YOxHNcFnQ?=
 =?us-ascii?Q?pu8bPKKQbCqdBSdkaV3vIJuxiUId2ufBk41Y/hRsIP0No/HVq8RmFU4F01rf?=
 =?us-ascii?Q?t1fEIBLJe95bzI4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kin6LnhIiaH1aNyQrWAKGTRW1gaED4QrjB+Gy9Rb6KGmWm8vhF+R/jMlBb/v?=
 =?us-ascii?Q?52r58rBZvfJaOOSri79+VgjMBDjAH4799GuLoPPd/3j7G3YM2jtAt8OpZAR8?=
 =?us-ascii?Q?UGRDvQUplLXbKD6L7SbKquy5/5r1pVDPiJB2vORbyO2Yf+Vu5q2m4ZhaVtt+?=
 =?us-ascii?Q?AqikoiDrFMQB3LLHH2pn7+p+GBCQN+bhu2F1ZB/7x66caJktoIBCnmKb97mN?=
 =?us-ascii?Q?gPkJxbkZhRHBSLMtQZgy8Es/sz6Y0Lv3cUnfok2qIAtp7HtQPlGxxkntU8Ux?=
 =?us-ascii?Q?3qTCjvVg/vIA1cTsiAOJhyMdIUJQD8ZZ8LBEtplOxipcU+gr93w3VYyRPYSa?=
 =?us-ascii?Q?wgJwCYWNB4DGQrBmrKdaVVbhkuaeaI1PL/qZbnv5G19GKugm5hajEL21GLZ/?=
 =?us-ascii?Q?ohIj1lBci4hEBkMm+03kxFv6jCknMcheT9iAuTsgfXacYbj4ySYiFioN/v/6?=
 =?us-ascii?Q?N6b1W5iLdlf8yttfpAk5/oYEqmSHIQdLJEhois0ySwUu3Jhf9rmnVYGtlN7c?=
 =?us-ascii?Q?zmbxT6wT7drghLdXlv40zhLQ/nJNalQ67CBT+mAiKVt0HZaVHZHPgtlhLQ/2?=
 =?us-ascii?Q?6A2KPH2T6CN/Y/YFLvJ+wp4GybAQoBz9+z4j1KWgB3YEoN8Ie6kfSbXj/M6c?=
 =?us-ascii?Q?kBDpm11XiX4+HPRfsPDGPLsnScF7kqbwKAi3kMcC7j4WuNpcmTg2ovkLKrQ8?=
 =?us-ascii?Q?xalr5oVmpogUA8GzeZ9xvtjoYegnuvPMytpUbN3O3vNejjNTD8D0nlBJ44oO?=
 =?us-ascii?Q?tzb3yyPOY2/wdaVpbIgKKM9TnB9uC72n4gkSohDDNnMs58AIW2l0RWm925S+?=
 =?us-ascii?Q?Qq+/gmtWZT3VZv49ANpTP8Dc1UFaYwLJpxBUlAUrnMigAw5YtiTOSa3VbeyB?=
 =?us-ascii?Q?DmxSfwaYEHhKrcKBV0+w3N5jIE+IocceHrTfBzmMNkUf/zqlHyYG3wMiDX25?=
 =?us-ascii?Q?VprEwnORVZLg7C9Rf0p6YmqVUJ97sIBDIgNA0Deb7ckkcWx/L9cdZU3EQFt0?=
 =?us-ascii?Q?2S6k+L5VzdhVrfVm5q41guSJbQk+24XIpTWUTA4uSZDA4XBxriwHwLm2rBso?=
 =?us-ascii?Q?DD2yBaAkhL1Vzs6Akk5LK+QbvvdPbT9Ul1N/mjNNNx0KoaXQ559UVhu2w2vw?=
 =?us-ascii?Q?dnZGD+U7+uryj1A9FeagURYDH9ylN5AXG/ZlX63kt6fHMwSudcnBIE87gAxF?=
 =?us-ascii?Q?nXq6YhTG9q6/4kQV0b8GoPhT5W+Gt5BDGfDAOMB8YGJ37qxx9yzq7kGcRnAG?=
 =?us-ascii?Q?fG2uIRBhqb0SiHqwPK5IAFbHxnwe7qSXjCGFX4Bkde1OCvuN+ZZBzfmOyEx6?=
 =?us-ascii?Q?BOG6thjTbi+vvwz8kHEGIOwwbVnPs/g31TzYWqhpv7yIaOHD0Bp+m8itLEAC?=
 =?us-ascii?Q?LwJUbdzudhLDEpie17Hu9nWtZDRcZuQoO/pxOjniET5Y9v0sy/Xd7QLPbx+L?=
 =?us-ascii?Q?tq79fPzSI8BRc0zXE204ZT0Qt/ydFu0+clrvgAYsZcdZf6TnneJxHM7o48uh?=
 =?us-ascii?Q?HJAu1zRFwT+dl/iLB0y3ws7C2h8urchpjlbEwf4xDcX75AH7crAkq0O2AVQH?=
 =?us-ascii?Q?57SJY0bQXijc6OVUZJJWE/5PUrM5o0mhLyTFssflihNDgcWFed+Syarfsgo5?=
 =?us-ascii?Q?MhoGs0Vu4OVvMTgpgayfwoE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7a621f-c695-47d6-3528-08dd784d6524
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:33:16.2216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GL8TZRqsgA+kddthrs/d+o22napmBDutKPQPh9ARTjX4EYklccJeGuS/7n4GNDF9hGXYDMiR4RVwXEHSACEI+odSIy9cHpHicJV0/QUDaWaomS2vNv/dVSspmG8U7IYk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12055

Hi Geert,
Thanks for your review.

On Thu, Apr 10, 2025 at 06:25:13PM +0200, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Mon, 17 Mar 2025 at 09:33, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > rzv2h_cpg_assert() and rzv2h_cpg_deassert() functions are similar. Share
> > this code via __rzv2h_cpg_assert(). This avoid code duplication.
> >
> > Reported-by: Pavel Machek <pavel@denx.de>
> > Closes: https://lore.kernel.org/cip-dev/Z9QA9rwuXCuVbOXp@duo.ucw.cz/
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.16.
> 
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -652,16 +652,17 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
> >                 mod->name, PTR_ERR(clk));
> >  }
> >
> > -static int rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
> > -                           unsigned long id)
> > +static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
> > +                             unsigned long id, bool assert)
> >  {
> >         struct rzv2h_cpg_priv *priv = rcdev_to_priv(rcdev);
> >         unsigned int reg = GET_RST_OFFSET(priv->resets[id].reset_index);
> >         u32 mask = BIT(priv->resets[id].reset_bit);
> >         u8 monbit = priv->resets[id].mon_bit;
> > -       u32 value = mask << 16;
> > +       u32 value = assert ? (mask << 16) : ((mask << 16) | mask);
> 
> Do you mind if I change this to
> 
>     u32 value = mask << 16;
> 
>     if (!assert)
>             value |= mask;
> 
> while applying?

Fine to me, thanks.

Regards,
Tommaso

> 
> >
> > -       dev_dbg(rcdev->dev, "assert id:%ld offset:0x%x\n", id, reg);
> > +       dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
> > +               assert ? "assert" : "deassert", id, reg);
> >
> >         writel(value, priv->base + reg);
> >
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

