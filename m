Return-Path: <linux-renesas-soc+bounces-33798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qZZzEPAXKWoRQgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:53:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E528666CC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:53:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=F6ETenTm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2122A31836E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 07:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EDD393DDA;
	Wed, 10 Jun 2026 07:47:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58463932E6;
	Wed, 10 Jun 2026 07:47:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077666; cv=fail; b=dqtaxVUsm8dC2boRVjePLDREzFs5bXq9VJejlqiU58FCfZbpg9/vPVLqVZ5lWLN1qAqdI1neZtBK8LvDro/JryS5vAHH5W0owA7BKaPTTj255HCINu2x0VvYbaoEUStuh9h+djxC6Znynx+/gv7q80Y0vs0Z1iTmuyAkXP3UxNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077666; c=relaxed/simple;
	bh=JfqkiJEcjiMic1/QI7g+1/1aGQ0ZJsBTR5gIPWpLg+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KIEBUD0lFUBLC39L2SsVgJyg2MB7k4e36y8lWWzmPnZNoqdwGcILAX2SczhWzx6FMWLarRcFigEkNMVn29qMGQeD4yzk/1NzJIIqsgnW6Qnbu5j7skLXlNF55N0Znh2ZFLDU4Y562/iynGfXpA1mJ2ccu5VW5GREnJ4WWLKdu6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=F6ETenTm; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mm4odI+pif/VqZXFUfSg0gJ/ITXptjzLiGByaKmMCt+OTX9tIRP7FiRnzSZUDe+cqPL161bz3wLVbN5CfNE0gGylHUW2OZocGjTl2ie4GMOKJlMAkbvjBloTLIYz6UhcBriv3YX1yFm1i2cbw+NDFWYRkBCQPrHmALCiiJLTpFDAJcFUx3JJsPFMQHVlYENn3B94dCNoV7Znz7ssqs9UzGMil0LXoJ2xu1whJNBfBUXj6ZHrQ7anN/1vzdmkzV139TRPoOgWAqUgiDEtffSthyhqpwoh+dpLvnttcUUaVJnyKRwliHJ0a9IRraskVMux44NHOEBwdgDNWVHosbm7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvHMnIntRV60mPkd5GDv80iWHRjGj/v6ZnbveaUVROY=;
 b=lwD4L6J0r8/GBz9Xh/p6nme2Vyi4mSBEPuFFHXDiJPzndPcH75bdSbtq5QWW6KBHe2tU5tdk+huvcjBvbG3emE2CA/Ta+2lWR3M4YXg352jkrqF7p8lOqDAPDJ/jSPOn5IEJUNWoJueRBI/3H5EE1R0nYhPzzsqCfvpYDeOxVPOMrAb84kRzRQJNzwEnToN391582Y9DNLy7yfF8tl5OVsgIj3Z/29BzIRemTHoTHPUUGgkA2K94rktZZzDV3qpT8H0DHF3PvMxMewAtcEACwETc6DCEEnwkB4Nch/RoHCZ9n7XLcM/9+qe8hDUft1N/HQIuMfnqxhfN0EVOFUNvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QvHMnIntRV60mPkd5GDv80iWHRjGj/v6ZnbveaUVROY=;
 b=F6ETenTm52ZbHw9RAU3ZmZjj6nY6b5kTKgCf9vItJfhx9LAjURUTdKrZUoZ0Z3QL4Wa6iOm/wVGHrta2FVcJ5Zv9SCNXNe5OBZgNc01VZg+quzaJvvbTSi1mtmrX/dp5kwE1RdNMLV0Jc3G+ST1BSzyAkwjxzQi+mb7bKZYpihA=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS7PR01MB13812.jpnprd01.prod.outlook.com (2603:1096:604:368::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 07:47:43 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 07:47:43 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 3/4] arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
