Return-Path: <linux-renesas-soc+bounces-33644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6ItxMW4TJmohSAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 02:57:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE5B65209F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 02:57:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=T0aSFTDy;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAE43300A137
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 00:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFE12E6CAB;
	Mon,  8 Jun 2026 00:57:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39F282F00;
	Mon,  8 Jun 2026 00:57:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880236; cv=fail; b=Ay69+uwopN7WAiUAWNBFJnjeVi1eW7HWBiXJnmvmVqySChvX47wPW5OpxMnkwIEGACBPY27Cm8qLBWUffAlmByrR18sdh9OOp2IuNYGZf5Fq7+jgh9/iEQo0AcmbMr5peN4+Iyc/Z7k1V01zaVR6a4GyYjCMr1+HQMoqlI9dMLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880236; c=relaxed/simple;
	bh=INxDlYs262wpYPZi9VS+9nHgn8DgRSpO0Q6cxgRmmj4=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=LZMT9t63ELpBiGeotte3xtg4Bq+mTsQxynTDFhw/5Ak9UxmtHjwnJllsxT65IeSwwdNmMnuRjTNWx2bCzU9Mbq8DMvpqotaz+pPMNgfMUV1a8qVgxTBuLIHCWO04yn+A5RO5LTjmAzr9o/lW4+q6DLbgwUh1ruY0xtCG8zIHPkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=T0aSFTDy; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHe7pMKEFDOZI8KzT8rbhoIV5AWH356t7WaBE945uW6MJt2H74ZDfCoAdwI+C0E7+UEpS1ghesSxEXjvzvfGagvTxk2OrEd8ZwbMM4cXysD6JWK14RVfPjQZnGggAprxN8Jk1QnDtP98AARJe+myAuDEAR5FP4octhXGqamFwoUX5lhjIRd+wNuMIwIlmh1IOkOGqdeVIHYK1Kgi31IGunuEFF7CaUO8lzyYx3Bob+CjyH8q8AU138GI5vTOK8jwc8ap2ETrSoJvQbtAUuOQekWe5u8wQMm9xMBpdwHlA76QT5DiQ1DOC5LOxSQTlSSl0zu/1QBcj6+jVw7b8Zp/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7w6AcJwVgXAU3VGqfu8BZQXo6FFE+cxeS03+m0TqhsM=;
 b=iu4ALWKAKZIxh/dbMQvr0rnj7OROBOZvEz9lTaxFSEa1PEvUz7yYwpsXNqM9qPfQ6nHV8yh+cfLtuSLBwWwaWPZ1G+VcGIg8yX5WdSpHWqIRBLWD+EvglxCjcRpCizO83plX8B0mcL4zkJ/9WTRQklLYvAUJLzI3YoiBr19j/LCIf8kefBmXd0mHYTr5MPXlnwIRgc/x6/94HeM+8+bf4xQ+wrAisZhRmsluqlpJyks98pB2baPjdHivKVbnKC5KRHRMHISYC8raNPKnY1MIqTv7eGRCH+07V7YU38SpNhXYAL8A7aPfjn0J9sW1jYFCMh4z0MAhCjmlrIT5QKR+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7w6AcJwVgXAU3VGqfu8BZQXo6FFE+cxeS03+m0TqhsM=;
 b=T0aSFTDySyLktI1ncnzUN5RRDqrfEwIDRlyQq7kpf9zavcKluZm/uJ9DAkhn6fIIncxzyBBKTAySnnpUw3fYASiE3RfVtNtvb/XQEcqf041WN4DiLi6IRy0jhbE3sNtBP5SehcorjqdwgaDj+H00vF1nL1NLHWmFJ4zZDZhLru8=
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB13800.jpnprd01.prod.outlook.com (2603:1096:405:1fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 00:57:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 00:57:10 +0000
Message-ID: <87wlw9etne.wl-kuninori.morimoto.gx@renesas.com>
To: Baojun Xu <baojun.xu@ti.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Herve Codina <herve.codina@bootlin.com>,
 Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Sen Wang
 <sen@ti.com>, Shenghao Ding <shenghao-ding@ti.com>, Support Opensource
 <support.opensource@diasemi.com>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/9] ASoC: don't use array if single pattarn
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 00:57:10 +0000
X-ClientProxiedBy: TY6P286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB13800:EE_
X-MS-Office365-Filtering-Correlation-Id: 696201b7-4233-4740-4f1e-08dec4f8decf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	54Wv89i4msRC093uQPnOcyrXPNEdWKUp/bFP+aRkVyV0cHz4zOiXk3InB9Yu92Obwr0SoQpbN640t2y/LDkqsxHS9iHhfN0EIy80t/7hS6yaaxffIRlfzrvfg+DztVlujCJUpowupsuXKilW7aVgi8jmFQH/ZssRp0zHRmnnFWj8GuCHeFZqU6cGoDXbXUeE1OOWEnYLUvDYTky5DTxXGdHXGTE/TEezgkJS+LWqC6UmagxTNvcwIJUbqY7UYG4ae+E9xRSC+2EuzodPpdeyW6i0YKnzbRuCQAyYwwdD3Oq3Af/fTh4SLFHgmLuH2NaivjiXmr7q19gSlJfYUnPYaaDOUu+Chw8bTWy3W9k6EZvZBOpUBMyXqDAXsBhyo/Ub7puHL3Dek5UZIbenOTbCs2/BWVuFFqfi0sbUaIRrdRS/wS2giLFeEQ/1bkyf3k5+uYQO0oo5x15aqJUbGD+8KAxCGaOsLIh+frw3ImnCilTOlDJSVrxYBuHrygnNNUoyL7lCMSAonvTvnP5IbPO82FRW0T/sDOhqG7xTs5rUm500jFBI055eCzaueqyAlFfyccaqOF7P2+eU/p95ZvSWVp3gjYGM99UvQVuPstFDygs3wjrvEJBSn2ASfetVd1iIfFyW+hIIHzZDG+4TTsc2tx8yW4VBy82KL5H8jRDepubUZDcxD6FTWy84Q/yPs8aeohNgAoIO4za3yuro+/gC4AAN0V85G8UcsdKsW4U2Jnls61G+4QI1D4mux0pFP35cGnUrDNcbYLd3SS8JyThq/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OJfyEdiHQhXIdKLkSuhT7xfqQu7hsDUgNvgi0CZqUxKdB8OwOgXy3q3yTPcC?=
 =?us-ascii?Q?eRHTC7IoUFAHQKbicgcyr0oqEA038+bV274KBjs/VyXuXsvD2TBWy2PVlO7g?=
 =?us-ascii?Q?1RpjvzeIVRIJDxdNY2gX+dV6RPoIBdI5OqU5qdF//7wNVjedmewgzv3A8rLn?=
 =?us-ascii?Q?0BYimmKPAPB+wRCyLkNSxcaZ7/+MjbyWWQwy+fzjDCQoUvzsv7RlwBqwrP8h?=
 =?us-ascii?Q?ynZNJY5zUyg63teJD2iJW/+TURcqMKnWi150RRN299U41Hh0JSMwmMpTRcmo?=
 =?us-ascii?Q?UUrz7UzQZtpUnRyz9NGFDmr+Mu9zne/+UC+TyeKjID+zMpK8jyvoLH9CjsBm?=
 =?us-ascii?Q?Gual044mFStp6QOVYc2PE9CZzdzxyy7MfNcd0r7qasL4A9PJOpx0Fhzmi1lN?=
 =?us-ascii?Q?Nwk0eGcfAgfWaGve6EPEPPzkFngBmnsKFep7N77naCPjLhoXDWWqfTaql0fd?=
 =?us-ascii?Q?5aTqoKlEl8TAy6TKLMAgxxxCyko4dQ1aHOtRT2rzbRWuL7eNLdDO25hAFvJ6?=
 =?us-ascii?Q?Umnm5tegjkC4YKx1KC1rF2RLXCTxJ0NYj78bFAIL6oO5bThHGCociX85bDJr?=
 =?us-ascii?Q?gN7U4tSqdpQ2SwdLpj4GScCmAE9wqLvAIzIvwoToxEq1WYj86octb5uKPcUs?=
 =?us-ascii?Q?wOIIu0baoMT85EmoZ078FSbmB2fWuixio8Cs3BKz7RibDwMU6/XiwviDpeiz?=
 =?us-ascii?Q?eRXlTJa2RpMUcPOh2WzAmLLOD6T8PbxA3l+45fMD+TdGmaPiZulMGPMhe0dJ?=
 =?us-ascii?Q?MvEVPTWRZGxaPve7VUyqQEQU2c9hzKNHPkge7O2PSTbKwN90UvGrIrndB8MZ?=
 =?us-ascii?Q?K8y2jrsAEgHXWOvbhb72LWBhsuECeFjnvvm42zgCUD6VN6S4UTc5wVYz08fF?=
 =?us-ascii?Q?F/pFxDfem/8sCGdROvjcd52b6jZz/VwMo5LIzJmRHhm1IL79uHhm5/AzCwBa?=
 =?us-ascii?Q?zI/N44Sm6igF9vJRs4R9ZRTTn+jAdbu7wchmh9OEoj2K6K7r7UQ1vcAcf1/x?=
 =?us-ascii?Q?dr1TzCABpFGbwh+TAZbQeb+6lpO6Rz4H/pCjmBSk4a8pNHdv326IKttIsGvl?=
 =?us-ascii?Q?5+aX2pBIvFXvEQVSKQWYnb9475zrWOv2zKMHZq/kv4apvRQb6WXUBXH5XqUp?=
 =?us-ascii?Q?nqOYiabLjpZrg/WQIqSpTHvN+0IbBWPajsnhYnO9gwBPLGhRuXs8By41+e8C?=
 =?us-ascii?Q?b+OpEYGMMQ2tKeVJ1RsFqS/ZEESnQG6D+wSZp0cBcDxIF9iOS/PXt1ton+c6?=
 =?us-ascii?Q?XhuaV6Y+Elpqv3m8h/jmvdnYHu2nDDFjNyNRSm6VtYi3cbD6B2CsXbPw2ISG?=
 =?us-ascii?Q?+QrKEKGZFzecY4d8Kz5Ana5demlOcrZlwyxxt0u7xJmxmlaLpZsgvm7tjMOg?=
 =?us-ascii?Q?JSOo1/Hc3tZaUlgAkQPfgu3kOERWUV0m82AcWSDtWKu/VQpNTBc+2zMyv0aH?=
 =?us-ascii?Q?u3Ji2EnbJ1d0vQjiqPB8TFw96JI1YQ48HOD6e2q7+84VGGjfOhswpMAo8jIZ?=
 =?us-ascii?Q?8KyxikSzR0Fo9yPN411SLYpaezc6MhrHDx4e9er5M8Vk5qjmgrMzTBc7+9PG?=
 =?us-ascii?Q?VslSmgbVvlHRHtoGvbdqXz8XMU6n52qGP0kWbqQaZpsNZgucgs/zApcVpsKC?=
 =?us-ascii?Q?bC0svtEX2FChcY9AncstJmw6QPGdvi4i7duaoJLgO6kYMUU5Shq8oj5InhkK?=
 =?us-ascii?Q?kEaqFjg4RmQhiTJu5w0Il4D9+3fFXnhy0gwholzt0Mj9XgJtUk4WoxxjoKwW?=
 =?us-ascii?Q?5I7HXg6QJMo3+mTZFhtd7F36aovbdvg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696201b7-4233-4740-4f1e-08dec4f8decf
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 00:57:10.5109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IM44XyAP/u6qxeRt/T+mNwAkUByp2yWmDaFF9CoquPpXdNaVJEnYyPXmHlsK254cU/zOeZAz7yAg5tVtULuesYDFYYnEbU7dOoxerMC9/1aRwYqSe0uccZHXu1np47FM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13800
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33644-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ti.com,glider.be,bootlin.com,perex.cz,gmail.com,vger.kernel.org,kernel.org,diasemi.com,suse.com,baylibre.com];
	FORGED_SENDER(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:baojun.xu@ti.com,m:geert+renesas@glider.be,m:herve.codina@bootlin.com,m:perex@perex.cz,m:kevin-lu@ti.com,m:lgirdwood@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:broonie@kernel.org,m:sen@ti.com,m:shenghao-ding@ti.com,m:support.opensource@diasemi.com,m:tiwai@suse.com,m:u.kleine-koenig@baylibre.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuninori.morimoto.gx@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CE5B65209F


Hi Mark, all

I have posted this patch-set as [RFC] and v1 before.
This is v2.

v1
Link: https://lore.kernel.org/r/8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com

It was too huge patch-set, thus I have separated it into 3 part.
(A)	- Update existing driver which is already using auto format
	- Add auto format support to not-yet used driver
(B)	 - Already got Reivewed-by / Acked-by
(C)	 - No yet reviewed

This is (A).

------- 8< ------- 8< ------- 8< ------- 8< ------- 8< -------

Current ASoC supports snd_soc_daifmt_parse_format() which can specify DAI
format by "dai-format" property from DT.
But strictly speaking, it is SW settings, so doesn't match to DT's policy.

Current ASoC is supporting auto format select via
snd_soc_dai_ops :: .auto_selectable_formats.
But the user is very few today.

DT doesn't need to specify the DAI format via "dai-format", if both CPU
and Codec drivers were supporting .auto_selectable_formats. It will be
automatically selected from .auto_selectable_formats.

But, I noticed that current auto format select method can't handle all cases.
For example, current .auto_selectable_formats is like below

	static u64 xxx_auto_formats[] = {
(A)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|	(x)
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,		(x)

		/* Second Priority */
(B)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|	(y)
		SND_SOC_POSSIBLE_DAIFMT_DSP_B,		(y)
	};

It try to find DAI format from (A) first, and next it will use (A | B).
But it can't handle the format if some format were independent.
For example, DSP_x (y) can't use with xB_IF (x), etc.

So, I would like to update the method. New method doesn't use OR.
It try to find DAI format from (a), next it will use (b).

	static u64 xxx_auto_formats[] = {
(a)		/* First Priority */
		SND_SOC_POSSIBLE_DAIFMT_I2S	|
		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_IF,

		/* Second Priority */
(b)		SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
		SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
		SND_SOC_POSSIBLE_DAIFMT_IB_NF,
	};

Switch old method to new method, Current auto select user need to update
.auto_selectable_formats. Fortunately, current few users doesn't have
above limitation. update (A)(B) to (a)(b) style is possible.

	a = A
	b = A | B

I would like to update method, and add .auto_selectable_formats
support on all drivers.

One note is that auto select might not find best format on some CPU/Codec
combination. So "dai-format" is necessary anyway.

And, there haven't been any big problems on .auto_selectable_formats,
because there were few users.
But if all drivers try to use this, it cannot be denied that they may
encounter unknown problems... In such case, "dai-format" can help, though.


Kuninori Morimoto (9):
  ASoC: remove SND_SOC_POSSIBLE_xBx_xFx
  ASoC: codecs: framer-codec: don't use array if single pattarn
  ASoC: codecs: idt821034: don't use array if single pattarn
  ASoC: codecs: peb2466: don't use array if single pattarn
  ASoC: codecs: ak4619: update auto select format
  ASoC: codecs: pcm3168a: update auto select format
  ASoC: renesas: rcar: update auto select format
  ASoC: update auto format selection method
  ASoC: audio-graph-card2: recommend to use auto select DAI format

 include/sound/soc-dai.h               |  15 +-
 sound/soc/codecs/ak4613.c             |   5 -
 sound/soc/codecs/ak4619.c             |   8 +-
 sound/soc/codecs/da7213.c             |   5 -
 sound/soc/codecs/framer-codec.c       |   8 +-
 sound/soc/codecs/idt821034.c          |   9 +-
 sound/soc/codecs/pcm3168a.c           |   8 +-
 sound/soc/codecs/peb2466.c            |   9 +-
 sound/soc/generic/audio-graph-card2.c |  12 ++
 sound/soc/generic/test-component.c    |   7 -
 sound/soc/renesas/fsi.c               |   5 -
 sound/soc/renesas/rcar/core.c         |  12 +-
 sound/soc/renesas/rcar/msiof.c        |   5 -
 sound/soc/soc-core.c                  | 160 +-------------------
 sound/soc/soc-dai.c                   | 207 ++++++++++++++++++++------
 sound/soc/soc-utils.c                 |   7 -
 16 files changed, 201 insertions(+), 281 deletions(-)

-- 
2.53.0


