Return-Path: <linux-renesas-soc+bounces-32519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLoKMyl3A2pY6AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:53:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FDD528346
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94C1931E721C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7D538E8D5;
	Tue, 12 May 2026 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kiAYs60a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812339A049;
	Tue, 12 May 2026 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610571; cv=fail; b=YcS8AOhp1UbYnK4u8YAZF+AH9H/IJow228UjdtS/1JDy6n+lTeqV0Jg0DsYAMlJmqwK1xyUVO89x/J7HLYnDKvUNmoUFqWOZza7JX/P3Iuj9WpSvH358EURyk57vdjk0nnIPgE8OrWwjqgZa5cJAuuDRAZKZBs0aDi16uIy1q34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610571; c=relaxed/simple;
	bh=TPZRf6tGKEM4BKxAVI724EhER0vBE2XU7fttA+sKT6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EAcJIey1JVmLZbdj+OXnYF5sFNdvv3cajifdxv9IlNyNHypb7PeIIXimm0Ew6nn3ozDzmBULaLMzk8NwNXfbl96qEVr2XKf4UgI+7qL1lrSPBEhyUNOYo2NUFFuIwBSriMTPKeJuXo4bXLNUdEnuvZWwYQVgVfHy09ub9DeK3F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kiAYs60a; arc=fail smtp.client-ip=52.101.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCJ3y3Iq+VZ2hm1xE0OGlMgbf8rmTP3T7XUYyTai0QtOZabzZnOyyo6RKpVVRlvjypSMvaueMJXtXZX0kf78E7wdZNitNvzIG0FgzGPTUYfd7CfG/m/qBslrIBIH3S/r4ZhTHbwugKkPqrOfNlHWYhvMY4/GLd7aL13MXZ5BKm0sityQ60qPT8zRt2QxYH1TLWncDqJZzrIvpamllKcLyaUkAe7WLkn9QfV95yuAYDI1zGlZJkupIK/WHkfnImES74BIP+Iyy3K4pubaXZXLWQbuVsFSMMEZBA5/Wwqf3xKzuH79kq4JHThtyrsMZuUPFVD93OHGaWagOP5jKOhC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgY1vbjioS7bWZwphjyNBfKzrJns7qKDMDQENy17MkI=;
 b=cm1/IZtdNEaU7fCX52t5C1IW889HQL65eoX5LX1QamfViCB2Hw6UrtrVgbTD8BsGF75qf1Va4qbNxTTXwQIJvlEHlG5R6LRf2M2Iuy6SzgJWbWmlj1yBu+tK/vobsOXXJXVzmaWsoY/a1eaDbdkDpSYXUNzfZgOjr2gOtv5xMNzXAQaYP1RWpZIGvAI9t8UegvfWDzJXiLbgN5Oku0423ZMyDvimBinPe0wLEO8wudrXeIeADFO5fHHDQF1+XVDER78So5j773dn29tBPhaDZFatpjEoXgCfLWt3o3vHPlF2pgQh446T4jBauEwquqMwEDByVPfHJPj/CTR8wGamMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgY1vbjioS7bWZwphjyNBfKzrJns7qKDMDQENy17MkI=;
 b=kiAYs60ag8aG9pXBiJ2V+huWvzLgj2adBdnpkfz7SCkn04VjUcAB00dDLtApvSppvLcxalOMkZGtfGHnTanHKppaOp9MkG8tJ3kD/S8W2j8paWvb6ggpyhlsDf8dG8AYqYwhDbzhMM3LQ58DNG8K5kpoK9HKuNLU/JNHEeMOrpE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB13037.jpnprd01.prod.outlook.com (2603:1096:405:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:29:27 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:29:27 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 16/16] ASoC: rsnd: Add system suspend/resume support
