Return-Path: <linux-renesas-soc+bounces-33035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPYOC8+rEGowcQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:17:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB35B9550
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 21:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 571D5300443E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 19:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9945D356744;
	Fri, 22 May 2026 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JWLNiQZ3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D404D224AF9;
	Fri, 22 May 2026 19:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477429; cv=fail; b=XBnbMz1sNs3dw8yRXHPJV8YHP+eY1kIUKTqjmgni+SyNw8ONl173L98+or3FZBs4kMfqHAj1zjJeEMPS/7FnqJoOUk1zPW0fDE0P8rhwqNbIcoEmwIjfHH3dVNK289JbDJbRRJBAOpcwMZUhfnX9gYVEmLNIPqBe/l0Q8WP/Pl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477429; c=relaxed/simple;
	bh=vrdAQeV2+vPEgaRKellwmJmiP41TgHTUnKj4GBrpXeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nyqv+tqY93rTXU3RndrpUTTMAXVTcA4oswvIjjaIa7xoJfZcu8fOU+XUCweQatf9Tllek88IlfSWSeQ6Bhzb21y6zRYbalERCbqHFIghWuTxw0DeQwBUC56pDNi+2SMf/wPebupTLzhXdtlzhaxUz3nIi/BijeAo4AwXibQwpuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JWLNiQZ3; arc=fail smtp.client-ip=52.101.69.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IK8/J3Xt5b6PRnzByhz5CYCzx0GY1KlC71tmP8Ny9avvlUze54Qtkha63j/0E/prf2yj6gxEzn7qbIAB7u4gymbMDPYjea+ZbmXAOQx3oaYzhScFSeyY0e0V2BCiD/eJUQjZrsx6wVJbG6N9Fn8Oi2JWZ6Sp+VaBSuhSo14OlMrAney46LVKiFqZttpzIh8FBoE7uWZH3Dzq+UHxM3EtqioSD+CzrLcLbWA3nleq3kufO+Hz8KeaaoziB+HfU2+yrh9Q/KUk0Pe7dljPhFEvR9sk0hP1Hduvs0cZuxIhDaWkQTsLfebKd5x4heq5B4xCiP8VAOXSrpPVYpVsXpxgaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IspDWnnScrlqKGWD2pFvJGR+q42yX0WGUtceEaxOnDI=;
 b=kEnuRIo0pu3sK3ysLo33j2oDG+ZG+YJ7NU89pkVReGMhtMquADqW7VW/z+eaaThSiZDOYs9XobWiYgXqNp4NpOxg6fEemqsYlt4jdWHgdcoHNkBJ4xCnBKi1NwzBudXa495YGR4Na9RMnuSg+B08SoneLbKMkAoP89BRyoWgMWX5z1QwNK7Az0fRNSYbY/zFbFjROqu53pilNWyaqsnkDOaMUcQAe7zJJCiNxA7xWG4v6XPDtQDCiNYMFUbGziqNnJb4A9TwAwwJis00yl6+4bHd3mbxv8sBU5wISkX5SlIauzay9UP0EHF53lYFRHD1QVa5/YSxbnUhh5am1IeHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IspDWnnScrlqKGWD2pFvJGR+q42yX0WGUtceEaxOnDI=;
 b=JWLNiQZ3TUEXaI5j0d1j4pKj7sgaLIWV3JHUgVmov+v/OZpmUEXMg1l/gY+mv237JbnbRFgACAo8/X22r+eMT1xHHvacqNk+7bO7sr57zW/4q6J7rX1JZbKXG5Q5U/XdznEyYUKa9wyPPgeBgdsp/AkjlUJziQaK3V+iXf7dZGNiE5gKGTerM6gmysPr23eoR9v6DGVVeQlxzDyA6Lu8qteHWVy+GdvaEnZu3Oc5JCFwZCzyS3zuGZ/V872qJThuy7Q2fgVUFHVjRz+xZMA4RkOL3GYSJzoFQeIsRxGoMjBZIh//AiDUx1nYNYn3sy/C+XSOm8qh4+vJs/v8/RAC6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10300.eurprd04.prod.outlook.com (2603:10a6:800:218::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 19:17:04 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 19:17:04 +0000
