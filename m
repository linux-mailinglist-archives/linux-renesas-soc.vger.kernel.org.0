Return-Path: <linux-renesas-soc+bounces-31103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNY6AMlY2GkvcQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 03:56:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F713D13FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 03:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8761030086EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 01:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1859330FF32;
	Fri, 10 Apr 2026 01:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="faDtZxM0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB64F33EC;
	Fri, 10 Apr 2026 01:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775786182; cv=fail; b=V6acdZrEJWdj9JK4+I2HThVRtcYnhBkMcGvF1AKEKNfcqZPVvnBDcXQIBXkc2+Bq0i7KXiCtFS1BDhgdGMrLzR8mrFdmp3jpTbQdXvQqoF55f03VvkCSDfK/ZTz1e/RJNiKFLHBQmzF9XdRdSUn1mJzYAv3T/GN7tYWjC6Se7r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775786182; c=relaxed/simple;
	bh=rWm+0rgOtpYZP03+uQ6/YYqMb4NPY84JNm8nZLpiqh0=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uowzPI+ZWiL4b8/sWdl1tY365deXvlBEm8jHqLNL367dZnXk0mi84zCmQKOW8oSTG7BGQBqTpmb9rlenTBeRluPpcGDW7d5LMjEvTU4dZsGg1/Itfbo88ZWSve0IMp8UMX+b+7VqsDEMcoMGsql9x/aImjrE4spAKAKiMLaJONs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=faDtZxM0; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6uQvOwj4RXl5JoET8AiXYdLB4DdxUSB7Q5vNuBW6qj1eByfR2qclqVL8sANHboN/Zgvc7vht6fLnZFOg2y+XUHzOHy5/oDdraeXnf9SRcMVy/UmUp3JLzVQOio+bDtJd46B/Vo5WATBvlsQZmi7W7cmrYF6hR7skhg2RVCnyjTco1UHW4WmQx0bG50liZL3LB49atCU+oRHC1lbCES13cDJeFjkMy9YHg/meXuL2LW3Up+1R89IklAQCOeIYvmCo+T4gl81/WWWB6lKQNDXYNK089DlvY2SSe8lZWgIwp3EvKXxBSGXHhaqASgmkST8LrIP1lK9xr9A8VxAMdgqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB0nro9dpIxPBEx1xCwHoGbua61JhAO+DG3Gca0zL9Y=;
 b=bnnrH+8dMP3KmjNfQ6cWRhct0vLAcHX5b8EVgFmlfAo4rzEHEOzQkpQW4WVjrtKbh7lhWzzjbpfWuYS9Oe/vfDu0NYPXOMKK3HhAXsOPLPBikFBADz9rcZuN0LPGYk+rSmVLpwhkCeUgcHneldbtXmVe6dIfUsox5/YzqKEhSWcIQ5xRDdA8R7C0GStc8p9dx6YewAwRRzUMKfCpToEUx8cTqqwn+TRVYI7OjuUMor+jO5CnapkOl9mbmQdyAe167yT7e6YSqn11uUYrGHcyxOFxQLORv302W2XOdEt4daklOJOvkm/t11qXEVcHiXSnnC4HSM57U3Cxs8KMTbZqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OB0nro9dpIxPBEx1xCwHoGbua61JhAO+DG3Gca0zL9Y=;
 b=faDtZxM0keFTqsLVFam9/UCUhSci7gZadAzn73oRgn3h/d0scvDwqzBGmxbKMTtFXOUCelMG3IBi6cYEVdq85HlqNbwzbWzfcBhUmeX5YEVDOX0seOCiufsUNJ0vKETsVmGAmnqdUgrVNVkv26d48K7U4Q1iXXCZKXfXAZF28kc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYRPR01MB16269.jpnprd01.prod.outlook.com (2603:1096:405:2ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 01:56:18 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 01:56:18 +0000
Message-ID: <87qzonefy6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/12] ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
In-Reply-To: <20260409090302.2243305-6-john.madieu.xa@bp.renesas.com>
References: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
	<20260409090302.2243305-6-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Apr 2026 01:56:18 +0000