Date: Tue, 12 May 2026 18:26:31 +0000
Message-Id: <20260512182631.3842065-17-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0192.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::17) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYYPR01MB13037:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ec4749-fe4f-4ef2-abb1-08deb05465f5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Cb1SqLy8AyElqoQpg22Tyydv272fnQsHQpmhDjQLMJ4ggRLu88C47okBo7Fm/7ly64IUDoSuxVbTS1v80GdIwlxU2px+bBrR7kj0MBW+NKOioJ2ZvpQhjPP3MWuC5KnVdtM7408Z0LPRayTqQ0hnFTFTYdDkSqd5wJu6UIsvIAsPo1Kdf/L6RTGixfyc3m7WrOEdBBCkXKr3iPYvgDZYuNWQIHZ0eFquoOsY9YrBFdKfyxeHG8NFCppg0w0tzUA8g67AcregaWEXaX+r++u2d4d3PqpuL+cG6AwvHhdI5biVQDUacoTpj9Oy1AqPD+ZUNXXJy1wvMjI0borjz1anIvZVY1fEZ7D/hT+3aPE4mY1ioxykUfkG+I1JuHOs1MVS/R//1PTpqgMdtkZcQ9A9Gj0DYUjwHkS+1UlJkNUCAAKyJ8StT+set/cnL+5sU15xsx0o9/VKL89COtv/OxlaJ1UmlanCHvRZFrx/jHqmiSWJs18N0oar8dQxRGdRifz4Xqcp9eSX920xdCla8voY2grXs7B/R+E2M1gQ2liyFST6jyL7zEY/q2q0ql3m/O7+pBZTjDyhj3IbmmCW1fg4mahmJDEh0HzTn5b4HL2rh4xiS81c2stb5XwxO+uRcpw9minVeCPQSxuzW5XUb2fA+5NFxR5w4N0XmG5ZEuka17zwRdndL2mHHcimecmjbzrYbstlAAPeao0wEhvT1ltfQmaeqs25hq/t2ZnJqjcmNClpbUuZ/R1QuPErdcQq/3nq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rifyGGInrPBkALgYjSZ/2lOjJAGoFWufOmUqhnSXhczC3KrE4399+aqwKvkZ?=
 =?us-ascii?Q?AHZGisbHRrDxrA9ymTj6JcWO2VYruUcCVJut+6WJvT/elsI5yV5DS6NhdSnY?=
 =?us-ascii?Q?ZPrxxkWPc4IGubA9wzKbvA7jeXyh2hyodxPlq25iMypdx4zLHRj3IeqeuV0z?=
 =?us-ascii?Q?WN5uWsasVj6an/jBdFMWsKnQswAEBDQItjbstcq5SZFfzGwRcyy0PeIj3TLt?=
 =?us-ascii?Q?Bb1+MK9Tb1UCWgqrhJpiR+YiTgHkapo5R/Sok/3cSu8Rpe9RsEPF0/EjcvSN?=
 =?us-ascii?Q?IbUhkk3Vr+kzjjpN/5IWWtVrrzxvaSC6p7Ib7a+/XzPPxWreKQVDvumx8v+h?=
 =?us-ascii?Q?AtG8r/9eKm2aK7m8nm/2KbpoPVlvKjYLNsiijzZqeEwtE1Bl1A6x+D4caJ+e?=
 =?us-ascii?Q?LnMgZ2VYxWain/uCWQdrQtjgk6jmislwmKeBp0n0ucvCZBV/BuQ5a876IS5g?=
 =?us-ascii?Q?7xRcp0B8Bf7nFjl2Hj5TB4U2G5KUqZxpj+7+DBRqqlfBcZRIXUofDA5zUUqY?=
 =?us-ascii?Q?ox4iU6rTIqXL3haf8TmRvnwn4kOl6iv59rA7oxGRDq2Hv67onJtqxSCYQnQ5?=
 =?us-ascii?Q?+wzzVg0JxAFPnrPcKIqpgP9vkcVhFT37YxsPr5CxIXCgG7zI7XOzHPkPe7nw?=
 =?us-ascii?Q?4BMj+0CGx69O65Kcr5OSQx3Z4AXHc+EGDNw0gAv5CnNb+99LS5yDigrcwpzh?=
 =?us-ascii?Q?ytK/Y/6JOHnVkGq2r2rXIRmn9eryK50I+t/y4SWSFYmEdnmzNdGyiTzfoeM5?=
 =?us-ascii?Q?DEENvtnFqyZZNUf00/zwYkcWE3ZAqmjseMMsSF73EnNpCpI1i1FaxzdaOHND?=
 =?us-ascii?Q?WMON1mtaJr3a15AIUowkdbxq+HZCZ58PMkrx1IQq5J747kMgnH5HhPgEAwab?=
 =?us-ascii?Q?26TCa1BTby0sLtIJvmAtV9KNBf7FJ/mvlKtkeMvzBdF/8VC0Dqwlf3XONqa/?=
 =?us-ascii?Q?/5fTgUBzdVO5uiYwJ0PQOutY7+77dseQM+7gqvx9WS11ICMiw/0ev7HC6Zm5?=
 =?us-ascii?Q?z0lxwZ7lFGALASvENoeFHJ8ZZGJpmmcVD0OeOh2yYdKpjh5T19bmyiP2nADx?=
 =?us-ascii?Q?YXNDDx+7QT7n0GP+46g2Epf6t0aMUIUsdUreJWBQzAxEqdopf6AdJ45tdKhX?=
 =?us-ascii?Q?wxTC5eAFFWiwK3L2x1XlU81/iyCFoWD66l2uNjclImHV6lAB21bvDDJtLv6K?=
 =?us-ascii?Q?o6wI9kubPPU/gKR/GFrlP3giCIOzhS1TNP1M9GosynHP6Ri5QEQ3KlEm5E7O?=
 =?us-ascii?Q?vhhA7yq6XyLnuvRWhXVPiuwcESTel01t+5YKlPpqidLB5/KU1Ilsn0ZAf5N4?=
 =?us-ascii?Q?F0oA2SsMaux3YRQWKRHhoq3ntNCGnfbdibEtaUEvTXrk9b0UxIom26BalWmL?=
 =?us-ascii?Q?O8gtFDehXu9fY2joMxd9qh+zaPn+fTaLvGDWiAGIK23k2/Fl5P7V0SD+KnWM?=
 =?us-ascii?Q?70OcW+cEs7Anim66Zg38FadBVOoU3lRkZoNxyFllcsCrm1GVGx4GxrBLJk9Y?=
 =?us-ascii?Q?azdgASCJmiJ0ep7bdEXDUHCz4EEKPj8HcXA2V4N9DyJ1Zlc8ZsF+1Mj70RM8?=
 =?us-ascii?Q?WkemlmeKdq3ESDcYuuyfsZY/8a5FSBLmW5vhLaWcyVeVbEybLDrQSUBUoWQ/?=
 =?us-ascii?Q?gEzmrN4QoLJ07ephePFRHBqlxelqHXM5LK8PT0UZzPI54C4lw8V+mpMjosiB?=
 =?us-ascii?Q?Xm8aspofvmmZNIlB2br/uKuZCj0UWzTKk8LvQyXV+kLIEQousu4psCdhShPZ?=
 =?us-ascii?Q?9Gq6EeckTYuvZA3KqNJGlX8iDkWzpWc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ec4749-fe4f-4ef2-abb1-08deb05465f5
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:29:27.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+RQEa3pCiWXXGGXwpkYKCdq3Bo3oEoJXfG/E2EvNR66/35akry43bcyfreXOSAEt3KfXzU+h1O1AarkMmRjCR26gBGCkr49zha8PfzMHuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13037
X-Rspamd-Queue-Id: 24FDD528346
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32519-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

