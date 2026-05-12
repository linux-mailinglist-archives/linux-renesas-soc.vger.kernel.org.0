Return-Path: <linux-renesas-soc+bounces-32513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIdKDHlyA2q55wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:33:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F0F527C19
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B53B31341B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9B63955D1;
	Tue, 12 May 2026 18:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Hz8+31ax"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF473EDE50;
	Tue, 12 May 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610532; cv=fail; b=rJ7rEWfnrl/I9VHXFKvy3oAaFtIvhcpyZJfWAwvQgHObdQdsBKk9FPXLWlKCdJ5sdSEnm/8wHhI1Guc5jFvqXVwLu2sVVqUl+Q+bd01Gq0Xr4QReav8rd47bG00Igqx0gmna2lm2Gej6e3KJc8OcjMez+O0opxtxR6f4HMmFi2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610532; c=relaxed/simple;
	bh=f0awMTp5QFuM57nRRhtVmyLokj6SZpkdYEqtu/ioSiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IIll7iL7Vz5IXESp5ihA/Px3QrSJ49YegbEBRHSIVrLLOmTYvymCWNk/CBHwLW/NKpi6uZsnSKSU92v9DDKv4/N5VK85MPsFeL/S4QHRdsw2V3LsC3K6o89Fa4fcOu+McTyEalpRMNUJpHY68JLfRLqyIfhE1dTRZmLUwSt9PIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Hz8+31ax; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7e7e22xGbHMUibcnMROAIpG8TEwkB3uXbJVn8snQCzCDjSuq/egZAdCjflbg8tqM3JZkR8cj31e49lB/OJ34aq/R7DqSPAb4a+tmPnUjVJN1M+gD38VWAg7lZOlZ0aLvz5FvIUOrC9FLqUXbqTz4wdZm56IStwilY3GHiWddWq6EoXOqY7KA6j1Waa7OfNsN+clTH5ct3TinrQ9lB52KIcJX1g74Cig0r7u4JRcpPHaV0ojXdwbKvKnV3mk+/luLI7JNqSIs1CiKNkqHweux+FSdXJDgYvWT6cZsS5PmekiEnBFYEk1l7Dxtp8EP79dyS09W4xn/Nr4a82QcVpEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9fqi1VPwIAxGydOGcHDBLZM3mexZU+135MwMdZj2UQ=;
 b=mQInbbTLpwjpuRf7Um9kYqTWdvaxjamtGd8FwWpEtwACNtJKLHoMnMKjLuHJUn/KoLRO1e6ch1eKtAJZ8fFuuZawAf5WKLO3GMXvgo/+SsikgpksANWQZHNa1kjRDBygIspHC9zxLQ/uFFQbpk35m1mCjZ8Zuhwwf1rdKx0Nj8xFNAFSKMFmIDQ4EkH0ngEjOh0/HGfuMnFvyx/y8D7pD4D7u0FEgY8mMpIyaYr6nlOE8xXAdsnPVQr8Mw66Acci1RnJEuUnokkkEL/6lT3VkklSJ+fbOkKTMRsJwW5nOvRWqENQ4vjWHoYdaodpezTAsYyjWchh0zzHOYvVGQk+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9fqi1VPwIAxGydOGcHDBLZM3mexZU+135MwMdZj2UQ=;
 b=Hz8+31axzyqR2F3roetQM7f/zlxjYqGpNM2NlVwpcfUj+X2KlmKk4ONSa0GeFUibcvZg/F1Xxqc+xCUdxI+KG373o7BcTHCgNp8bdyHzLc9X68I9x+ctSZXgx2vK5ihm7NUK1djyU7IyQRQDq1RXiSwc9S56AzvRZr6MEaid5+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB13037.jpnprd01.prod.outlook.com (2603:1096:405:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:28:48 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:28:48 +0000
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
Subject: [PATCH v6 10/16] ASoC: rsnd: Add SSI reset support for RZ/G3E platform
Date: Tue, 12 May 2026 18:26:25 +0000
Message-Id: <20260512182631.3842065-11-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 93b882e7-7fb9-40f5-b0a5-08deb0544efd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Z3mNKxDtbHHC/yo98EQ0d9Gg+J6c4oFl2gy/B2I2tAOTVok8Y/10EWX+uql+hd2qXHD5ZiE8J4mjW1eQg9tm34Wh1V+c8uvUg9FsqyNVWERuHLEHMMz2mWCPZHs4WSUzGnsy1myT/Jn0oCf4jekCaPKgLvlX7Yc53Ab7kQ8WeyktKIXA/ERvhafVzPH5XlSbng8qeUxgDL0o0v6zwZVdYi7wemTyrkXoMhAM+ELvxsXn2MDLVd6lf9IdkqCm5ZmsARbx29haP5wqLrB1Wy8iqp/E8tapE82WM/O0sWAtQBO2j8R1AHTzQw/VbzjBj7Yknf9pYCsFXsUyIg2TrBakjiMjD6XF/BSaDN4ak+hlCgFF6R6Xhs+r8m4yyg+0DYGbldzXLFDnaOhXV+zZnQYx2YL1MVcJSqHPQ4e1phmxu7LproKN6+r0WMXjM/APafmhASjpfmTamMWuwT5F8d+fT2FzmNYYrkvUOzU1qcQ94sZ+mv5UIVFZsYzvUVFUgJvtVFFUK377kXkaZwxMkEIjd6U/4CAoGe5oPlXKWCQzlbEadbrjIkQmjZHuSQvu1EGl501Sh971hcxVZapw3gpWnmM6UKaNvF7WDAUdaaWQ6h1GYcQahMenuV5uGOaT6AGSowgiIjks1wMNzr4VgD8Z5u0TIVgAMQrywb4bWj3PGjGsZXQRkgkSWiGWEJvw/CngMvc4RyIREZo7XqGUTPAhJS+uN8aPHcdggENldj1PnLUAXyXRnUruPOHVL0yUm8Sq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nQiHHwX5o5DqSd0ghR7HU9TAStimBWabbfUyAHeri+tL7i/SCsBJrFR8yxDs?=
 =?us-ascii?Q?tvaNMZuGLgHsip1nQAKcwM+Ytvogl8dklOYHlFJi+kCSI33Tl/GeF6/S1ASv?=
 =?us-ascii?Q?agHZkGSHHMecQUfbuXrc78FMbzvKCmAfJ5smqSkPDuM7jU4NW6IInExW8kmA?=
 =?us-ascii?Q?FV5HBB4R16/Vz30Isx40q9iqhE3wCN/i2zitv4v30pSXJolhWjmiS0X9Xzuy?=
 =?us-ascii?Q?OKNPe5lVUhg4wKJYQnHSHeLIr29hqLWq4JKMkaqBtO3VhtiOuI+OJPFZarZ/?=
 =?us-ascii?Q?7Go8K3YKJakk6xhD0ghysH2S76nR/HnBPFAGUjyJfh4yXaZvY+qmxWeDrfj6?=
 =?us-ascii?Q?EaQsKf+UWQ9mY+3x05ZgsP/T5Lad5877o8gS71FF/VkWL/E0DuhFxxLn1IX2?=
 =?us-ascii?Q?2+dxYEoK30f121udF8AfvmynLXgs7gPYpdguEPlcfvE+N9U9uzRURRohDj3H?=
 =?us-ascii?Q?sn1IQsiVeTJtfln2B0TPyjbSh9AyY8t9nk1JWfSMFoxvqMefKDkBKjZxgzdt?=
 =?us-ascii?Q?Nypi6VpEX0M5FWO5r8v4XNctosQzTEshWgULt2+/WwKI8AOjaQKHGzdU9ebo?=
 =?us-ascii?Q?8zeniqQG3L5mYvVe4XPD8a6iYcJXst4w48gIQ3duS2jIG+nQzOdaOFXvXGEh?=
 =?us-ascii?Q?TTO+5EYtPLY92p7sV2IRMGJyKd9fMIfkoCYTc3wZlJ2m56MC6rgX6PSG2U+7?=
 =?us-ascii?Q?V6aj1esCep1J51pe891ZVCnFKLhKZSHJGMQUzAaLaarn731XXIMM2Ybxxi0I?=
 =?us-ascii?Q?TQ0oUu2TFK8Z8FD4JgWTXqagkv/HIabhRh/NgAKDG8w9IKnzWt6Is/n4Ae0H?=
 =?us-ascii?Q?vguz8gr9m+llOi0YxKHQbkbzEMmNXn7qgMH51HudC7DJK1MN68fip4+S2Est?=
 =?us-ascii?Q?mjCModalEtI3Jk0PsfO3+MRy3toor5jc0D1RxSw3636e5/6IHfsnyYWazfIK?=
 =?us-ascii?Q?A9rCgfpR4DNhsAtjoNaR5m7Xu7Wxrh2ZD1nFLbAqxKzQPsQwmo3LMVa1ufHw?=
 =?us-ascii?Q?qByDmXrzSxM6CAb81iwaAiwRJhm6ZtP4F9n87A+NWhcxN9W6d3k7fXs4Xi6I?=
 =?us-ascii?Q?IStToGC++UOm4zZam6lBX2asFk0RQcoT7T5jSNBL/9qmIYg+7SmWwzFyy9Q0?=
 =?us-ascii?Q?hwNRZ3uzyy7EVWXXYVhJX0LRAV9G/E6LcBne9aJDwuZq3rNZ03WTKbaM6f6U?=
 =?us-ascii?Q?TDf22gTI0lhqn+VM052SsAjv552E/HDwGkqoD4c74qU/97V7NUun6wzmN0Ud?=
 =?us-ascii?Q?FheqDHslDNfAE2IqYtXQmqULR1GL/BVKFjmaLkO3TpI/FMvlk8x5Wc92FXZw?=
 =?us-ascii?Q?2uV81mjtF6cV4OXTk04nTI2BWyQJmf8T2/z3Y0uDhuFFrgcko4dJMuL26TMS?=
 =?us-ascii?Q?pQhFvrWoAj6GzIeR0xPB4orYcEt7InIsUYMC4Lxb9b13C29RKL/Hk3clXwEb?=
 =?us-ascii?Q?mWAg+Evr0Aykh0jW9gPJIxkgcn4YxWW2np/Kl1fMLsPBUtr6kQGYl4L43yPs?=
 =?us-ascii?Q?LVixSRokgEnYobQgKcucErO2+cyXnG2oHYyrij4q9vkNR8XoLHfQ20d873hJ?=
 =?us-ascii?Q?V6OPhrPLfXzPshcmYTcHHDwFLUuQKD0CwgC1z3PzpZDI5S3pyRose3pzh/sb?=
 =?us-ascii?Q?x5EQ7uaOs7JdZVIOKUCfXyn+HgMS2bkiW3wBWuTTiexqEMEqLUH4OoDWhYDl?=
 =?us-ascii?Q?wnZCCggSnZD4QRpF2U/HQm7bXTJ2HIqkljqvAAJT5KB4NDsBaZab4gNADemC?=
 =?us-ascii?Q?LfVGs+V4ib5pWhIdiSXFD97T7FPX/Y4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b882e7-7fb9-40f5-b0a5-08deb0544efd
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:28:48.5345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yi6ILIku1l69LoAVBnMP4IHfb1gVjhoE1mLKYynbzIxU5r+ZNkkQzHAa/WiDTItmyM53YkMbC9xLTKHo2At5w+hCuF+6QTH+a8qyns1lLB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13037
X-Rspamd-Queue-Id: 66F0F527C19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32513-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

Add SSI reset support for the Renesas RZ/G3E SoC, which differs from
earlier generations in several ways:

 - The SSI block always operates in BUSIF mode; RZ/G3E does not
   implement the SSITDR/SSIRDR registers used by R-Car Gen2/Gen3/Gen4
   for direct SSI DMA. Consequently, for the RZ/G3E, all audio data
   must pass through BUSIF. PIO mode remains available for R-Car
   Gen2/Gen3/Gen4 platforms.
 - Each SSI instance has its own reset line, exposed using per-SSI
   names such as "ssi-0", "ssi-1", etc., rather than a single shared
   reset.

To support these differences, rsnd_ssi_use_busif() always returns 1
on RZ/G3E, ensuring that the driver consistently selects the BUSIF
DMA path. While at it, acquire the per-SSI reset controller through
the indexed-name helper added earlier in the series, so the same code
accepts both the hyphenated RZ/G3E names and the legacy dotted names
used by R-Car.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6:
 - Acquire the per-SSI reset through the new
   rsnd_devm_reset_control_get_optional_indexed() helper from
   patch 04/16, so the same code accepts both the hyphenated
   RZ/G3E names ("ssi-0") and the legacy dotted names ("ssi.0").
 - Rewrite the commit message accordingly.

v5: No changes

v4:
 - Clarify in commit message that PIO mode remains available on
   R-Car Gen2/Gen3/Gen4 platforms.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/ssi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index cf98cc9ee44c..e6734671328c 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1157,6 +1157,7 @@ int __rsnd_ssi_is_pin_sharing(struct rsnd_mod *mod)
 
 int rsnd_ssi_probe(struct rsnd_priv *priv)
 {
+	struct reset_control *rstc;
 	struct device_node *node;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_mod_ops *ops;
@@ -1202,6 +1203,17 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			goto rsnd_ssi_probe_done;
 		}
 
+		/*
+		 * RZ/G3E uses per-SSI reset controllers.
+		 * R-Car platforms typically don't have SSI reset controls.
+		 */
+		rstc = rsnd_devm_reset_control_get_optional_indexed(dev,
+								    SSI_NAME, i);
+		if (IS_ERR(rstc)) {
+			ret = PTR_ERR(rstc);
+			goto rsnd_ssi_probe_done;
+		}
+
 		if (of_property_read_bool(np, "shared-pin"))
 			rsnd_flags_set(ssi, RSND_SSI_CLK_PIN_SHARE);
 
@@ -1220,7 +1232,7 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 			ops = &rsnd_ssi_dma_ops;
 
 		ret = rsnd_mod_init(priv, rsnd_mod_get(ssi), ops, clk,
-				    NULL, RSND_MOD_SSI, i);
+				    rstc, RSND_MOD_SSI, i);
 		if (ret)
 			goto rsnd_ssi_probe_done;
 
-- 
2.25.1