Date: Wed, 10 Jun 2026 07:47:01 +0000
Message-Id: <20260610074702.1743334-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
References: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS7PR01MB13812:EE_
X-MS-Office365-Filtering-Correlation-Id: c9426663-13c4-40e6-72be-08dec6c48dd9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|38350700014|5023799004|11063799006|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XOVnRGyys0vc0B3c+JE1HfZkLxO3Rtotj2991P+8io75VUxNEDCEftC+Ooyw9D4hT4b7lnBaxECAQIL0quaR3fxAQGnrwh5RaExCy79tPjIZkel3YXgsbb5NLqrJCfbMPy7yHMUHndzw+RU2RYJGHIlFTW3hV+mr/r4GLVUwjUeQzXDiUP8E2TkUIo2mJAMSsskHQKgAyrLgUUons/MbS0PYYYsynHQKm5wyyAHrxdjfc9t9pO8j+kWXtp+vmpfFQxBQgw14ZG6sQaz5ki5P4XAv0Ti6d2tdhwrt0ssI+rNRiU3cpeBXWxe/T66DyIGOZ2EakKO1iKlZparfuXPgvE0E45ffy5viLiq4Ta872j1hxHnVik+lMcix/FQjlenGV1DEZZj4uBH5roSmMoZUUkNBhXyQ1HKlNvt8PK+940gCYhuQojeK787o7CjkMHSa8U53cbj1BL7yKS8RDX1Q0VDfPffSBkns3Ekw2kAzIdD3Mr5Fkm9BU8n2Sz83sSKzV44qcqs8qeflp5WVe13tQlWZitqmf8s2zf1s98nd6e3KXBBFvWn+4YJ9+t+uKWcgCuXWeLI06tGsHD/mhipOEaUbMwikTdsiL9iVlqL6Nb7qgnHU81E7ynVV3CrRRVBXS+XovuD4MN2ZwAzs4Yy2WUuMAISqMnUu0f40r9yD0Br1aK3hSFPXcsSizQgrJcfuhHb6N6yt09HO87D/S2/reChEpa9kF8iEsL2jgEwEHCXfo0IPkN2ZQ2qMiFmvFr6s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(38350700014)(5023799004)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6hH4/G87QN3xBO40frPhDZDbzwTv3Qeaz+SKmEA04NMC6d7QZD9+0TIOkckJ?=
 =?us-ascii?Q?mT0fxglNQQv9eisf2h2AAdm1biIVR89iySXgPqdiJXoDcCe+toyddFQcZs/u?=
 =?us-ascii?Q?aRezoWjSR8sp8cSM4LGh//21aSfwxQIPiopjNKrsIHQEUvxcGGwzyu4HFlkl?=
 =?us-ascii?Q?12EcdVBWXGndyW78TUqpMEDQwe2t3zb51Qcwdx6EANQae1t4bZQ6vrGtQ+oJ?=
 =?us-ascii?Q?Fm/818TeW8N5kEM/u8J0Lh2P5oXKbAI5WOObKHWXSRkMpa5+EZLQ5OE9g52K?=
 =?us-ascii?Q?BMHbS2NpuoLHSAH0kHgke+C3V0y8lOGl1E55pbf6BFHn/eNVrIOuGmOJpU4y?=
 =?us-ascii?Q?LZtKYwvifJ8BRTjQ8LS4Hr1yCh6iXXux9DAauRtgPBpALFtun0v70pK892d3?=
 =?us-ascii?Q?zwBivEy6K+rnru5auwB5yUbTf5CyaAw2mXLlTOK5Y3YO1psyfIys8T3ggTNz?=
 =?us-ascii?Q?qwMDoo9MJTJ8CsBHiSmNSsCY6YrUJDLNhZ0hGHKK0uUBKenrM+PmPZF1mHMP?=
 =?us-ascii?Q?3tXvlWOdpjE5Jtg+BVD/Fx2nWwgqIz2rx1TU363o2q4LFYHrXpI4ct+w/s7f?=
 =?us-ascii?Q?QTiwFKaX5Yzjgieywh/N1QhtdrhJRz+Jftg6YdoCb6CZmj22TEVvGeOm5/eu?=
 =?us-ascii?Q?EaXMxdad/ag/iZOCM8Bd9TmdJ46pb14+D8Id+Cy3qNPWKaqb4PX8ADCXikN0?=
 =?us-ascii?Q?dOBFkM4jGrGTr1w0TPrSG5O4H3DlmJyCYdThiZ1hdOyqtTHo0GfGL1Hj1AYe?=
 =?us-ascii?Q?wVdGIwTQf7v/L4OgFe7FflKNW+zmIFLWinjFH3UXMTlKgr1A8BYnYkccpliG?=
 =?us-ascii?Q?nb0C8aa7uAmSPQVRmlcdYBsXp0zBohNMH9L2ESt0iskONdstxKLINfJ3jn1n?=
 =?us-ascii?Q?aR80BBbBkpO1r4wDc6Xztjjv9wOjO70jjcqmyNdXXECOu4BY/+G/NvhRmt0d?=
 =?us-ascii?Q?v0vM8jiDKSX1OjLqmMBvVa79t0vACGYMDDIz/lZ5rKvaZpZna5t0E0D5kpvX?=
 =?us-ascii?Q?NHmNVEf5sLyl605kkadaMzOn+OYoOYS6kwTpQAGit1+CWf0fQLyyKLpj8JA/?=
 =?us-ascii?Q?dzTTgt5z/zXY54irYTWG0cQNGbM76Rn81mGpGS8qkam3QVvbpMU+mwXrqkO7?=
 =?us-ascii?Q?G53064SbkhnFEwSlps7FEHwe75upa5IxyYxeVMtKHNb6x32fPcOyMHuArv+Z?=
 =?us-ascii?Q?6VspYbMZXd274FrA2sIVHTcPwqjiSzwqAwqZ+KUx/5o102xFQOyCTVjZQ6EI?=
 =?us-ascii?Q?ZhC0x7FajtOMWd1lkcShmXpIa/tU7B9MuhHltzYvAro7Hhxy3Nbd+s0b8J3s?=
 =?us-ascii?Q?CwBSaCiX1R99h7e7UXNENqwBN8z30aS/0zYUqBcLodEi8tTVsOHY8kitY9P2?=
 =?us-ascii?Q?m8TMdOWax7t1ruH8++ImVdDNEppWbYvW6kNAK0/aNzgE2v91u2+3LzUFiW34?=
 =?us-ascii?Q?vXckh0oRnb8nrh4ylnOGAHB0p1woa51olMITISRYy/xarV6Cc+yq1efwNAco?=
 =?us-ascii?Q?H42tvxAtD8deqm+aqZ1m0YMpjWehZuDyDC8lo2FQ7pEsH8eG3a7BVL14jgIC?=
 =?us-ascii?Q?nxJ1Q3aUHAkYMFoIs8tW2+RpR+zLmb9QsDCg0fvF9+Kpw6lpSuEpsvlkkLyk?=
 =?us-ascii?Q?fSN7Y8JpqfliEuj2xpccZJEvMiaTsXYzQM2KBga2BjD18JGQl2qybSLAN331?=
 =?us-ascii?Q?IC1JtOqatOMjFGj3BtOL/Ccye/OV4bV10FWXxZm0/nsIILJtQYNqIXNODnND?=
 =?us-ascii?Q?SUdCwvO1DjZBk0tqZqE5Kyn/AvvRkmw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9426663-13c4-40e6-72be-08dec6c48dd9
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:47:43.2104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmAczmhHvs8XVkG7h/DSB6JOMXvizYjkFaa1EGCGcUJYD5jD6fbpcgBp9N7kY7NYF2Bi8aq/F5CW5LjfXJ0MWA32T2xWvT03trZ59Cd6XvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-33798-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:john.madieu.xa@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E528666CC6

