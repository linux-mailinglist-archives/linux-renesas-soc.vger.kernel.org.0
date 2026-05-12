Return-Path: <linux-renesas-soc+bounces-32510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEWQMztyA2q55wEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:32:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DBD527BA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92ECB3110B75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9FA388397;
	Tue, 12 May 2026 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sXafZEwZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09E385D65;
	Tue, 12 May 2026 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610512; cv=fail; b=SI8iaSMSKNzkVE6tffsz4UZEzl4lV6Y4xvzKxmJj3PdWq55OFP59JCkJn8k0FVKCCrH/WwXsBa+cJK2NocsbyIb69ZFmz/YNF9+LYRDZiw6I0jExhYjwboJLBdFobRxL2kN+RZ+r0jMetfA9W8YKjVZiCfJBiJDPtewLRPHchzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610512; c=relaxed/simple;
	bh=PkO4EEANEVsyCNndklNihzDWGUoSeKjBB69a+KZv+YE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PYyssThVssxKDDIu2tRe9n0Yn6UC1a+jwGixLpS3LsSFLjigddTHfb71i7B6IVTouEI7AW3MTuqrV/Tq4VksrhFadh8Nnvov0oQTcMJownqQWKeX3gSiWSURbK5W7u6EOOy+r0MXPsAViB+BbYep7sQMKlp6fX1+IM03J0TVhqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sXafZEwZ; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXBAssfEH8vMqa4YEeC+o3Z3caAJbLoh5JwcnZ2n3ebhYp0opr8ihcnoxlXQCLnBLCuI8lqMTTJPAy8le+8IMUwiUxe4718ullq62FlY63Ef4Ti5ncUPVCZ/qv1SqCIPzhPOOzHZavTh0Th7C0Aeagx0fs6yG0QuImTkpkWiocQeo8j0VmgxqfqIe3G8DaaR9XAusBagnzEeg6dlm5Pfdz2/szjpklie9th98lNtdWO8vMvK2aoIy1RxSCQW55Ws0tEEgdSTAK8PikNZwKpaG/9UCk1XnlSKWvNWS7IZPl4QT7ir64SRWoFKI+ot0X2hjFcW69BcNsklZgU179THuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1+p+alrUgxPMH6iQAP/P9UULHvXjhSiCZ9ES3jl5b4=;
 b=KI6s2IfrkjRkkpzT+/2BPPLC9J5ofKg28SEowhQ9C5Blam3PcuFYnPF3LFb98uK0xCK/+ClWtRMFao0JOLpzpU/XNeoB18LCDY00IpJrWvvPUWqEHoQtiUjc3kpDfLr8uiKAiYKDF4+7nzFvoYDmifvUZeZQBGPCnxemqMEsPy1zeIBUJMZt26CgBcquBufFmY2PkRKuZd9ZvLIoN70EEd8C0/yFKAc5md6UlPTQXHJgeOVT/9mnrSz2YNulEdRdK4Omm4UdpuZHsPQHaTH/miblp/YFh66kdAsnLVUxdX+ZMnZ3Dz8dRVzQRJHE1XN34Smj9iF7m+mzkSpGHd/hvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1+p+alrUgxPMH6iQAP/P9UULHvXjhSiCZ9ES3jl5b4=;
 b=sXafZEwZhULowGmyMOIBVato2pqrOC68y6x/nnLEBVJPIiY/IiwUKeVrmzjzsXnIlKBeczCva8Mb/XIe47IVKBTogqqKp0pIbD5ayvYEy/fhyBLsGHRlnWGBiwQSh6+s/rWqRE8FJuSvEGDWbXTDBduEWVV2NkMHYu+MnEeNwI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYWPR01MB8431.jpnprd01.prod.outlook.com (2603:1096:400:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 18:28:29 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:28:29 +0000
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
Subject: [PATCH v6 07/16] ASoC: rsnd: Refactor DMA address tables with named structs
Date: Tue, 12 May 2026 18:26:22 +0000
Message-Id: <20260512182631.3842065-8-john.madieu.xa@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TYWPR01MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: f67ca636-3bb5-4f37-c721-08deb054436e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|18002099003|22082099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	DFaiXrGvMp4bW1VFm711YGK8f6ko6Xl/wsNqNdUyH9YSYmIA9qsHyCsoIoGkw7TfakDx26Tl+yvRVx5PuF/78ETFaaFxR8GPcbNO7viRiOTvWE4/B8BbmSOVnCkpYPaZbD89207Ro6n7EIiMBIF4ki0iSqEDT+JKvdX+xdaFp81CfbbQVCuSTa94/K0ljNazN33Ubl4AAtVptoIb8yEg/lbmR25aRHxv5OZufbWXRP4CqL5iZR+eht7ZtOGiKv/SG6mPf5ZtwesljFXGjBoYAUMfRwXTuUcSjHZaWOE+pPKWxdRVQapvp/TiBXq8ngM8H+kon5jTbIN6Q3/4V43xp9LdPq4mOjlfM0bwEk5YT/LKHWLsbSAVa6DySeDc1BlXqKxUfDn8LdKqF5g0kyVGV4ZXp5Cs0L/mrsezXtdDJtKmua6xstunG1tnE22phwLhI9VpTbQiQGJh3o1k3BxUFnsgoAuLTqraa4NQJQPNe/GXqNtkRZjZHeklKuOSEKdWFytgmyTa+Eg9MBhS4yf/JpQAHXDMW76iU+94ZibcMFoHxaTdTvM7uZaYUs1LJNWlRxG6Ui/TNnfSR68HXpR13qMxIWBASkRmMOf6EcXvDEQaK5e98zHZpzlXGR+2WeYgsr8M6Vbug+tXHoRX8aB1x0Nl6ZiRTCLMTCYQ4f0Z+o+eKHO0Ckm9w9w1xtgKx2AMoaVIlFfpn+rcfgwv8PiZb2YYK7kDowOiEHHcv5dXtTELHmt+N6ulENrxkOXABzjV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cWkpzL0irw9fJ086/NrBjXW4J7hwJYk/b1JCkAvAhotXkxU7Nyg+igttCa+X?=
 =?us-ascii?Q?BJ/Q5aZOaGjQQg5rRtKzepm/fb/VjmpoZtRgd1PFylOEs8rTXGMYtTNkFGZ0?=
 =?us-ascii?Q?qKT0xNonbOrkJpN8U26AE1owiVSk375In6ZTDl2eTqNti04+5LWblasQRQyA?=
 =?us-ascii?Q?dNYD2KfvE4idOr+RAJQIsz+6FNhhaqqdMg0ipnA6Mu22+tRUw6tAfQV1GHZM?=
 =?us-ascii?Q?qZNe8VXRGRzK5wC14GfHBdYYuwWzi5kI36oGpCT/Y0pD8gkNYYWWfpoAFGrA?=
 =?us-ascii?Q?srmuD9DlinOup1NjeSLK7qxKjoD3tZ6duY+ngEE4wWvCCxJYR5aQ+tN3+kLo?=
 =?us-ascii?Q?LbUav+58jFocFOE/J+Wfv5klvY8dWLUmHJEaOfBqEaAff4rgBsoiZdDB6wN5?=
 =?us-ascii?Q?WHjv7IfUc5NZW1KGEtuE5ACedCnWjmVhIWGs8PDkNWbKe0RgErTBoXKn8Bdn?=
 =?us-ascii?Q?GHqhfbszlcn3zZfJtLErxduKV13VzifVhJZEguYbL2LLxWLMN2oIb9mcivKJ?=
 =?us-ascii?Q?fh0zgQMZqtofByF7BzIHmkUm9RKDu9ldWxNrJ+bRpDJpdLRluaA6oIThNs++?=
 =?us-ascii?Q?RlU0gkz0sauktKaTa01qVRPPZgjvN6V7OjbkygzVcSA83aTnBxKZGLO4bANG?=
 =?us-ascii?Q?5wJ/7M3AviOvnrnzm2gZ/kbUFfIhUrI1BdjPU0UiHC4aFP0ZRBRlcRh0C/aF?=
 =?us-ascii?Q?FpanhjeYEFnvNp7gp218EcTPiQ8EOgWqnZALWpc5/CK6cws2NKotutwmdM8d?=
 =?us-ascii?Q?G3rhosbfCr7VXQSMPukmUy6+6bCGc71zh4nn5HkkC22lKHrEDnvIhSNJ4gzT?=
 =?us-ascii?Q?e3uVMP2W9B+tC4oKY/XpE9CEG0+vqnp4uYUWmiZWzxaU0+uktoOv/GTdG0hv?=
 =?us-ascii?Q?8kJV0e3DnD7JK2dY9lrWVYcazMX/ZEPHkO5Av7Hq8gYUCr2UmlwfYSM5S+oI?=
 =?us-ascii?Q?M/e9Hh5n0pwhsFiACPF5LE3w2CxIiL6Mbgzbj9CHe113QAnzFfWc63ZL7VuE?=
 =?us-ascii?Q?hzXWYsbVs6pkOCPS06pqOylTECLe/0iy3NpKk3bmzOE30ubAHyTcrRiwlmY4?=
 =?us-ascii?Q?rqCcwvPNiZDMYWek/WtPtwIpnIbdQeHm8KRyOWYO8riJdyVjzPRrdjBSsqKs?=
 =?us-ascii?Q?UEVG05YWNVp9X2kRJ9vYY000XUI88nm3T9lD+tiIBc9k+vgj3WzDi6wuXQNR?=
 =?us-ascii?Q?FyaQ9qusnqcmKNlCayABO1rZlmt3NAksV1jTS7/sqhKaftvfVEoHMeyA+oKG?=
 =?us-ascii?Q?ib0StizXbdTpZkhiql30erM9P+PsI18NVDrJurPba0zAR7aW9e3WDsuXxhOc?=
 =?us-ascii?Q?7CQ4HvZXscgIY4dMPqb1t2DyjOxZj6LilACv9qMVkMN8st+2/yc4vccnntOB?=
 =?us-ascii?Q?ilSMJyrJ/af/wHsGx21ng0tqrg1OjH4YcrqomTR4eO+D46H2aiSW1paXJuVO?=
 =?us-ascii?Q?plJWO2OpRGwCeY5aQ8HLicWnFh11XXFCCLVBo7LIB+y+cG1N/lli9Tpf4HGO?=
 =?us-ascii?Q?6hHhVf/opc4GJlc0O9GZbC1vkGi/upvPWgN+NGcEe3Os1kbVY5BagQNb9V4+?=
 =?us-ascii?Q?USUSsKwRck/WXbW0LrFvkOkGUlBULGpWjLYGTepK0/Iiv7K0m8x1C8OUD0gP?=
 =?us-ascii?Q?6BVoa5CvpRQoGwcuhwo9ejWUc2jmwTUR3hJO3g9kH00Vz/1gf57XhrHwXNRg?=
 =?us-ascii?Q?axPXWY6cp+o8WQV30xrFhxRPakhcsZJZj2K6p3ncB4bfWl4z+RBMxAqVS3zP?=
 =?us-ascii?Q?hqKA4R7AuVGaSliUL2Jk0yNtyeDvbUs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67ca636-3bb5-4f37-c721-08deb054436e
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:28:29.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDSqtNGIoeRepeYSIHVFSe7XeTXvNtpU9x38+7/BQP4/+TWIh3tvR6qqCHYJLNzH8tgwTp9/SYBGiGZ1KqLCvErt89Ky80nsb0lc0P/kqpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8431
X-Rspamd-Queue-Id: 87DBD527BA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32510-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action

Replace the raw multi-dimensional array used for DMA address lookup in
rsnd_gen2_dma_addr() with properly named structs: rsnd_dma_addr (in/out
pair), rsnd_dma_addr_dir (capture/playback arrays), and
rsnd_dma_addr_map (src/ssi/ssiu module sets).

While at it, extract the common lookup logic (is_ssi / use_src / use_cmd
evaluation and table indexing) into a shared rsnd_dma_addr_lookup()
function.

No functional change. This is a preparatory refactor for upcoming RZ/G3E
support which will add its own DMA address map using the same struct and
lookup function.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes

v5:
 - New patch, extracted from v4 patch 06/12 as a standalone
   preparatory refactor per Kuninori's request.
 - No RZ/G3E content; purely the struct introduction and
   rsnd_gen2 conversion.

 sound/soc/renesas/rcar/dma.c | 147 +++++++++++++++++++++++------------
 1 file changed, 99 insertions(+), 48 deletions(-)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 71774dae8847..24c23cb89390 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -481,6 +481,69 @@ static struct rsnd_mod_ops rsnd_dmapp_ops = {
 	DEBUG_INFO
 };
 
+struct rsnd_dma_addr {
+	dma_addr_t out_addr;
+	dma_addr_t in_addr;
+};
+
+struct rsnd_dma_addr_dir {
+	struct rsnd_dma_addr capture[3];
+	struct rsnd_dma_addr playback[3];
+};
+
+struct rsnd_dma_addr_map {
+	struct rsnd_dma_addr_dir src;
+	struct rsnd_dma_addr_dir ssi;
+	struct rsnd_dma_addr_dir ssiu;
+};
+
+static dma_addr_t
+rsnd_dma_addr_lookup(struct rsnd_dai_stream *io,
+		     struct rsnd_mod *mod,
+		     struct rsnd_priv *priv,
+		     const struct rsnd_dma_addr_map *map,
+		     int is_play, int is_from)
+{
+	struct device *dev = rsnd_priv_to_dev(priv);
+	int is_ssi = !!(rsnd_io_to_mod_ssi(io) == mod) ||
+		     !!(rsnd_io_to_mod_ssiu(io) == mod);
+	int use_src = !!rsnd_io_to_mod_src(io);
+	int use_cmd = !!rsnd_io_to_mod_dvc(io) ||
+		      !!rsnd_io_to_mod_mix(io) ||
+		      !!rsnd_io_to_mod_ctu(io);
+	int id = rsnd_mod_id(mod);
+	const struct rsnd_dma_addr_dir *dir;
+	const struct rsnd_dma_addr *addr;
+
+	/* it shouldn't happen */
+	if (use_cmd && !use_src)
+		dev_err(dev, "DVC is selected without SRC\n");
+
+	/* use SSIU or SSI? */
+	if (is_ssi && rsnd_ssi_use_busif(io))
+		is_ssi++;
+
+	dev_dbg(dev, "dma%d addr : is_ssi=%d use_src=%d use_cmd=%d\n",
+		id, is_ssi, use_src, use_cmd);
+
+	switch (is_ssi) {
+	case 2:
+		dir = &map->ssiu;
+		break;
+	case 1:
+		dir = &map->ssi;
+		break;
+	default:
+		dir = &map->src;
+		break;
+	}
+
+	addr = is_play ? &dir->playback[use_src + use_cmd]
+		       : &dir->capture[use_src + use_cmd];
+
+	return is_from ? addr->out_addr : addr->in_addr;
+}
+
 /*
  *		Common DMAC Interface
  */
@@ -527,47 +590,45 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 	struct device *dev = rsnd_priv_to_dev(priv);
 	phys_addr_t ssi_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
 	phys_addr_t src_reg = rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
-	int is_ssi = !!(rsnd_io_to_mod_ssi(io) == mod) ||
-		     !!(rsnd_io_to_mod_ssiu(io) == mod);
-	int use_src = !!rsnd_io_to_mod_src(io);
-	int use_cmd = !!rsnd_io_to_mod_dvc(io) ||
-		      !!rsnd_io_to_mod_mix(io) ||
-		      !!rsnd_io_to_mod_ctu(io);
 	int id = rsnd_mod_id(mod);
 	int busif = rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io));