Add system suspend/resume support for the ASoC rsnd driver, required
for RZ/G3E platforms. Distribute the per-module suspend/resume work
across the relevant files (adg.c, ssi.c, ssiu.c, src.c, ctu.c, mix.c,
dvc.c, dma.c) rather than centralising it in core.c.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6:
 - rsnd_dma_suspend()/_resume(): respect the audmapp probe
   ordering. On suspend, assert the reset before disabling the
   clock; on resume, enable the clock before deasserting the
   reset.
 - rsnd_src_suspend()/_resume(): cache src_ctrl in a local and
   add an "if (!src_ctrl) return;" early-out so platforms that
   do not instantiate the SRC subsystem are safe.

v5: No changes

v4:
 - Absorb rsnd_adg_mod_get() helper directly instead of a
   separate preparatory patch.
 - Distribute suspend/resume declarations into their respective
   IP sections in rsnd.h.

v3: No changes
v2:
 - Distribute suspend/resume into per-module files (ssi.c,
   ssiu.c, src.c, ctu.c, mix.c, dvc.c, adg.c, dma.c) instead of
   monolithic loops in core.c, following Morimoto-san's
   architecture suggestion.

 sound/soc/renesas/rcar/adg.c  | 26 +++++++++++++++++++++
 sound/soc/renesas/rcar/core.c | 43 +++++++++++++++++++++++++++++++++--
 sound/soc/renesas/rcar/ctu.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/dma.c  | 22 ++++++++++++++++++
 sound/soc/renesas/rcar/dvc.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/mix.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/rsnd.h | 18 +++++++++++++++
 sound/soc/renesas/rcar/src.c  | 34 +++++++++++++++++++++++++++
 sound/soc/renesas/rcar/ssi.c  | 20 ++++++++++++++++
 sound/soc/renesas/rcar/ssiu.c | 20 ++++++++++++++++
 10 files changed, 241 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 203298b63b76..3d8fd66be648 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -915,3 +915,29 @@ void rsnd_adg_remove(struct rsnd_priv *priv)
 	/* It should be called after rsnd_adg_clk_disable() */
 	rsnd_adg_null_clk_clean(priv);
 }