X-ClientProxiedBy: OS7PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:604:24f::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYRPR01MB16269:EE_
X-MS-Office365-Filtering-Correlation-Id: 40959131-ec79-4f99-66e8-08de96a45b75
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5H68efpb9muQXnMQZZ0XTT+MdEQ5NM2wYF/r9PaErmecV9WTYEWvDtBlb54ilyG21QePDcuVBAmGOIghCfD4UfLKdTJQ2mLNC5twTIOWd09K994iWDiOvv7yhiTByxKMkPCSfh6sO+hjTz1X3h+ns6psW64491m95tY5/NrxM0SI5TreuA3cV8QtgzL9qZw9vII14Ax524SLuArNoYx1WbR5DcWpXuwbRa3VTkBC+16bQ3TAMpT9CHsDPTIHiTMpR5v45A/dvm/HQcYjU8SnpzKPZ9wDY0hrRb23ehM9vndQqtkxpMx/jJoR+6ijw0sfyDzSnIW3QmDe1hzoZ+4SK96JB5xEXCaPjSVBsHeb4rw7arh0OeFaPp5hXmW7wOuczh1iNjj5XviosMbBVdc2jPkfCcZ1Qy5V2fwxhK14YaRAn6Ixo02ecPu+54k/u4GgEfiMcb0lwAfrd5csIJ8jc0BOHBNms5gC0mbvgwPwblhXa8uXPFE7TS/4GSpdY9iH1w3iWLI8shxPeQSYRvDMMqMAuq6oVtQeoSKZdGQIeubnX/CpPAJ3YN1VP9qBisljo10Jfh4PEo5mLdSqYIIxqu/EEdniIF4YymfBdRA90kAIwE3pt4TvSU5yrXe6mHi3J/R2js51HEk7GcMRgBtaImBthYRBqrbkckm95ZkDdBKLQBUwW0U2VSC5T3HJBTGsWecL/o+Ko2K0AXwnslJ2Silb8DMK0eGxkRRvmS+1UHiYUaGSQR96AzWghMk0IGxCrn6/UY2HMhMfO+7Zap7pL94zoIS8TmmqM96f5N1D6sg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ht3ijHscfAvC36qhX2vvQYb79Irr5m+DddHMiGEmbjJdjwJPqKUNnZP3cu0?=
 =?us-ascii?Q?7eEEEXsvwBOvnsNc3N84GW8oRGyQNfH5SnIC9Pw2IEYqjRoOAiMH+E6WdE5F?=
 =?us-ascii?Q?QNsdykRUVBAnOVai1/S0AL5mnBa5SLcpiJDG8aRojB7PUpxgge6Mg4HOib8Y?=
 =?us-ascii?Q?bv7fuqK02aPkWi46fQRiTl0JRiZXpledG+/Uj8ynHj39luizoABMCFtEjOmd?=
 =?us-ascii?Q?7Wqi/voSTvW8xPAxGT5qufsJBxiFlV6WeMCIY3rWnKy9Ygf2dhJaHVk/W9wy?=
 =?us-ascii?Q?pWauCEaLIsyLwB1HCKPqWTvduAHXk80LKkHQPBdZWnUFJ9b3tcqgjNEwircY?=
 =?us-ascii?Q?p97Vjeo3T39Yirk1f6DoFwiKoFGJQ+H+2eg+v7loKEbEiltTlKMqDAbyFeiB?=
 =?us-ascii?Q?if5FgpCAHdcQ8Sw8fEhNYn/ijwWRnxjI066FgaTz0JSzcEGFDhczSPceaRLp?=
 =?us-ascii?Q?tNnALEOOtKR5qt2idZKD3ie8yvANteKa5PE9oe1CsxRG85g02zXsMCCpAeDh?=
 =?us-ascii?Q?to9r00xJZ72fxGovmb/InE6pGwFlixX2LPnLOr6QWETqucVzITKPJ/gLwQ3b?=
 =?us-ascii?Q?FdN9q+n2E1HvS0rahUvCqpZv/q7CZqwCB3EtRmtszLtAbfSNAZDqxSLGuk68?=
 =?us-ascii?Q?gZsIfumc6c5Zdz8Cb7KwQCPMrFLMp5U3yIn7RYZ2oGcbvcE7mJfWXP6ry+E6?=
 =?us-ascii?Q?HC8SKs7CaIcnqlZ9YDGN7RXbYSslUVpNW89e4NmActhbfdvHby3AGpPzKCp9?=
 =?us-ascii?Q?EC6eN6k49SuAayAB6uiqEV6b7O5Ja/Qd8nxUdyzH3rPGpX8StCKU317XRo3L?=
 =?us-ascii?Q?bR5EQj1k6aHICkz7yTuwyQvTCV1wN+kcGp8hHfaSlpsbPnf93r7Y7Ca0/lkM?=
 =?us-ascii?Q?Emiy4ymNFg0fUeuXoiItAgjo+kdJ0VpZKPTplScRqhR9diQlriqAkZX/rY1w?=
 =?us-ascii?Q?Y6dO00JFioLG9qHBoro3wTVqTZEhD7p2d7btQSrRsbLbjD1vl/BYaM/EO8IS?=
 =?us-ascii?Q?XHSN8wH6Ro7yiueWi3I11djhBdt/hGlfhXkO4JaT02EBr63T9lxh7ETM+tFi?=
 =?us-ascii?Q?IO7hDnlZfUdhZX/upOflrf60gNaE/ERPiGpVi6xG1WgNakgSfSqwOskZbjjl?=
 =?us-ascii?Q?fnfrm9403VzLNggP5P2tN8OQ8yAvBAexIR7F2Io+EnAnuflT4BgihVWBlTCr?=
 =?us-ascii?Q?eqLRoIjgI35EPLC4daQ9JqN44WtjkZoVXchKOPy/AiJFp1a/Vrk+ly3oYh9A?=
 =?us-ascii?Q?YYiXznklP0EkbrY+VQ08/GoqjFhBPF0ggIY2o2L2f+A9XPoo6YAYoghlm5xI?=
 =?us-ascii?Q?gONZ6S7HAME7dLe0s3INqGh0rXgFYrNGDf6wOWeQLo4eFu+u/29M7c6h+40M?=
 =?us-ascii?Q?dM/IWXRJF5bAJR2t4CfxHaZAO54eW2ZE3V2c+tXPguNXiKep/el50qSlxtja?=
 =?us-ascii?Q?yd653yAAKszEzPyIF87AZN8mhGfcOqI+DcjpYp1rwtqIgd5KGGQAP257AEwb?=
 =?us-ascii?Q?FC8cenhT6UEP3rGgJRjyLmItk/k/j9442BoP618YeOR/aNqi311OieSeA+t6?=
 =?us-ascii?Q?pTA8dhQMGIHUVpWMcYV9ftPlANRubm/4V4vcnpwoMaScF4M+4fEInF/ijkF6?=
 =?us-ascii?Q?83ZRgtXWomqFPiAD897wOngqWOIap4iEJnWPp2zYGZOD/qUEQlU+ffCruv6c?=
 =?us-ascii?Q?k1jlRVRF47lK8RVNA6srYMfKDwKeryRDMKDr5Rff9vz+I7sOL9rc3ihqddEq?=
 =?us-ascii?Q?1J6Ch8cvqxX7iwGwpW7PywEFGnc56DjJAJHpOd5Mz5odxwTYg5ck?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40959131-ec79-4f99-66e8-08de96a45b75
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 01:56:18.7783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrwFs1if86KJUPzjtG3mzC6afnQt/nxJHYyKPvk2ETcyagS2q0Pa82TCp1cYl33h1LRrmpPpm0J6gXjFRnz+nDOdMDcRTlhNifuVASnt0W/2tC7ImEHGPXR+v7GXgJcL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16269
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31103-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 56F713D13FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> RZ/G3E requires additional audmapp clock and reset lines for
> Audio DMA-PP operation.
> 
> Add global audmacpp clock/reset management in rsnd_dma_probe()
> using optional APIs to remain transparent to other platforms.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> +	/* for RZ/G3E */
> +	dmac->audmapp_rstc =
> +		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
> +	if (IS_ERR(dmac->audmapp_rstc)) {
> +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
> +				     "failed to get audmapp reset\n");
> +	}
> +
> +	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
> +	if (IS_ERR(dmac->audmapp_clk)) {
> +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
> +				     "failed to get audmapp clock\n");
> +	}

Very nitpick, but could you please add comment that these are optional
and/or will be no error if DT didn't have it ?

> --- a/sound/soc/renesas/rcar/rsnd.h
> +++ b/sound/soc/renesas/rcar/rsnd.h
> @@ -623,6 +623,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
>  struct rsnd_priv {
>  
>  	struct platform_device *pdev;
> +
>  	spinlock_t lock;
>  	unsigned long flags;

Do need white line :)

Thank you for your help !!

Best regards
---
Kuninori Morimoto

