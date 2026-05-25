Return-Path: <linux-renesas-soc+bounces-33070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIVrEOgsFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:05:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 987565C9997
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 243D430160CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F8D36999F;
	Mon, 25 May 2026 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="c8se/Dtf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D43537CE;
	Mon, 25 May 2026 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707025; cv=fail; b=X+5rBkvkBfMHT4uYmVqjzTUkdUiw7P6Imc0Wv6TxpG9pVTjApM6UwKnYvSHOGyBrtky20lVxMtbvF676v/ezYXwImSltoI3OhtW21ahZqv8wLBgRof7WMRYRta0oHUpzgqfCptIXIJlLFuuh86+edx7p/1kLckxJiHdmXtJodyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707025; c=relaxed/simple;
	bh=3AuevBPI2wzLidhCXQgsOZCMPvP60vKT2JBgC+6r5jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kCKQmVUenfEDQmGFzMOjKiKOlXQJ7k+HxvP0yiJy//gZkcGt2XrsOP8MFoe3TRpWlkqoI0E6rL6RHcDSpdcgJUh6TlkeghDmLq64Xt+6JWeBOTDNhl22SlR/Yk0l1FTfD419fGPu3GVP/3YTq5vXXGi57n/I7BraSD+z0dA4hJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=c8se/Dtf; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePmMR8ZdQ+ECzXdMakSmBDt2NEgo6nYCzVe4aYeaqw+EAUJaaJUPN/myrIE+fmiGNwYfxQlNF7bvv/pcae/Q7axvV/xxzPHp2PtgfpAkX2sEYqzOep9sxHHhKtXjf2RIH9Ueo/6pFjMTa+z7rT4S/zUIvBafuzN13vzAbdpxCnuD/LJDmReSg8qCCc29Ia/AmOGcBRolfULXhOmuSfksc4pj4uqY69IBUtTjwbw3Hlnn1912C3POr1d8b2823rC9OOeKg8LuEtGdQaBM7UyS98o1v1wyhDP5jKikcUNvQhMhA+r8GcsikoLVpYYl79080FjhueOWrInRMAoSsFiTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIVYe41mwcQjFumcuYgdDrutk7t1eap86yTF0oylI7M=;
 b=c2d6CvLdnV5wQNDrktU1+bFLFRHmUdY3TG4qRjYJ7vLi66iULMvdO84xZv3NjGJYFKBoJp1Jhlkyjj5vV7oKM3OPZeNXVJiMGgtWctIRkOyC/xITRpv7dz33vouCGuPBFsdQB7Uay/YrLzN3+t/U2HnJceREr74C+Ilgfrzd3i0MfdGst757ALRcVVPi6BpdGu77HRe2PZdew9A0vjLvj4fXotu7k7y8dPXmFi4TRL0rZERouZiRaJuBezLHDW8ccearvrUsqg3WpV5XJxhN597SkwUtLOgpKxmTFGtWsGpSXsOTztuSXDNj0ppcz8SqNXTPPndWgG39S2iguG2UKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIVYe41mwcQjFumcuYgdDrutk7t1eap86yTF0oylI7M=;
 b=c8se/DtfUWQMLEQDucsCetOdlIXb+L6bXuPpBWuoHRXaWwIuZrpZ38lZjrleQLdyPWOrEi0TQaUrDUYVLoxdm7ZEpbG1+KGk+4FNbpbr8smj0Isa5h7N9om2Wy10WMLqoXlGj8BzFM2S6FkDMYPVXzeb3gdVV3zVE5/ThNeNuAI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 11:03:41 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:03:41 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
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
Subject: [PATCH v7 03/18] ASoC: rsnd: Add reset controller support to rsnd_mod
Date: Mon, 25 May 2026 11:02:15 +0000
Message-Id: <20260525110230.4014435-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0180.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::6) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e215d88-62ae-4e96-50d6-08deba4d47d1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|22082099003|18002099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	wl0rQbKOWFhb2lHIXrXRFYKv/g3vesijVvgAmwasa46USF0C/SpibeNjtSpbXGf4/3CR3L46Mz6QcJezoHNwaTqef+rXwAIAgLnqn7FSsQROXsQEjVPuxnmSYXfuTHjqSAF09Y2IGzPegIAYzy7zVa1ipM0abXpHrP6ZMQngCvwsoyqsUxezwW8oqBezHLQfl8iGUZZi/VLuOvecJ98axQD5aH15LRgMs5DANZnTyifHoLtTJ5R6PZZ/2ua09PeFTl9tqp4Lr7ACa8IV1U4AtzTS5UERpYbiyZpgQiZJKVLfo7/cI9lAjoO+vsmkjmCInElRAhLtizXv7sPCRZsItRKlEokUHqFTLNObmSXNzAyYJS1InrMGtYoQ2FxwEzFPJp4y0fERlul8YZJpjzWohZ0lmBMstcp4CMktYhrX1OpcJzNg6dET2PJ4K/fg7F0Lhe4dm7j4nwcKX74dCK0zbvhVNPqRMJm58zRWerAdMOWekIDZSyBEErKxae55+yB4HwaAR9p4cgp4z4JIhqMVO4pkEDMjwoFXihn691u/Xhdv/+7PKANvQd5c01u1PqtDr1JAQHnPzpL7nFC2ElXgs+ANQpHqSoVRfTvs7s3a3BuBmlYM48KW9eMCm+lxRkGLpbOlGJTlfQLtQZMb3uYPZg5zn16GZAjfO3Rt4yyYcoWj8c+h0gxiNGSNH8D+kwR1Mvt14kc7kgb5KgO+hLzhibxDWUl39bVVZ4w01NY58NpKKajUYE9pYrjZmyQxRxDW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(22082099003)(18002099003)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c+T+YM+fY4oFVFvF5Q+l+mINmbhkFoWD6OGdjA25JApqcEN/3KxxFY3uV1I4?=
 =?us-ascii?Q?UoRFa9s7yYkJ2w5V11SlMbiHJvnWCKH6skUI5iNUZEwIqXieonKYjS/ERzGZ?=
 =?us-ascii?Q?a6XQu/V/GmDQymV0C5yY3HaxAVuwbk2kwfaNL7gHFh1YMIGvH2MrfUSqm4JK?=
 =?us-ascii?Q?C6VfFnf44+kk1gxel0pETtUDpx2LbVd2VQKOPBLgsujSIZV5r/VJj8o1SeLh?=
 =?us-ascii?Q?kMNFd9Wso/kVVUkom7xfGomcLGkUtJwv3IJt88eAqRYtZeDllFvbj28PYkTy?=
 =?us-ascii?Q?clVmiWJmrnZpC6kJGyROc2xbrzCfxEmCyz6hi93FmMXADi673XIqz6j8MwbJ?=
 =?us-ascii?Q?ntaTvnsdUuJTkhuON4w1TCA2r0V6WXGTRPz7M9v7dyjp1u/ukAStSSn/+bV3?=
 =?us-ascii?Q?d4Rg7v5QNnlzZEGuf0k/JRKwHxIOvcMgD1AKY16T1fHP1c8h5K3V3uhOQYhJ?=
 =?us-ascii?Q?1XrA98hQVSiSWSZS5S0fO4p+DM7qiSwU2ikizXvnibx2ml/wMZtkxLCoJ+w+?=
 =?us-ascii?Q?ybuZtO5iXrnXaLA+q96+hDbSbseiKua7p694Ddd9eVSwsQ9xvZXpQ2EFX4AH?=
 =?us-ascii?Q?n7bgP1h+ChXYUNQWVOkLaZrp/bD7Brcgtqqals3/KAOSTrdl7gNMuOaL/pYA?=
 =?us-ascii?Q?gUkWtHiOlNLM2tNJ8S98H/TzJnK8Tem5nO65EQmFOA8F8KBvZMy0tuVeeFB5?=
 =?us-ascii?Q?J7c9S71b8t/s6tkT389SuzkceAX2LbYmaJoYTow6n58UpOkXjB6EX0Au9wM4?=
 =?us-ascii?Q?vLDHnOLcV9UzulN3UHnp55azeqzVJ9FGwOsi9m1TXBd7V2RLDaiFMQPw/t8N?=
 =?us-ascii?Q?Ksg5oYwBWS1UGhS2P7FeyuJRmq0S3IRWLrixImkKWxDxoxnYYEDQVsUhlw4S?=
 =?us-ascii?Q?BphSsdnCjh54iXBeVs8CRsDj7Reyn9J4q3p7yIagtZXiYFnRmKRywk8bKxJK?=
 =?us-ascii?Q?W407ataCiaJnIEqSQNb3HOI0V0cAl/AKgX9EIs27Slt4DhdT0hbXP2UTbnQN?=
 =?us-ascii?Q?qLBZUlZOO8du2YesIaqpctB/VIbMqs2v9e+wGVDIGpapWDRfJj1Gk239Ep3x?=
 =?us-ascii?Q?hS6xDok38oUh5pP0UaktT3LycF1EJ9U6VGtSK0LRbYjdnPusUQCXuZKmJn2x?=
 =?us-ascii?Q?D/WzqjfiLEaHSo6xLqxvTSMlGbC5RypwtkftYxh7pGYPDOfxnTzhkm3EgxwX?=
 =?us-ascii?Q?uklBYblK/ez4R3b4LNHIbXKoC1oBzvvmTabo5TyLOLDEEn9v/KFWeNfcuuy1?=
 =?us-ascii?Q?ZfJY+hF4ze5OKzYKGIhKsx5gRjDcS61f7CF4hOgIGxPetM06griB5a5ER4rO?=
 =?us-ascii?Q?X5WrbzA8awk1mQz6ishHWexOBZLLUY3u09LpF5WB1i09Pld4JUE/Ol/LShdE?=
 =?us-ascii?Q?L7aa1MOtramErPdrikpGcAtkZhtSUxbMUehVz8kZZDXlmEg/3QMdxcaHQpes?=
 =?us-ascii?Q?8glrBxhhDyKZqDcfiUt0a4795q3RTO+9UX2DeQmYZ0zO75bw8plclLzeEV7T?=
 =?us-ascii?Q?3v97Gwzeuvo592MuyVVrRmYqqepjBXbPAuSE8F1WyR4Imm9shvBXvQjv3T9C?=
 =?us-ascii?Q?3060iA8vhcMpuJIMml7S0703hSO/gh2u8UZ3HfbxFpTCMNFIYgjiAC7Svpn+?=
 =?us-ascii?Q?U29nLuugQ7KwReuj3bn+0PVejFyRy46I1PVI7UIsfr0QZjkJhdKYBvx0W5W6?=
 =?us-ascii?Q?RFupGi040u1Jd1ehSJ/YMmZ0F7WqiP+hpiU7o7faXhbC2FdwLaWL9VqbYKv2?=
 =?us-ascii?Q?WBYebgqFCYuXyUcmB8AznzFYSRPA7sY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e215d88-62ae-4e96-50d6-08deba4d47d1
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:03:41.6499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxXlcwQf7jv4sWbamaAHYGdbxDs7wMWWEkPirRmKgQoGubS5HxHjKN0vh48K/SPsqbGOSB37IdoGoTbPQULCWl1mvow3iQTIWh6N7DsOADQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6982
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
	TAGGED_FROM(0.00)[bounces-33070-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 987565C9997
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G3E SoC requires per-module reset control for the audio subsystem.
Add reset controller support to struct rsnd_mod and update rsnd_mod_init()
to accept and handle a reset_control parameter and mirror it in
rsnd_mod_quit().

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7:
 - rsnd_mod_quit(): assert the reset before unpreparing the clock,
   mirroring rsnd_mod_init() which enables the clock before
   deasserting the reset, so the teardown is the exact inverse of
   init (sashiko-bot).
 - Drop the unused <linux/delay.h> include added to core.c
   (sashiko-bot).

v6: No changes

v5: No changes

v4:
 - Add reset_control_assert() in rsnd_mod_quit() for symmetry with
   deassert in rsnd_mod_init().

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/adg.c  |  2 +-
 sound/soc/renesas/rcar/cmd.c  |  2 +-
 sound/soc/renesas/rcar/core.c | 15 ++++++++++++++-
 sound/soc/renesas/rcar/ctu.c  |  2 +-
 sound/soc/renesas/rcar/dma.c  |  4 ++--
 sound/soc/renesas/rcar/dvc.c  |  2 +-
 sound/soc/renesas/rcar/mix.c  |  2 +-
 sound/soc/renesas/rcar/rsnd.h |  3 +++
 sound/soc/renesas/rcar/src.c  |  2 +-
 sound/soc/renesas/rcar/ssi.c  |  2 +-
 sound/soc/renesas/rcar/ssiu.c |  2 +-
 11 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 8641b73d1f77..0105c60a144e 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -780,7 +780,7 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 		return -ENOMEM;
 
 	ret = rsnd_mod_init(priv, &adg->mod, &adg_ops,
-		      NULL, 0, 0);
+		      NULL, NULL, 0, 0);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/renesas/rcar/cmd.c b/sound/soc/renesas/rcar/cmd.c
index 8d9a1e345a22..13beef389797 100644
--- a/sound/soc/renesas/rcar/cmd.c
+++ b/sound/soc/renesas/rcar/cmd.c
@@ -171,7 +171,7 @@ int rsnd_cmd_probe(struct rsnd_priv *priv)
 
 	for_each_rsnd_cmd(cmd, priv, i) {
 		int ret = rsnd_mod_init(priv, rsnd_mod_get(cmd),
-					&rsnd_cmd_ops, NULL,
+					&rsnd_cmd_ops, NULL, NULL,
 					RSND_MOD_CMD, i);
 		if (ret)
 			return ret;
diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 2dc078358612..2038e3079a9a 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -196,18 +196,29 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 		  struct rsnd_mod *mod,
 		  struct rsnd_mod_ops *ops,
 		  struct clk *clk,
+		  struct reset_control *rstc,
 		  enum rsnd_mod_type type,
 		  int id)
 {
-	int ret = clk_prepare(clk);
+	int ret;
 
+	ret = clk_prepare_enable(clk);
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(rstc);
+	if (ret) {
+		clk_disable_unprepare(clk);
+		return ret;
+	}
+
+	clk_disable(clk);
+
 	mod->id		= id;
 	mod->ops	= ops;
 	mod->type	= type;
 	mod->clk	= clk;
+	mod->rstc	= rstc;
 	mod->priv	= priv;
 
 	return 0;
@@ -215,6 +226,8 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 
 void rsnd_mod_quit(struct rsnd_mod *mod)
 {
+	reset_control_assert(mod->rstc);
+	mod->rstc = NULL;
 	clk_unprepare(mod->clk);
 	mod->clk = NULL;
 }
diff --git a/sound/soc/renesas/rcar/ctu.c b/sound/soc/renesas/rcar/ctu.c
index bd4c61f9fb3c..81bba6a1af6e 100644
--- a/sound/soc/renesas/rcar/ctu.c
+++ b/sound/soc/renesas/rcar/ctu.c
@@ -360,7 +360,7 @@ int rsnd_ctu_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ctu), &rsnd_ctu_ops,
-				    clk, RSND_MOD_CTU, i);
+				    clk, NULL, RSND_MOD_CTU, i);
 		if (ret)
 			goto rsnd_ctu_probe_done;
 
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 2035ce06fe4c..68c859897e68 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -803,7 +803,7 @@ static int rsnd_dma_alloc(struct rsnd_dai_stream *io, struct rsnd_mod *mod,
 
 	*dma_mod = rsnd_mod_get(dma);
 
-	ret = rsnd_mod_init(priv, *dma_mod, ops, NULL,
+	ret = rsnd_mod_init(priv, *dma_mod, ops, NULL, NULL,
 			    type, dma_id);
 	if (ret < 0)
 		return ret;
@@ -879,5 +879,5 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	priv->dma = dmac;
 
 	/* dummy mem mod for debug */
-	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, 0, 0);
+	return rsnd_mod_init(NULL, &mem, &mem_ops, NULL, NULL, 0, 0);
 }