+
+static struct rsnd_mod *rsnd_adg_mod_get(struct rsnd_priv *priv)
+{
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+
+	if (!adg)
+		return NULL;
+
+	return rsnd_mod_get(adg);
+}
+
+void rsnd_adg_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_mod *mod = rsnd_adg_mod_get(priv);
+
+	if (mod)
+		rsnd_suspend_clk_reset(mod->clk, mod->rstc);
+}
+
+void rsnd_adg_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_mod *mod = rsnd_adg_mod_get(priv);
+
+	if (mod)
+		rsnd_resume_clk_reset(mod->clk, mod->rstc);
+}
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 679c833fd001..26cd908299e6 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -963,7 +963,8 @@ static int rsnd_soc_hw_rule_channels(struct snd_pcm_hw_params *params,
 static const struct snd_pcm_hardware rsnd_pcm_hardware = {
 	.info =		SNDRV_PCM_INFO_INTERLEAVED	|
 			SNDRV_PCM_INFO_MMAP		|
-			SNDRV_PCM_INFO_MMAP_VALID,
+			SNDRV_PCM_INFO_MMAP_VALID	|
+			SNDRV_PCM_INFO_RESUME,
 	.buffer_bytes_max	= 64 * 1024,
 	.period_bytes_min	= 32,
 	.period_bytes_max	= 8192,
@@ -2160,11 +2161,35 @@ static void rsnd_remove(struct platform_device *pdev)
 		remove_func[i](priv);
 }
 
+void rsnd_suspend_clk_reset(struct clk *clk, struct reset_control *rstc)
+{
+	clk_unprepare(clk);
+	reset_control_assert(rstc);
+}
+
+void rsnd_resume_clk_reset(struct clk *clk, struct reset_control *rstc)
+{
+	reset_control_deassert(rstc);
+	clk_prepare(clk);
+}
+
 static int rsnd_suspend(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
+	/*
+	 * Reverse order of probe:
+	 * ADG -> DVC -> MIX -> CTU -> SRC -> SSIU -> SSI -> DMA
+	 */
 	rsnd_adg_clk_disable(priv);
+	rsnd_adg_suspend(priv);
+	rsnd_dvc_suspend(priv);
+	rsnd_mix_suspend(priv);
+	rsnd_ctu_suspend(priv);
+	rsnd_src_suspend(priv);
+	rsnd_ssiu_suspend(priv);
+	rsnd_ssi_suspend(priv);
+	rsnd_dma_suspend(priv);
 
 	return 0;
 }
@@ -2173,7 +2198,21 @@ static int rsnd_resume(struct device *dev)
 {
 	struct rsnd_priv *priv = dev_get_drvdata(dev);
 
-	return rsnd_adg_clk_enable(priv);
+	/*
+	 * Same order as probe:
+	 * DMA -> SSI -> SSIU -> SRC -> CTU -> MIX -> DVC -> ADG
+	 */
+	rsnd_dma_resume(priv);
+	rsnd_ssi_resume(priv);
+	rsnd_ssiu_resume(priv);
+	rsnd_src_resume(priv);
+	rsnd_ctu_resume(priv);
+	rsnd_mix_resume(priv);
+	rsnd_dvc_resume(priv);
+	rsnd_adg_resume(priv);
+	rsnd_adg_clk_enable(priv);
+
+	return 0;
 }
 
 static const struct dev_pm_ops rsnd_pm_ops = {
diff --git a/sound/soc/renesas/rcar/ctu.c b/sound/soc/renesas/rcar/ctu.c
index 293b0eec1ded..7db0fb3612bc 100644
--- a/sound/soc/renesas/rcar/ctu.c
+++ b/sound/soc/renesas/rcar/ctu.c
@@ -378,3 +378,23 @@ void rsnd_ctu_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(ctu));
 	}
 }