Add pinmux definitions for SSI3/SSI4 audio interface on RZ/G3E SMARC SoM:

- sound_clk_pins: AUDIO_CLKB and AUDIO_CLKC clock outputs
- sound_pins: SSI3_SCK, SSI3_WS, SSI3_SDATA (playback) and
  SSI4_SDATA (capture)

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5:
 - No underscores in node names: rename sound_clk to sound-clk and the
   other pinmux node names accordingly.
 - Sort the pinmux entries by GPIO number.

v4: No changes
v3: No changes
v2: No changes

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index e951609d39e9..0951f02bd2b5 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -352,6 +352,18 @@ sd2-pwen {
 		};
 	};
 
+	sound_clk_pins: sound-clk {
+		pinmux = <RZG3E_PORT_PINMUX(4, 2, 8)>, /* AUDIO_CLKB */
+			 <RZG3E_PORT_PINMUX(4, 3, 8)>; /* AUDIO_CLKC */
+	};
+
+	sound_pins: sound {
+		pinmux = <RZG3E_PORT_PINMUX(0, 2, 9)>, /* SSI3_SDATA */
+			 <RZG3E_PORT_PINMUX(0, 3, 9)>, /* SSI3_SCK */
+			 <RZG3E_PORT_PINMUX(0, 4, 9)>, /* SSI3_WS */
+			 <RZG3E_PORT_PINMUX(0, 5, 9)>; /* SSI4_SDATA */
+	};
+
 	xspi_pins: xspi0 {
 		pinmux = <RZG3E_PORT_PINMUX(M, 0, 0)>, /* XSPI0_IO0 */
 			 <RZG3E_PORT_PINMUX(M, 1, 0)>, /* XSPI0_IO1 */
-- 
2.25.1


