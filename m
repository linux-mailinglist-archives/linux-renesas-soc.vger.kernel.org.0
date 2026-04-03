Return-Path: <linux-renesas-soc+bounces-30805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFFDHY0Mz2kNsgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 02:40:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8638F945
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 02:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5817E309D5BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 00:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CC526CE1E;
	Fri,  3 Apr 2026 00:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SXlEsVLy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70FD270575;
	Fri,  3 Apr 2026 00:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176587; cv=fail; b=YHdY4EIrT969t+pWdb1bUZpD2CKcjIRx83s0yiSt+vUJUcGAHHcOtR6WDNzs1LCllhT5upAG0c3Z4ixm9KdDhJI0yPXF/Cb06oVtRI6dhRDjXefDRoA/41pIxrz2Ozc2Ozmp7dHdnzu39sOxp2u7nRkRpJ0UE76VuLtfmJyg2Y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176587; c=relaxed/simple;
	bh=X21eIqolkOGSpavC4u9WzqhXhQFLakbpexj+pCQDQis=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p0EL3B33DJOguuGbVHKTYzh1cLuN9Nyu9tbInbHu4INcpFohMH0qEzb0jXEW+VLejWes+wubXtH7YumT7Jno8N+gqBwSiFNbtj2sT6YU29Zv/NYSd9mfNhLCD5zLMlH1fVirhKqeTpUvXt3OJuo5mKNCzzsaLGjPHCEiDJhKgmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SXlEsVLy; arc=fail smtp.client-ip=52.101.125.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUI8SZSjdW9WswajVdAMlfSaOuZCFeru5CNsAuSAdENfXiIXzXvuD7Xfi2ekW9KqilKetT3cZmMZVihnPFREpP7U1aWiJT5dKfcrHXWN7PHz/uhaJXVNGa8IajiScz/r8P8LDfixAPO2SgAlwcIfdsoskUmAO1oAz1pL86Nv3Kzv0pXcsZmxlmsBoDFcBWGPSnw9ajoLQ3K54q4x9LMzPjLTiCSh+I1X+yjEebseg2ogGfdJaYdfjvw+hrwYngI2pNVW/uxozxaNRdXSzcGBnz7BDmNX6ZI8kEWrVk6Izf57x5a2IxWdw7IPG/9lh0CBlmeTKexHUw43/2RwA1FrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9JZ+YBTtBD5xDHrUdsGTqu9IahOpl/EKaTsTbDSUfY=;
 b=nxMLDk3XPNLQJ8pdGMicLiHdz3h36Bb8wZQYBcoQ0ung1xw2QtT86YM7JzrbImQLVBBDETlPGTYEymgLPhlYklEVrXXpgNQdwy6GI0Mc9fP7y0YCw30hM/Fxy7x7GfJeOS3mj7bBdvR/6LpmpzZwLN07DmUiS2/qjSRdZpIYkRRxVQwbMgx74d6r+DQlKFHE4Se+bgTs971krAp1Qvg9t0ieKvgWlWWW2ecZwdmtl1sBDFMc6Yr83EzBE2FwbOd8U8UHTwFZy8AQYp0bgTyKGGDvUjuH/oBEfi+iHARXwWgxsqtpmKXvkrF5TLzveaw+dktuw2E5vaICCAp5sMf1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9JZ+YBTtBD5xDHrUdsGTqu9IahOpl/EKaTsTbDSUfY=;
 b=SXlEsVLyk/lNhMRcpaUMc9nbLohCsijA1EkfqWu76dnpaIz3eIFNfkXFHgQngmBt5cQx4j5FkE3LPoOtmpPnHFkw+64NS+tHUlJtBvHLO6M40hDfW8S9WaK+0pH4I3Aq3QC8awSvOj529O/LuZiIJbSr4bAg3PAOT4wZBBMkvRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11297.jpnprd01.prod.outlook.com (2603:1096:400:3d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 00:36:22 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 00:36:22 +0000
Message-ID: <87pl4gg9ru.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
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
Subject: Re: [PATCh v3 04/14] ASoC: rsnd: Add RZ/G3E SoC probing and register map
In-Reply-To: <ca7da576-5280-456a-969c-aa4762803ee9@sirena.org.uk>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-5-john.madieu.xa@bp.renesas.com>
	<ca7da576-5280-456a-969c-aa4762803ee9@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 00:36:21 +0000
X-ClientProxiedBy: OS3P301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21c::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11297:EE_
X-MS-Office365-Filtering-Correlation-Id: 62977ef3-8b70-43c5-3567-08de911907a2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dE5+b/ePAVgyE2+NU2rrAUu7S479xd4T0kPjeUMNd79l4pyk1p4ayP+RwVbgoFlTcxKZPZIq/tyo7qLdziyG2zIch4Jl6lnoFfJUwTtk2LwN/CQncfvmLeWEnQVuthiLugTQc0HISkgUObtWP4/oaUOxmprh6omjodA+87E8MjPZTC+YAMc7rSJ12AHPnfLI03YX7sacqst6zW8HeOnXfYO3wT1CJbUVWEc/jCqcG7/SdKc39gEM9Z3JRQYXfNcGWk4uJL+LvuqzZaUPGzIt4KvviaDgcvhUWmQRODYlno7/0eGg8xl3o6Xf8cd+d4rCszVthcTR8k/fX5zOKjmyTVXBhznOf9TUiRd9BLksG0ITKuGWt7avt0NIl61VIE/1vzVz8rK11aMmycFVeHfx2ytdn3xKnZ0Dzi3kwbrjrgqT9Ilcnv/qYSw5Ay8Ju/+6kP6LPFOrBzg6MwL6ioi0eU2/Fg5ILU3AuKADH3/dMencwTojbR2tCp9iz6zuNo66Eh1/W0qNyOM6P2Yz49rD3DXRLi0Ak3l69HMJplMs40ZxogyETiozXeo3C4T5oJ34Au7Ou//RW8eum4yjFd1rTU38Cc83yjxZTqxyviu4z9WgrlYXopLl4h4aceWKl/oOI956jXC2ydtF2fwAqxsCPh6R+dIx1uXS3W7NasDdKkarsJiFL/NtLlCtgX9me9OLoc7/L63DfTwHeo/MMpryeL3eMdcmIlmeg6Er7t+aGN/XUU1iFp0I5J1ONGw5dIpXwxKnwJg7vrQlLLErAW2jhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B79pKncAgGjjb9x8MGobmpkC4FMR8ErRFNfYil44VApOhkcCjpZzyD6r6G27?=
 =?us-ascii?Q?pCNckQC744yU1tWllsnXY340326+tR8uMcYPd1NakEMZurw27lEKi2C0ut9e?=
 =?us-ascii?Q?D2uoMloCXiZVuOsW7L3zeA/X5UTaeDCnC8wMXo7wPJNie9279wfJiEtRscYo?=
 =?us-ascii?Q?Fwnpb8OdvzV3CmzI3XyQ6o11Gp4wDqCyOqj2NlyDyV/mSBL+7PsBcZmDnQOI?=
 =?us-ascii?Q?sC6sRgssEga96WvPgPkuR8tzSqqqwjiMSLIwppUgAFm0XDTic3+9LmVQF6fp?=
 =?us-ascii?Q?dTSBN19PGr6ym+cquud5wFg7vevocigUJvqcN2rrc/6v9oGHGCCc4Ki9EPGr?=
 =?us-ascii?Q?WzKtSnD6FZa/VzeHhGQTEDlZ44GLasIsfsLjDbrWgvXJnPZV1E452PzPZQcg?=
 =?us-ascii?Q?49fugPQ0ltu7QWkPw5LF2Ah2rp1wNL5J8KhxGMZfJeVYOy2tIVrAcIn2jNQ7?=
 =?us-ascii?Q?4ja811tWAo8Q4WDGddGAT6I8ULmzyHhoN+gj02Ta3Nahw+HIEv0KyoNl39S2?=
 =?us-ascii?Q?pPBnuaiQ2HZ0Bd1YYgcMIPLfUjtfdFOcaWTlFQ7x+vHYbIk9jou3xUKegyjH?=
 =?us-ascii?Q?F16fXgIh+5H+AavptnXcRs//0noBWwxNgua8K9QIF5Qq+05ckIrvXGk+dV1l?=
 =?us-ascii?Q?N/y/F/at6C0odVHXN57J/8Pcd/rQwySi1PRWdYQl0Cf+FK+9oz4k9SaVwr5i?=
 =?us-ascii?Q?4cjMi38YdUf95DCYNAXvloue9XIDV5jFF8Wn9cFaUwe8Q4UFy+VevCkfAWjI?=
 =?us-ascii?Q?mwro5OuP9Q5ynh07jN6xxHiFfd6LnQA1xRK5RCN46VI7bf+gtL2PlCvVD0Cf?=
 =?us-ascii?Q?0Ry+dsL6uLQ3BVyPLG8PxXGpG2GtbJq0lBB8S1QNyBO+s1kDI0rIe8BHmdi/?=
 =?us-ascii?Q?sIXEASeAnFABekJ4vsbDaveL9e6jLwBNWylOtnUXuqQQA+PJjUhYpj2LtzCi?=
 =?us-ascii?Q?38efGMl4Hc+D07xUeZxGL5o95w7l45/PaQmZkHHWepALfVa3MUdo8MCD3bbX?=
 =?us-ascii?Q?lRO+wuryut8TCtCELrgtGwVm4NZlR3eI9UI0DmkzR2Gy5u4RI8zbSSs04QQu?=
 =?us-ascii?Q?zRPyM8RXsqdjVwPVV9NP+ox21bmq2grQWrCBqoMcxHrJmjRnBsekkZZ4IMI/?=
 =?us-ascii?Q?YdmZAN9yfr8+jCNKh/l7+S++RqaMNOd1GvKAoROnNfVqU4RhPfBEW7KhKtyG?=
 =?us-ascii?Q?CvHRRz9DRPYFLg+snJhtWSrQ7Ew/kpvn7ftRbVWXcy94Fn/X6mKHoONZillD?=
 =?us-ascii?Q?8sfVCq//emVkawhIZ/jdkpln8x6FeRGI6IRCXw8vcC4i5w00c7Qwkvfs8YPc?=
 =?us-ascii?Q?+jcAA1raRtniVfyPu/A/BnpcHJmtsH5LZ3uBh0NXXJwmUN+zUMvVyp9KyGrE?=
 =?us-ascii?Q?Z2u9y4qgggFppxXbBKTjn2m7PWGZyUbOfaDZVS1MDKnlTrqmKGWumwzVxBKR?=
 =?us-ascii?Q?8rTEwIy8I6yLpTD8aCqkTvwgwDrtMViMAfbRtR1/RmocB4jwxt0smx1405FL?=
 =?us-ascii?Q?aO3mXuOVQrcf8sQV8pd49fwh8SmIC8fpf0hVSRPbswEPvqG8J5yzVP2WbVnV?=
 =?us-ascii?Q?5QGXDTrJVlnigzwpmgj/PWNMpjvrGdSobBwMmI8cNTciqN5YCXeDblQ8FqC5?=
 =?us-ascii?Q?EfimOoCETK37dEmlkmyMMexY7E4xIG3UECOUBM08ZH86ctxO3niwlRr+xhtN?=
 =?us-ascii?Q?uUchXNZs+P6uX9NXY/vrCnhBMKRRW/Zu6cRP6rLPjXKz6MhfnslZXYsx0ymB?=
 =?us-ascii?Q?mQQFuRYwkE+ESxm7N4cPqYCizMpyVpM86dRvr6uZQEAkZf5BA7EI?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62977ef3-8b70-43c5-3567-08de911907a2
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 00:36:22.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wV6EIe+nUDsVupSUOzkRjwsjvqXCUY7fAssShsGHMfuvANVtjJgGznmAvBdtv4+KugCroIh3dmhGHt0GL59NpGbtaeSWePlX0Pdpzud9HTwg1/sVZWAt6H6QNA2MNXq1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11297
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30805-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1AD8638F945
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John, Mark

Thank you for the patch

> > @@ -629,7 +632,9 @@ struct rsnd_priv {
> >  #define RSND_GEN4	(4 << 0)
> >  #define RSND_SOC_MASK	(0xFF << 4)
> >  #define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
> > -
> > +#define RSND_RZ_MASK	(0xFF << 8)
> 
> This overlaps with RSND_SOC_MASK.  That might be intentional but I'm
> really not sure and it's all kind of unclear.

Indeed.
But it seems the strange is RSND_SOC_MASK, it should be

	- #define RSND_SOC_MASK	(0xFF << 4)
	+ #define RSND_SOC_MASK	(0xF  << 4)

I think it is good timing to have comment to clarify flag.

	0x....DCBA
	A:	R-Car GenX
	B:	R-Car GenX identifier (if needed)
	C:	RZ series
	D:	RZ series  identifier (if needed)

Thank you for your help !!

Best regards
---
Kuninori Morimoto

