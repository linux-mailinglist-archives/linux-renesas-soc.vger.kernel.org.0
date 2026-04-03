Return-Path: <linux-renesas-soc+bounces-30811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKfcBiMaz2nJswYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:38:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE4C3901A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0899F301371E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 01:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDD63375C3;
	Fri,  3 Apr 2026 01:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CfxJXg/h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E8F2F3C18;
	Fri,  3 Apr 2026 01:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775180317; cv=fail; b=WFkAQ0C88QrqS5BBgEipuhFTU/mUVJKuJ6W/4XvNptKaBtPyuCePbDtRQ6pZQ1E7LA/RSkEV8CCHYRBuKscrssZETeO4a62Im/aBWRLqrRsTS8EaUnbZE8ZRDDSkXNdGASMJi/iCtFMWanJuw/GIHUrK/GBq6Hc3WL/qDNsYbdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775180317; c=relaxed/simple;
	bh=Nlf1EAaIshK9/oQRIqYdUupZAwg/QHGab2UietLpg1o=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=slWSqcmKMya4MSmC+QT14YHYHngcFQNlGtOcREINDi19pJsyLjXVb7pnsIFfsR9QMRE7XCBl6d9tV6AglhvFad9X/pGYsz9Rdhiozpx9pVXmv/YtOt9WB0AZApytpa/Mq5smyWN7wcBuyz7D5du4z1MRpOGSZYA3CbZq0oJUJ34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CfxJXg/h; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MG2fVdyOnOOBOPmSpY0tgPt/YWqc33o/xkY920YIfyMp5Ykpp6ER23HxNO4qb3hx9UAQf1j/X5Y7mjlNmn//Mm6y/mMxtCK1nCLS9vi5uUt70n412huWHVuERDcVlu76nKcpzCPbWbC0MEhP0MC32pLQBgtl9ZQ6RVfrl7A4+0sd6F7S3EgF8Pk9QjLNLeVG3Y8nmABzyxPnO5CuXnAoz1yKB/8xYxlDuyDRoJ1d4A630b+rfZ66soGLdQwCA3t3o17qu6yuwzEFWnaamKpanp4tBlyLnXh2oX7xt9hJowUWCN/Xs3cMO6YZoNrEJvo/XWLFs2U32tzE7Z/MvQzoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07Sn5zuYKFYhvPXTZoAE8dSYKwKVOUsrW4gajpMQc1Y=;
 b=qv7UNL3Z/Kauq10WitGmj34KXSiCQTiKCchwOEyWfLHvs3npfEotCv/ua+i8KDw69IBiV+dyTlrCxMp3hkZtLLKXT+5E4HfffoIID6eKld60+dSE3Nx87OoRIVtqvlnKZHCv9wd4lppzh/byczvmmy+pfFzq/drnhJ8LxQ0CiuE97rFMG8zR8x1cu+h4zNTl8EvIfC13QHYUNM4FZi6F7VnY31FnyuvsLi7fh9Cq+XfQaT/Un25pV1PKkYe0EXPS53CiU3/wNQ9u/9WLnb2Kr8KA6jnt3Xy8MSGRXDwjyHR1nSSI8BYy5AQj4+rczrbYCf2x1u0ERKoGpSC/NIyEng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07Sn5zuYKFYhvPXTZoAE8dSYKwKVOUsrW4gajpMQc1Y=;
 b=CfxJXg/h5JfbyPL7OFFgIAwoJ1Q1aISAhGLBBWSbE6JtuWOFjO2tUc/km9gLRxC8VChe64AuEJeK52QQFCHOsCB3oJYjmXqSmN/oZD7FuEPipQsHgxSj6kOjEcetK9EY18vyEmycfcK2GzmFj7/wUDLKyfFFa04Wt2SYfVnNWCM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB8396.jpnprd01.prod.outlook.com (2603:1096:400:177::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 01:38:33 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 01:38:31 +0000
Message-ID: <87h5psg6w9.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCh v3 11/14] ASoC: rsnd: src: Add SRC reset and clock support for RZ/G3E
In-Reply-To: <20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-12-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 01:38:30 +0000
X-ClientProxiedBy: OSAPR01CA0284.jpnprd01.prod.outlook.com
 (2603:1096:604:2b::32) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB8396:EE_
