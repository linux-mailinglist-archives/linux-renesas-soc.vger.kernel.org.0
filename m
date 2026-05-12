Return-Path: <linux-renesas-soc+bounces-32518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id F/RbMVh3A2ri6AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:54:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C6752839B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 20:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3210931DCAA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 18:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34E93955E3;
	Tue, 12 May 2026 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F3CR759t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0DC3955C2;
	Tue, 12 May 2026 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610564; cv=fail; b=V5F4HMV6E2e5U7Lv+AqmBhm76dd/5E/zWzDknHkx/29xTY2JXPGmlPdmePObmaUfkGBiBwclXDkdiucRUNz/Y7ohiE/vjfH4uhdh/Lllm2TjL3cdMQCYUJBWVkvop30YZLgvM680UuNJGuJg3TVrOtStQoyU+5O0Ry96zgc+2FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610564; c=relaxed/simple;
	bh=5o6T/W8SBR+UE+m3WoDhamd0dVJcr4fm/SmZot3iCGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UkrUPiV6/tOYiW3ozIfMMrrZ0QK2Vfwje1ZIP4Y0yJaYGFMZiN8fCn/fkvT5HfTB0utqkj9i8z5OqGFAEaA/mzMCev6uLO7fjvA/AHEQBcuyXHMwCIL8mMUq7qrnqibZ02kzHSVDx+2u9zjCKuLxkUptcqvvHb2hO72FU8l0+dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=F3CR759t; arc=fail smtp.client-ip=52.101.229.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOnSNDFnag/hsX2rlwS8nlT3D7founGcmmIq5v9mz2sRGeRaoDpxTDPgUXjdDYioDqAcjSl+prpMgcjYpXClC5bj3Yn/kPUoMsXSpWxVUejFKj0aqzPTiG8TCfNbXMSk6IWYjumO/FFzYsHvhAa7jj8AtiIUecKAko/IEaB9iebRBTZSmlQCUPTWY8Fr3owhIc1IKd6yO7teDD6PKc7Gvsm1NX+ZRA1vwaxd1wsh4SLf/LNCcenjnIfQjKu5R3gexzw/kUrvv+MwbfPxqgo9y9lMjb1EhNn7Hnw8ASYGu1hykNrAbc4J2OkGnXcQPR96gW6FN+vK5QvTDRrTvHyIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYij2m2/lkTNTk1ZO4F0Q4WzWE8eLd1dcof+ptO/EQU=;
 b=K3UAeOzgFPpm1xyw85TRJm4queFOsaxXcPuNKIHAHr3k/xeag2oCVLqwbW0Ozj6inCXcQvnIelRqxQmy5fpGn+deu8VFZ6QN5h2pvXuz8324xE4jp0hK3n4BxEKz5RgiJraOn4YbuFajC36BkEiUzvh+cnvT9g+io29FrPXcFYhbnmD/c5D+Vr6f/rpYE09AUtwkutag4V1dX0GceqeBqTKQopw9SqdwR9G3dbkyPYqizfI6TncQQl62i8s+zKFiC9vvSFtBQbXKd1NXhq7y4aNW2Ua0Vb5D6kPvWDUMSyIgf8EHo7/9lNh8NcCSTgeATdvoPZIYa8q0Ojf3LvP6NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYij2m2/lkTNTk1ZO4F0Q4WzWE8eLd1dcof+ptO/EQU=;
 b=F3CR759tfVR4EH6mYE/C8M0PSpm9Bbn0kb91ByWjhS+HlAyggCsBGCsT3SGIva3m2lyJl73MwXYubukhyVaw9Wzh9Zc64/qex73PI+MQc9Jn8Nmyp2ijiyN/GhmkBRMmF37Ewfz4a+sYqpbwnTLG1xeZ95i9gGuJkE3mfAQbjW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB13037.jpnprd01.prod.outlook.com (2603:1096:405:1c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:29:20 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 18:29:20 +0000
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
Subject: [PATCH v6 15/16] ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
Date: Tue, 12 May 2026 18:26:30 +0000
Message-Id: <20260512182631.3842065-16-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1e217ed6-a582-4859-fb11-08deb054622d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|22082099003|18002099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	KbQnbvaVtOLGYMPDcwVHTjLN3O/jMeBIrT8+dsOH3JLAVMOyZ2hxoNvoCRdr96TWnzrbS3U3rF04cqLEPULR/UodR8WlZaxhjENjrM8hekPXzuubBmpIf8B0KylcVJi3FB0btzTi+mXRuH2acBRUdW4Mv87chTJsVnrn9UbdL5bE/CzaGkqy7jrVNq62pIUJfVQ38VGv0MYAUBb1WckPFob5oPbeiA+1TDkHbKzQbUa+SL189cMKY+CuOG9rkFudIDybDarh7brvnFJu0IixBTrdGptO+nNo34WIns6Gl4kA3Cy9G0qZ9lED+cG+zL4NxzExjegIOCZ69Fcx3/s6QBI6aCb6/C8HVG3T4qxtOZhRIatV8UjLepgA9GxrvTzxp2reRtfSBHJGB8tekJiK5UuapjdUGUP1lZYsk4oNfLeS6iXMK2obx3+J+0NJEoxl63KkHaN25bS6H/hh2PLQa0tWSBw6EgbN/TjtP19eSgVOEk5Frke6FiOsMw5KN5daGYqqJTbLB0MDsNXiaa9QVIdaIsdQ3gFzTq8NDG3uIMTspng/03lM+1WHtkkhDJuxRnX/v43/yxZM/fjWhpluhc2HhA1wjMKBu4CVq0Wg/C0dLnLMzFpt7Tbvt+TXJSiIEc/SBU6uouYcfr9QfCeS3hUaHc03o2RXIIfmkxw2zbenV4e0snzdNiRTV/s6NLZfXgFNv3fyCmgzwBiM6n1XM2fhzEjsS7ouqIzeRp4bB40436BFM/uMz9m0Sn0yUvKK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G8Tp7qftZvGF4LTT4K3PWfTOrKOlQQPkVTYF6ySICj50zKkCiuvQKArW9YMC?=
 =?us-ascii?Q?VPv1/DF/lKkRwRg9mcufjlPbPpq38w6ayJiT4+4ER0ddg9P4z3KBUsKLokE/?=
 =?us-ascii?Q?/YStq1LtArNBkUGET1rHgxKr3AySKL8Jgz9uiSTFunJ9MX/74hZZU5mFu4GA?=
 =?us-ascii?Q?2muPKkhU8AoOkcDkhGfmjqRrhfOYMDG3QKBQofqXNWfH70hZhyCr1iN4rNuk?=
 =?us-ascii?Q?IRcTxDEMZZIGT0n1OXQAnYZRIAlPYsnLM/ecwK7fw1J7b+TJPwN3VpsICpCC?=
 =?us-ascii?Q?h8PejsmQBqGBp1MKUG2bCHlpPG7KBaHBLXNx/0E544iRvENCMRHPdNpj0VaV?=
 =?us-ascii?Q?uNhg2/F2hSkJFCaKOL3xXAPbIoJwBQb+GsREVX6gircCq0QvG2iN5g1MUgfW?=
 =?us-ascii?Q?NzEejehttkExm2kQVbM7K3QzaBm6+eZMPJbdGPRaJ2/k/wnGd/6UardbieHM?=
 =?us-ascii?Q?1Jm2iFlPRag0jjVWgG0QWskOVoDabNaEgLmnFSm52nx6vQSX6zdseV4iuBrv?=
 =?us-ascii?Q?pT4UMQOSzJ1Vuutj0vB9LGVPEmxNQc2R0zfuqUBJlkyYtV5oRkEg4vaaokZM?=
 =?us-ascii?Q?YYvOWClgttYIDH9UXGn6m7JBIXJ2se9UdMLXGwMFFA3zmxufQVMl7NQcTMc3?=
 =?us-ascii?Q?h/sM2q/WBrdZ/536wT47mlvDlizkMH+7Mr48vZh3/474paPCIpKuLVABmG2K?=
 =?us-ascii?Q?xnlflN6crIILxTRJgErjiIpgtOGHxkoBIIv1ADpIPjdH5c+jCEgPsXjJCnNX?=
 =?us-ascii?Q?kS7c+PkoAVjPnTjlz1c99+BLs3Bp/86gJp/ruBBvYUZO5HkYMo+YCjOGTEPC?=
 =?us-ascii?Q?gXzyEXYBcD6NJ74lp9VYr/T6Lzbkq3rqEJoMZDrQrU7yLKYPrBqKQrcgysav?=
 =?us-ascii?Q?/sOrD3PObguZ270DZsTi+dKHWF9AQ6X1FeINivh+kqiMWtvqrQdF7JnwC+1Y?=
 =?us-ascii?Q?CMox2g02BOMoOIH5mQLcgDUVAKcaowSLDDJN50qMoH0tmsfiRkQvMcJAcrYV?=
 =?us-ascii?Q?DIc1+6zvHbVxnxzKs8mxLcPcAA+90TnoamvAR1X2z4dcmvcCFVwoielQPOkr?=
 =?us-ascii?Q?sPdrjlAsDb6nwCA+OwNe/pFh3m6zmyCA83gk6TuAg3BDtF7Z8uTk7Wg5OOun?=
 =?us-ascii?Q?DkdkZ536m6IYp3HmMJAbZl3H90WNAUlhGNcAQGvdeuUrDcJoo6yxXKyyB6Ns?=
 =?us-ascii?Q?wwHuG3Rih2ilrFOz5JbiJPPnwmOdnsbVRxQlZENwUGqocl+yRFwbBeHDUTnR?=
 =?us-ascii?Q?LQ/fJ0q8RL/xIxBNVIxpbTPXg2vmSWb5gJkK5FUwIIXSekmTVVGRYfmcuSZy?=
 =?us-ascii?Q?hteVcErx7HK/URKr8JKjMJkqv10RksTVcyUVZB+aX8ct5wSlX9Oz6EKYumGH?=
 =?us-ascii?Q?WOwBra2SYwO5KEznWS4IeFEUs6Ve7Q4yoOaZlsMKGWL5CZ3soEtbSF4U8pPz?=
 =?us-ascii?Q?BVyauDha58Z9QNUhAPwAMrsxRpJLIR/gD4xlHZ6DL+c6u3xuLVBzHK0NPV+Y?=
 =?us-ascii?Q?DsfBQW3xGbaZ965ypmBOcEO/eupeUHXEuk50ehkqTazvWB9vn3kcPi9k9JEH?=
 =?us-ascii?Q?8GuaTyttpj4VsoHq1NomkQbnuJHtRem8OBMPV/TmKUJ6pXEi6Ak37Uhhu1eY?=
 =?us-ascii?Q?PyIdEnmaxEUi7VaHr28QN7I9xre8iAAbRi/GBjOtnFRf7BHVgPbi9ISas0i3?=
 =?us-ascii?Q?2RwMVw7PTq2gI6iv+BPBGHY/fDl1QhSV061sOdxy8eKboFM5nzhWpPCv22QT?=
 =?us-ascii?Q?ccrZoDyYARP+5LU4bLDPOT0mAAQbIwc=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e217ed6-a582-4859-fb11-08deb054622d
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:29:20.7086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDXSLUC6HNG5qyI2Idh6REx9zMyPrq1aRZKHhDkn/Oq5uaara0R3b3XhVVTGUiuUEYkBl7LQ8N57qpkmcihgaR//Ys999vZ9xsGY/kJDm0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13037
X-Rspamd-Queue-Id: 19C6752839B
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
	TAGGED_FROM(0.00)[bounces-32518-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The RZ/G3E device tree binding uses standard unprefixed node names
("ssi", "ssiu", "src", "dvc", "mix", "ctu") instead of the legacy
"rcar_sound," prefixed names used by R-Car bindings.

Convert rsnd_parse_of_node() from a macro into a function that tries
the legacy prefixed name first, then falls back to the unprefixed name
by stripping the "rcar_sound," prefix. This makes the driver work
transparently with both old and new bindings.

While at it, update the related comments in dma.c, ssi.c and ssiu.c
that reference the hardcoded "rcar_sound,ssiu" / "rcar_sound,ssi"
names to note that the driver now accepts both the prefixed and the
unprefixed forms.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6:
 - Factor the "rcar_sound," prefix-strip into a small static
   helper rsnd_node_name_strip_prefix() and call it from
   rsnd_parse_of_node(), so the convention is in one place.
 - Drop the of_node_name_eq() "dai" fallback that v5 added to
   rsnd_dai_of_node() and rsnd_dai_probe(); not needed once
   rsnd_parse_of_node() handles both forms uniformly.

v5: New patch.

 sound/soc/renesas/rcar/core.c | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/renesas/rcar/dma.c  |  8 ++++----
 sound/soc/renesas/rcar/rsnd.h |  4 ++--
 sound/soc/renesas/rcar/ssi.c  |  8 ++++----
 sound/soc/renesas/rcar/ssiu.c |  8 ++++----
 5 files changed, 48 insertions(+), 14 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index 9022f03c45d6..679c833fd001 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1302,6 +1302,40 @@ rsnd_devm_reset_control_get_optional_indexed(struct device *dev,
 	return devm_reset_control_get_optional(dev, name);
 }
 
+/*
+ * Strip the "rcar_sound," prefix from a legacy node name.
+ *
+ * The RZ/G3E binding uses unprefixed sub-node names (e.g. "ssi",
+ * "ssiu") while earlier R-Car bindings use the legacy "rcar_sound,*"
+ * form. This helper returns the unprefixed portion (the part after
+ * the comma) or NULL if there is no prefix.
+ *
+ * Centralising the convention here keeps every call site consistent.
+ */
+static const char *rsnd_node_name_strip_prefix(const char *name)
+{
+	const char *comma = strchr(name, ',');
+
+	return comma ? comma + 1 : NULL;
+}
+
+struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name)
+{
+	struct device_node *np = rsnd_priv_to_dev(priv)->of_node;
+	struct device_node *node;
+	const char *unprefixed;
+
+	node = of_get_child_by_name(np, name);
+	if (node)
+		return node;
+
+	unprefixed = rsnd_node_name_strip_prefix(name);
+	if (unprefixed)
+		node = of_get_child_by_name(np, unprefixed);
+
+	return node;
+}
+
 static struct device_node*
 	rsnd_pick_endpoint_node_for_ports(struct device_node *e_ports,
 					  struct device_node *e_port)
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index ede0123d40eb..0bca0b303191 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -794,11 +794,11 @@ static void rsnd_dma_of_path(struct rsnd_mod *this,
 	int nr, i, idx;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old version.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssiu_dma_req()
 	 *	rsnd_ssi_dma_req()
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index bdc4a99394de..1e4bc8a6c55c 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -501,8 +501,8 @@ rsnd_devm_reset_control_get_optional_indexed(struct device *dev,
 /*
  * DT
  */
-#define rsnd_parse_of_node(priv, node)					\
-	of_get_child_by_name(rsnd_priv_to_dev(priv)->of_node, node)
+struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name);
+
 #define RSND_NODE_DAI	"rcar_sound,dai"
 #define RSND_NODE_SSI	"rcar_sound,ssi"
 #define RSND_NODE_SSIU	"rcar_sound,ssiu"
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index e6734671328c..007a7c91d470 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1009,11 +1009,11 @@ static struct dma_chan *rsnd_ssi_dma_req(struct rsnd_dai_stream *io,
 	char *name;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old version.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssiu_dma_req()
 	 *	rsnd_dma_of_path()
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index f483389868d2..8fb0ec5dc791 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -401,11 +401,11 @@ static struct dma_chan *rsnd_ssiu_dma_req(struct rsnd_dai_stream *io,
 	char *name;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old versions.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssi_dma_req()
 	 *	rsnd_dma_of_path()
-- 
2.25.1