+
+void rsnd_ctu_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_ctu *ctu;
+	int i;
+
+	for_each_rsnd_ctu(ctu, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(ctu)->clk,
+				       rsnd_mod_get(ctu)->rstc);
+}
+
+void rsnd_ctu_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_ctu *ctu;
+	int i;
+
+	for_each_rsnd_ctu(ctu, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(ctu)->clk,
+				      rsnd_mod_get(ctu)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 0bca0b303191..0bf97a12a9a7 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -1035,3 +1035,25 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	/* dummy mem mod for debug */
 	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, NULL, 0, 0);
 }
+
+void rsnd_dma_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_dma_ctrl *dmac = rsnd_priv_to_dmac(priv);
+
+	if (dmac) {
+		/* Mirror probe (which enables clk before deasserting reset) */
+		rsnd_suspend_clk_reset(NULL, dmac->audmapp_rstc);
+		clk_disable_unprepare(dmac->audmapp_clk);
+	}
+}
+
+void rsnd_dma_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_dma_ctrl *dmac = rsnd_priv_to_dmac(priv);
+
+	if (dmac) {
+		/* Clock must be stable before reset is deasserted */
+		clk_prepare_enable(dmac->audmapp_clk);
+		rsnd_resume_clk_reset(NULL, dmac->audmapp_rstc);
+	}
+}
diff --git a/sound/soc/renesas/rcar/dvc.c b/sound/soc/renesas/rcar/dvc.c
index 26f80d542da8..7601dfb0810a 100644
--- a/sound/soc/renesas/rcar/dvc.c
+++ b/sound/soc/renesas/rcar/dvc.c
@@ -381,3 +381,23 @@ void rsnd_dvc_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(dvc));
 	}
 }
+
+void rsnd_dvc_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_dvc *dvc;
+	int i;
+
+	for_each_rsnd_dvc(dvc, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(dvc)->clk,
+				       rsnd_mod_get(dvc)->rstc);
+}
+
+void rsnd_dvc_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_dvc *dvc;
+	int i;
+
+	for_each_rsnd_dvc(dvc, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(dvc)->clk,
+				      rsnd_mod_get(dvc)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/mix.c b/sound/soc/renesas/rcar/mix.c
index 9ffa591aa4a4..c4da4c4bedb3 100644
--- a/sound/soc/renesas/rcar/mix.c
+++ b/sound/soc/renesas/rcar/mix.c
@@ -345,3 +345,23 @@ void rsnd_mix_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(mix));
 	}
 }