-	struct dma_addr {
-		dma_addr_t out_addr;
-		dma_addr_t in_addr;
-	} dma_addrs[3][2][3] = {
-		/* SRC */
-		/* Capture */
-		{{{ 0,				0 },
-		  { RDMA_SRC_O_N(src, id),	RDMA_SRC_I_P(src, id) },
-		  { RDMA_CMD_O_N(src, id),	RDMA_SRC_I_P(src, id) } },
-		 /* Playback */
-		 {{ 0,				0, },
-		  { RDMA_SRC_O_P(src, id),	RDMA_SRC_I_N(src, id) },
-		  { RDMA_CMD_O_P(src, id),	RDMA_SRC_I_N(src, id) } }
+	const struct rsnd_dma_addr_map map = {
+		.src = {
+			.capture = {
+				{ 0,				0 },
+				{ RDMA_SRC_O_N(src, id),	RDMA_SRC_I_P(src, id) },
+				{ RDMA_CMD_O_N(src, id),	RDMA_SRC_I_P(src, id) },
+			},
+			.playback = {
+				{ 0,				0 },
+				{ RDMA_SRC_O_P(src, id),	RDMA_SRC_I_N(src, id) },
+				{ RDMA_CMD_O_P(src, id),	RDMA_SRC_I_N(src, id) },
+			},
+		},
+		.ssi = {
+			.capture = {
+				{ RDMA_SSI_O_N(ssi, id),		0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,			RDMA_SSI_I_N(ssi, id) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+			},
 		},
-		/* SSI */
-		/* Capture */
-		{{{ RDMA_SSI_O_N(ssi, id),		0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 } },
-		 /* Playback */
-		 {{ 0,			RDMA_SSI_I_N(ssi, id) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) } }
+		.ssiu = {
+			.capture = {
+				{ RDMA_SSIU_O_N(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+				{ RDMA_SSIU_O_P(ssi, id, busif),	0 },
+			},
+			.playback = {
+				{ 0,			RDMA_SSIU_I_N(ssi, id, busif) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+				{ 0,			RDMA_SSIU_I_P(ssi, id, busif) },
+			},
 		},
-		/* SSIU */
-		/* Capture */
-		{{{ RDMA_SSIU_O_N(ssi, id, busif),	0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 },
-		  { RDMA_SSIU_O_P(ssi, id, busif),	0 } },
-		 /* Playback */
-		 {{ 0,			RDMA_SSIU_I_N(ssi, id, busif) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) },
-		  { 0,			RDMA_SSIU_I_P(ssi, id, busif) } } },
 	};
 
 	/*
@@ -580,17 +641,7 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
 		dev_err(dev, "This driver doesn't support SSI%d-%d, so far",
 			id, busif);
 
-	/* it shouldn't happen */
-	if (use_cmd && !use_src)
-		dev_err(dev, "DVC is selected without SRC\n");
-
-	/* use SSIU or SSI ? */
-	if (is_ssi && rsnd_ssi_use_busif(io))
-		is_ssi++;
-
-	return (is_from) ?
-		dma_addrs[is_ssi][is_play][use_src + use_cmd].out_addr :
-		dma_addrs[is_ssi][is_play][use_src + use_cmd].in_addr;
+	return rsnd_dma_addr_lookup(io, mod, priv, &map, is_play, is_from);
 }
 
 /*
-- 
2.25.1


