Return-Path: <linux-renesas-soc+bounces-33072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGT4AhwtFGpYKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:06:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9D5C99CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 647DF301CCFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1235B36F8EC;
	Mon, 25 May 2026 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dhgXnTsk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E34536999F;
	Mon, 25 May 2026 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707040; cv=fail; b=pQ8vwjcZi+N98Wr9mxnBAzCV8vTYo76wNtEqreCEvoI9gWYP5OPaR4wDS4w1qWKuK/aldcq+lc4m7K9ub5trg2pk4ErYhVF6sSf0nLtmcftdY1x89gBXCHACus+8jPsM9lQZHV/aiqZE0isqszuvefG5aCyDcyVsbs2rizvgjK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707040; c=relaxed/simple;
	bh=ozF6mjLXgBQOxZi2zoXIPyqyMo8ABt/cJA+yAKsjip4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XE6X3KqiQDvsLrmLvdia3I4O1PuYh/e1N4NNFuvED9Bejto1e8oNEyEa5DNnhPDSTxh9DU6G1sKAiuiqX/1dZDNYMsWrwzkWzv0ZU7UCC6ljkeq2CypYJNnjNwRT14KYDtlsr3yT9viFQaKylVaXpZzBQl3EAcdy4V48Sqn8EFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dhgXnTsk; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnbdJa5du4Dn2hq9ssjpToDbLP2CTPWbgmaJV2kE94xF8Z8SyDhSKD2hle2FPOjv4aRpn/q00LnxCHlgWyEaTBA73s/XQpbttoJmhsv5PgJk5YtHwQK+xgMSXpDTKU3uJ7qSyQ24fkNI9y5r7eQlXU1/gJL5OnsxpREVT1EpGpTrtJlkPZUEUeNcY33S6+h/kz8Ft09vyeMZ3Gc+uHMYg9K/QDMVFynZhjWpakbWWUHRfMjkupzc8VunOEZYlOfOpAZR+1AsCpQVFl/XsTOgJ3wN5IvxXabG1WOQDzojrP1dW8bPAUJuMceoQcvN6qRjnwFbMEl1ersiUDFGdC/HJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sljAl7sMQg9IdDgGnb4W1UjBRO3H/GG4R/BoSPDKF+0=;
 b=idSOR1S6LLrfBpJsZD9qSFUYcucV3yFHE7A1dB7dj2C9k/cOknUlmwI6K8nRmI0wcLLlWRAcYRB9gP0ZNC3GdCmiiQ/y7DUFTZWAxag9ULyrwmZfM8IeNT/xddwPH+AlZFRGsqwPanjoxGU1eRMB0btjHkjEWj8PjsIdhlC3Dy7xwaAf3heupCGoxG4viIBNRHwqZbNmDb5dbVWrW0RiKvlHk5RWpJ4Cc6BYchzi1WjvYqWLDOD2xpmYv2+YnXELHellCVDHqdi+UHGFvB8+yMaE8hbFESwucVThc+QeVLQz92P2CreZQzR6lfLZt9+m6MW2lMgDKmXyBVgKr0bErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sljAl7sMQg9IdDgGnb4W1UjBRO3H/GG4R/BoSPDKF+0=;
 b=dhgXnTskn0E6gnwLZUe2jMdJnbUQsb4jgc5wYd9nIRRu8k1zvOYaJMITB4qtl/dhDOKVDhMMeaO3FCL5LbFgg0UD/Nz2I1Am5Vc/NcIGax7X18YkBOLpTBGWkafIJxDquiT02n6JGGmrFmqi7cNCJnTZ1diIbZ3Eyr3FhojUNXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB6982.jpnprd01.prod.outlook.com (2603:1096:604:116::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Mon, 25 May
 2026 11:03:55 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:03:55 +0000
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
Subject: [PATCH v7 05/18] ASoC: rsnd: Add RZ/G3E SoC probing and register map
Date: Mon, 25 May 2026 11:02:17 +0000
Message-Id: <20260525110230.4014435-6-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: df1a78ec-c2be-4b55-18c8-08deba4d5028
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|22082099003|18002099003|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info:
	oFbnEXvRVVewouwBS9LPhGpcaLrzhefjcbJ9EAvIkSUv54c3mlY+mjVUAEqScnbjxUX5rs/Xc2dzLFvRLM9BCO8opQFBQnWITNM/TcEN7Yj82OHrtCFsASAJA5+h8uejo3AA3heZLWPwVTCavGueG44/lQXfgCRNq2Pu+VRGS1W3cxAGtnJV/BFcvrryS3j017lEpWw71znG8/VWkxSYSBsSiZB5as3oRWe/Xv64J9ARPS+7HMSkWILsTkp/G7I2Ru5C0rqJaFMA1RZ5HuFdHFczmFAhUMysBoUni7IGqMrxIsHJT2SumiyJDqcBIGaarhPi4s1LwwGB5VJoXT67TA7JzVMCk40lGUEf1wbThSa/+RiepFDLbht51nbW3Ry9dhAMQ3jX6vdiErtfWOhCKmGRTUPdbCRpab3Ihk57XO8UUlR+21COAMhxmHXi+hULehBMjJ0ZYZabY1spBuPn/HvGdKOMmpLFZLUlGOW9Iy6fw1oyckrVYIDcsXiuO9bbysiG6hFWWoHsg2EeACzgpWfuQ0UiT/cpyr5wEXydjc/JLL99agQzCJNEVp8y1o1il0GJCu9HcHXI5RUZUjTVMKQ9i4NDSnjVhTyE9uUCgMJ3V6SL1UC3nMX8VitHSYJ2eBhExX4Hu6F1rbtYGeUV5cXD3fJYaKR0eR4h3YcSf0KXwJId1m6BI5gdv2lhK73VREOycjJVPjVRCMkqSRDFcVUCgivBZ7sqdxifU3Ebfu4aG7qXbxxkwNBfC329rfit
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(22082099003)(18002099003)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xn2gNmEgqPgwvEdG5ZSCXagpkOTpn3mWt378W/L34NxpAQrX6vOFl0aAjEER?=
 =?us-ascii?Q?TK3B7rxgHIVHcvFWuoCpEOsfdzZSV67elWM5P4bBNGv/Ji0tNr6Z1fhXt6kM?=
 =?us-ascii?Q?4JVSANZ4vgOQjK//mfOQxpUjYDAFtR71r5r8iEDq9LddKz0BK1N/WURunXmP?=
 =?us-ascii?Q?4PbSwXLlw7ekp1E5Z0xf/cGbIs6ewSJRkyWE/E3p9CKbOTv83xmmebBnduf2?=
 =?us-ascii?Q?WEWzWjpbFzXf/ftUaiYsacr8OFYArTYYVxICykeeHtutkMt0xJzAf7L5JMKW?=
 =?us-ascii?Q?aAhfjMOH/KwHv+boOfyaRp/dFWG6r8ZBv9n4S0KLURivB9CQBbty5Ol0huL8?=
 =?us-ascii?Q?Y8kABx4iQvpfPqejRdgcRwn1GczrFPqyD95ftBITO8t08l/AA56pJ/1l8+71?=
 =?us-ascii?Q?bMOM5q+97OxpcVt575k5RqPgOqhcEX9vL45s6abQl9qk3QMRwYnVcRj8lkOp?=
 =?us-ascii?Q?yChr2NGtXJLY00CP7mx9HAp/Up/UilhjGdvh3H8f3jXBbHwaNxAV6+OdCFJL?=
 =?us-ascii?Q?nQM8M591XuT0CWjZO6yAdXUEnXEusuOada92Yb30v32viG4QwD7nneXoUNkt?=
 =?us-ascii?Q?qA8gvctgTTpgwcZNrfho9O3PaSAjN02mgDZPDl8iBGRfS2Gz79cycTD7kWTX?=
 =?us-ascii?Q?74l7NXqAml6GAXFlSkDOXqLtlFYU5PW6KG2Dj83pR5TjCwScMepPlZrlOavY?=
 =?us-ascii?Q?QUeVBWIrSYRSkuroKVfhLhxRCRaWN6gtal3E0680rost6UYkOH2ysxwlRrSF?=
 =?us-ascii?Q?Lutc+1ZQpeGHCUjgKnj2zqARwV0yquIJ0YhosFk6Dw/XPIhmyW5XNXp7WmZm?=
 =?us-ascii?Q?/FPqnQmgHK7H0aPQKcQ5q7FlUrTDR+mxw6xBRUk9P3ScQs+mMA52tY4Yeilo?=
 =?us-ascii?Q?rUXT0kKYl/K6MkRIAaaXf0BOKy0qRsB8YAg0QARjpvi0aAcuJOEdjf5OQdmd?=
 =?us-ascii?Q?rfYND7KkpG90dKcuZ3TUjVVN4Qtqz0u3b3Efv1SGMRdwg1J9QBpfBpQgicgt?=
 =?us-ascii?Q?stRCR2f4w2ebFj7uQFw1nJXazo0BlJrMQ43wzLUP+hF9lCAVmF9Tun6IyoAH?=
 =?us-ascii?Q?zxlyzzafuhjnjTbCaJsbEuNyDy1tMxsL3ehWdvJfbAZfNHVmURnw8Endr/PI?=
 =?us-ascii?Q?MyJ7bbVAM+oHOgzsp2fxzvz34xu1vwKmGcaa1PpHoqJEQbuKMP4cSQ4aXAL1?=
 =?us-ascii?Q?udQFRg0pjkxYMv0W8WKNsKbdLdKRD8a6DzKxYLX0sCJrRfDwGdgc0XMWoBdv?=
 =?us-ascii?Q?8pSt0OBcfQqufh59H8CfDrIAVIQpz24UGgxD3o2YGy73QOpe15cBXyWoe2Wr?=
 =?us-ascii?Q?1OQa8jGyzw+1h9krPZ+myiJKuYMlOoJqM0rLPZP8OSS0wiNnWSl9tCtS0zrP?=
 =?us-ascii?Q?jgErtABnwbOgJD8yUNOpGWAca8jhqsQgdoMk+2x1v269sJ/GfnWSQ6gmv3f8?=
 =?us-ascii?Q?yWI9WaNhRX86ZyEDWq/5S2mNK+dYmAjY98A+4Mxmw44pvrkfGwvRdBMJRdez?=
 =?us-ascii?Q?jPM3UgmVkv6uRPnFcthxftI7XG6eVp16VFScmr5w9fIEgj/9VRR2qBo+c23P?=
 =?us-ascii?Q?J9mICspiBVG1+dVSWlA7KjRv/ZjkMkemKMm6PwPffauF2ewjUMg1wXnuSH1P?=
 =?us-ascii?Q?LRxodamCRZ+EaHOZMJgthRmatWIJNl0KqLNBx6nD9H6DajV1jhgmFnWZeeZL?=
 =?us-ascii?Q?uN6Nl0Cc0mleTpoDPTR10LS1lal4GqfWtsLq5E0kiNMoifQyWvPp/oln5pVS?=
 =?us-ascii?Q?zuKw9Z1HTZn1c4fuRS6FwVMxYD8JFs4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1a78ec-c2be-4b55-18c8-08deba4d5028
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:03:55.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7s7Sxy6UyUkxs+X02ON/TKc37TRcq+EsrfvdeOFOPgG1agEl2OtlGNCvyDhhMls+CRNBhelK3Gvk08eg3LcUIMJmr4czKBvhbMVEwodX6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6982
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33072-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 63D9D5C99CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E audio subsystem has a different register layout compared to
R-Car Gen2/Gen3/Gen4, as described below:

- Different base address organization (SCU, ADG, SSIU, SSI as
  separate regions accessed by name)
- Additional registers: AUDIO_CLK_SEL3, SSI_MODE3, SSI_CONTROL2
- Different register offsets within each region

Add RZ/G3E SoC's audio subsystem register layouts and probe support.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v7: No changes

v6: No changes

v5:
 - Simplify flags layout comment per Kuninori's feedback.
 - RSND_SOC_MASK fix moved to dedicated patch 02/14.

v4:
 - Fix RSND_SOC_MASK to (0xF << 4) to avoid overlap with
   RSND_RZ_MASK.
 - Add comment documenting flag nibble layout.

v3: No changes
v2: No changes

 sound/soc/renesas/rcar/core.c |   1 +
 sound/soc/renesas/rcar/gen.c  | 180 ++++++++++++++++++++++++++++++++++
 sound/soc/renesas/rcar/rsnd.h |  26 ++++-
 3 files changed, 204 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index a60b7a5d90ad..7169d0ef8f90 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -106,6 +106,7 @@ static const struct of_device_id rsnd_of_match[] = {
 	{ .compatible = "renesas,rcar_sound-gen4", .data = (void *)RSND_GEN4 },
 	/* Special Handling */
 	{ .compatible = "renesas,rcar_sound-r8a77990", .data = (void *)(RSND_GEN3 | RSND_SOC_E) },
+	{ .compatible = "renesas,r9a09g047-sound", .data = (void *)(RSND_RZ3 | RSND_RZG3E) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rsnd_of_match);
diff --git a/sound/soc/renesas/rcar/gen.c b/sound/soc/renesas/rcar/gen.c
index d1f20cde66be..05d5f656fb01 100644
--- a/sound/soc/renesas/rcar/gen.c
+++ b/sound/soc/renesas/rcar/gen.c
@@ -464,6 +464,184 @@ static int rsnd_gen1_probe(struct rsnd_priv *priv)
 	return ret_adg | ret_ssi;
 }
 
+/*
+ *		RZ/G3E Generation
+ */
+static int rsnd_rzg3e_probe(struct rsnd_priv *priv)
+{
+	static const struct rsnd_regmap_field_conf conf_ssiu[] = {
+		RSND_GEN_S_REG(SSI_MODE1,		0x804),
+		RSND_GEN_S_REG(SSI_MODE2,		0x808),
+		RSND_GEN_S_REG(SSI_MODE3,		0x80c),
+		RSND_GEN_S_REG(SSI_CONTROL,		0x810),
+		RSND_GEN_S_REG(SSI_CONTROL2,		0x814),
+		RSND_GEN_S_REG(SSI_SYS_STATUS0,		0x840),
+		RSND_GEN_S_REG(SSI_SYS_STATUS1,		0x844),
+		RSND_GEN_S_REG(SSI_SYS_STATUS2,		0x848),
+		RSND_GEN_S_REG(SSI_SYS_STATUS3,		0x84c),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE0,	0x850),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE1,	0x854),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE2,	0x858),
+		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE3,	0x85c),
+		RSND_GEN_M_REG(SSI_BUSIF0_MODE,		0x0,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF0_ADINR,	0x4,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF0_DALIGN,	0x8,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF1_MODE,		0x20,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF1_ADINR,	0x24,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF1_DALIGN,	0x28,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF2_MODE,		0x40,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF2_ADINR,	0x44,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF2_DALIGN,	0x48,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF3_MODE,		0x60,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF3_ADINR,	0x64,	0x80),
+		RSND_GEN_M_REG(SSI_BUSIF3_DALIGN,	0x68,	0x80),
+		RSND_GEN_M_REG(SSI_MODE,		0xc,	0x80),
+		RSND_GEN_M_REG(SSI_CTRL,		0x10,	0x80),
+		RSND_GEN_M_REG(SSI_INT_ENABLE,		0x18,	0x80),
+		RSND_GEN_S_REG(SSI9_BUSIF0_MODE,	0x480),
+		RSND_GEN_S_REG(SSI9_BUSIF0_ADINR,	0x484),
+		RSND_GEN_S_REG(SSI9_BUSIF0_DALIGN,	0x488),
+		RSND_GEN_S_REG(SSI9_BUSIF1_MODE,	0x4a0),
+		RSND_GEN_S_REG(SSI9_BUSIF1_ADINR,	0x4a4),
+		RSND_GEN_S_REG(SSI9_BUSIF1_DALIGN,	0x4a8),
+		RSND_GEN_S_REG(SSI9_BUSIF2_MODE,	0x4c0),
+		RSND_GEN_S_REG(SSI9_BUSIF2_ADINR,	0x4c4),
+		RSND_GEN_S_REG(SSI9_BUSIF2_DALIGN,	0x4c8),
+		RSND_GEN_S_REG(SSI9_BUSIF3_MODE,	0x4e0),
+		RSND_GEN_S_REG(SSI9_BUSIF3_ADINR,	0x4e4),
+		RSND_GEN_S_REG(SSI9_BUSIF3_DALIGN,	0x4e8),
+	};
+	static const struct rsnd_regmap_field_conf conf_scu[] = {
+		RSND_GEN_M_REG(SRC_I_BUSIF_MODE,	0x0,	0x20),
+		RSND_GEN_M_REG(SRC_O_BUSIF_MODE,	0x4,	0x20),
+		RSND_GEN_M_REG(SRC_BUSIF_DALIGN,	0x8,	0x20),
+		RSND_GEN_M_REG(SRC_ROUTE_MODE0,		0xc,	0x20),
+		RSND_GEN_M_REG(SRC_CTRL,		0x10,	0x20),
+		RSND_GEN_M_REG(SRC_INT_ENABLE0,		0x18,	0x20),
+		RSND_GEN_M_REG(CMD_BUSIF_MODE,		0x184,	0x20),
+		RSND_GEN_M_REG(CMD_BUSIF_DALIGN,	0x188,	0x20),
+		RSND_GEN_M_REG(CMD_ROUTE_SLCT,		0x18c,	0x20),
+		RSND_GEN_M_REG(CMD_CTRL,		0x190,	0x20),
+		RSND_GEN_S_REG(SCU_SYS_STATUS0,		0x1c8),
+		RSND_GEN_S_REG(SCU_SYS_INT_EN0,		0x1cc),
+		RSND_GEN_S_REG(SCU_SYS_STATUS1,		0x1d0),
+		RSND_GEN_S_REG(SCU_SYS_INT_EN1,		0x1d4),
+		RSND_GEN_M_REG(SRC_SWRSR,		0x200,	0x40),
+		RSND_GEN_M_REG(SRC_SRCIR,		0x204,	0x40),
+		RSND_GEN_M_REG(SRC_ADINR,		0x214,	0x40),
+		RSND_GEN_M_REG(SRC_IFSCR,		0x21c,	0x40),
+		RSND_GEN_M_REG(SRC_IFSVR,		0x220,	0x40),
+		RSND_GEN_M_REG(SRC_SRCCR,		0x224,	0x40),
+		RSND_GEN_M_REG(SRC_BSDSR,		0x22c,	0x40),
+		RSND_GEN_M_REG(SRC_BSISR,		0x238,	0x40),
+		RSND_GEN_M_REG(CTU_SWRSR,		0x500,	0x100),
+		RSND_GEN_M_REG(CTU_CTUIR,		0x504,	0x100),
+		RSND_GEN_M_REG(CTU_ADINR,		0x508,	0x100),
+		RSND_GEN_M_REG(CTU_CPMDR,		0x510,	0x100),
+		RSND_GEN_M_REG(CTU_SCMDR,		0x514,	0x100),
+		RSND_GEN_M_REG(CTU_SV00R,		0x518,	0x100),
+		RSND_GEN_M_REG(CTU_SV01R,		0x51c,	0x100),
+		RSND_GEN_M_REG(CTU_SV02R,		0x520,	0x100),
+		RSND_GEN_M_REG(CTU_SV03R,		0x524,	0x100),
+		RSND_GEN_M_REG(CTU_SV04R,		0x528,	0x100),
+		RSND_GEN_M_REG(CTU_SV05R,		0x52c,	0x100),
+		RSND_GEN_M_REG(CTU_SV06R,		0x530,	0x100),
+		RSND_GEN_M_REG(CTU_SV07R,		0x534,	0x100),
+		RSND_GEN_M_REG(CTU_SV10R,		0x538,	0x100),
+		RSND_GEN_M_REG(CTU_SV11R,		0x53c,	0x100),
+		RSND_GEN_M_REG(CTU_SV12R,		0x540,	0x100),
+		RSND_GEN_M_REG(CTU_SV13R,		0x544,	0x100),
+		RSND_GEN_M_REG(CTU_SV14R,		0x548,	0x100),
+		RSND_GEN_M_REG(CTU_SV15R,		0x54c,	0x100),
+		RSND_GEN_M_REG(CTU_SV16R,		0x550,	0x100),
+		RSND_GEN_M_REG(CTU_SV17R,		0x554,	0x100),
+		RSND_GEN_M_REG(CTU_SV20R,		0x558,	0x100),
+		RSND_GEN_M_REG(CTU_SV21R,		0x55c,	0x100),
+		RSND_GEN_M_REG(CTU_SV22R,		0x560,	0x100),
+		RSND_GEN_M_REG(CTU_SV23R,		0x564,	0x100),
+		RSND_GEN_M_REG(CTU_SV24R,		0x568,	0x100),
+		RSND_GEN_M_REG(CTU_SV25R,		0x56c,	0x100),
+		RSND_GEN_M_REG(CTU_SV26R,		0x570,	0x100),
+		RSND_GEN_M_REG(CTU_SV27R,		0x574,	0x100),
+		RSND_GEN_M_REG(CTU_SV30R,		0x578,	0x100),
+		RSND_GEN_M_REG(CTU_SV31R,		0x57c,	0x100),
+		RSND_GEN_M_REG(CTU_SV32R,		0x580,	0x100),
+		RSND_GEN_M_REG(CTU_SV33R,		0x584,	0x100),
+		RSND_GEN_M_REG(CTU_SV34R,		0x588,	0x100),
+		RSND_GEN_M_REG(CTU_SV35R,		0x58c,	0x100),
+		RSND_GEN_M_REG(CTU_SV36R,		0x590,	0x100),
+		RSND_GEN_M_REG(CTU_SV37R,		0x594,	0x100),
+		RSND_GEN_M_REG(MIX_SWRSR,		0xd00,	0x40),
+		RSND_GEN_M_REG(MIX_MIXIR,		0xd04,	0x40),
+		RSND_GEN_M_REG(MIX_ADINR,		0xd08,	0x40),
+		RSND_GEN_M_REG(MIX_MIXMR,		0xd10,	0x40),
+		RSND_GEN_M_REG(MIX_MVPDR,		0xd14,	0x40),
+		RSND_GEN_M_REG(MIX_MDBAR,		0xd18,	0x40),
+		RSND_GEN_M_REG(MIX_MDBBR,		0xd1c,	0x40),
+		RSND_GEN_M_REG(MIX_MDBCR,		0xd20,	0x40),
+		RSND_GEN_M_REG(MIX_MDBDR,		0xd24,	0x40),
+		RSND_GEN_M_REG(MIX_MDBER,		0xd28,	0x40),
+		RSND_GEN_M_REG(DVC_SWRSR,		0xe00,	0x100),
+		RSND_GEN_M_REG(DVC_DVUIR,		0xe04,	0x100),
+		RSND_GEN_M_REG(DVC_ADINR,		0xe08,	0x100),
+		RSND_GEN_M_REG(DVC_DVUCR,		0xe10,	0x100),
+		RSND_GEN_M_REG(DVC_ZCMCR,		0xe14,	0x100),
+		RSND_GEN_M_REG(DVC_VRCTR,		0xe18,	0x100),
+		RSND_GEN_M_REG(DVC_VRPDR,		0xe1c,	0x100),
+		RSND_GEN_M_REG(DVC_VRDBR,		0xe20,	0x100),
+		RSND_GEN_M_REG(DVC_VOL0R,		0xe28,	0x100),
+		RSND_GEN_M_REG(DVC_VOL1R,		0xe2c,	0x100),
+		RSND_GEN_M_REG(DVC_VOL2R,		0xe30,	0x100),
+		RSND_GEN_M_REG(DVC_VOL3R,		0xe34,	0x100),
+		RSND_GEN_M_REG(DVC_VOL4R,		0xe38,	0x100),
+		RSND_GEN_M_REG(DVC_VOL5R,		0xe3c,	0x100),
+		RSND_GEN_M_REG(DVC_VOL6R,		0xe40,	0x100),
+		RSND_GEN_M_REG(DVC_VOL7R,		0xe44,	0x100),
+		RSND_GEN_M_REG(DVC_DVUER,		0xe48,	0x100),
+	};
+	static const struct rsnd_regmap_field_conf conf_adg[] = {
+		RSND_GEN_S_REG(BRRA,			0x00),
+		RSND_GEN_S_REG(BRRB,			0x04),
+		RSND_GEN_S_REG(BRGCKR,			0x08),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL0,		0x0c),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL1,		0x10),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL2,		0x14),
+		RSND_GEN_S_REG(AUDIO_CLK_SEL3,		0x18),
+		RSND_GEN_S_REG(DIV_EN,			0x30),
+		RSND_GEN_S_REG(SRCIN_TIMSEL0,		0x34),
+		RSND_GEN_S_REG(SRCIN_TIMSEL1,		0x38),
+		RSND_GEN_S_REG(SRCIN_TIMSEL2,		0x3c),
+		RSND_GEN_S_REG(SRCIN_TIMSEL3,		0x40),
+		RSND_GEN_S_REG(SRCIN_TIMSEL4,		0x44),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL0,		0x48),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL1,		0x4c),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL2,		0x50),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL3,		0x54),
+		RSND_GEN_S_REG(SRCOUT_TIMSEL4,		0x58),
+		RSND_GEN_S_REG(CMDOUT_TIMSEL,		0x5c),
+	};
+	static const struct rsnd_regmap_field_conf conf_ssi[] = {
+		RSND_GEN_M_REG(SSICR,			0x00,	0x40),
+		RSND_GEN_M_REG(SSISR,			0x04,	0x40),
+		RSND_GEN_M_REG(SSIWSR,			0x20,	0x40),
+	};
+	int ret;
+
+	ret = rsnd_gen_regmap_init(priv, 10, RSND_BASE_SCU, "scu", conf_scu);
+	if (ret < 0)
+		return ret;
+
+	ret = rsnd_gen_regmap_init(priv, 1, RSND_BASE_ADG, "adg", conf_adg);
+	if (ret < 0)
+		return ret;
+
+	ret = rsnd_gen_regmap_init(priv, 10, RSND_BASE_SSIU, "ssiu", conf_ssiu);
+	if (ret < 0)
+		return ret;
+
+	return rsnd_gen_regmap_init(priv, 10, RSND_BASE_SSI, "ssi", conf_ssi);
+}
+
 /*
  *		Gen
  */