X-MS-Office365-Filtering-Correlation-Id: 449ddd90-7e35-4a3b-4b4a-08de9121b663
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mYSN0KVOC3r4Zx95ZxW31/1nTohaQhxMTCt58H4Fa8FhTK7LN1WtC6fQE/f8tZHtEW+WQZjeXL4pm0O9IMeiwoziOIw+nztjU2Wh5GsNVdE3m/BlxD/pj3tBgpdvCi0e903eCwWDRF7/dv7U7AxrI8Cqv0sFX2TiGBnmMJPTWVmdqxUnjPI28U+AMKAI6a06AtdFJDtnhfOXm2sRv8b1swQf0ZVfEYPYb5EhYbsn/pkmYTSNV9mtXjfJmPXGEbf0Et595Is8Xi88UTGbijN2d7oLcVOHZHwRow8CQHuYHpB2l95pnyt2ZrMd1CAlwnEAsclwSEdiCBAwyyVC2UCiXqaW9hGSJTdEy+6rSeptB9H6YYSUvwuQy+PwizrY5UvKBzLWere3N5dbIKO9HhiP6KgaaOSvr1s9m3C+JuDLanXqYjZBBFUACluktWHGdHQ8EhaBB/q3b0GwSLYVxIDE9XIxY69k5PY515DNmaD8R3MmR7u2HVCyEGTEnSoakN6Mm+HlAWLupGCB5C/Oi8DAWadqcPcx3WDx5hofoXZ/4VNrK8ARfQ7XtbpAXbmQgL8/G8Dbet3ngMbKsVmqSGynuMdoy62ZTX2bUVy2UBo/K4cFyu99Ybvs4UpPXZS2fOadKHzJl+qegNXvOeiMeTP6NLOZpqjRqek8q0/GKMRUuVtCQdS3EsZNlStWWRX04TdZ0go0t+22SRkE3H7+81cwz1l1uHdYMFJ3VBGkYmfdGgVOdpL5KRggCzRBTVHXT2pUDPpr5Xd4jmj5qJky4+IT7Hd9rJjJzfWU3ubEL1oImYA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0LNHUjyuxjviAwF5i2LxcIyqFEuW6/pq5gcWTQmLE/1N/ndT7nKxVcBpzFhA?=
 =?us-ascii?Q?r+tub3WkN+BQmeDLt+xWz1s0EXO2I8REDFPhQyN23lFwLlG9GMJfgoI/JA08?=
 =?us-ascii?Q?QyWst+vEzTAuM1+OQAjpi9OxcaReskqohR5LCrJ3N/T9VPPs34puYvPt88+j?=
 =?us-ascii?Q?iBlmzRBn/CCNawHAZAkzQjUk5GCb/SZVnNcIHYGhpnu9TrFZdC+KcLWOW6kV?=
 =?us-ascii?Q?NNQ06L/SCuez8ga8isiho6qi6h+hVG+9fkIUH0qkHTJrot4gSCILMpYqIQ+R?=
 =?us-ascii?Q?td3d+yWeFK4byrOG0PXh8OPR7d20RgFp1A2Dsfi6ZV6qbaQgfTGjru30z5Kh?=
 =?us-ascii?Q?msdZHDX5KSjbeNOWnlK6qwEw8F1LFxtJb5pkFk/aIV2k0dknfJ1mOXh6/MK9?=
 =?us-ascii?Q?tRmXsNPM5y95L7PACJdEG/+RjrfKFvt/hK66KT2ckqsIYrP6lzZHXYZrM6ap?=
 =?us-ascii?Q?jJ64Tgj2gQ4Ks0XTdz/KBJZwhKzWny0hESY2wc4yDaASSdUIit7E5NZceTr4?=
 =?us-ascii?Q?C5yuFBGaCm9sLHYIAlOqSGysoic50xTqqo6ZmtxEjpWL+O103T6bAJ/tF4Qj?=
 =?us-ascii?Q?AF4i/TvXIUzJt/51fG2tD9iXx9mZ2j7qN27izc5dDs7ehOVp1xZHKE0pLbkC?=
 =?us-ascii?Q?Paoe+43TD/Zv+u0zXqrPKs8F80GApgp/9WVhcwqxAJpjj9x86+OdZ+z8UlG7?=
 =?us-ascii?Q?uFXL4rOuUjtVR2bY15SmGzyr/cHM/FZUpijwGlwTwzbK0RWrjp6MLic7sO01?=
 =?us-ascii?Q?4J0J+DEWJhJlU94B6U5B20WQl6Wc0HhaAOmujObUaOrh/Elj8715VdxFYPJV?=
 =?us-ascii?Q?43PGj0A2aZ1qeTLi/XfaxszzDBGB9zfcGyycZGIcL5jW8uCmr8jqFvM9iArS?=
 =?us-ascii?Q?tymtadnag4IgHLQxVHZ4uPm6SEzBnRFsYF8NirsCAWRHkSdeqCcU0JXCxEIB?=
 =?us-ascii?Q?jtpnPsRfFMo89Gp8b6dXlMku58ywke+UYPjLVLjjMTrPlQGHRLdA+hJAkDSk?=
 =?us-ascii?Q?FlIr1b09rC0e7PZDJO/9pzy410qi+IdIcwx967mzFSnNYRyz1ZZYNC6tyCfg?=
 =?us-ascii?Q?gOhH00R3IL0AhCA/swqu02hBQ860tiLATuFJMSIigJ2Xp+P24K1FgNFILyC1?=
 =?us-ascii?Q?AAiwKYVn1iiSykG5qwNDUJIdsSflKfJq4ZSY91yQMOPdQno7d3c5jCziUwX4?=
 =?us-ascii?Q?gcnsIO4lk0PLjYuxQnUSamt4036hv+JhyTFC+gWt/Sm2XKQCiulPO0rfQCUG?=
 =?us-ascii?Q?mFqpa/rV1XLabmQyHUGKrqdZ2iQdTXDuPUduuWVS86EbvPlNR29vWzk7Mh4O?=
 =?us-ascii?Q?AtBJuh1NE9gLg5u0mKhapGZRmAkU2swaR1c5543LHf8yddcBsEK42qoBHgru?=
 =?us-ascii?Q?vVyocJ0jFtyFJEcfB5ZiJ/RlOVTqO7MfN4DUV/UuuUfqkFfE5uqBL31AUNsM?=
 =?us-ascii?Q?AUQ/oLDIcgTONnLVoQG0TFU8AiVPJnFlFR8Xt9lsA5+j0VuduYlnpBBs/6xD?=
 =?us-ascii?Q?zt/rcg+BqyvGeLsWxfE2MiGh8WHcWcNdzNtkiCMJrrIh1ZCBfTyP+xX4Ggsg?=
 =?us-ascii?Q?ZfYrhHKQgENGR7xzsOFpmeg0mE8bhtT6CQ2mC3wM0EnnU/P0VG+AjnEffor6?=
 =?us-ascii?Q?23qgzL8yp+tNQzNslr7sMuIUtAFyBd3UtcQX9N6fxJnzffcSp8GeahViQ6wP?=
 =?us-ascii?Q?ofe6vXD0eWLbE+/BNgfPI2034omlVTCVuEgEP+0CK9s4EHq53PV4Nz5f22zo?=
 =?us-ascii?Q?bvv7Oz3unwLcPaus9ZdSfV6n2D2iQNWsr+ha9fdFA36levKWrtVN?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 449ddd90-7e35-4a3b-4b4a-08de9121b663
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:38:31.6175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XLfsOOBUVzFF07O0yTDDboSiRR5q8Dc+9DXXrthLmGjkiXRPHncupk6p0oeqWkeBySZHzT6eP0eSrWyX6BaIEo4l2aj79PT1Kq0ZwX46bJcI16JGONroYXRgXBKRTl6p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8396
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30811-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1DE4C3901A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> The RZ/G3E SoC requires explicit SCU (Sampling Rate Converter Unit)
> reset and clock management unlike previous R-Car generations:
> 
> - scu_clk: SCU module clock
> - scu_clkx2: SCU double-rate clock
> - scu_supply_clk: SCU supply clock
> 
> Without these clocks enabled, the SRC module cannot operate on RZ/G3E.
> Add support for the shared SCU reset controller used by the SRC modules
> on the Renesas RZ/G3E SoC. All SRC instances are gated by the same "scu"
> reset line.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
(snip)
> diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
> index 2c5738926093..8700b39b535e 100644
> --- a/sound/soc/renesas/rcar/rsnd.h
> +++ b/sound/soc/renesas/rcar/rsnd.h
> @@ -632,6 +632,13 @@ struct rsnd_priv {
>  	struct clk *audmapp_clk;
>  	struct reset_control *audmapp_rstc;
>  
> +	/*
> +	 * Below values will be filled in rsnd_src_probe()
> +	 */
> +	struct clk *clk_scu;
> +	struct clk *clk_scu_x2;
> +	struct clk *clk_scu_supply;

It is SRC specific.
Please move it to rsnd_src instead of rsnd_priv.

> @@ -711,8 +720,9 @@ struct rsnd_mod *rsnd_src_mod_get(struct rsnd_priv *priv, int id)
>  
>  int rsnd_src_probe(struct rsnd_priv *priv)
>  {
> -	struct device_node *node;
>  	struct device *dev = rsnd_priv_to_dev(priv);
> +	struct reset_control *rstc;
> +	struct device_node *node;

Very nitpick. No need to move *node :)

Thank you for your help !!

Best regards
---
Kuninori Morimoto

