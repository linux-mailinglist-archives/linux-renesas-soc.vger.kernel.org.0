Return-Path: <linux-renesas-soc+bounces-34374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JVmnBFOmOmq2CggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 17:29:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1F6B84B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 17:29:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=tolHCRKd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E3A030182AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2026 15:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15E73D9026;
	Tue, 23 Jun 2026 15:29:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B746B3D7D84;
	Tue, 23 Jun 2026 15:29:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782228560; cv=fail; b=NF4GSrPm1NxW2669WSUQwNPXjVaLvru3ebCTrWy9PFm8JXAAqpCLmBMB/kkBKhg83ts+MMwURuCrFCsaReosh60zbDtSlu5uBfvfLJm+Gjeqc8SgoE+Udpd8o0ogMDSGvUya7kHtGA+V5jRAXgfixA1eqW6AiFJcY+nWBBOweuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782228560; c=relaxed/simple;
	bh=DWf0RBHGu59x8V6Yk7PSB16RpzfICOjlGxLVa8iqwZA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Pa3qkp2WD7t+RI1p9dRzcycOECKiNV2Oda10HDG1jbBL7XbpLJfR3/J6XSff316h0f1s9zlNEnYuuaAkKaMbaU0klAtFpW+lFyBYkkV5lP3YdMgnQ0tmI/dtZRGTFE7EgXthk2u/OE5uifQGFm9uRuZIdzxnqUcItLvjKp3uhBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tolHCRKd; arc=fail smtp.client-ip=52.101.228.21
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/oMlgVQly/qE5PslZMmJA9GIrXFwzyV+OxthX25HxPY4ahNbqvePnCG5AORFFAPaHaSiSYnTjPYnN5YIednt15ARW5ZXA651cXZcnkriqLFLWLYio6A1GAcJ6EokZkBfVnrJEbcCbu0qrs87Jwh1YgFWO2W7DWs4RIlEDtcHHfMHg0SAmRnykbgOXtEp+8zlOxO0owpCAqitIpPQvMx+75muhwQW+40an8re5Y42k9o8A63PlS+tWBKGReg+h42K+8kMftDLFraDkWiHEongCqJALG8xBOfsupywiogwS1soaAafIX2KoO+LxkqbrZYZrPR7T/X9qGnCAF+OcNXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhSW2zG6ecT34CIFwFakc665kbr+mJJ73gw15AuV5Xg=;
 b=Gs1RLdlxI1QLKY8KrFOIRbSQqPywv6IGNtzAHpwfnnf4F6a9EXpNhYZYPbwXy9OfT7EFg+r4fZmuWOjlCpUznJqzDocPtIf0C4FNLf4wKn5sDEN7U51yGgqAiOauoHvJZCTcB35jZjvN8LyAOLdS2MpQRjZ+vmYWEeYM8rZbrtv+ArAFDjNVx0EeeVTsQa+zx2jd38h1RkZKyykO/4deMDoiEZPCC1QiSL+U2WV89eBkLXwRfN2kOQ/m7KrtjEutd0VxL0xN3BIycuDsXPoMmthwCSvBYZL4mgGq8dAJgML/WhZSGoAMgg07Y6nlOzlXAvJJ8ZUobKXqkn+p1ennng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhSW2zG6ecT34CIFwFakc665kbr+mJJ73gw15AuV5Xg=;
 b=tolHCRKdLh/hLp+CvA2SpudPSci4ktABsDq1tiHKnwmCqOhZWSX2C99Mh7R5P7j22M1v2YaS4Dffjkxh6esyMSfq6wCoN85d1hcLZIRFRRZnHjnuLKQh7teotj+JBWGz5BlOzwEitxt/rKIARMQVE0TrlyzoBZLadYt38IIuFII=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB10054.jpnprd01.prod.outlook.com (2603:1096:400:1ea::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 15:29:15 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 15:29:15 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: renesas: r9a09g047: Add LVDS clocks and resets
Date: Tue, 23 Jun 2026 17:28:49 +0200
Message-ID: <20260623152851.478573-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIXP296CA0014.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36c::17) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB10054:EE_
X-MS-Office365-Filtering-Correlation-Id: 56331d66-eda0-4bf0-4a3e-08ded13c2f0c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|56012099006|38350700014|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	RupZHcuJlk053KOqpHgAbPdh4oMD5P/mPezny1d7JDZBDxDfARE44IifJ+/63FTyM/tap46+yDu0shhU6Dds25CJ0p2S4cKCZ7rWq1kokaBWWZMOTzpsPF/tDq3e1wedUTiv2DRP6vYOBJznLsvCF/H+iGIUu2vmwkkC64xLubIQ9ZV5lkQrtdPtxVev5ZS+Vui/zm/7HpRJE0/TT+gJUJxzxjbGM6Wz1kGla4Bn5z/S7QhCfTwjUxUMwjkJxHZU4FydryBV7IsnQn6jRnXYMegu7tIaBPbngIxXmV442OrX9+BL4OzKDydQiE05dimzIYGXdEEv7lg1kTQGxWmeRiteoqPZ/s4iwgxeIRAcmkprAkU0Mcr4J56poaPa3dZewSAtZdjiRfBL/Fb3FFHBYjO3M/jTZUE5bHaTL0MXLSD/Njw4zIOSiswPR748MPdVUFno7dxewtMRvNryckcOt002eQg5oDrVS41ONc5yiBL8rFSew/dMopTZTD/jVg1big8Hgwx3LbdtPbUq2ezkV/64g6LLF6F2ZLAZQSVdDoTqAT4dQoZv6YpcUyt3OFD2f7dhignLJm3xxlTRfKbs/HezkwivZEUTz9mCQPsCXWkG2bgS6PdAqO0HogTKKUoAThDve5qFm+yTZSs0fr6/Aa9f7+Xr+50QsNf86TKhILkSRJWksNaUFbCI1kUJ/Jqkdvl/BdnGrxOhW1aImveXBBxQHdafGs70T7vvaPhTlu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(56012099006)(38350700014)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fZXy59eO268uUk5dgveR26zgMOi/8vcPJKaDoVe/JANf4fGerP9dJBqgQda6?=
 =?us-ascii?Q?tIX95Qg49FMiATZDSjtcAo19o1AI9pBE+LrwfL2OkBF2PpD677BbXmEtksKj?=
 =?us-ascii?Q?mz59LOtEr/fIHPWYDjVzjXT5BYnKJaqU+2jhXapS33A0p0+aPvm19OaJCtuQ?=
 =?us-ascii?Q?Z+oe+Pcnxi46kHWphp+EIR1Eio+udM3CieQP+SHQe42nzxiOTd3J9E90oXt0?=
 =?us-ascii?Q?Tf/2WHdRflRLVfxkwhKH9RHD65hE3EpzlY78VUNHdrXCRnfm7g42wyeNtEax?=
 =?us-ascii?Q?FCSKi/yhDj/bS120oJja/ey7EzqLqtHmrZjRlPNRPmUXnhsYN1BeYNb2uMnl?=
 =?us-ascii?Q?f1PSVz21JVCUxwj+nuj/8zcl247Xnk1ywjlisbeswFIbFDFpT2Vbm24aGB1D?=
 =?us-ascii?Q?8HoGT5jz5wzxu63+hE5dRy27HZeWyqnFzhGDEDUYI98JxkDredSgcsC7TWNn?=
 =?us-ascii?Q?kZoQG3zG/ehYQ/HXjohXsDlPqwib/nDJn26xchkadngVVvbxa/6SiTF8QMLa?=
 =?us-ascii?Q?tt09VtOV60dSt3mHD+jIw2ozgCKw//Cl3lJjufMSAtONCf8lPT/VscLZtYgC?=
 =?us-ascii?Q?pmRVx6Hq/ssTrl7qBC2oWTyxpk5Rjjnw29Y6wHaNrLafDxJ7JWoWvwbIBuTM?=
 =?us-ascii?Q?naM8pkqmxXsoAS0+XdcP0TviVZzj95UCUnnl6PTojLqTvqhWuElkW/aJp6hr?=
 =?us-ascii?Q?eoa5QhiqvHHVDuop9/uCYt2DVnYa/3AGh8EvHnoHk02GZ3ybP46S4ZjCuB1q?=
 =?us-ascii?Q?1FobDLFrNU++tFd3RvHYij7jNLR9WuO+95Y2gZZvgIF/dE8QJv4Pii2I85oL?=
 =?us-ascii?Q?gCRo62HqAc6a/Xgcvvdim3lUOch+BgK2zgyL6weI9slVT3PVs1acEzlxCd2P?=
 =?us-ascii?Q?VJhhIm5R+7NcAOJtNK2IKBqvlIl6Pw6Yc6eRTXg7poyFgSMMx71urQv8t6Vu?=
 =?us-ascii?Q?fvZzHQ99KBRw15tnqeQEmSEONsFMeGGkW7AmnaY5duNKnyazpi12yCp6UHPl?=
 =?us-ascii?Q?GJhVxqxm6S/iF7mrhHWb/ZUU0vDMXlylI7Mt90A1UDlw8JB6As4BRweeW5ah?=
 =?us-ascii?Q?jClZj7Jk529v3tb6shdwc5La1GquBblePqzcLkGmPyTivkt+HJh//8QyM8Oy?=
 =?us-ascii?Q?7gyQ6brxLR+knGYb5y+cEUDTojr/Jm5+dUNVt1hNqrpfBZ1/RF2XCAUcUYfF?=
 =?us-ascii?Q?j6T7+Y0egn7lM+EeQcQlajLzbMsF5tG9De9xYKrHs4QP8d5WU4MIeg07bu2s?=
 =?us-ascii?Q?fslySo66JscdYWer6lQ7bs5dtdPOR0pgaJJPGLgQs1PlydzhEtib1WoQteqJ?=
 =?us-ascii?Q?haOR4bCjCj9/nEFp/luSsxYcZ90kssRVuGykbaOyTbaCiga+3mq4T57lTn4E?=
 =?us-ascii?Q?X1lGFZHSuKlvs96f7r9xex+FHL+yD1PFAaaVE/wbaopEYBQBnPFdJqZ1vTk7?=
 =?us-ascii?Q?i+P6VKb9/vOnCKYA5rtMdwQ8OM/Sv0GBkdGH/lrZkSybNFen8LiRNOxJhqkw?=
 =?us-ascii?Q?K5nQc1xgIw6/7FLzjjOOtfQnMqw/7b8BkngsDQvu8ECVZZW4lh4leDAwnqpH?=
 =?us-ascii?Q?Qa7E3mK6r/Bxa9jXI4+CamtgBYse4bKN68xBttdfA1BlxO2ERsQGG7OX9gBs?=
 =?us-ascii?Q?IxlS8ppxPD/mB2I+ZmfW4RcVnn/jrRUf3wnEQtsr8u3vYsa6ygOi9v272Ctx?=
 =?us-ascii?Q?HRAcrs6uSOyVTsEvXlnkn4tMVolheLdyvnK+zSDTZx7hP9eZRUZAw+ZRDZjs?=
 =?us-ascii?Q?cc9LNfBpqgD6m1Rgz6PDRyhkOxlh7yfkH7yMh4IvmRaegYNcfZa+?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56331d66-eda0-4bf0-4a3e-08ded13c2f0c
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:29:15.1717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYrItkXrKhs8SWgMdYkapTtY7TXu0RwcR6Tq6k8hrl0iWmuE+HyLqO9As+OZTEkJQ7Q//RTEh1BYjbmlvyAuMG1QZMeEI2N98c95oX+yUkArMMvJZvPOIxllFY2kBlQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34374-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55B1F6B84B1

