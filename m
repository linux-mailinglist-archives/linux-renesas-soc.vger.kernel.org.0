Return-Path: <linux-renesas-soc+bounces-33642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rcQjCJ8HJmrrQwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 02:06:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DAC651F9C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 02:06:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=G5vZbYD+;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A659300515C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 00:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2F24A21;
	Mon,  8 Jun 2026 00:06:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011033.outbound.protection.outlook.com [52.101.125.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F17A59;
	Mon,  8 Jun 2026 00:06:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780877211; cv=fail; b=kKPsywuzXUkM3XpmiyszRucNfweaUyXXn39w5KgdQHFUk+mqPqoREsS/AUopSxCVUgUQw7QtUDevZ+E1gdzp8bQFIuD2HiFW1DNY3GNO/M3cUoNyxIT56UIj4UFBLJmEgf2+olbpdCvQjz6IUOn+ZvaJrdNg9x8lPufLBUBzvaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780877211; c=relaxed/simple;
	bh=hMtGwvdNLRR+Udjnkq4y+zrh+2cIf3AfuhZvltlOTys=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EptzelIWnt5BmqFBEszqCjAcaJOWoOwG1D0ikBTwCYVsjVFArvLgHsNEkRZ/Axs56232mf8ZJF+buWVYx7xH9dYt7j+JjCEzlOyGgcxaHI/nukVuNEVc2nQpN/riEnk8SGmd+CudOqQU6dDLeRmUI9pulPHRdreg5o/zMzl8pWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=G5vZbYD+; arc=fail smtp.client-ip=52.101.125.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/sEQIIkdkuNP2Z9vOxJvMnt1ePQvTGhtB2zMckOLWmtNHDkZSTID9fowZyI57N34suG6DYK8kfCnr/7y6Nv/ySFIYnfw3Y75kjo3YepUIEofHuY1y4uojmc4xQNuVhQq3jw2BUl79ky13glC+7tv+lINIgyM5qddcjVXL8mJ+6Yv7XM6w2OQNVaPoitfFYVul6vUADbGojimV1QWuImebhiT4okR5PhOTqAwJjDplRmY/J73r55f8+OMqim128WEHoGhPKFiaC4iccGF+q3u8Fjdu+31DJvkv4OSNWyidRdUF8cGLZkqLmShdwsHO4nx+I7SxOXi6JUjD+wc2wX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppq+wGR2mr/INmpCBOyIbmNhI1sszKpHi/Z37a6jve0=;
 b=s4gkAQSrbojN8ef1Rjw/P+7N7qQZIFO0dD+bOVn2ljqcisA6L1DfdIzMVGbJeHMKudxXKiXPpUMC+WcevcDW5gaiV/9FpvIW8MWHwiugoEYVvw2q2RxDhBVl02YYj9yBb3CQCzh2iDr5f27pIfy3FHshg/ix2h0j9K1zN9ApX0ZeYC67n5vv6MMyO5NpnzozlS1j81OVGBif0p3lczfMtfhoJvqwA+IdbhZqIZUro3kx40+gPo+J8lkPLs3BdAKdnpwXdmcU7LjsmtdEo3OZqHiXyF42WULkYM/FaI4ggy+CimFPP7ZxCtR+UuO+B4WEqYtiDOY9Ot536q7gM0ZSOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppq+wGR2mr/INmpCBOyIbmNhI1sszKpHi/Z37a6jve0=;
 b=G5vZbYD+dajqrBWugOWtbgVoQGVhBSlmJYTlpVNBPDtH3IvesmwsiMlQVgzRAiEURk/RMveF5cfJQkVqTtxk67D8ciyEc1XPneB9ekcssWjNue9qwV1FUG/8aKb5KBKUxSSbayYKrhaD5/9Zzj6cZtgzcasoenn4T8fqATrYSvg=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11446.jpnprd01.prod.outlook.com (2603:1096:400:374::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:06:45 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:06:44 +0000
Message-ID: <8733yxgajv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/10] ASoC: renesas: fsi: refactor clock initialization
In-Reply-To: <20260605121955.105661-9-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
	<20260605121955.105661-9-phucduc.bui@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:06:44 +0000
X-ClientProxiedBy: TY4PR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:378::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11446:EE_
X-MS-Office365-Filtering-Correlation-Id: d93e24d4-f8d9-453a-431c-08dec4f1d384
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|6133799003|22082099003|18002099003|38350700014|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	WoELynbjz4WVfKvTwr/+q5kZ9C0wX5ne2OljNerLX0upDOzAGNpsfBVFYvuhDhWXXb/XggFZ5gtQHuQMnpOgddnjXdszxyTIRF3Wf47VtTrUr8BOXis4X+WmXK5oRIUGxBitwqBkBCKSNCcUzlkTJ6+QhKFPZaJIzwVrMS855mphIk9ztv3l+p7/xqF2glaFlUEB050DoWS5NBHWx34tiWk2qf37dYpOwIqZRtdZgerDd/FEetMAUm1WjAyp1OJqKJpQAxDf/LTyuZRaiq9d80V3A2/xCaiQ6yLDTEGtC0/tLqkN5ZE5NTGtH/Q8I+qBuEtXNSUmWWxJDpf6T1Hx3YGOpB1E4brRd1uidRLpIOeRM9mxilhCmmcGW56Yf6xbSYNCALFAe5EkkD75XL9vL3XoMt7K4NAlpAMz6Bjxk3dk5cUXZm6kRfzC4A1TKhZiGmxEaSYWt+b5Hf6+G9YyNZjqCMyXIbdu9PCnf5q+kVkhkiluPTuJZD3CzcjacKTlMN7pH9cpDqg4RLXmYouoca8R/1VSRSuqCnBzYuJhglHxZJzP7iQb4Ii+uG1qFVjeQenL73y05q18YlvYM5M+ad1Fqa+vexJt4qQ1a9oiK5RfWiCNT/xnrr+HDBGJQZiXOisahWocW5nd2gGiwmrdcIX7zI3Mp7tvbsZ0G3gqqdSrkHGr6prkMzehQjZUgTJ4d5z6Tp5ryjCQg1vu2yF+Q1y4Suza230lZFjcjX8+BVTmSERHGZWHCyZ+V4yc722o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(6133799003)(22082099003)(18002099003)(38350700014)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E1QDTceEtz1nMzrtqO0Gpi3aA7hwkalXxbadRGhsaudZhz7yNlRCUF+lQUni?=
 =?us-ascii?Q?lPoHcrGlNRs7w3vCiA/l3y1Y+1bcd0DGIQr4Oi00fiIqpAa3Q3wJzE0vE56A?=
 =?us-ascii?Q?DQREaNKROam/db7Jb+EzznQ0WtrsdTJ157rXQSnjgvBRpc4mOY0QugI30oX7?=
 =?us-ascii?Q?uJ4biOUTGpI6ZYZ/j8vPGhbZTUUCQBZtxHyOft1LX18pY+s56mHfi6Pcnln9?=
 =?us-ascii?Q?6sqhhWyKGRJqWhB4g85c9l7/dsUxAEsZrrBMECLP2EG2emxp+dHXkV+wnF/7?=
 =?us-ascii?Q?OSJjwh64ZXizWPSFIzs/2kUIZOq7Qhtg1FCrGBmfaLgP+2GfK5QdHjZpywRs?=
 =?us-ascii?Q?LIlB4DA65z+IUjQeAiR5A8jObqcpnPV375jjb2/MSDzL4nfHN8w75YqDYw8x?=
 =?us-ascii?Q?88iz2w2PJ5R364tnzZHc0PqO/rj+LcVzipVaWWkBlLMry5KKRA7B+vfLfSDq?=
 =?us-ascii?Q?5N/P1MOfe17uullo8BoqBOHHMWimeT2KBFl/uEw4QOcos/Lk9PI3aU6p3aNg?=
 =?us-ascii?Q?78o6c01FCeDZCgIxFgokriDanqzbmeODrQJpKMrv9np73kN8Uoql21aoQ4X1?=
 =?us-ascii?Q?Fh9Z61aOhOoQl00Y1TMGSSdyy8MCV2b6jdzjtVcnB7nExlwm0qll4NBPzTE1?=
 =?us-ascii?Q?gisInQ2FtunPC2X2ndFY0FeYLOBVbOtVJUWVgTJfpMPzto5zn5AXICJkzT/n?=
 =?us-ascii?Q?X9nUQH+wKlPdCzwsFeqMfuWQk6V5fGef+HHxaCEzbpdXnlxYJBtFBg1YcSYx?=
 =?us-ascii?Q?MdTlTV+rp99wU96YF4+UCK7N+XzEWVrpBexMiFgk/pLDLk/L8GABVm26kk88?=
 =?us-ascii?Q?L18X/xRQdancr27SWX9asKR/0ByvjMT/HU/Xyfc2KSlVu1qLPkssIke9Xga3?=
 =?us-ascii?Q?4IV/21jy3ZGMiUMwKUfyUxaSmQXjDnt+M7kK6iaA1cG1UQDHwWmzU/eTMbhn?=
 =?us-ascii?Q?YPGD+RRQTIjLVkbzPOsyyG4CXd7sv/qBlmukI+WmPRaKpD3WOKckcb3UC+7o?=
 =?us-ascii?Q?RMgkxUjxoEASoME/mmU4yDcrfQz88yJS5oaidZzJdqI/+yu4IyhiWRjPbV0k?=
 =?us-ascii?Q?z3b5vfVH0b8e7b/K1DaI5ndUdROZVPlZg4xLrPCl3zoAcIcrEtZBDdyxNaYf?=
 =?us-ascii?Q?aFX6CKcSuSdlsUDSm1QxRFYikKGElP5JD6GmZEDedXg86H/ckvyIoYLnYaXb?=
 =?us-ascii?Q?lTFu05k+p0PgCbiDz9WG0u1WmSrV/NO6JLiLjaXQkEU3k8AHqXUFq23Y/6xd?=
 =?us-ascii?Q?HljrWO+SZRRUjohL/TqAAPem0llPdLKo87S3IaVH4I3SdHOdqjQnNySJ9fv8?=
 =?us-ascii?Q?ajObf2qCEc2A1BQgvaSKQWXA2IiRRx5peu1EERf8qOH/P6ZWwKPaxHlfcdhr?=
 =?us-ascii?Q?vLFR0fyvLM5o9wzS46fPOLUW1+KoTO2iIDzMl4CaIBSHm1iCmAl24ZTcP9E6?=
 =?us-ascii?Q?kaoKbdE/dUPS+fpu4BLQPHUJOfB6CKTaV0leQCYQdrGRUb5DV44M0V5RplwI?=
 =?us-ascii?Q?F2uRGpBABr7PL4oDcRAPg65iSDWnPR0ZqDn0VkYEni792OeiDEGv1t0Wm1i+?=
 =?us-ascii?Q?XtR8lqPFZDF3NZy1eA3bA1VyeN8Bry2pjAIX7YXC8FOSkjCBH3AUnVYjyGkl?=
 =?us-ascii?Q?xQ9GaOw/QKHPGAF2MzLiXZrG15EAJkYU7fMQCxxAVsZyYG7unUAqgTm775QO?=
 =?us-ascii?Q?hv4/8KiXCAa37YNCE4E2WLTgRhfS4NLFfeFkLI+r4r9CvFntG2/kcERQuZhi?=
 =?us-ascii?Q?41m0EHUkOSak8DmUe5tAxz4E32sFl7A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93e24d4-f8d9-453a-431c-08dec4f1d384
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:06:44.9363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvNgdgrHDdKcdku9j0vqECt0ntPGaEXIVhJZ86KxO029iTH8YnU2NDr3QB/DUV5DEm2sF0429QA24QKOmXzuD0KCkJ0wGvCE8v7OQPaKM79uU30S2rkUAUy9jSUZctYq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11446
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33642-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucducbui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,perex.cz,suse.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71DAC651F9C


Hi Bui

Thank you for the patch

> Move fsi_clk_init() from set_fmt() to probe.
> This moves clock resource lookup from fsi_dai_set_fmt() to the probe
> path. The set_rate() callbacks validate that the required clock
> resources are available before they are used for hardware
> configuration.
> 
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

In my understanding,

	[07/10] patch
(A)	 - devm_clk_get() -> devm_clk_get_optional()
(B)	 - use dev_err_probe()

	[08/10] patch
(C)	 - add clk_spu
(D)	 - call fsi_clk_init() from probe()

I think...
	(A) should be 1 patch
	(B) and (D) can be merged into 1 patch
	(C) should be 1 patch

Thank you for your help !!

Best regards
---
Kuninori Morimoto

