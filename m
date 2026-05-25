Return-Path: <linux-renesas-soc+bounces-33067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNtsDogsFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:03:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFCF5C9908
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E535C300678C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EF03563E8;
	Mon, 25 May 2026 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CimYb/nb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292B7305664;
	Mon, 25 May 2026 11:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707005; cv=fail; b=L8+EBkT3qSy6czzSqlPGTn6zOU4EcLd04UoHUifh15bQrSkuiATGSDUaINRPr68w+oiSd5ZhPx0Y7Y1UNLhWwI5lcz+Q8TqNU8IzxOpU3GDs8fPa+2R0cfORN6/zZFjLEtUP5Iig7Z9yA+/OuWfF6P3P8fpUPspgxPLvCPF6RT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707005; c=relaxed/simple;
	bh=8S/j4MdUYe5SxzK+txD2I2OxjHLfb1sNXRgu0sWuMGE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L2iWtFdDj5nuBac4CeekTwR1uhi6mD3Ui5S7DUYuYqDF0yMEGg2ao2PXLU7o1z6ukwGKYgWqI0xL/cUoghcKSEjQKcSZk/Zl0p+epgGdhRaKUZXtAJ0eBM77pPpg/D7x0/FXDgC/hOBLP5tb8WUF8SZTmJjR82VEaxHfWfCl7eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CimYb/nb; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjRcOiF0Lf1NVTcF61AUvXVQIgKCws2qEBStIxFKjYQ6zuH+omeXunfR4G6/yIEyb8SzIExbVquKrfqZPHHSan52P7hV9DH5cF8wFm7uUiiY2mZ+Vl6TUgx1q1HxoCWdDR0RjfybSl3palRPUPQOn7s1/siyQcxUALrWBuxQ00AujG7ZV1qJCkjJpdm2oeWslxf6fyVC0etkRe3LOwzZK+U2MYqY3yQH1V7I/b7Yp9t5CRgJ9C3tGeQXYPrDjjdy0b8nWQcKobcEHcjVCsUgMpY6r/LKo0xuXAQdZJnP4Zm44VxpY2ZQRBwqfGFVwo1LCquF4jDRYGgQWE4kKHCQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EFCZ6JIO6g8sG4wZ4SCSnOHpOlRvPcFPmjFpV5lCGI=;
 b=cZAuH6pRpc7axCLKXKvsS5I9Dmos9dfH38dXRJQ0ImhhZVlZeRS560AqgDsJx6JaEdTWyQFDi3LKhjWExeBomJq4i2HWBnzUVNXRHnvT+GtRR/+dp/lA7bbDmtVT/ZKuLmxq2gAVaMCcXspA1MrkRmWDN2Xy1Sm8Kpl8pDoMV30J9NFoNQrIrA6xMgCyCvNfpPbtZN6EQqZsXgH4v1ha3Qf15FdpQBqmbvoTOeVluLidPe48A/8haG8St/fAMkLQuz4sUO05zUGGsO8L17+nO127UKOctS+I+jz0LLEmhI7Hg6uNkt55gM7cTNBmHcip6MIzWRbDirAKwThveR9QXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EFCZ6JIO6g8sG4wZ4SCSnOHpOlRvPcFPmjFpV5lCGI=;
 b=CimYb/nb7EJVmPy2PNSCrmFsTc4KWEF0QUEbaFAKsqvf+qYH1r10Qb4iFsV/0G6DgiDVBTazWPT6uB8UfmcGP9xLJ6EnYWMQaERORcvLD4nB5pFgdDpQx6zSQJh8qLPBMxa15/w4rtJPmp55TOpMAjzOESLlmzJQWL6+SOfyH20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 11:03:20 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:03:20 +0000
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
Subject: [PATCH v7 00/18] ASoC: rsnd: Add RZ/G3E audio driver support
Date: Mon, 25 May 2026 11:02:12 +0000
Message-Id: <20260525110230.4014435-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 1615bd2a-7bdb-43dc-f215-08deba4d3b1e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|6133799003|18002099003|3023799007|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	ci5feQO1duZB/STVEpJ7YiZZvQ91AnUb38CK42dAXK6x12YwQE9tCMx7od7tRBttohQ/zA5Zmknq5K9E5UL+F/6yj3MYuhA5aHGwOOEubuKJDBfPkWMkYyeKJqAvaB+S+9FPKbM6RuY+nyVgwnp4ewP9KnLy4UTmPR+PZrUMYQQCWdKxDPlpNPbEdrugDin2K/nbko252z++r1b4KZgYrPG/JNjnDo8iaOgjgGUccHCeuiesrpaa8U506ofOXd4qGH0kE4+QpKD/xOwefeHLRa15d0wD1D+DacgYGECAgk0s0znjOBbf9TzQdooZDZ+bQCOga/52wZgTLYrlxc+8D3HbDAuCcQWTZQEjPmHByTmZv7tXdRHLbCm94sMPzZHAS6svluBe2VUsNrmn9t8aWm1TF6zA9Yupl+H7x8LjCEl1MEWazAr31mlLNpuPuXnhjASDdIVVGDQRTVNwPVwRGSJLi0bbWhwjUFcnJSmQlfG5N2FS4iKKZ1s/3YqBz1uNwkzm//B0fgtBFeQY8qfartJNPPDrXKxjdqJxel9zjtLZ9GDKAp67KWS1Jf7nXzpfHcccRGyO6tvsaGYL7UT0hPdxDEkQW8djgmsDXZq0EM8XPU+cpgyFMu7pTgDzaL+RzcK2t0IoVGpG6Rq0viMIrxv45jLjuXgyrN1T+WjjfePZ9UbWiE3tMbEnsG3yprdvjGSl3o7JIhFUOLe7vFUlzWbkNhhG013xBJDtloz+eCj9JxzshrnYfObcV2qX+1Np
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(6133799003)(18002099003)(3023799007)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vqni7vVabVsxtt8l9iKvg0+jYho1HNmpiOtuk9HyMItwgHSghKmQXnvG4XAV?=
 =?us-ascii?Q?S0GC3RhvTpyz3JbE81jH779wB90pyihQ0cXmbEdBbHEJ63UV9nOajm8YxBmF?=
 =?us-ascii?Q?Z/39iEtTzrutvxyOyJTzzon7z67r4a4JNDZp3k3Z1bdFqyYyC5N9FppEINbK?=
 =?us-ascii?Q?lQDTGpZUH2G8TZDdyzB0T4zco6egrOFgjsmlWP0rFPRm6wdbPz8Vm7Ns/tGo?=
 =?us-ascii?Q?f50gkUBHmO+06esditFASXcXBD/WCtnXSlDiK2637xg9NBmBHIgQGfRKAYOT?=
 =?us-ascii?Q?XeJMC9MHqyX0io0JN7jij4x7827jMQJBInC0T1XTiwZEO2Wu2O8nc+6LKbI2?=
 =?us-ascii?Q?lIm/JNY9nUgLgm6FyEw5RVz0HK17ziGjGiJDkeg4SBLQy0t182VPlANvXcQA?=
 =?us-ascii?Q?5KDcQLWO67ucxSrM47KQFsWp9FxHJf+tCgzp6WEp06ZPKvLHPDNvgO9z4Sru?=
 =?us-ascii?Q?lAD4WPGr9JuGc11EhOU2+E7aYJROZMboVyxk8FCQXLEQBrjt7s532pj9lm6l?=
 =?us-ascii?Q?d82WateoNjkZrHXzJpjKwuzRHl69pqe4rd9SW8z/p5j903BSUQ4PzDUk7PuQ?=
 =?us-ascii?Q?lNtkP/mLgroEILxuLkDWCaApZ1WVaq4oNL8ekY9oeD5NAtcC7XPG2v34W99h?=
 =?us-ascii?Q?hIzLu1sQb1aNsfrC8Cwd736qmWdMZUGNkcfIm81h4Xk7LCIL8bx2jqnBs6Gq?=
 =?us-ascii?Q?vm8k1nl3355/iEiPMx5jid78S9Z9Qid0ytnVo0wOLkXB121EiqnzkLo2isqM?=
 =?us-ascii?Q?8lJtPmnlh3lpS/erPZa/5m5THR/ilmIKMpjnI6Q5PalGh3zqPYu8ySgmego+?=
 =?us-ascii?Q?Euoh2kL2IrGlnAWR8gu9dverkiFJzqO4GUhP3YhXI21EzKehsN5TOvvqX6U8?=
 =?us-ascii?Q?VhnyyeY3ZOm8+yldVqr4ShTTBqcg5yc2H+prviqsiDiaoSy7AgaqCY90UxsC?=
 =?us-ascii?Q?4hd1g2zezDewDorP9ZIhth1WS5QdZ4qyqgqvYxgIxZ8fp7oGA8ox6+4EgD/U?=
 =?us-ascii?Q?ofaheh4v3hK+yfXhLo8rnKUcK57X9XJq9MaX+U+1aJPmqu/2taDW6YB2L81O?=
 =?us-ascii?Q?xfxnA/+dz93ErHjoz8RYma1p7+Dh8VUUoq7iibNsabYUvM2lAza0/WXHP/oH?=
 =?us-ascii?Q?3NqvJq+3aJFymUQkkSm31NKYxgxW2VG9i8jhnzJhkY/p2hYGaOQxrlYWn2cN?=
 =?us-ascii?Q?FSfDxR31TuNRU/wtV6dnoblAp8bL97qk2yTyn1/dPnsDpL6YBUiIl5RM79JY?=
 =?us-ascii?Q?yRggpUqJj2BORVwwXz2em1seJX9p1teho0m24opMSKbFdd5jD3HI1J2HFyPS?=
 =?us-ascii?Q?CBVHxwuoobG4mA4A1gFzOjmHLJz+Bfe4dm/tPDPKDo1ifivPE1xTSlfJV19v?=
 =?us-ascii?Q?hr2/SNi4yKMPzVeUAkFGhl2kp0WJtnoTZWrBxc3vFZ/k0Ga2PizhGB6M8S6k?=
 =?us-ascii?Q?EK18hE7r9BiFhO2LZ1ZSLfHIM/Vw2iDQhNbhtaJZROMv7DVaJyRoCYiuMDz6?=
 =?us-ascii?Q?qc7WBYSOBBlQwCF/OXU/W3vzsHRv55yE3oxTdDrXn3pmgYNWoq7QLogNg01I?=
 =?us-ascii?Q?xzmSrA4NkzKqGYEckjqubGJlcp1U13JjrHwmlbZl9mB/EnMoqp7Qv7xVmpMf?=
 =?us-ascii?Q?1U0cvJj3QT6fnbkI/zTsYKBuLmn58x/CDs87dGCsRdAqz59pa8kCRfc8mAR8?=
 =?us-ascii?Q?koF1NicjiU3w6zAyy2jnDk0p2ReWUSJkhMF7ZgKYkGdgKiv98D0X5pEGJCtV?=
 =?us-ascii?Q?SS1g0fP9yGqmF9F88UzyRgh8Xlo4XDE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1615bd2a-7bdb-43dc-f215-08deba4d3b1e
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:03:20.4061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jlnPfRV2LUwHcaVyVMQNaEuht+9/2KIBFekaNK6umhEuWSM7FCcXt9gz9ZOhcywAbA1GygbXdbzeHiJR7nlllbJHbJqkTDfDTAr//fvWttc=
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
	TAGGED_FROM(0.00)[bounces-33067-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8BFCF5C9908
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add audio support for the Renesas RZ/G3E SoC to the R-Car Sound
driver. The RZ/G3E audio subsystem is based on R-Car Sound IP but
has several differences requiring dedicated handling:

  - SSI operates exclusively in BUSIF mode (no PIO)
  - 2-4 BUSIF channels per SSI (layout differs from R-Car)
  - Separate register regions for SCU, ADG, SSIU, SSI accessed by name
  - Per-SSI ADG and SSIF supply clocks
  - Dedicated audmapp clock/reset for Audio DMAC peri-peri
  - Per-SSI and per-module reset controllers via CPG
  - Unprefixed DT sub-node names (ssi, ssiu, src, ...) instead of
    rcar_sound,xxx
  - Hyphenated indexed clock/reset names (ssi-0, src-0, adg-ssi-0,
    audio-clka, ...) instead of the legacy dotted form

Link to v6 at [1].

Changes:

v7:
 - Split [PATCH v6 09/16] "ssui: Add RZ/G3E SSIU BUSIF support" into
   two patches: a preparatory "ssiu: Add shared SSI reset controller
   support" and "ssiu: Add RZ/G3E BUSIF support".
 - Split [PATCH v6 14/16] "src: Add SRC reset and clock support for
   RZ/G3E" into two patches: "src: Acquire shared SCU clocks for
   RZ/G3E" and "src: Add SRC reset support for RZ/G3E".
 - DT binding: add per-property descriptions for the DMA specifier
   lists, for the property-less mix/ctu sub-nodes and for the dai
   playback/capture phandle arrays; add #sound-dai-cells and
   #clock-cells to the required list; drop the dmas/dma-names
   blanket allowance on the ssi sub-node; add DT labels in the
   example so the phandle references resolve and dt_binding_check
   passes (Rob, sashiko-bot).
 - rsnd_mod_quit(): assert the reset before unpreparing the clock,
   mirroring the clock-then-reset ordering of rsnd_mod_init(); drop
   the unused <linux/delay.h> include (sashiko-bot).
 - adg: replace the bitwise-OR error accumulation in
   rsnd_adg_clk_control() with dedicated
   rsnd_adg_ssi_clk_prepare()/_unprepare() helpers that stop at the
   first failure, unwind the partially prepared clocks and preserve
   the first error, guarded by a new ssi_clk_prepared flag
   (sashiko-bot).
 - dma: wrap the index arguments of the RDMA_*_G3E address macros in
   parentheses (sashiko-bot).
 - src: acquire the shared "scu" reset once before the per-SRC probe
   loop instead of inside it.
 - core: split the r9a09g047 match-data initialiser line after the
   comma rather than after the pipe (Geert Uytterhoeven).
 - Fix the kernel-doc comment of rsnd_devm_clk_get_indexed() to refer
   to -ENOENT instead of ENODEV (Mark).
 - Fix the "audmacpp" spelling to "audmapp" in the AUDMAC peri-peri
   patch subject and commit message.

v6:
 - Rename all indexed clock-names and reset-names from the dotted form
   ("ssi.0", "src.0", "adg.ssi.0", "clk_a", ...) to the hyphenated form
   ("ssi-0", "src-0", "adg-ssi-0", "audio-clka", ...).
 - DT binding: tighten #sound-dai-cells to const: 1, drop the unused
   clock-frequency and clkout-lr-asynchronous properties.
 - Add a new preparatory patch to handle the hyphenated DT name first and
   fall back to the legacy dotted form, so existing R-Car DTs keep
   working unchanged while new bindings can use the hyphenated convention.
 - Convert the SSI, SRC, CTU, DVC and MIX probes to the helpers and drop
   the per-module name buffers and NAME_SIZE defines.
 - Add a new patch adding a third clkin name table for RZ/G3E and
   dispatching to it in the same style as the existing Gen4
   branch. CLKA/B/C/I enum values, the clkin[] array and the
   BRGA/BRGB derivation are unchanged; only the DT lookup names
   differ and use the hyphenated form.
 - audmacpp: enable the clock before deasserting the reset so the
   block sees a stable clock on the way out of reset (and mirror
   the ordering on suspend/resume).
 - SRC: use devm_clk_get_optional_enabled() for scu_supply and drop
   the manual prepare/enable in rsnd_src_init()/rsnd_src_quit(),
   so scu_supply has the same lifetime as scu/scu_x2.
 - adg: simplify the per-SSI ADG and SSIF supply clock
 - Strip out the "rcar_sound," from binding, DT, and add corresponding
   code support.
 - suspend/resume: respect the probe ordering in
   rsnd_dma_suspend()/_resume() (assert reset before disabling
   clock on suspend; enable clock before deasserting reset on
   resume)
 - Guard rsnd_src_suspend()/_resume() so platforms without SRC are safe.

v5:
 - Drop the rsnd.yaml binding split (patches 01/12 and 02/12 from v4).
 - Extract RSND_SOC_MASK fix as a standalone bug-fix patch (was
   previously embedded in patch 04) per Kuninori's request.
 - Split the DMA refactor out of patch 06/12 into its own
   preparatory patch, so the struct/lookup introduction and the
   RZ/G3E address tables are in separate commits.
 - Add new patch "Support unprefixed DT node names for RZ/G3E"
   converting rsnd_parse_of_node() to a function that tries the
   legacy rcar_sound, prefix first, then falls back to the bare
   name.
 - Simplify flags layout comment per Kuninori's feedback.
 - Add comment clarifying that clock/reset acquisition is optional
   and no-error when absent from DT, and drop spurious blank line
   in rsnd.h.
 - Move RZ/G3E DMA address comment to rsnd_rzg3e_dma_addr(), not
   the shared header. Separate the line-wrap-only change in
   rsnd_gen2_dma_addr() into the preparatory patch only.

v4:
 - Add reset_control_assert() in rsnd_mod_quit() for symmetry with
   deassert in rsnd_mod_init() (Mark Brown)
 - Fix RSND_SOC_MASK to (0xF << 4) to avoid overlap with
   RSND_RZ_MASK. Add nibble layout comment documenting the flag
   bit allocation.
 - Move audmapp_clk and audmapp_rstc from struct rsnd_priv into
   struct rsnd_dma_ctrl.
 - Replace raw [3][2][3] DMA address array with named structs
   (rsnd_dma_addr_dir, rsnd_dma_addr_map) for self-documenting
   table initializers.
 - Move busif_status_count from file-static into new
   struct rsnd_ssiu_ctrl, following the rsnd_dma_ctrl pattern.
   Remove duplicate priv variable. Properly propagate reset errors
   via dev_err_probe().
 - Clarify commit message regarding PIO mode still being available
   on R-Car.
 - Collapse dev_err_probe() and rsnd_mod_init() calls to single
   lines.
 - Move per-SSI ADG and SSIF supply clock prepare/unprepare into
   rsnd_adg_clk_control() instead of separate functions.
 - Move shared SCU clocks from file-statics into new
   struct rsnd_src_ctrl.
 - Merge rsnd_adg_mod_get() helper directly into the suspend/resume
   patch.
 - Drop former patch 12/14 "Add rsnd_adg_mod_get() for PM support".
 - Drop former patch 13/14 "Export rsnd_ssiu_mod_get() for PM
   support".

v3:
 - Split out from v2 series [2] to ASoC-specific patchset.

v2:
 - Split of rsnd.yaml into common and R-Car-specific schemas.
 - Introduce RZ/G3E sound binding as a standalone schema.
 - Addressed Kuninori's comments (details in individual patches).

[1] https://lore.kernel.org/all/20260512182631.3842065-1-john.madieu.xa@bp.renesas.com/
[2] https://lore.kernel.org/all/20260415124731.3684773-1-john.madieu.xa@bp.renesas.com/

John Madieu (18):
  ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
  ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
  ASoC: rsnd: Add reset controller support to rsnd_mod
  ASoC: rsnd: Support hyphen or dot in indexed clock and reset names
  ASoC: rsnd: Add RZ/G3E SoC probing and register map
  ASoC: rsnd: Add audmapp clock and reset support for RZ/G3E
  ASoC: rsnd: Refactor DMA address tables with named structs
  ASoC: rsnd: Add RZ/G3E DMA address calculation support
  ASoC: rsnd: ssiu: Add shared SSI reset controller support
  ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support
  ASoC: rsnd: Add SSI reset support for RZ/G3E platform
  ASoC: rsnd: Add ADG reset support for RZ/G3E
  ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
  ASoC: rsnd: adg: Look up RZ/G3E clkin under audio-clk{a,b,c,i}
  ASoC: rsnd: src: Acquire shared SCU clocks for RZ/G3E
  ASoC: rsnd: src: Add SRC reset support for RZ/G3E
  ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
  ASoC: rsnd: Add system suspend/resume support

 .../sound/renesas,r9a09g047-sound.yaml        | 800 ++++++++++++++++++
 sound/soc/renesas/rcar/adg.c                  | 168 +++-
 sound/soc/renesas/rcar/cmd.c                  |   2 +-
 sound/soc/renesas/rcar/core.c                 | 161 +++-
 sound/soc/renesas/rcar/ctu.c                  |  29 +-
 sound/soc/renesas/rcar/dma.c                  | 280 ++++--
 sound/soc/renesas/rcar/dvc.c                  |  29 +-
 sound/soc/renesas/rcar/gen.c                  | 180 ++++
 sound/soc/renesas/rcar/mix.c                  |  29 +-
 sound/soc/renesas/rcar/rsnd.h                 |  73 +-
 sound/soc/renesas/rcar/src.c                  |  91 +-
 sound/soc/renesas/rcar/ssi.c                  |  49 +-
 sound/soc/renesas/rcar/ssiu.c                 |  92 +-
 13 files changed, 1857 insertions(+), 126 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml

-- 
2.25.1