diff --git a/sound/soc/renesas/rcar/dvc.c b/sound/soc/renesas/rcar/dvc.c
index 988cbddbc611..bf7146ceb5f6 100644
--- a/sound/soc/renesas/rcar/dvc.c
+++ b/sound/soc/renesas/rcar/dvc.c
@@ -364,7 +364,7 @@ int rsnd_dvc_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(dvc), &rsnd_dvc_ops,
-				    clk, RSND_MOD_DVC, i);
+				    clk, NULL, RSND_MOD_DVC, i);
 		if (ret)
 			goto rsnd_dvc_probe_done;
 
diff --git a/sound/soc/renesas/rcar/mix.c b/sound/soc/renesas/rcar/mix.c
index aea74e703305..566e9b2a488c 100644
--- a/sound/soc/renesas/rcar/mix.c
+++ b/sound/soc/renesas/rcar/mix.c
@@ -328,7 +328,7 @@ int rsnd_mix_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(mix), &rsnd_mix_ops,
-				    clk, RSND_MOD_MIX, i);
+				    clk, NULL, RSND_MOD_MIX, i);
 		if (ret)
 			goto rsnd_mix_probe_done;
 
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 3e666125959b..3d419b31cf40 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -15,6 +15,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 #include <linux/sh_dma.h>
 #include <linux/workqueue.h>
 #include <sound/soc.h>
