Return-Path: <linux-renesas-soc+bounces-6663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E62913F79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 02:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E673628133E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 00:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEA8376;
	Mon, 24 Jun 2024 00:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pb1I2D2z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2066.outbound.protection.outlook.com [40.107.114.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F9C624
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 00:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188074; cv=fail; b=Rag3GqXerpnX2XeMQ69048KrFc4jy/mw/xBsjhCBGDfbZ6C6nLdxLoWjatNj/g4hQHyZf2EsVEnUv8qgae0ZLFZpzN73pOtrdPYeeIYkmUZXiGpGerKvdS6jocQ9sL7j11ltnNIssbJ7ft/iB3e13WYG1Q7RVz2HzUVOzcx211M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188074; c=relaxed/simple;
	bh=cZqa4se7/9GAyUMkns2pDEkAByN5IdqoK1KCfP3NZ0Q=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=IsEjXxc9tMI0OMP4w3NKK3efJdi7/JlTg/R5lL0MzTsYU6/ZiCllOW+T3v6EToR5TLr3bYCrtQvcahiPt9k6M70I5riNFeuaJ1Ji4o1mYx/6h8Pxr/FMX9F+xBw2gp2ZfpL4sMHH9dhdufuGlBM+AbpYEAsoR+cyhsxRjldMetc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pb1I2D2z; arc=fail smtp.client-ip=40.107.114.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgZa7csj0ipEBMqoQj9rb9/UqHruJXO/lsZ13p8+4DwjNTHmp5fv+8UWmdaLruakW3emb1Fc25Ii76JIDemN03kHb60wvq10cFDrZ8No9OK7vENcW/msEuj2/X9m/BilyvQBOVHLaO2032hDeMOjRBqr+byjO4Xnlj9CE6lTVv93Y6qeodaPkbbn9SSSS9+dF3763BEb6kTuAHi9U5ugWiSko/WYzjtQcFbODbu2LzrZB8hZ0DHhrrbyXBqFDANgBia6rFbrG7Fc8e7bVkTYCcth68cKpgk1flB7DWLY6PHfSl8XJ/bsdw3nu9qj7c5dDVXyrC+U8dvv4LrPtqV2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uokc3E/5A+yBI7mcvI4vMPTZYMNy9noQXTLeOUWXCoY=;
 b=jLm4QGA0fgnWMVWXRfg6IaN1GUZG8Ss4H2qMJ6BMcVxqIm0MmRqNkOKS7MG78AoJ/GV9HCHmedLJaRTZ1T04Q8um+bFci6++YJE5/Tuw4fYf84axMRS7vcyHfUTFI/1CJVsbynAw4vhkINwMZQVwI1uYUCG2waSaHzb3FmEl/dWObzLdcvRbZLmjk5n/PO7qy7o+7S/Bh6pqrTCXp+23y+6Lov+na9SMq/LC/4ff6eakSBP3lQgO5gM2qq6xx8UcHcs3KvbkybpAIXCzHrRdHcIuCVDtyAytOzr970wcuint//2QBWcury/VAgP9TIhcmkZj2kJ8Um307GR9rkR+YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uokc3E/5A+yBI7mcvI4vMPTZYMNy9noQXTLeOUWXCoY=;
 b=Pb1I2D2z8pxmhH9aWAQfUwYil50uG0dVCLvkXo2yZXmCZo6q7orr5+5hznntWE8qNEXxlkJNZq4vSFtTobBjSQHjj2aYy2zCts9Ha7GnB9jrZcj+LVjkBzxuj1Cy26L/jIHz2E/ydOuDLaThYhhaYYa6B3+zqSWlVdDgk/5TWoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7104.jpnprd01.prod.outlook.com
 (2603:1096:400:dd::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 00:14:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 00:14:28 +0000
Message-ID: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/6] arm64: V4M GrayHawk Sound support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jun 2024 00:14:28 +0000
X-ClientProxiedBy: TY2PR06CA0035.apcprd06.prod.outlook.com
 (2603:1096:404:2e::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: f7639694-912f-4b49-5460-08dc93e29cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|366013|1800799021|52116011|376011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vft/CfYdogArZDIjZzJ/r2jRtT0H6zZtWcP1jTWCIXoyG6LN79avXNxnEXy0?=
 =?us-ascii?Q?mzxAD4+9kD7JjoqgoVV9nK1NKGCtNUt4xwscBJy1ykYT/qDYjrP+XR3TKshs?=
 =?us-ascii?Q?pYSFtW/+sgnTwWV3u8WUZqzcaaKw/WTJxy3ksGjxouW0fp1T5Q/z8vNh9OkI?=
 =?us-ascii?Q?DpNnprT8U75sBBiCRZexHcgXL62QjPOPQfdlTVyMsrRYlngbjGnnUshwleXo?=
 =?us-ascii?Q?vf7czm3XvErcYGaD2Wcjl3e9LvZWCfO19DnmvVi8N+pGeQfTyXV6uVdM+V0I?=
 =?us-ascii?Q?M8/Ij2qp5Nynmbc/S9jsZzftcajbl22DfXibrkC09pVSHes+WANAy0GO3KqL?=
 =?us-ascii?Q?wHD+GFGSCcrTbzjgKLNwCAxoMwugMFneHdNQe73I9Zdz+T9xybKLZBM+2GSo?=
 =?us-ascii?Q?7SHoeTn6NdY9gXt8UlMkDH2jNJvDHR6yPrHEWBZ3Q/dqTaAi0dQY9hY1fNVq?=
 =?us-ascii?Q?f521LoZdredTwyUqb/AHpJcqWFS8WzM5NyG9z2mCwrPBC++oQf94vyrP0+ce?=
 =?us-ascii?Q?aWT0BcObE5p8iRGsSko24hYVPojR+6yPHpsBSRH6AZxxDqguGR1gFKZ+oZ6A?=
 =?us-ascii?Q?Vittxgjoe/h/iyfqQhluE4LuiMLd0sOqRpJEJ0i0PrvXbDXemcnTnBQXGr4x?=
 =?us-ascii?Q?5MWSPTSQGygD5cx0TBLP/RHbbXH8ugnHZ8J/mdnSkZ3cxr+CWREP0LL7k01J?=
 =?us-ascii?Q?dhQHICx3DpEXIenRnViOuhVyCqRTHaJdsaOTdqijSlunJmZOzDMHFjtDDRO3?=
 =?us-ascii?Q?+qhYf+Y3LYMIBA56Nd3AMEWy3C4JomV6HNS9jaHH1r5G+66Cc0SjHRwapqXp?=
 =?us-ascii?Q?MZwOiCZxN6oNSB0XBOJ539C78CS8Vy7azagF9eFC/IrRZUTmhprbsIl4xiOx?=
 =?us-ascii?Q?3QBY4Xyui8xNFv9jgXjw9vJ7Oq1nyEOHl3PUL88e3lkKQROqcnAiGpofFUr9?=
 =?us-ascii?Q?SsqxncVkVMTna0a04a3VIbNzUcmJCWZkmACtoG5O+fmlkRDwddgoq7QGURLB?=
 =?us-ascii?Q?ndTcHyIYiWLIlo3KsJfnHlrALAsGUKeyjOOMbIVzIqNyM5dMFTJoagHHFrnE?=
 =?us-ascii?Q?cgqZIZH3ThOFOtuLglQRsXapGGIUCr/Rr+G3Wb+kZzPwRLkoX5digomlr7VE?=
 =?us-ascii?Q?ChOYNai9PRNI3guTqkcdwxuaoPvDPAgg+KPg0rikvtkUEwfrftXRsZ7/W9Zp?=
 =?us-ascii?Q?o+kQV05/uTro3UPzNjqInRa7mVBecbq93P35tcG7R1FT89Mz/rZ/kzFV6j4L?=
 =?us-ascii?Q?1yQiupQs5+Z9hH8dVaZB6SyAewhqZcKxUnolBdWmuQDdULbxAdiC5uyrx/6P?=
 =?us-ascii?Q?WWwtwh/xbcs8x6VZ6ucUs1xa5nANbv1OJGfCdqMir3LS+i44QwdNM0/cS7pK?=
 =?us-ascii?Q?y+TD+SQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(52116011)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v0qbZCdF2NJFmn24YJgwuoSZDYvvWzz+OaVtF3gtLtvcMucntUqstNmOhDNU?=
 =?us-ascii?Q?KkVAX+As5UkLUd0rx+Tc899dhNHR+k1BXCTuN0uAcYb2zZcL+J4tCVE4k0Za?=
 =?us-ascii?Q?X+SreUZ8q9q08ns1/xo5w2uWzrtHmpEj9FXJ6gTuWVHlkcLHaK1rMJmYqMuL?=
 =?us-ascii?Q?WNnEUTa9BKLsIVkA/48myQ0Jmdyulynq/VD4neckGvNuDfowjwUGI2Kz81jB?=
 =?us-ascii?Q?XIkN5HNSDelQcOWYtxTyrWxBOW6U4BCAFqsEwBgjPE0WYeC0nEV7MnodL7dN?=
 =?us-ascii?Q?dQz4/P0x0qjHBFlz+ePHTRT2M5ZKo+Q1Tdivj3bc7DYULtSKFRhBujrRydcV?=
 =?us-ascii?Q?EzzAjjTvc35BmiApuPDzbtrl3SJfuxiO7pFjn5Ogql3oIAPZBZCLhXS0izPe?=
 =?us-ascii?Q?/Wgt9ySTj86QEg5DxTq0PXET22zRTZEbkrf/b8Fj9BsdZbvAcze6OEcLBG7r?=
 =?us-ascii?Q?QRwfUO2PD3Zjq8ztLTq9vYDTA1mlriI1BO0ZHEnSDM8NoAgf1hW7xdUVBI/v?=
 =?us-ascii?Q?jZOzk+p/n+5mt/xQAiQWOMc5E5kPyp+8ANAgTICQ+tvRv80cBS6promV3sts?=
 =?us-ascii?Q?esKp1JYQsi/u8hqFPrhJxgg4bcfsXyvnAb0V0Km2hE9LrZk78vZcYQz9xZsA?=
 =?us-ascii?Q?DfcQf+EabX+QZgObA+zhrdy0cFxlD2jUIyEU/70q9/BFunktaZJyKm7z6+4Y?=
 =?us-ascii?Q?J+IgAo9oSqafeRXFcNm+dggcBMTq61JOsL5PWwTOMOHuaRVXNAzutDP8/jt2?=
 =?us-ascii?Q?OH1dfAC1KykG6SMRzf46acLnr3UsXBdxQdbTf++Ya4+rG7FYlWHe/ANEgvM3?=
 =?us-ascii?Q?LTk+9SgeEK3EUtZ6+ruGACA3CoZ+eqQckwaGHBTdYHnUYkE8t1gALEMtOrks?=
 =?us-ascii?Q?exoMII9ZYGP+QLoCk7xXyfrLpnszUNn3ur8eVai+NnvtEOrvMJvAL40aB62A?=
 =?us-ascii?Q?Qyi9OLM8vMUl5HpYmMOlSsyBidQ6HMiXqk3b97sXtidPxZwEpldPiIHSBEnA?=
 =?us-ascii?Q?PH41d1owQyAcuoBEijMXGwW9vtf1LRLys9cI+hKfyAxPMReLgnc79GgTVfPV?=
 =?us-ascii?Q?FCh/9yWUW4K8f2TsWmPqzhCiHYzg8vFbCsaBmlFAJtH/OrwQZj0e/sdU27LV?=
 =?us-ascii?Q?avaSSRujgNNWv/bJnyR8mmb2GIv33nh2XcyzIG20CCvwNBZKLZIwAMukz/xg?=
 =?us-ascii?Q?Rzmae3mcgnZCwCstRTBBiIeLHFW6/Jxk2u/QOTllKkOcZjlRijPURhk3hELy?=
 =?us-ascii?Q?nKPATaIJTHc6vTHcPG3Vq/MChP+OCmE2CoF2Vnfv3wsUcgR7yue+ahka5Rek?=
 =?us-ascii?Q?sQZPMDUzamTYhqHTvWB553B6H43hVyuIYQmV+q/zEzRhX9baObnEL0mD1aiT?=
 =?us-ascii?Q?nnnlknLf1UbPlr3xXeDQNYB+zbTmnFGZ8yOHxDFWCSLAXvw3FrwT8EK2kMnj?=
 =?us-ascii?Q?/wnZRhI69imHgzu5Oo+OqkPwNywoxVyq51tQPR4oO2ELAkgwfdQXkS/SSh+n?=
 =?us-ascii?Q?HQ1IP6jgA8rEL7uy9glAx36EhfGfU5JO6sYeax9vozBsrk/1m/c50CJ6kuds?=
 =?us-ascii?Q?qRCqCwwOuGHP8DbPjUeeHKTX1W1UAV9mp40vpmn6wYhOd8cQy5XYDz7Lgw5R?=
 =?us-ascii?Q?groHZDyOVti1Yt/kpwrW6Ds=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7639694-912f-4b49-5460-08dc93e29cb4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 00:14:28.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/6RRwxo9h1Xs254r5miVpbiQQM+RLCbIGHU4bx+qEQhOTnupz+7NryWPLqE3YjO+5uM5HSYEWTvdejpCzUkGEHy+BkJVHzSmTFufTCN/XztKufBndrunOThRBSg+X/A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7104


Hi Geert
Cc Khanh

This patch-set adds V4M GrayHawk Sound support.
Because V4M has only 1 SSI, we need to switch Playback/Capture when use.
You can find how to do it on DT file.

[2/6] is not related to V4M, but fixup for V4H sound.
[6/6] is for renesas_defconfig.

Kuninori Morimoto (6):
  clk: renesas: r8a779h0: Add Audio clocks
  arm64: dts: renesas: r8a779g0: tidyup sound DT settings
  arm64: dts: renesas: r8a779h0: R-Car Sound support
  arm64: dts: renesas: gray-hawk-single: Add Sound support
  arm64: defconfig: Enable AK4619 codec support
  arm64: renesas: defconfig: Enable AK4619/Simple_MUX

 .../r8a779g0-white-hawk-ard-audio-da7212.dtso |   4 -
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     |  17 +--
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 107 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     |  68 +++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 arch/arm64/configs/renesas_defconfig          |   2 +
 drivers/clk/renesas/r8a779h0-cpg-mssr.c       |   2 +
 7 files changed, 185 insertions(+), 16 deletions(-)

-- 
2.43.0





Thank you for your help !!
Best regards
---
Kuninori Morimoto

