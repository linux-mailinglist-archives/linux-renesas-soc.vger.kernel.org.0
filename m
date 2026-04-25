Return-Path: <linux-renesas-soc+bounces-31645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE6CGKkr7GmVVAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 04:49:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7561E464CC8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 04:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82458300D840
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 02:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC3C1FCF41;
	Sat, 25 Apr 2026 02:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="I42GCZk+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A83175A62;
	Sat, 25 Apr 2026 02:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777085277; cv=fail; b=nolWxe///d7IfBh78JJFG0hFC/A03BMms9bAFNtW3zlEnxW58PexPh37lfWIXkm0W5+4WpHVHfROZza26YVAYu5hzslsSpEu9+7h1JvWPkbR6EZNc6i19I9ZtYjKGpR2gV114y+u1PfXBSZI7Qnu4TUen6MSof8WwuCiGKcucNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777085277; c=relaxed/simple;
	bh=CBo2IFgGkcuVTOohLb8HFXBBEeB3wZKtQ/ftxGz0Dfg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FpYHXhqQuRpGkWaliYQF2WNUnjNCIG101MCxmtgbhusroiYurERhB7OCewiKYsgKHM10FyVdH8dswYunqMDEdxvmmpDCy+n6e+Cs1QrNZi1Ua7C5Mnce6XLBroffHVrVaZ4qlOCkJbVN2ekETmD6AIRAr2SWp2Q7vW/lZDuHL3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=I42GCZk+; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlqqdIzKvaYHth9HT8Tt6GeWMYkFmesiKErnMtcDjmoTE5nI+M738mHsVkTupivhTAroSBWlg4owAMc+mAs7iepCdAsE8x4+pzHnd+HQUBImo99QARx/CKNFS54Zf/aZy4s8KJvi4STs4uCs3Z1BZYSeHhZTtH+7+4khbQQRLVXO5aN+5so6Z7huUY5Nb7GvExVTbytcKLBayAlc/w/shH22/li8utUiVNhJhSvJQgv446InW0BVoIREudxcinmEbazEXrjqOa2Zn8NtBubqlyYk3IsW2y2CemYS6RoCC/ONmUc/QkK2a+VlWCQmqmyZBClOBKJg47U6Y6Z/aINoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4gMXLKUjv0kmwvon1kD0GxwIY/OeZFqi4OiDZRPRZc=;
 b=uGHkZkC1H3MkDSB2nysrYOoE4FzUt6ECE5kjWzA5c5NWbiLm0cM4eOmLo8y/duX0aHNbh2xhMJMfALcpQNhjKAzEJ0sxZVAfyPupbgu8AwdsbVGQVOaV8NF7xWLRkAoY0LrdLhhbMqRjj9hXZ7XZimdj2zQrKoByN7yAJD/KruEQQXsiiANkvdAMyQXbeee2UocEQWPJ74Cn6evMrBYfx1aXpv4gUGnQUM17iHXpbIMqDdatJmdJySFCSZJMALQ14LegTBNRDZPA+pkgSWZSP6ifrVfJDpb7brALfTHAZY3NWCdc0X6qB/7OigQaGYwkN7P4gkkDoOoVy6vDEp3n5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4gMXLKUjv0kmwvon1kD0GxwIY/OeZFqi4OiDZRPRZc=;
 b=I42GCZk+7vRPyNjbNWVljMmxm0Nt6/83cSslMKwRehQiVL+cJ9XgJ7pfRPFZvTu0N1g4JU7LC3YBzF5wXK+5fihtKLv8wsysREohpEoGHIeLzifxQtOQQmBDalAT6ElCUyDrWJLJh6SLHwURHzNTFvfU4aA9KlnFeuI1URc4wJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB7755.jpnprd01.prod.outlook.com (2603:1096:604:17a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.23; Sat, 25 Apr
 2026 02:47:53 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9846.023; Sat, 25 Apr 2026
 02:47:53 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: fabrizio.castro.jz@renesas.com,
	broonie@kernel.org
Cc: cosmin-gabriel.tanislav.xa@renesas.com,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH] spi: rzv2h-rspi: Fix silent failure in clock setup error path
Date: Sat, 25 Apr 2026 02:47:25 +0000
Message-Id: <20260425024725.2393632-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0523.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3db::28) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9fb4b0-c4ed-4afc-55d0-08dea2750bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uKPIKx9hJl4uD1wipcgje7bSm26J4HXvEFj5EKouBsZ/E1yKFTqLLN6E844smt2L1m8DOabW+2Ygu54cHJgRqkoTKpmfAIS1PiFk4aqpkOHpkDVvYu/oyEG4G5YdKAwqzEv8pkYreRIkT+vwKDF6KRpcheTwHgIRuYO1Zvs+9wNtWN1rQ/SLIZeMUJBeOdBa7qmzfJB+j+dFcZpG3BU7YZCdwG+YyhySMG9ozlqwMkhEhqedZ/wRNuC7JHaGLQAPKgCQE2MdDlUfWl2Sba5wxJAAMKMERTe0sMmHI9tFOcPOY1RAyjqOhedzhYVYQBVwDra1Zke6ppqRfDsV1pUUW9aZ93KDzFRa8wPpALgKea3hp1sbKISoQCzHo/cjq4NqD/VALTBrNS6H823MyHQ7VbYAh22V32PGFYBcBtOY+XS9+LI0/Kr/Xjzp3wFJOK9NJsuEIxv/WfVwa2npjbS5BHH2lBUjxY+80PpeUEdTUGX9zJMa4NKogWWP+ed6MRlj91UTmqk03lpnKQ3Gcw3VoWnIesw02yk1+9H/BXUAlBz9AFDf3i5Z8Eu2XMC8/Axc+OgxiHX+uTKh1bpLnWMmMeFJXu2hP+fYHCLUaeYa14M8M0n79ZSrRXCqlnTEXIIlakKYCqvjGckZEtOzabMplVDmBrn/yHIbnjrisup9YAtmFsshiTbYml3ykAlpajMxFTvJQuVeewX5DOJN1PYkVKSAO0Nh7CPiGZOSM+Wi36IFMI7/kfVfexgMCEh6Oq3EID/uM2Bd+0yuhyEhnrIy5wezX3fx95+n29H8ESx9lYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mwL652F7hmFx97G5ml1UTkYij79/htftxYNwhqJVE644mpb7qZtpn4prRVV9?=
 =?us-ascii?Q?P1Bpgvr1lnLIGyUoKIq9ldR5vgSHw+qC6InJkDCIACIl8L/VJrgcxev5K3XP?=
 =?us-ascii?Q?aOmVI+CBQoZRql6uQ7ns8XJMMbQuAaYasHqmggMO/JPjmGRr9qdFQ2UN2088?=
 =?us-ascii?Q?V2rY/l0TWs4LCRREn3+Wmti+VSyvgLaTAiQ4dnzz+ZgVKmHgVmadgjCaOU0m?=
 =?us-ascii?Q?StVq/HXhoVhx2ZvGYbc/hCHMARo5Yrl1VUYvAfpeyBGPxzkkfmUXfy5E4lVh?=
 =?us-ascii?Q?2o3LuBdQPHQdoGjyz6d3mbFUTMWtW6mXltrY8JgezOfw93fCzNfITey9viwP?=
 =?us-ascii?Q?D2AskQP7VNv3Hw0f1ujSL1GtONHkK8TNXLdiOi/1FlWYlYfL3croOtQIR8i1?=
 =?us-ascii?Q?smXZUX7oe3fsmlSx7geRcsGTI6GHP9ozP0t4MXK/dkfM9lTCfMO6Or1U2QiV?=
 =?us-ascii?Q?A8gNA2FZvMTfvW3tZw0cgzf/liXFT7rDHaGslxUDfLLrI2bL623Dys9XSrkr?=
 =?us-ascii?Q?3OesYw+PS/SDALKfPG++rDqBLtg9lR+sNYoX39sizBPLbrH1sk2M5egwQwak?=
 =?us-ascii?Q?553YLI0azqKScnpNnGWQp8gKkGOgtu3dk8IsAIFJKM/X8kKBHnjweJdIFnv7?=
 =?us-ascii?Q?va3g5u2ynuYu2XjrP+Y8HZqN07Jg6IbKJpk8vBfhM8Jy69MKVh05OV4yHsj7?=
 =?us-ascii?Q?Cb+K/H/CzhstUv8wzNbf8mlvRcHpINg/1wXH/+gZoq9dC0xv/WLqyxtN+yBW?=
 =?us-ascii?Q?KVbyItc21iHzc8BnriLGWTe1X1qQL/jeh0H73imL4soNy1CQNVTqcBQuj7Yr?=
 =?us-ascii?Q?xuBem0k/aNOPQZqiYYrLzZv4W9tbUwxTaElaYs6tgV/jlgzkMZpPwrxXJ5+g?=
 =?us-ascii?Q?IINUVK8AYWwFBUK4Rx57HP7Aw1pHlLRrkmzjo9UYoQqzHQHVq0AewSRB0kLj?=
 =?us-ascii?Q?BPRR7NpjDskQdTf/0g2ND47yRp2+AUYgKqZZR6p7JcdAf0TDJV8bOqeLsO3x?=
 =?us-ascii?Q?bfC6t4m5ekvCGVBYcDRdFzaM+ImuqNbR3hI2E6nzHznVL787Rkfe3FGt2ETI?=
 =?us-ascii?Q?MXYOBgOp4qnN0NZ6kcqaay8xxCriep4Z0e9TeNQBGWRqOZ4DhyKSCzADvzpq?=
 =?us-ascii?Q?pC0/fFJ/picZ2m3Nmq6H83hzqyFKnLOAsKRBueCN/W9Xk0kdLPkIFrg8z2b+?=
 =?us-ascii?Q?t7V1NvuhTckwFWuqWKsekMit4/4yHBv0OXqJS0j/Qn6zbLa0qKlIVeUg2QWd?=
 =?us-ascii?Q?2lfsLMjKRV/8Bd59c+lLxRik/PxRqKbANFczmDSq5w3j8T2FYtMXrRPb3i4s?=
 =?us-ascii?Q?EaaA9hpICjub9Ro4dzsQ31f0gpMYd23GZEw6map4Va+OELqdN9FkHZIl3PZf?=
 =?us-ascii?Q?hjHtM9vpEpiyAkTVodL7IgabGNRwEGtKT8oG5Apc1WcUfFMxc3YNcjtOCyF/?=
 =?us-ascii?Q?3lvBWpfmD0/TIyrnlQkIrUXOfsDC15/aMD5eH8FZvncEDiURnM5RlwG9a4T8?=
 =?us-ascii?Q?QWnNJ2cwlsulZXPQkOtH+Tsn5yuKgtH611NNc2qOQBsXDQL03a76EtVpJk2V?=
 =?us-ascii?Q?KaHU92mVIz9g/If2tlJt5QPqr38iSP9jgOdHzNFHibouTy2NzEg5kYFmxDJn?=
 =?us-ascii?Q?MgZlpZ6F0F3+A9B0exuollaRXucQpLLq/L7xWjdUzgoTP7OrI2NODgEpgDW2?=
 =?us-ascii?Q?k1+9DXsUzrq4buFTr3V+vrt2auaPLE3mgvvM0sxdLtXmevjgDeIvozGXjY/s?=
 =?us-ascii?Q?dOCt/ux+02Ko15NZ0yoZk2ASyJJi4NQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9fb4b0-c4ed-4afc-55d0-08dea2750bdb
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 02:47:53.0036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwOptY0rl2sp8O1BsoV1En4uwYKdnpxBWu/aM7iGiQmxw0hR76o8tEhMWrO2sPmK/0zc5WYfdzE3TfRUBfJBpjyM05NpxEb/EKGHZ3OzWzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7755
X-Rspamd-Queue-Id: 7561E464CC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[renesas.com,vger.kernel.org,gmail.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-31645-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]