+
+void rsnd_mix_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_mix *mix;
+	int i;
+
+	for_each_rsnd_mix(mix, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(mix)->clk,
+				       rsnd_mod_get(mix)->rstc);
+}
+
+void rsnd_mix_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_mix *mix;
+	int i;
+
+	for_each_rsnd_mix(mix, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(mix)->clk,
+				      rsnd_mod_get(mix)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 1e4bc8a6c55c..7c9b2d064d50 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -267,6 +267,8 @@ u32 rsnd_get_busif_shift(struct rsnd_dai_stream *io, struct rsnd_mod *mod);
 int rsnd_dma_attach(struct rsnd_dai_stream *io,
 		    struct rsnd_mod *mod, struct rsnd_mod **dma_mod);
 int rsnd_dma_probe(struct rsnd_priv *priv);
+void rsnd_dma_suspend(struct rsnd_priv *priv);
+void rsnd_dma_resume(struct rsnd_priv *priv);
 struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *name,
 					  struct rsnd_mod *mod, char *x);
 
@@ -429,6 +431,8 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 		  enum rsnd_mod_type type,
 		  int id);
 void rsnd_mod_quit(struct rsnd_mod *mod);
+void rsnd_suspend_clk_reset(struct clk *clk, struct reset_control *rstc);
+void rsnd_resume_clk_reset(struct clk *clk, struct reset_control *rstc);
 struct dma_chan *rsnd_mod_dma_req(struct rsnd_dai_stream *io,
 				  struct rsnd_mod *mod);
 void rsnd_mod_interrupt(struct rsnd_mod *mod,
@@ -625,6 +629,8 @@ int rsnd_adg_ssi_clk_stop(struct rsnd_mod *ssi_mod);
 int rsnd_adg_ssi_clk_try_start(struct rsnd_mod *ssi_mod, unsigned int rate);
 int rsnd_adg_probe(struct rsnd_priv *priv);
 void rsnd_adg_remove(struct rsnd_priv *priv);
+void rsnd_adg_suspend(struct rsnd_priv *priv);
+void rsnd_adg_resume(struct rsnd_priv *priv);
 int rsnd_adg_set_src_timesel_gen2(struct rsnd_mod *src_mod,
 				  struct rsnd_dai_stream *io,
 				  unsigned int in_rate,
@@ -822,6 +828,8 @@ extern const char * const volume_ramp_rate[];
  */
 int rsnd_ssi_probe(struct rsnd_priv *priv);
 void rsnd_ssi_remove(struct rsnd_priv *priv);
+void rsnd_ssi_suspend(struct rsnd_priv *priv);
+void rsnd_ssi_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_ssi_mod_get(struct rsnd_priv *priv, int id);
 int rsnd_ssi_use_busif(struct rsnd_dai_stream *io);
 u32 rsnd_ssi_multi_secondaries_runtime(struct rsnd_dai_stream *io);
@@ -845,6 +853,8 @@ int rsnd_ssiu_attach(struct rsnd_dai_stream *io,
 		     struct rsnd_mod *mod);
 int rsnd_ssiu_probe(struct rsnd_priv *priv);
 void rsnd_ssiu_remove(struct rsnd_priv *priv);
+void rsnd_ssiu_suspend(struct rsnd_priv *priv);
+void rsnd_ssiu_resume(struct rsnd_priv *priv);
 void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
 			     struct device_node *playback,
 			     struct device_node *capture);
@@ -856,6 +866,8 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod);
  */
 int rsnd_src_probe(struct rsnd_priv *priv);
 void rsnd_src_remove(struct rsnd_priv *priv);
+void rsnd_src_suspend(struct rsnd_priv *priv);
+void rsnd_src_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_src_mod_get(struct rsnd_priv *priv, int id);
 
 #define rsnd_src_get_in_rate(priv, io) rsnd_src_get_rate(priv, io, 1)
@@ -875,6 +887,8 @@ unsigned int rsnd_src_get_rate(struct rsnd_priv *priv,
  */
 int rsnd_ctu_probe(struct rsnd_priv *priv);
 void rsnd_ctu_remove(struct rsnd_priv *priv);
+void rsnd_ctu_suspend(struct rsnd_priv *priv);
+void rsnd_ctu_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_ctu_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_ctu_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_CTU)
 #define rsnd_parse_connect_ctu(rdai, playback, capture)			\