Add LVDS clocks and resets entries to the r9a09g047 CPG driver.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g047-cpg.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 94158b6834e6..875c01eaa695 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -534,6 +534,16 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(2, BIT(15))),
 	DEF_MOD("dsi_0_vclk2",			CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("lvds_top_clk_ch0",		CLK_PLLDSI0, 26, 0, 10, 22,
+						BUS_MSTOP(13, BIT(0))),
+	DEF_MOD("lvds_top_clk_ch1",		CLK_PLLDSI1, 26, 1, 10, 23,
+						BUS_MSTOP(13, BIT(0))),
+	DEF_MOD("lvds_top_clk_dot_ch0",		CLK_SMUX2_DSI0_CLK, 26, 2, 10, 24,
+						BUS_MSTOP(13, BIT(0))),
+	DEF_MOD("lvds_top_clk_dot_ch1",		CLK_SMUX2_DSI1_CLK, 26, 3, 10, 25,
+						BUS_MSTOP(13, BIT(0))),
+	DEF_MOD("lvds_top_pclk",		CLK_PLLDTY_DIV16, 26, 4, 10, 26,
+						BUS_MSTOP(13, BIT(0))),
 	DEF_MOD("lcdc_1_clk_a",			CLK_PLLDTY_ACPU_DIV2, 26, 8, 10, 30,
 						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
 	DEF_MOD("lcdc_1_clk_p",			CLK_PLLDTY_DIV16, 26, 9, 10, 31,
@@ -622,6 +632,7 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
+	DEF_RST(17, 10, 8, 11),		/* LVDS_TOP_RESET_N */
 	DEF_RST(17, 14, 8, 15),		/* LCDC_1_RESET_N */
 };
 
-- 
2.54.0