@@ -353,6 +354,7 @@ struct rsnd_mod {
 	struct rsnd_mod_ops *ops;
 	struct rsnd_priv *priv;
 	struct clk *clk;
+	struct reset_control *rstc;
 	u32 status;
 };
 /*
@@ -420,6 +422,7 @@ int rsnd_mod_init(struct rsnd_priv *priv,
 		  struct rsnd_mod *mod,
 		  struct rsnd_mod_ops *ops,
 		  struct clk *clk,
+		  struct reset_control *rstc,
 		  enum rsnd_mod_type type,
 		  int id);
 void rsnd_mod_quit(struct rsnd_mod *mod);
diff --git a/sound/soc/renesas/rcar/src.c b/sound/soc/renesas/rcar/src.c
index 6a3dbc84f474..8b58cc20e7a8 100644
--- a/sound/soc/renesas/rcar/src.c
+++ b/sound/soc/renesas/rcar/src.c
@@ -766,7 +766,7 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(src),
-				    &rsnd_src_ops, clk, RSND_MOD_SRC, i);
+				    &rsnd_src_ops, clk, NULL, RSND_MOD_SRC, i);
 		if (ret)
 			goto rsnd_src_probe_done;
 
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index 0420041e282c..c06cebb36170 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1225,7 +1225,7 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			ops = &rsnd_ssi_dma_ops;
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssi), ops, clk,
-				    RSND_MOD_SSI, i);
+				    NULL, RSND_MOD_SSI, i);
 		if (ret)
 			goto rsnd_ssi_probe_done;
 
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index 244fb833292a..0cfa84fe5ea8 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -586,7 +586,7 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
 		}
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssiu),
-				    ops, NULL, RSND_MOD_SSIU, i);
+				    ops, NULL, NULL, RSND_MOD_SSIU, i);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1