Date: Fri, 22 May 2026 15:16:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
	claudiu.beznea@tuxon.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 07/17] i3c: renesas: Perform Dynamic Address Assignment
 on resume
Message-ID: <ahCrpz-J8a5HQSmY@lizhi-Precision-Tower-5810>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
 <20260522101815.1722909-8-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522101815.1722909-8-claudiu.beznea@kernel.org>
X-ClientProxiedBy: PH8P221CA0041.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10300:EE_
X-MS-Office365-Filtering-Correlation-Id: 1007fe68-404c-41f1-5f60-08deb836b57d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014|11063799006|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xnw5vMeCmRpDbTHbeJwDX1usYcIv0DJzaBBEIZOx3T4XR3xexUfhXpmOThjOXDUpfpT0DGLCRQ/VnrmDqJfR+KVuE32chLGY6lNLj2n8lPgyfTvNptjKShGD14n5W+d8aUQYlGFYO0HE9kVdgIsY5j7zOihjHCB4cjUcBUUKxAV0WgcZ5+8xSp4Xaf5dolX463q688aAURJBMvpSD5DCIsT0J9bsZlixaDQgRV3f+jepQZ+kiF5fHOiikUymMDXJFyQvp50bRy0GG+twmTxznl0kDpnY7B5FiQS9gVDsM6Nf5cOCeqF985C4zqSy2KnxHRtHoXkvZZHlPtUYcWQ0qOB7/oQNn4l663iruv+xev7Terzb0HHtrfaNsWR8rWldKBM4vrD9DpmKqVPbzMO9aDeXF8+rYjsRsDeQzBY2MVr1RzhtPxbn95jUcYEKdw3++YxNPaff96wz2SIjW5Pp3aoOM86odLSRIXCzBAwOSrlynRIcFamdkcUebMK9wvnRkm/NwvyTgtPJfotEr217h4OsiGX8XQIafXCyy7WjHmCQoE9mbUS2rChRh3NJRdvUN5vuPn/OuHayHTFNLScnJ6K5+Rktcs4D8C1v5wS3/5ul13D1KachDuRAK0h30D5BpZpZoou8UrbTrz49f/G1VKSzn6lnLwagBa5hTQf0t3VdRecvSB7ck+OqmcRcHV23L7ur7yRy2eWDg6rbmLrovDyUTfubrDzRp2tWQcmnluBgQlk9q/GwWjEPBbSaDF48
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(11063799006)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A+hVgEheC2+2JApgpKn3X22FqmI0RAqDYshvFaPUCtSL5moUS5/9FDR4TvnW?=
 =?us-ascii?Q?830ydhRli6m67sb2uuQ3HqBLWWMbBVTLLKn9L8WtrFzrvizB6HSqOqFx0oaA?=
 =?us-ascii?Q?qTED4phC5LEx5rcb+SQM5S1M/X+DFUqN2shCIBiOA+e2oLlbLvQt1YrA16tr?=
 =?us-ascii?Q?0+tSOtb5vWXebw+W9XkQXqo2uAkEqEHy9xX4JFYytmoOSVbDnFYhsnGMlUqU?=
 =?us-ascii?Q?/ucetHo9VTTtRbaezpynInCj3HA3T1J9bgWjiUiLWfFfaI+AsCDMae1a4yG0?=
 =?us-ascii?Q?T4o+Y8FFYuANUVa4hqBXvIwexXF43ngohs22W13uNLDfI/+11SJAveXCydxS?=
 =?us-ascii?Q?kJdD/UIbknJexQ+VDp71tiDNYbbsepFIqQ6oc7Pn6HRImhi6sdaw7XeaSx8h?=
 =?us-ascii?Q?DwEdAs01nWS/NkSRPGSGHT+zzhw0SOwzyNqTyQ/LtZBATWswwOwSSRSCcad7?=
 =?us-ascii?Q?/UWIhXnROCYNs96dI+geRi4JYIgcO/88tD5KgyYrbPggIdawJnsWPdZZIPon?=
 =?us-ascii?Q?AwqM7WFmiBVX51Mo5XBkXm656Mqik1p06iaB95a8Cd7FGgVSczOfuS9076GO?=
 =?us-ascii?Q?wvPlM4B32Dy1IMeHPl6DwZ+M8RRpS+JIuLQ4ZoXxul7Wdqh2CytH0GrDoaq4?=
 =?us-ascii?Q?WiYt4GK2TeYdQJGx9N09VRtVxZ2DRG5eatiL+O1ZQk29RJZ8zPFzpCJU2DyH?=
 =?us-ascii?Q?1Jwru2hS31MdQ+xiXzYMnUOpFmlNeDsZQ8m5ehhD3WXeTpJiG0i7dxauZbsO?=
 =?us-ascii?Q?VT/s17ejqYziklzq5ozN6+J3wY1N4XOsTj9V0WkXv0EbzSSf30RIjkufkI1f?=
 =?us-ascii?Q?e5+kfvzkv7oq0/EEYTg4yzntzqGQu/1V1Ix1+2ZUbrZIWHMAyNOjkPEFTjFJ?=
 =?us-ascii?Q?W4+loFv5Qqpi3aQNfFy9OtiOJpSr3r2T/mxy8YXRQQ3e4G0zPOS7lujgzLDC?=
 =?us-ascii?Q?Am/epyKIC1UUmS0IkwvHOsD7745MbrfWaLOV0qrJpxP5/1mMRIyQZ06Hjo0F?=
 =?us-ascii?Q?iR8IbhgBrQhGmNZcMGkP+31R76T9ZmhB5JGpvRJnoBaf/+zMEDSvzpI5Obuo?=
 =?us-ascii?Q?QdvlktPoXIykh3qb2dCToqQlwnNI5naSBFvEkjSbLClKtNrV/p6U694YSN8W?=
 =?us-ascii?Q?ZGjZmAtDus3NxaleQMef+EDGUjmnOS1wU3GVl4mNk3i+R5LTZEdD0moPBpNu?=
 =?us-ascii?Q?AeV+7Ib1WgjZQ73eCzDDOQQIpcgPJ4A6rAL4CFo8ajNl04425RwEjINNkh+y?=
 =?us-ascii?Q?tiMAV6y2YUiE72t9JCggj8wAq83tTeaDu1JGHwdLqC02xlFNG8ZSQoJkMsly?=
 =?us-ascii?Q?u+rEJAHqWQ9BmLResxprYPw1u3ySdGDobYdL+Ic3Gd6bJKNO7j+MNuzJIWyG?=
 =?us-ascii?Q?eh10x0I7ntw10ghcHQh3KIwd9PPwP+4TtkN4jbXFJUsFQkyAF1QdLrn7ojWC?=
 =?us-ascii?Q?X+msbZna3W8PEKDodqUnppkO1goqDDN4rWdJ0g+lNsJSVXF2dRk5ezjJ40EZ?=
 =?us-ascii?Q?KfTxxNQ2o9q2RtoppRoYnkbiMmfAFoDp91X5QFrVK9ufjktzXOEuFsXkIImG?=
 =?us-ascii?Q?KE5iJUQSZN1lKfSkVnodELpItofVDTUSOzWtxl6Y6TrWid0eK0e46x2uEihx?=
 =?us-ascii?Q?xwWMgkT+1rmn4HlGXtLOMZdhPtVpXiqXBm1dhr+LdPSaGaC8eeyoFMuYyNp+?=
 =?us-ascii?Q?oFFI0UJeFSLfKtIoLk1o3eQO+pzIRbJ34q+pGSR6pA0zQ25gIJKODG3yU4lB?=
 =?us-ascii?Q?0JmV3sE2lw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1007fe68-404c-41f1-5f60-08deb836b57d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:17:04.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/NFzIoSOLvf+tJ4dSM0soUJ+AXtuh0Sdq4sOj3g1tqy9Thhuc5pgVMf2Q+6Y1KvSioI8U1E+I/hxcla1m0O/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10300
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33035-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 29CB35B9550
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 01:18:05PM +0300, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC supports a power saving mode where power to most
> SoC components, including I3C, is turned off.
>
> On systems where the I3C devices also loses power during suspend (e.g. NXP
> P3T1085UK-ARD connected to the PMOD1_6A connector of the RZ SMARC Carrier
> 2 + Renesas RZ/G3S SMARC SOM), the devices becomes unreachable after
> resume.
>
> Running DAA in the controller resume path restores communication. However,
> DAA relies on interrupts for TX/RX, which are not available in the noirq
> suspend/resume phase (unless they are wakeup interrupts). For this, the
> suspend/resume callbacks were moved out of the noirq phase. Currently,
> there is no identified use case on either the Renesas RZ/G3S or Renesas
> RZ/G3E SoCs that requires the controller suspend/resume hooks to be part of
> the noirq suspend/resume phase.

Can you refer https://lore.kernel.org/linux-i3c/20260512121732.406009-1-adrian.hunter@intel.com/T/#mafdc9631a2a18dfebfa5b5efcb8584d32bceba7f

which defer DAA to workqueue.

Frank

>
> Along with this, struct renesas_i3c::DATBASn and its usage were removed,
> as they are no longer needed.
>
> Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/i3c/master/renesas-i3c.c | 34 ++++++++++++--------------------
>  1 file changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 2f3c6ddf75c0..c009d0de6a2b 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -265,7 +265,6 @@ struct renesas_i3c {
>  	u8 addrs[RENESAS_I3C_MAX_DEVS];
>  	struct renesas_i3c_xferqueue xferqueue;
>  	void __iomem *regs;
> -	u32 *DATBASn;
>  	struct clk_bulk_data *clks;
>  	struct reset_control *presetn;
>  	struct reset_control *tresetn;
> @@ -1400,12 +1399,6 @@ static int renesas_i3c_probe(struct platform_device *pdev)
>  	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
>  	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
>
> -	/* Allocate dynamic Device Address Table backup. */
> -	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
> -				    GFP_KERNEL);
> -	if (!i3c->DATBASn)
> -		return -ENOMEM;
> -
>  	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
>  }
>
> @@ -1416,17 +1409,13 @@ static void renesas_i3c_remove(struct platform_device *pdev)
>  	i3c_master_unregister(&i3c->base);
>  }
>
> -static int renesas_i3c_suspend_noirq(struct device *dev)
> +static int renesas_i3c_suspend(struct device *dev)
>  {
>  	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> -	int i, ret;
> +	int ret;
>
>  	i2c_mark_adapter_suspended(&i3c->base.i2c);
>
> -	/* Store Device Address Table values. */
> -	for (i = 0; i < i3c->maxdevs; i++)
> -		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
> -
>  	ret = reset_control_assert(i3c->presetn);
>  	if (ret)
>  		goto err_mark_resumed;
> @@ -1447,10 +1436,10 @@ static int renesas_i3c_suspend_noirq(struct device *dev)
>  	return ret;
>  }
>
> -static int renesas_i3c_resume_noirq(struct device *dev)
> +static int renesas_i3c_resume(struct device *dev)
>  {
>  	struct renesas_i3c *i3c = dev_get_drvdata(dev);
> -	int i, ret;
> +	int ret;
>
>  	ret = reset_control_deassert(i3c->tresetn);
>  	if (ret)
> @@ -1476,15 +1465,19 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>  	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
>  		       MSDVAD_MDYAD(i3c->dyn_addr));
>
> -	/* Restore Device Address Table values. */
> -	for (i = 0; i < i3c->maxdevs; i++)
> -		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
> -
>  	/* I3C hw init. */
>  	renesas_i3c_hw_init(i3c);
>
>  	i2c_mark_adapter_resumed(&i3c->base.i2c);
>
> +	ret = i3c_master_do_daa_ext(&i3c->base, true);
> +	if (ret)
> +		dev_err(dev, "DAA failed on resume, ret=%d", ret);
> +
> +	/*
> +	 * I3C devices may have retained their dynamic address anyway. Do not
> +	 * fail the resume because of DAA error.
> +	 */
>  	return 0;
>
>  err_clks_disable:
> @@ -1497,8 +1490,7 @@ static int renesas_i3c_resume_noirq(struct device *dev)
>  }
>
>  static const struct dev_pm_ops renesas_i3c_pm_ops = {
> -	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
> -				  renesas_i3c_resume_noirq)
> +	SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend, renesas_i3c_resume)
>  };
>
>  static const struct of_device_id renesas_i3c_of_ids[] = {
> --
> 2.43.0
>