@@ -887,6 +901,8 @@ struct rsnd_mod *rsnd_ctu_mod_get(struct rsnd_priv *priv, int id);
  */
 int rsnd_mix_probe(struct rsnd_priv *priv);
 void rsnd_mix_remove(struct rsnd_priv *priv);
+void rsnd_mix_suspend(struct rsnd_priv *priv);
+void rsnd_mix_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_mix_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_mix_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_MIX)
 #define rsnd_parse_connect_mix(rdai, playback, capture)			\
@@ -899,6 +915,8 @@ struct rsnd_mod *rsnd_mix_mod_get(struct rsnd_priv *priv, int id);
  */
 int rsnd_dvc_probe(struct rsnd_priv *priv);
 void rsnd_dvc_remove(struct rsnd_priv *priv);
+void rsnd_dvc_suspend(struct rsnd_priv *priv);
+void rsnd_dvc_resume(struct rsnd_priv *priv);
 struct rsnd_mod *rsnd_dvc_mod_get(struct rsnd_priv *priv, int id);
 #define rsnd_dvc_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_DVC)
 #define rsnd_parse_connect_dvc(rdai, playback, capture)			\
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 0237b5d2e79e..a84425587978 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -834,3 +834,37 @@ void rsnd_src_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(src));
 	}
 }
+
+void rsnd_src_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_src_ctrl *src_ctrl = rsnd_priv_to_src_ctrl(priv);
+	struct rsnd_src *src;
+	int i;
+
+	if (!src_ctrl)
+		return;
+
+	for_each_rsnd_src(src, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(src)->clk,
+				       rsnd_mod_get(src)->rstc);
+
+	clk_disable_unprepare(src_ctrl->scu_x2);
+	clk_disable_unprepare(src_ctrl->scu);
+}
+
+void rsnd_src_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_src_ctrl *src_ctrl = rsnd_priv_to_src_ctrl(priv);
+	struct rsnd_src *src;
+	int i;
+
+	if (!src_ctrl)
+		return;
+
+	clk_prepare_enable(src_ctrl->scu);
+	clk_prepare_enable(src_ctrl->scu_x2);
+
+	for_each_rsnd_src(src, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(src)->clk,
+				      rsnd_mod_get(src)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index 007a7c91d470..2fa76a079982 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1257,3 +1257,23 @@ void rsnd_ssi_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(ssi));
 	}
 }
+
+void rsnd_ssi_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_ssi *ssi;
+	int i;
+
+	for_each_rsnd_ssi(ssi, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(ssi)->clk,
+				       rsnd_mod_get(ssi)->rstc);
+}
+
+void rsnd_ssi_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_ssi *ssi;
+	int i;
+
+	for_each_rsnd_ssi(ssi, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(ssi)->clk,
+				      rsnd_mod_get(ssi)->rstc);
+}
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 8fb0ec5dc791..60b58096531d 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -630,3 +630,23 @@ void rsnd_ssiu_remove(struct rsnd_priv *priv)
 		rsnd_mod_quit(rsnd_mod_get(ssiu));
 	}
 }
+
+void rsnd_ssiu_suspend(struct rsnd_priv *priv)
+{
+	struct rsnd_ssiu *ssiu;
+	int i;
+
+	for_each_rsnd_ssiu(ssiu, priv, i)
+		rsnd_suspend_clk_reset(rsnd_mod_get(ssiu)->clk,
+				       rsnd_mod_get(ssiu)->rstc);
+}
+
+void rsnd_ssiu_resume(struct rsnd_priv *priv)
+{
+	struct rsnd_ssiu *ssiu;
+	int i;
+
+	for_each_rsnd_ssiu(ssiu, priv, i)
+		rsnd_resume_clk_reset(rsnd_mod_get(ssiu)->clk,
+				      rsnd_mod_get(ssiu)->rstc);
+}
-- 
2.25.1


