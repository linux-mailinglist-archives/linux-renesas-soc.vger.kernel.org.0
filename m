Return-Path: <linux-renesas-soc+bounces-30812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGI0EuQcz2n6swYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:50:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 308C73902BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 03:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D8CE3017A97
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 01:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008392D4B68;
	Fri,  3 Apr 2026 01:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nRqKktss"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010002.outbound.protection.outlook.com [52.101.228.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27F4138490;
	Fri,  3 Apr 2026 01:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775181022; cv=fail; b=aqH8ReKRAc5JjxkyqezZS8wP1zTf++uiPjnrHPk1UoTotUeLA8hOK8emv+mED9/7K8fIek5AvqXT0ktwWuOsWyOzy6YqHI+sIVhPGseKNmV3bpw6FYmDNHYL6CKPp2CkkcK7R/2VPLgIYbUi8Zvasg6leDuL0S5uZDkFPY8neW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775181022; c=relaxed/simple;
	bh=QMUxMTGVVCQU6GEUYT3bjFmqkajz8pNL2iJDWyIoeDg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BqwrPlj3mzPrAPvFSUmAq0mXdeEO1pK4+kGomowA6qR/hOG9aQ+mWQiTwM8fgMrYgTaZZBICdMicAecE19+u9Qx+VHDdksGQRrHfl5sOzyVRsATPCEqfAZ7ciJIB3C44iVnbU4yNfho44Hn8Ne++Cay4AWInwCWNYKsqjimoXmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nRqKktss; arc=fail smtp.client-ip=52.101.228.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwiu5rkxrpyygr/UH94c4XKEXvC4EymrnL1YPUvZqr2KglfMbjffVBnl+kv6dhm6vHiNrrtxwJevxEa0zSW0jNCfmQdY3SXF2DffdC/ipwCpr6oVf1hVmWQKW++4s69uTmJqHrm8MR1LiBHwowxBIzwOpj5KlUn+ZibegmgMI9H7YZdjxqq0Hr4I/oh4kSxf/1oFQeZkxbknsjQ7CGCcLTzprOyGClPvbBnOUjG1kgMCpEvIt0qiQv7uEjhmq+/Pqjm7Cgbar/FSY6riUFCjbjUtqTXtFAU7Ajxrf5o1tcBgpmnqrcb9fXHNImK7xf7J6GWJGKL/2hSOIbfd1SnTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98SrQKstokQdret6eN/DrNXV0h15bKqz2ZfpCcqJfCU=;
 b=bufWMGT+7m0d25RihRe4kY4Ei63iJRXDt793Ugy3WYPVRCn56RnI7vYguOUiE4w7HH0A+uDZza02dLzVgfYqu81K3eTuVtGoC+oYRM8/MbXV1ij8AtnXFGrpa9/v5X4Ox5plwpXnEXDCYf1lm4PIktk1/LcrcUQaSh1oCbbHUFHKUTTWzGawkAJ4F96iRXTCfbQjd/nMovETkFt+VN30kke4Gz9sAS6jEkf0mtH3mWZ3KNJTKvSJo2NGykAjQM8xvhWegDKmXDbS5GLw0aY3NTnuu5WhUAsZ9HqikuT8AFj9i8cDR3QN7scSjQscmPvf6nU65Vw5lpcE97QAC7Iqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98SrQKstokQdret6eN/DrNXV0h15bKqz2ZfpCcqJfCU=;
 b=nRqKktssKL29Qkpnj5pK1gkw7rx+Re3Zdkv0Qexy60x9Wt/m2McTWucdrsRItNTKmoWB6XeySEPcbCd1AF8BF1l2U5IBMzgeuEtxrp3b1Fab0J13viMmMRQgynVeEhqjiOmaJJkuaPuOKWbn5Uls1QDB0E1o0eHPlBgsi2pG1gg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14718.jpnprd01.prod.outlook.com (2603:1096:405:261::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 01:50:19 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.017; Fri, 3 Apr 2026
 01:50:18 +0000
Message-ID: <87fr5cg6cl.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCh v3 12/14] ASoC: rsnd: Add rsnd_adg_mod_get() for PM support
In-Reply-To: <20260402162436.12059-13-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-13-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 3 Apr 2026 01:50:18 +0000
X-ClientProxiedBy: TYCP301CA0054.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::12) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14718:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef0c432-2851-40a9-7eff-08de91235bfe
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	IBL4UGbiXsKYWiZwkJ7Z+Ma7ajyMZHLaL0HOr9yORpDbcUKbwCEP9mFC+gp74zh8qdI6JkyL0SPW4NTz+7mR1S6HrPbxvaOtkFq3UsQVgSnq0txYEIe/ea1xHs07tG3pm1OR5fBLimMiEoq6A4K6nybK2Of452NbH8yPNLEhcXnd5ayKi5HZqfg6X/SLl3mX6n9SRLrAXIbZS/GXXkf9KuQU4Su6mftRkwl3jcmfR2WfGbkZwiLhTk+2DohLQ7qWvKLMg2XxLIpsxbD+QkQweO0bLzfZWq+6TOHf/bbv64hp6H+BkB1GlnkReSiYy3QisCU6zpX8SgIaJWIjupfPZz2iRVi8SmXlrYWtitCKCkhjW74Jy9RkFmk6NS8J3rwMeHd+b6EAyTsbn+7UEhktOtAwy3utvh+uqdT8cyp0GWlYszAk1WZ4ig+z2JClxcSQZ9v7ozM+vLhTlOBXY+P71McNRPewtuJ1szjya3pAoI/Fs0CBZJj/XDkgGKxyXJOzpGDvWcCw+SrU5jmuATjxpMyt+oBcqi8kqUGaMial3GldCj1Zu+ZwHzAnzgCPu8aIQgLjMmUnQG4vUDXPx9EXwPbDO8TYI6gV8CPp7m/iWkBfIFgvQMYDNj2YUeQ5VdiY3IY2JkjaVcNb66Yg69EodyfzOIuk9V5r+G3VcbEYPawioaXPpt6p7XePAk+64/xjwmfZqeCjuTeXvycwnkwJWk5lKwpKU7+kxYX/b47gR9/a9G6nxEVvZibkjRCsnFAp9hHi82kWacwIFO1qrymk5ujwAjNQw4iusFRFkvb6WE8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8OQgeoSUUFoB4SXPER8C6ykQb7N97iRWWeU5kqY+0YIBNmDZVhZNDklMH5hC?=
 =?us-ascii?Q?ABSZGpPI+zJBG6KMIpxwyiZytLKuTjN/jnpDzxIWas2rWwcjaeQUdh3iAwSq?=
 =?us-ascii?Q?rhYFZZxRrkwVe5rKpLZEY62cm7BThaAJmXvwXQ1y6kE8gP4VVpYc0Q8X8ez5?=
 =?us-ascii?Q?+ePnFYiY3M4iQPxzzd8SAPt+tueYM9miSMNDt1Jo/sn4+CvGmrKoorI84Aw0?=
 =?us-ascii?Q?BRx1bwxp0Yb5KA6Xefp3/xx5huf3KH2CvBLbrLk3xgtRp6smCsD3BxdV7jED?=
 =?us-ascii?Q?p43fqIzjce2dPFj/Kyfb9nX2awfqc4mIFp2Gzsf/cKfUOuJRlMqA+y4DJooA?=
 =?us-ascii?Q?qK6MxqPqy0K3Ws12kdTFGGw3cFFx+wYz7rfJV9EiXxGRiORqGQ4fSO64n+y3?=
 =?us-ascii?Q?KIMo/X6D9xNc+p6ZqvUGKc75pu1tH1AkBoJqeoHagHamMxgeXkHDoclrI94X?=
 =?us-ascii?Q?mQt2ZYhb5z+JBTjcYWFFutQzeuTdJw3HsvFNlhkiZPGs0BSzJHMRv2ow0Btu?=
 =?us-ascii?Q?4spt3206WIkXKZ19E+8KBDUNw2lgML6lcqKydlI1pEpTZrUyd86dVlc2Eio0?=
 =?us-ascii?Q?2ULSX52PVSX8CeEi0glO+OzC5VkQnaqEGov7Veuf0ITPtS+Ph4Us9gbv9G+5?=
 =?us-ascii?Q?Wneatf4LcUEVShC9JTy4aI0LcJFcW199v0QGqAYq7QuvLEbOFaS+XwlLcVP/?=
 =?us-ascii?Q?X4DW5+tXEkTdBkIoI7urshAYX2x4IbR5VUV/JCw6I8/4XOhEPTfxpk1TJvsi?=
 =?us-ascii?Q?4mho/BLUII0o21Tj5Ut3yJYAOGSKZRQcKE4HeqTWpK1GDOlbCIn2DV63IUSb?=
 =?us-ascii?Q?DXks/eVg7IUoR7y2sDpXaIohbeiYCFZzsIbssNyxSMzPokI9RszvuPk/TJrw?=
 =?us-ascii?Q?NzYMdmsMyNebG0Bhh1ypyD3th/DUDOJ02mYFHHWqOMGTxxKIvWnfjaFDbWsQ?=
 =?us-ascii?Q?3b/NDH19rsVVkqkVR0zDT0++IGN1zwWBm3Qvv8LiSOCtOYigtg1z2Zi/wxfV?=
 =?us-ascii?Q?IzkENqSAGa+Q0xhgMsA7fGjeHCf28iYAEbxjpmvJPcwSz79eQswt8IL4o8PV?=
 =?us-ascii?Q?qNCWOHxOqfd2KxWg1vL+SfuU0nILO3lVt8kzvmce6CJV3Ylaot5c6aRdCqsk?=
 =?us-ascii?Q?AIKpoqnB66oMxBTBal9tQNC4hn09J4K64i5LSoUz0Cv5+eaw1bef6DH/tX8B?=
 =?us-ascii?Q?/Kwc5M4h+Qz6+4q8oyD22O0RSOb3MoEE1Br7adkxVZjV44BVP8//2EbfrY64?=
 =?us-ascii?Q?3avF51cGpQp6YVuihjiv9LdvPN/rhnabSUcnykAbrytqgzlLIuOujPXlBqAG?=
 =?us-ascii?Q?e6I2LQonMsAigLX1HjzL42+s4vU6e2qHZHSYj0gFD+j+f2ZacXWsNeMJ/hf/?=
 =?us-ascii?Q?YScsffzNwEKOgzwHN2Hqd6Iurtkpc/V4KtU/+FTYQAGm6RFcRE6BM4fob0y1?=
 =?us-ascii?Q?DJ872Lnwj4orRefdU/0OjzzvA+NTxWc3CheWq8cchfCvDAVu+8SueS4GS6u2?=
 =?us-ascii?Q?pDv17fPpyWrQ7z/Fyo7VdJ5o040WqGJQZrPtRPzqcRig7PF2q9+uSAdK/o2O?=
 =?us-ascii?Q?hVDbwvFKXK14mkirA+Eoxt6OSPI4K7JBxMEooztFOnB/qgWmRzQUrwxlsxaG?=
 =?us-ascii?Q?28Bqps0nBIk2SS9uTrMcrIMd/p+XKRbj6i3PeH3RtmaMDS6bG6Xbm8vI8zo4?=
 =?us-ascii?Q?5hiAlIKpoL3YVfCFqnh9ag71Xm5PszAjahic8n6gvKOSu5dFTVQdfF3xItEP?=
 =?us-ascii?Q?ds6SeaqykrzywqNy8KluRMy/8BwpHRS6Og+IB8RMYxPLbw/SNnOY?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef0c432-2851-40a9-7eff-08de91235bfe
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:50:18.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpwehIZK8PHu2PDjadhNiu/g5gERHavAuQ6tACaMdNR/5yDnBdQmwDwn2VayP71sSzcd0wLv3PCrMO8A06NJpC0d4sDY4ThlFhdWkM5tAGTYazehzMw5G9oBk+Q+70M9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14718
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30812-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 308C73902BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi John

> Add rsnd_adg_mod_get() to retrieve the ADG module handle.
> 
> This is preparation for system suspend/resume support, where the PM
> callbacks need to access the ADG module to manage its clock and reset
> state. Other modules (SSI, SRC, CTU, MIX, DVC) already have their
> getters exported.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---

This is just a comment.
The reason why other modules has getting function is it is needed
on rsnd_parse_connect_xxx() which is called in __rsnd_dai_probe().

> @@ -618,6 +618,7 @@ int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *cmd_mod,
>  #define rsnd_adg_clk_disable(priv)	rsnd_adg_clk_control(priv, 0)
>  int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable);
>  void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
> +struct rsnd_mod *rsnd_adg_mod_get(struct rsnd_priv *priv);

The user of rsnd_adg_mod_get() is only ADG, no need to add it on rsnd.h ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