@@ -487,6 +665,8 @@ int rsnd_gen_probe(struct rsnd_priv *priv)
 		ret = rsnd_gen2_probe(priv);
 	else if (rsnd_is_gen4(priv))
 		ret = rsnd_gen4_probe(priv);
+	else if (rsnd_is_rzg3e(priv))
+		ret = rsnd_rzg3e_probe(priv);
 
 	if (ret < 0)
 		dev_err(dev, "unknown generation R-Car sound device\n");
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index f3f1ad1180f8..e917aa12fa80 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -143,13 +143,16 @@ enum rsnd_reg {
 	AUDIO_CLK_SEL0,
 	AUDIO_CLK_SEL1,
 	AUDIO_CLK_SEL2,
+	AUDIO_CLK_SEL3,
 
 	/* SSIU */
 	SSI_MODE,
 	SSI_MODE0,
 	SSI_MODE1,
 	SSI_MODE2,
+	SSI_MODE3,
 	SSI_CONTROL,
+	SSI_CONTROL2,
 	SSI_CTRL,
 	SSI_BUSIF0_MODE,
 	SSI_BUSIF1_MODE,
@@ -641,14 +644,28 @@ struct rsnd_priv {
 	struct platform_device *pdev;
 	spinlock_t lock;
 	unsigned long flags;
+
+	/*
+	 * Flags layout: 0xDCBA
+	 *
+	 * A: R-Car generation (Gen1/Gen2/Gen3/Gen4)
+	 * B: R-Car SoC variant (e.g. SOC_E for E1/E2/E3)
+	 * C: RZ series generation
+	 * D: RZ series SoC identifier (e.g. RZG3E)
+	 *
+	 * Bits 16+ are used for capability flags.
+	 */
 #define RSND_GEN_MASK	(0xF << 0)
 #define RSND_GEN1	(1 << 0)
 #define RSND_GEN2	(2 << 0)
 #define RSND_GEN3	(3 << 0)
 #define RSND_GEN4	(4 << 0)
-#define RSND_SOC_MASK	(0xF << 4)
-#define RSND_SOC_E	(1 << 4) /* E1/E2/E3 */
-
+#define RSND_SOC_MASK	(0xF << 4)  /* nibble B */
+#define RSND_SOC_E	(1 << 4)    /* E1/E2/E3 */
+#define RSND_RZ_MASK	(0xF << 8)  /* nibble C */
+#define RSND_RZ3	(3 << 8)
+#define RSND_RZ_ID_MASK	(0xF << 12) /* nibble D */
+#define RSND_RZG3E	(1 << 12)
 	/*
 	 * below value will be filled on rsnd_gen_probe()
 	 */
@@ -727,6 +744,9 @@ struct rsnd_priv {
 #define rsnd_is_gen3_e3(priv)	(((priv)->flags & \
 					(RSND_GEN_MASK | RSND_SOC_MASK)) == \
 					(RSND_GEN3 | RSND_SOC_E))
+#define rsnd_is_rzg3e(priv) (((priv)->flags & \
+				(RSND_RZ_MASK | RSND_RZ_ID_MASK)) == \
+					(RSND_RZ3 | RSND_RZG3E))
 
 #define rsnd_flags_has(p, f) ((p)->flags & (f))
 #define rsnd_flags_set(p, f) ((p)->flags |= (f))
-- 
2.25.1


