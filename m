Return-Path: <linux-renesas-soc+bounces-33848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bJMtCpvqKWpQfgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 00:52:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7833666D433
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 00:52:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=TI4cJg94;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B216304D77C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 22:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA5033CE8A;
	Wed, 10 Jun 2026 22:52:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37A40D592;
	Wed, 10 Jun 2026 22:52:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781131928; cv=fail; b=BT2Q/38kiQrpZMXlIkbpAD9vgdCfCxztVL303PvmYBKM3Qw8YCvgwcnBMpw3ZYGJCYlRwh0vcmfeNz6P9h2huCB93c4gk5jX+i/fGqTGCm3ByU9XFOgqlq/QFMWKvrl+9Yf+1M7eE6s/p1GR7u6fEcAS3BbSVoMTGye4ViDqHII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781131928; c=relaxed/simple;
	bh=EewOueFGZQNPrPeGCObRkLrna1R6nsSGODhNxVtzhEA=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fSQb8UBVS34etGcw4nINXzuOtpHp8t2inm/wx/O7nEF4yrBQJa+YXCAi3KA+PNQP+XVZed1uWTGhYp2zY1hBgVYou1PEH1DamDcV7WhWjdxx0c7rDt8DXhqfiba3hmeGfEchDLnP+XnV/z67DhxLn+wkK9Frl5s+g5HeVUMABQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TI4cJg94; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPR7WCbAxAUJ2JoI+dYjZiYqeaqgy08tDx6Lp7ZrH9lo334HjkVt8MgTVEKvwgMr41hObHqBK3K8VQO1sHyqwXrFAOhEV8kn3yOFtfz8RN91OuHb62NBYU90t7FYdLA0CEbvgiXQvg5Elr+AvAtbyRhW2szWpOEJD4D0cpEsSgvaicNwM2a2OSHt7E/iaZYeFDjEDi7/7V0blkYKogbUiwK0lJ+AlTXQM3gzZGieWb9jP5bU5kxeEG+WIWI2uuH8EgNBqH4iqKtrtL8dykc/WI/qszSQlJfa2QPvKj02kDx9+BQq+9Wx2sQ1zjwk3Zdlr+GSHiR5OtHiyBaAbHg3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDEMDDaqdj9pQ3OwoIuKc6Cse0pp48jNinFz3VV87wk=;
 b=rffDBnCrKEaD2BW3YeSx3rcg2+iRC0VBgvl0R37Xc+NwiNG4I6w5Shth3Xr2OAlhKjj6EGWu9S8EDSM7ZLS7k2nJaezYxbKScC8XVkoWL4UmwBYiEOR1WB67GlTsy7kZCg8ajYF9OJz9vmQfvFklog7N5Tn5wVvgQL1Tc1eFRi1xi6ZOVDIwV9KMpreMRmfPmFHFT1X8MPM8LTVLWLiSDQjqenZdVIy1u2yZ6yjvGaDkNwVDV52hM4xa0RigCfYbsSxiuQIxonlU2wsxlnSE44/pMEjGzLIqQqgKShfp+w42cEnMcamClQ/FnG1lyvoO8KmvdxbhywBAQHmXj5R5sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDEMDDaqdj9pQ3OwoIuKc6Cse0pp48jNinFz3VV87wk=;
 b=TI4cJg94jTDYIh1MZDsyp1qma+DlncJPqL7GwUlbcWjYMazH3eTrIpD4AZhdrRaN6d21XhRy7QC+OoRD0kVmUPSU9PGdM4xHfBZwpkbxXvFUlck9dtL/Ci/hcTYB1KsMv5sUt7oa97M3olZEKAXLg+hCQouMpLfYlQ3JFrSILco=
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TY3PR01MB10942.jpnprd01.prod.outlook.com (2603:1096:400:3af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 22:52:00 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 22:51:58 +0000
Message-ID: <87ldcmovp0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com
Subject: Re: [PATCH] ASoC: rsnd: adg: make rsnd_adg_clk_control() idempotent
In-Reply-To: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
References: <20260610164704.2211321-1-john.madieu.xa@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jun 2026 22:51:58 +0000
X-ClientProxiedBy: TY4P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::12) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TY3PR01MB10942:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ffdf00e-750c-463b-ad26-08dec742e085
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|366016|1800799024|56012099006|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	rxwA68vwqUNP4fw2gdlev6zX3w9kFU1I+iG7OkUUQiMokYip64wqgNQtZjxeV5QHGPKXAEayYQkEg4K3FKGmGnu/vBO+PMqEXHV+hHcTMOf0mdAsMRTE6vGvTKckY4a5p0GIJbYsB+wIY9rPeu/z+4hcuiRpsgsN5JN8Wx26qxjsu6A1L1G0oKP2Czi1JAUSrzogk/G78gLccxkX7QF9FQ0FaIqqVddwcfb2cqNtZMrdM3LNK1ZxDkj9IpqTn+kriFE7VLh/yZK98eTUEiiYlUuxY2hzPvvMnbp4+cnsJUsf+Gg9kei4MFvAAu/XK584q7XZPtvlYJywsDcfBmx7ykWjd85/UUai8Osv++GHV5R3t+zA42umA5ef6qpPkcexFl6izXrDU3QbagzwpFQz421oz1XuEwXihL4BfiWcTeW6eAse9eKROhEN9r0bKp86Q6nWDpc9rP2jS4AvS9z38iad0RcLSNieTvDeJIAMf+kO2f4sjGsJoUGuDUgA8xiY2mo6g6P28VdIw58WD0w9d7SOVaxiy2etrN45bnxUifxj/sjYE2uCeZXG5DDdRRzv7IAPIreVG8rTU/6R6Wo+8Z8xl8W3ZoG+4hqA+zUbhKDHhQ2xB5XAieVrcEdEw2q5e8iTeERinWfYrQP0qGML2QkRt27XMw57037OpVZDP3FP4WoTa4VswUGj+Il2y6Blg/efmPjnFZq9SyWbv1Vz3tUveuSbI0xd2zBl+ru/kp9mNDlpqfZsgmCMjuWbNqV1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(366016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w1p5PfIDnd0N/jaEvQHn4F5J7zgTclld7EjZV66h9pvW9cPBarrLQw24/jqa?=
 =?us-ascii?Q?RYioPeuFgoMJdL6pis29zuEumxBzF2AKq2wzZ6r0slso03uPl2/ObcR19xpB?=
 =?us-ascii?Q?L5HtpQg+oW93NiXwhpmDIAGqBHaRawOT+tvc3iAIsLLpg5p5lfUljB7KrUNr?=
 =?us-ascii?Q?RYU6C66ARzOAlbt7gP8/9lYMaQ23L6/wMpnhi3c/ZW843DA6eqN2FL5qj/+/?=
 =?us-ascii?Q?oexRKfLltSSYEejZZg+gXLxH7ohJoWeFtnbtj6y8u3KzS9DYVCcy8LVR3XRj?=
 =?us-ascii?Q?i/S3Zsd/NR5lwCPINSrm/ViCFRUjUMpasVYBKXNcPi9N0Q5yOfooO85qDbI1?=
 =?us-ascii?Q?PuS4W5i0D3qz56Zv+ttALzjxivRZihVysjCpzlKPfncyaVetwDA/ezMU058y?=
 =?us-ascii?Q?6kbhCzqQzSs387+1zpzHrsROpNT8Dg0DIgtxxUj8YzmfU3qlWetUH9UEAR9u?=
 =?us-ascii?Q?odcZCTyOzNoj0KydpiImvUGdDB9dZ4zEcTbJy7Ol6yjnaEet2qEHsoIUIFl7?=
 =?us-ascii?Q?5Dt3uSkPO8BFOnS9sbbZLIHYKPp2BHQc2S60xj9o+dsqWOUN0Na5CZXe62lM?=
 =?us-ascii?Q?AwY8hcKwj/zjM2N+oYjuTSGaI37E12eCYyaDWnMMPXgwJgon28g9AeCI+XQd?=
 =?us-ascii?Q?2bNr3CF6sq4ZFYa8t7Q4XGYeQ033SL6qI7rSybbaN3tXLbIJF8Vj3gZE+Qnf?=
 =?us-ascii?Q?OvggFWahcobvxCg/wU4WnQl4qcZVHf+Nv8C/AFwOEABpt2OFsNgWHMFVS1G1?=
 =?us-ascii?Q?0iHJouA8yVaOhOzUwXI2mtMM2IZIgUD3/obOnhQrLO6F8OtiX/Vsh8NT3sZT?=
 =?us-ascii?Q?9GEm/eBwXzsp1VGPmp01BC/jFbwwAxUtrCq0BpqNmcFQRQHMjPTR8yyqgfqU?=
 =?us-ascii?Q?S/AMevLdw8l/IKjf5kb4pPV/Mz6DpmgqrjKTO1tRHXXCrC9Q6wDLCdSc81Qm?=
 =?us-ascii?Q?3Kkl+vua/MHSWJqJnb9dzNcTj2jIWloHAbULAb+WlgVPHkIufZ9vzf3VCoSY?=
 =?us-ascii?Q?XjCBfwUz0qZ1qbHWeNlMPgV+yT6vLszzSXP61gaPOsnfp9jypcHNXn4YJkoF?=
 =?us-ascii?Q?HNeW4HeDH23bnTjiFINz6mifvlysWZLUX9Mlz+/TTCiTlX3ps6A7qNW8wpag?=
 =?us-ascii?Q?2qHBuX4Wt6qHoLfwq38EoBZE7WNycRTZM4DqQwpOCcV5I6wP9qtuApJgBWRK?=
 =?us-ascii?Q?DCcXadUelG5oAlSGL6bHres2rE2/XwZuS8m4G8wPxNF9vUHm+zdv5KyjYoWr?=
 =?us-ascii?Q?fkcfh04OfO3IpKWXsT3iiQcfHOV//gFM0BhkyZ/cSGtVls6zSCTW4ULo+57M?=
 =?us-ascii?Q?oWLuPtniBEogsauAfe3sHSVsDTFkDZYVyygcXGzBjhZHCItAyoscrBHx4oRK?=
 =?us-ascii?Q?NNtnknubjV1MiZWuz4chJMxYzTiF4BIVkwMxn4zMkrkZOkZcugcrA2aHjN2c?=
 =?us-ascii?Q?tEOFVTjzQCLVYp5zXSiD548XGTgKfmhF0KBWcLqlN3Zhx79ftPa0+VPgIbat?=
 =?us-ascii?Q?sLod6WWxjr+lHAdSBsFuTqq1+8Xbv/csMfr4rtt30h+sW0BQyTiOrhGl72kk?=
 =?us-ascii?Q?yndft4kSU1LhLhXIqLut1a271Qjb8RBvqLeSGJrnP40n/fVn+OdJvhxsSjKZ?=
 =?us-ascii?Q?iR/quXu6W9h0qIQ2om+t2HH9jI4Bf7mbTqRoQM+1iOZ9C0WY7MJ+c7M4GJwg?=
 =?us-ascii?Q?BReAaNpvdLsnMXBYNk18pLTriY/XJHzNMqegkKzVRokt4BxOBnAjXVFmWvLm?=
 =?us-ascii?Q?seMzhuNDxmr1jW2+QAaGsflDkFAw3X+0dimNtBet6NMf2lCLlW7r?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffdf00e-750c-463b-ad26-08dec742e085
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 22:51:58.3315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbbH8o84b4Yh3QeMjZizbSlVnB0+JhdphiGC/GuWi2nRs7sLyBcH40AaXn8t1vHC6BGFx6qSzUwD2TPgk/XpNItX9wtbXwyUu+rz46MjV0Dr8shMADe+DczF5s7iJ5N3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10942
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-33848-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,glider.be,vger.kernel.org,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7833666D433


Hi John

> rsnd_adg_clk_control() is asymmetric on the disable path: the clkin
> clocks are guarded by clkin_rate[], but the "adg" clock is disabled
> unconditionally. If an enable attempt fails (for example a clkin
> failing to turn on during resume), the error path correctly rolls
> everything back, but rsnd_resume() ignores the return value, so the
> following system suspend calls rsnd_adg_clk_disable() again and
> underflows the "adg" clock enable count:
> 
>   adg_0_clks1 already disabled
>   WARNING: drivers/clk/clk.c:1188 clk_core_disable+0xa4/0xac
>   Call trace:
>    clk_core_disable+0xa4/0xac (P)
>    clk_disable+0x30/0x4c
>    rsnd_adg_clk_control+0x9c/0x2cc
>    rsnd_suspend+0x20/0x74
>    device_suspend+0x140/0x3ec
>    dpm_suspend+0x168/0x270
> 
> Track the enable state explicitly and bail out of redundant
> enable/disable calls, mirroring what is already done for the per-SSI
> clock prepare state. A failed enable leaves the state as disabled, so
> the next suspend becomes a no-op and the next resume retries cleanly.
> 
> Fixes: 47899d53f86f ("ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  sound/soc/renesas/rcar/adg.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
> index 5479cefb6dbe..53efd1be5139 100644
> --- a/sound/soc/renesas/rcar/adg.c
> +++ b/sound/soc/renesas/rcar/adg.c
> @@ -45,6 +45,7 @@ struct rsnd_adg {
>  	struct rsnd_mod mod;
>  	int clkin_rate[CLKINMAX];
>  	bool ssi_clk_prepared;
> +	bool clk_enabled;

Can we use clk_is_enabled_when_prepared() instead ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto

