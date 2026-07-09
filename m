Return-Path: <linux-renesas-soc+bounces-35004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ydw4OG4oUGrsuQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 01:02:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D509E7362FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 01:02:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=GSYpSIQg;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF2A730036FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 22:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FC72AEF5;
	Thu,  9 Jul 2026 22:58:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF0F1B7910
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 22:58:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783637915; cv=fail; b=GgCu5GhwXdyfvzuzoCYctwGjf6Jz7RB/uk3ZfpcRYnRHMLAQWxYu4CpzljgTRehVSNS6Ax09WiZjATYjQg4Cxf6doXFCK6sDdvMyobARH7d3IR8jD2mAHk10hnvYmtnzZRMUOTfrjomvPky5zrXxeDsKfH+p89DyHSv2dPPhY6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783637915; c=relaxed/simple;
	bh=e+bYf3a0sFiBYi2kR/0vZG+o0XG99cnIOpogzJwmeH4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=RGsaHlCF6rJ1PgYJZJzFHtpvBwiJ11sC9ezZWapyl6xcJBy77vNEy1C+p03SW/+JUTOUX2A5/Zong+2bqbz+Oa2MojxC78XA7FAQF/yJEFDF0J/IyqdXWU0xLeXqfH2FkthEdGe8IF7uFeAGLwgrFtFm38BJbGaGBpx0hzt36WI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GSYpSIQg; arc=fail smtp.client-ip=52.101.228.48
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uumqejKUB/N3uT8TCF7JgbcvSfSWtWpe/IRtQK6BvJ5cGbbDJK2MhaIHVqRtWJoiXxb3YXqOrbRKmVEetR+LimaDitiT8D2tB1s9DwONn+z9R7Ts+alLQAKeUH2KjHJVizDfHzMQ2pVHVIgfhViPztwSwKZF3JIVS24M5dLHmE2zEbol9AIddGDCn2zhkwCWotTUWDm5KXPM5sH2KebzxUMxmXWgp39auHLTuqUuOIrQzI4G+XKN0A9gQFtbQdsZ2lHqd9CnwEFWamBC3mKXCtnuYq8lp4sK4c/OVWiPrA3Ls4LwF+bGBgHW10M/lWf3psXBMXM3WBDVAdf7UxUahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmrIDeE3TLAsvpvq1g9U34OR3k3amq5SmnXIiAN7Q/Q=;
 b=yD98q3WUQdXwjSn4gfZvUiGTzV73HdzMQKBbLzJvNLNfXjtLwp7z+pRioCIN5wnFu0ce50NHdGGw6Ez6DufFLBvjV5v0zxNlADodx4q/IPiPSVi7i79oynzP2XhMto2IA0Stxu/cbJXLwnGY9B1lnyjQtGHTdYblRpz+cVr0oy2ZdGhaQYEdjwrYLDyRKCgpBMSYmp7Gc6lwgYC8UwHrHmRCzU6/MqYbJxFIX3D6X94XhSnUhtPJnu3yGgyYHsnS3tTdx0UmbQTupnW4v/aXX8SkH+BdMOqdc6Qllc+Fpq7ZhWnBnUEOuE/2qqAW1GZdg2sM+XgUdwrZMHfJpSBpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmrIDeE3TLAsvpvq1g9U34OR3k3amq5SmnXIiAN7Q/Q=;
 b=GSYpSIQgFJf3dOVWTd0DS5m2o3aS7teeNieitbDAz+zPeDsxS/UkFsOvC1B1xli3QNmrmMRXg3DkF1WyTH1toOChpgMYTvNzo4tStU1qv+C89HgNEglXWLJ27UouoE21LW29xm1jY7Lh1b8dCR+xuAyo05xoNGTWDq4ldxGu6uQ=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB10932.jpnprd01.prod.outlook.com (2603:1096:400:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Thu, 9 Jul
 2026 22:58:28 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0181.016; Thu, 9 Jul 2026
 22:58:28 +0000
Message-ID: <87tsq7ojn0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Huy Bui <huy.bui.wm@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH] soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"
In-Reply-To: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
References: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Jul 2026 22:58:27 +0000
X-ClientProxiedBy: TY4P286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::11) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB10932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e853b1e-874c-4059-2477-08dede0d96ad
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|4133799003|38350700014;
X-Microsoft-Antispam-Message-Info:
	QYqdCJ01qIp973PH9s1jA7t+CPn2r7pF1iONPmjUy1jkoFZ/Co6RnYyC5yodK82qRq86FYF5ROA0z1w/yVbKzxd8aHoVA5+AKwtmMLH9JHdXvfN1ObCGgKuqTXbjD8005NMGpU6T1Ce2DOMQSvJVpkgV3GOGRcPY0DINM7vVybWtQAgAd0hNP2FZZDwhg7+wAa9OBQoqMsQuLhBD9RfvvGr3LNpNusFfZI6KjH0fOjxJ6RVE/CxwWhPNWQQxylX2uFCvj4G2ZGVCeDipng+fUhIwmMx2IndsTkoEcrPPcYLcLHxJno/8F7NVbIDYjqW/e9IwQDttuKV2i8GHfIvgUjRmP1KZbwQ6iabo7CJ6U497wgwzZh1zBsC3ETqlQLb1cudrpfbGI8y3AHFEcYVXq+GCkgUrblk16DzKE7Jh2caL1bSFTFalo5HahRTnasxpdoA/JrAurab57f0lgZaXQJZ28vRWeBKDTdFqOyhYbZ8EKgjewW4SGwg37t4YsKdC2uvIKk7574W9xyoYJ5k1YnasFZ3LRh+NTWm+6ZgghwiEmfbA4lq4cLAC3iQ/zmn4rKDtGfIpg3CbqJA4BuDPNNazQyT2Klh0HoQIVDaQmaYIPqbdR3fAmBg6pImahilMwMmdUNpLznR5VKpr7+fh3jcEhLK1XCfJnLjh/vi6WgOR51TOswEyppBUPGSzc7mRczoBm1yggXNK2XZJkOVeFyAvJ9gGyhDi8NTY/NDfhGQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(4133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MWiQH1mlsYmfATR7sROR7uu8xv/IowrpKHEkZnLT1kFyro4oz8NnsDU+Z7nQ?=
 =?us-ascii?Q?2dfgsjrvMdjeEBCNYI6yGvh5DeqA9B1Nh52EmK0hXDeAiR91pc+iG50hhwpm?=
 =?us-ascii?Q?RungXO8KiduGc3xtNf42p+MdF/jPUYWWDqHQUCCEZ2zE3gvoPCjaJwPtuE/m?=
 =?us-ascii?Q?ZXrkw1DR93PmBAl/lc4SHe0AZnsgAUsIS2a5JHMIMwU3qrZRu3uVKvKmzRDj?=
 =?us-ascii?Q?ipVcZ81FawwidHGQjH5XTxTfvOPvcWtFqjNI+aXq6CX/J3UVqO6c56/JWCS5?=
 =?us-ascii?Q?zX2px5oCHv2yPyZhW3e3b0wl/DHtLc6QMYyQra+A20JYznl7jhZnLOKW/Q9H?=
 =?us-ascii?Q?Xv8qDardvXL7hwWH34SkdjwHOvg5OuBqUpA2FLCTNtsvEmLzLehDwSoe0YJ2?=
 =?us-ascii?Q?pLTJFrpdnoYQdVJBJVGhGzx3rGMwtFDlA9QID5oiP903zMGdq+sEyh9raEmY?=
 =?us-ascii?Q?OB3u56xWo2KI2vBPPT6a2s43KwU4oqBqIVZpcfMIjnNnJBVBErG85niJK3m6?=
 =?us-ascii?Q?f4mekdhCnpwf0JHFcosWQl4jUD2KUyn/NdxnN8zXoJnyohsTtGjSPl0mIjHZ?=
 =?us-ascii?Q?4FvK4qDcwDqaAB3EIWoEaN2xU3gwV8K0so6ANhdBXqfdpzr1szf3d9yPUXiL?=
 =?us-ascii?Q?o8XgC1yKjvAexLh4An3doOxphKlwOI0afbUR4zXgHfszgFRVXXpNA5E5F3bo?=
 =?us-ascii?Q?zN2gaDAzDMLMwrKBKDJdpTZTRnM3zB43JVcywOKy9NZSSsNgHdQxzn9HFt60?=
 =?us-ascii?Q?AUA29nAx2o5IQSvye9VBK5K8eG9R3/bBjd6u2n9XcRzgp/bwC15j4YoVZyGu?=
 =?us-ascii?Q?Yn4a6uclGO9aRvWAqavGUnZYNaE3LcUolvOd9qTVHA9kthyFhsO10UoNxGgo?=
 =?us-ascii?Q?hjZcWyrVzTgSv9woxa827rqvGQ+h5q1xmEus0ei0W1Qw/Y8ro7qdMeTvohm2?=
 =?us-ascii?Q?Q8SclNc7881HRK+Z0H1nLBiM3NBmylHcs6lOlFS+s0Mk27mW3oDgW/0/sm+L?=
 =?us-ascii?Q?3FRqb05xqu+U1kNy7pavKHWSUKw+Tp1IsS3Efh0GpD15SC+mcXtV37MsRKof?=
 =?us-ascii?Q?pfnD1MS63RsC69bjGyOnz5y1vEzy/+qgyQBoS3j2RgvQiXbW3/LuAfjzF8GQ?=
 =?us-ascii?Q?XD7bMvA/uaR0QzeuK0MBpJjMQRe98sAaD8it6IP9C+eFmXVDZOwd+WrGZlpP?=
 =?us-ascii?Q?ThYn0w3+CR4fXpstKttLQl+2IqMRloDMzllj+0Eh9cRD1/6ybPIXvuRgSUPj?=
 =?us-ascii?Q?0d2Nwl2HbvOj8GPHEnhxR19V6OxzO5vDoj1uMC3aLzduMkEOcVhgfqjIOpyh?=
 =?us-ascii?Q?fAYRobgk8aIxJ0CfXp/d/kIvGH4g2aWCow2pNCoDsxuIuGnf/O37PmV3RVoh?=
 =?us-ascii?Q?XO9kvfgvwK5eOdJ7o6dZfBSfjHZ/Ze6xMepy6NaaGHS6kiHQcO7aDDfS2kuh?=
 =?us-ascii?Q?aSE2E3+k/92rLwNx6HOf/SmmMkxVPWBnVta/dqYgf87AgRbeI+paLQn0ddML?=
 =?us-ascii?Q?2QdeEEFFB9PxzgYdKgNiDBvy/GgfrhP6BqRI0e1Q+FGiIs/3c9FaPkQ1GZLs?=
 =?us-ascii?Q?uPgdSW2BvRdNOVaq8JijahxdY48q+qLh4B2K7LMSimVqJH2CivTleUaft+fa?=
 =?us-ascii?Q?cKtG9TdlYk8qFDTRB+lAzDYjWqT8cyqMZHuDpPZGfJy0WTMyVExa2oPTfdaM?=
 =?us-ascii?Q?k9cw3xc+t1igudiauDjhT2EDFyBYe0RKo7XasZJYKqmr9n9cek7J8nEMVhcO?=
 =?us-ascii?Q?Y9kMnM2APrhjeikHnnPMm9ImwvirFco=3D?=
Content-Transfer-Encoding: 7bit
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e853b1e-874c-4059-2477-08dede0d96ad
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:58:27.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJcD1tGRHqZu4j/p0XYQwPIx+qGKXQCPoP/0X4hTC5fpqU7H3c8H4PWQWM9CpuSdcSHX8piLXxrn1hZPNCGjArNQSJXqUBQCCnbCLu/rnM4PT/5qyUwkDu0SOGMejXFu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10932
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
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,vger.kernel.org,lists.infradead.org,mailbox.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:huy.bui.wm@renesas.com,m:duy.nguyen.rh@renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:marek.vasut@mailbox.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35004-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,glider.be:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:from_mime,renesas.com:email,renesas.com:mid,renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D509E7362FE


Hi

> The Kconfig entry for ARCH_R8A78000 contains both "default y if
> ARCH_RENESAS" and "default ARCH_RENESAS", which are sort-of duplicates.
> 
> Drop the latter, to restore consistency with the other ARM64 entries.
> 
> Fixes: 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
> Reported-by: Marek Vasut <marek.vasut@mailbox.org>
> Closes: https://lore.kernel.org/a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