rzv2h_rspi_setup_clock() is declared to return u32 but returns -EINVAL
when no valid clock parameters are found. Cast to u32, -EINVAL becomes
0xffffffea, which is a non-zero value. The caller in
rzv2h_rspi_prepare_message() guards against failure with:

	rspi->freq = rzv2h_rspi_setup_clock(rspi, speed_hz);
	if (!rspi->freq)
		return -EINVAL;

Because 0xffffffea is non-zero, the check is bypassed and the controller
proceeds to program SPBR/SPCMD with stale values, leading to an unknown
bit rate.

Return 0 on the failed-search path, consistent with the existing
clk_set_rate() failure path which already returns 0.

Fixes: 77d931584dd3 ("spi: rzv2h-rspi: make transfer clock rate finding chip-specific")
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/spi/spi-rzv2h-rspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index f45af5884638..1655efda7d20 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -579,7 +579,7 @@ static u32 rzv2h_rspi_setup_clock(struct rzv2h_rspi_priv *rspi, u32 hz)
 		rspi->info->find_pclk_rate(rspi->pclk, hz, &best_clock);
 
 	if (!best_clock.clk_rate)
-		return -EINVAL;
+		return 0;
 
 	ret = clk_set_rate(best_clock.clk, best_clock.clk_rate);
 	if (ret)
-- 
2.25.1


