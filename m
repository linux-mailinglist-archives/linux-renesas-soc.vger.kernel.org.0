Return-Path: <linux-renesas-soc+bounces-23122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5797ABE110D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 02:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15305423134
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Oct 2025 00:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C6517E4;
	Thu, 16 Oct 2025 00:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YCYm4Tgm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF22DCA4E;
	Thu, 16 Oct 2025 00:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760572976; cv=fail; b=S76iO/XUJk8Ds2ediQSmIaM6WyfrMoOVmgk+HyxmscMoNGhFmAp9r8lbl0t+wP7S7ciMIKL1zu4R7s11ZJnJOFBsWSf3K9sUn/04VN+7n/5Xm/vQHBG3rd8qVAGb2h4Ui6HlYE9m6pLKhaG+vpaxK1+wlBmiGkkDyF4pwwmvrFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760572976; c=relaxed/simple;
	bh=rncWWzkEOSeedkq5/MRkSj1WKGMJl7UGO2ngpo38kCU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tBbvb13dsGRPvj/4Fi9gMpL9jyrG3JG2YMUKMrWA4rBaEjyDUCxF7lFzGlHViQFGXXjCS5iR8ZtiNuUA2I5ODqNDoTv2bmgudI9mSlWnnSIxgc0qEnTTGIV2dqImU3vvWCPFw5THQinMJxkszkD4DROvSa4VC0fWQcJCjmJ/oCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YCYm4Tgm; arc=fail smtp.client-ip=52.101.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbLuWqI3Svtr/weJ8REV718Kxfp/Ip8adnJ91TFVBwiNfPZEgm2p4YUQ6QKnQkb4IPPcWmNylNjSw2E0rQE/c0ak4grtIeEXdu2idIvgtBuxp5BGQdPXFT9n0dzAegudqbHjh7/H6UwfCl4bF3/c+NiM36rqqSeJbR3yBjc9a7zNG9N5/xlrxr7FQs1ZuzSrinfHijIgE0r3PLefN0CEiZGUjemhX67l+/ccwfqiaZhb2lBBydznEyM/k4gzcXt8Brz7WMZeEwRaekv9qc+5VLCFyVwjK+dny1uHNBbXyKeJ9beWFP9vnhNWpOs1prutQPA1YITJPmpGzVYM8patGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rncWWzkEOSeedkq5/MRkSj1WKGMJl7UGO2ngpo38kCU=;
 b=zJsgEOg/0U/EELqrketMMnHf3u1wl1KMMLxi5Wwvq+6xl8bGkOIrRg+f5RXveAKyZppFEE9GloGaTF77Ka/Q68E8Xuat4sU3oG/YQpWTEYQhUPB3nJUq710fbF6/TvmSL+vJPvdy50k03a9FC6s37S+QlOO71wCUxxKErIh7sNTysIxh/Yd9vi4+R4hLNjJpPbmCo3Pb1XE8yvP7/zEcvr8ZNas/A955K2TozSM5YQkU00ROWiKr/H28Vtoy8MlDYiW4l8awmMt99p1EuQBQ07CAAi6QwDbFSLoRkBEOVn2NUWWxAP3d6c8ZCOcNtDRYIwE8vJ+VdLVJv1ntIKPpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rncWWzkEOSeedkq5/MRkSj1WKGMJl7UGO2ngpo38kCU=;
 b=YCYm4TgmfTBpCrGoYajLxFhPXt4Di5Es2FtJT4LDCRYowUpcQPRfETNGD2SosMYpDEvFfwH9GcPciBUmTF3/gAnUjBm88vFANuTN4758eGM4n8BKHAL0W15rxDGlsjhETKc706xurNhctjsHd4U+naIZ36Ovz52u2jkn7WlwbwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11888.jpnprd01.prod.outlook.com
 (2603:1096:400:407::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 00:02:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 00:02:50 +0000
Message-ID: <874irz3e8m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] reset: handle RESET_GPIO better to provide the fallback
In-Reply-To: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 16 Oct 2025 00:02:50 +0000
X-ClientProxiedBy: TYWPR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11888:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c23dc1-9af5-429a-5657-08de0c475899
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mzvJ5nyVu4v+XfcTdse6hb3cwqskzjTKkkeawy14ANZtrX6sMA+aYlvFRVcG?=
 =?us-ascii?Q?Fv85F8Wa7jR16qTfPHO0aZiq7BMUYIjEOhGzO3H57m9X37JIk0wpHe8JasPf?=
 =?us-ascii?Q?/D5yAP7HFiSrIaZ3gNkFmgXIDzwpX2CbkboRLH9obSw9jOk0pwlGMEpXDPI/?=
 =?us-ascii?Q?df3tSbxwLoe7M6lfFsCmJKIZeaLmkeQvIR95s/L7TRkoyZHTKLZWBDjMxD3W?=
 =?us-ascii?Q?mIyn6E28ydym7RUUP0EHqjxAIcItIdXlQSNBV5qSFjCSQsdmvSBY3uFBvncy?=
 =?us-ascii?Q?SoICoqCXobytzu4PrcMGv6AJYWMlt8NDy4zfafBCzhsFksYjI3cdxWhIbEN6?=
 =?us-ascii?Q?7nMDNVw/WoVAY/G3NzcfGT36W7/ScbGkunDilt36tONgbdEBLXG3I6v+CrDE?=
 =?us-ascii?Q?zjE23XFuOIWvYfAUx2jZPusiEXSBDoC9yD/4ZOSiU6bRRiab0GOkawk5YLd9?=
 =?us-ascii?Q?qNgXwQ1irE22kVDhjXkMCJb85vzpjpnZ+zWuCQh383A8HJ/fjF/IAhHM1a6j?=
 =?us-ascii?Q?pVFAJtQv8ehauXYxWZOHI4JsBR60wBH1Vo9cH+R337zR6mpCJJ19pLSzVFBC?=
 =?us-ascii?Q?JB7huZPLuseqIm5R0HLHB0KfcCUQwWTleb4SYT3Eks8TFyqv6PNldygPdrRQ?=
 =?us-ascii?Q?6yxCDqjvGop9acDmXviid6ez0gpbLb36l3zDXtR4iigSbbI7wJuIe1bqqLsZ?=
 =?us-ascii?Q?TM4g78DJElGH9q5VqL7+TITo+c1oWriJS2S9DN6/DxseLQwxoQB/WDn8LeXK?=
 =?us-ascii?Q?zTIuqM5MQ9Er0QkKdgiZT47lAq8Ray8WVrCoAjKJ7mLwofx1etB2GvNoXuHO?=
 =?us-ascii?Q?wGAjhv+e77Er0vdUiJ5jHxyDkLAWlQzWi4z+X7ByWK0O5vEnzh+RhXzeQpPa?=
 =?us-ascii?Q?+VO5UAqZPzQwe7V+6Kx7LnJvkNvcqexU7Ou5ikFq1OAvGX/ZDf/V54xhTrK8?=
 =?us-ascii?Q?x9HXrui8IFhgQCpUvialE4CuoNMFxeT6SLw0IG3A5eIUTvNXh9h5KrDXl/wO?=
 =?us-ascii?Q?oXvVsASWZSZ6+nofOtbSkZCyiI8zK3PMkTJj6sOZjmajnaDHiu3sNPs14G9O?=
 =?us-ascii?Q?SBT3tRMRG1g6OPuGIj0Czu71YCXwwKp06CY433Y5HuEBYBiwTlGM5NdpcKMG?=
 =?us-ascii?Q?LfB2QBNazMhVcA5nRv7aEAEmlBnvyoReuuv46VP6CeOsQN/KV8+W/7r/hgyz?=
 =?us-ascii?Q?ZBhmGEaJSuUOwK0q2OWgUpHK7Tjg7+o4KrDRiKYz4yewgoORchAf03Hg0fPo?=
 =?us-ascii?Q?weZkp814aOpRXop5E6vfzxFeQn6M1X/l0nfpmlDoEsfmMDqINjXMJ26OiAxa?=
 =?us-ascii?Q?mfao3Hnl1QNJPKAGJD6m+DVQx+VB6mJfSEf0+1CzJbmoLni0MHYzX1Wr+Fve?=
 =?us-ascii?Q?ZWPBUfdAFSFu1bvLGCWQrBLsw9ydqxy1seTDKrNNax0m1i8rVr0wQDy5bvVr?=
 =?us-ascii?Q?6MFCedXYj4KYs3TmBGOsxbIY9HbiXiJ1J52YTgGfoDxHNfRFRqulsMy6t0y3?=
 =?us-ascii?Q?+X1m4nPr+Vn6RbCtnU/ageLtsm2H15ZkXnDp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0U24GmSjoI6CcQGJjfVQWk9zj9Uf0uhWce3RnoPvvs/l1THlFfR4xoHU64f2?=
 =?us-ascii?Q?bILFpXuoXQ2qRNzr6TXhEdPrOeXfm+94KB+7+8Ha7JjAtR4zyDdpdMHGpJkw?=
 =?us-ascii?Q?Ijbf/oLmA8IDlGPwwMOF/SpCnpr5EN45RM0lrhRhiYR7qANrSJNGK3gQ2rVS?=
 =?us-ascii?Q?GJe758WPYQ2N2TM2AJm6toRH6DcQwfeXWK7XQezUltF+EIp0x6Nw9m2ah1Q6?=
 =?us-ascii?Q?CLgbrifYe+m1bReKeh5I5vWsITDuGguqW5xpuZr7YZy/Fr+NNZzxbMAfE/J1?=
 =?us-ascii?Q?aCOCdyqPr2znVDspWGZ8/kFSu7uTOrL5gD3RBKo7J06waaDYgp/TdofCH5El?=
 =?us-ascii?Q?xcHKPPJK9PxhcVI5loMaTtVNujrKLb3gBm94Mazz58YhcAWkIDkrv75q6j1y?=
 =?us-ascii?Q?lX54dnTSYsYiPxe6Ts3VcDZD17q1ctStOGmbodB5SQ5jW+NF7Nfu+h0Y2WIr?=
 =?us-ascii?Q?QAwKsqZw+12FPktsjBB4vZ/OWr8ju81659NY61vOD/IIRmcMErUvNg1FeOMv?=
 =?us-ascii?Q?Kbo4FnBKimLiLPpb8+hmFXY/FcsDhWIM/sWK+F90yT9D9jBResoE0gZRJx+U?=
 =?us-ascii?Q?3phPsr/nhVwd9A9Uizieb5vdvnMh4DA+Iz0n+Rdt7wpjpEEXSUAziKY0HYPu?=
 =?us-ascii?Q?WTSNXawswFEnJLtCodFybe4sAZ4viUBcwv5niwkI6fif37mQuGAzv9DLD/W4?=
 =?us-ascii?Q?IM7c+3uZfiqfyHmNIncpsM9+pnDiyDjvzc6XWLnzk0c9jo6eBWx8oEL13xW2?=
 =?us-ascii?Q?IvbWDFf5wlbi4txkwn8yIQczPQAYw9ValLezqB01b36urUJfHXmohfa6TlaZ?=
 =?us-ascii?Q?rrCeyVaocQTfxrOHCmi+arbNJxqQfSLttyChYUPmlWdENbeWvNvgrdBtSFeZ?=
 =?us-ascii?Q?GuBdiA95Hi+y2X6zmynqt1LFamkseGZlTo1zal1dh46m/D+6JPPY4Tx2Og01?=
 =?us-ascii?Q?Vnr2qQtX2fKcLa2exNWU0fsosd07l3V9/lFcz4Ut8wbPvfhrua0T7s9HknST?=
 =?us-ascii?Q?w5aC0uT24XLOzgzp1vRjlPtf964eMX2QFpQ3l/yQ9AdZ+9Rh8xC8Kjyq7m9E?=
 =?us-ascii?Q?TyD0EhuXNdix6QeCC2lQQNH1ecq45vSw2vv2ksg25Qq09ulSBntKSkGT8h+n?=
 =?us-ascii?Q?iaPnHaPI43asLur077wRg851a1KOhr8Hif9RtmwGN0wmO+2v7+tFYx/Ytbbu?=
 =?us-ascii?Q?vfrYSx55Guk+FkW0znKo3I1CGtYDzkdOcgjGs9end11m0WHy2D0n1aaGoo9g?=
 =?us-ascii?Q?lQ2dNEqAHsbs3fQmc0fhfCdUVMoSruRB48a4tzon1lU6GIxlrNvJWuDPdAvL?=
 =?us-ascii?Q?lp9XIaWA0gypsW/nHdaMfAQw50UnZTXHQ6zRklRnzujrvPh/mW3G/dBchCpX?=
 =?us-ascii?Q?ndDBY2F7ivEzuZxOkOa0TARXbe2WEfQoPVup9R6sGTPWO0vMNGNWr4iYli7i?=
 =?us-ascii?Q?c8D4/Bvehh+FUzAsyJoLGSpCQvo3Z6Fdzup3OL3S6/zUxdoeQPWUqmukAdCT?=
 =?us-ascii?Q?D5CQ/TQZToFGNacCOjDGyMMcu1F7yl66IROi+iaq2Vb/PQXjc1uM2ZIZyXMz?=
 =?us-ascii?Q?WaMytL/fbPBhPeZAunRLqch44Wbjn0mgXoBFgVrOH9mrGPReUBYdBJKx3Cie?=
 =?us-ascii?Q?MAjGamnONPGuXnAnwi1o/ZQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c23dc1-9af5-429a-5657-08de0c475899
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 00:02:50.3039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAORSdzeKoX9nRBc43Z+apqMbUXC2E31IEP+AQvWTJhq9tr0L6IKmJewPDhvfMkimTOI0J4jn9G3Wv0kKN4ogL44xLD30mvLSDZ0jRL4eOzu82dZ5IelG3WPQJv2dbWU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11888


Hi Wolfram

> After the discussion[1] (Thanks, Philipp!), here is the updated series.
> Details are in the commit messages. Please let me know what you think.

Thank you for your help !!
My board started works again (without .config manual update !)

Tested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Best regards
---
Kuninori Morimoto

