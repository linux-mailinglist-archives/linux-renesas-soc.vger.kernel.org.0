Return-Path: <linux-renesas-soc+bounces-33086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJTFEGstFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33086-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:07:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B9A5C9A3E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72555300185C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E2B37D11D;
	Mon, 25 May 2026 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aQRPDPDF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CC737CD35;
	Mon, 25 May 2026 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707224; cv=fail; b=BXfdl6UKqtdC6H3XjHa2cY7pR8ZvOXsgci2YIEY6NLUZOVS1PNAgYO3ee8/ExpXs5Xulow+2/8I2D0DdZnC3lMgVUK3AKL+4TcmVktQJa2nn3fk0ztNoqS9xI2Q7K/jhAsysMRoUsscnGAEGgcps/H0ChlkOJm3CBb6QOqAGRuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707224; c=relaxed/simple;
	bh=HKZ7SjslaL8WZKXSPMn8oKEAtFh6Q80zIhrlyWzwQds=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WfyYATv/6jYrA6bioaHjNfmZOTC7qIIzY7z5rNLCThn1+1g7HeBas1JKxK8Q0gV3yXy+HHKdLusm1CfzE9lLzjZK7fJUocBWt5+G5HiWLMjolLp5uwgxlnWt7OgygDvRPHyl70sJEF48BOhG5g6SVfujFZ4t6aDKXsDvrCSQQ1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aQRPDPDF; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCIlcpIi3sNLKWnz+WR+JVWIkk2IIEgtWKgcb4pDzPro5jYZ4SphSO6358nzU9LAE2tHP/fpiZOD7BPh9ob0t32G7ecxbJ9XMKjodWTemkDScnDUHsJZgBow28ZnKfjrOFJWlqJZLfzWqeCUdasPh3khrItk2+pVIkrTRnB/7VDW90HlLB39Lmvm9dxsJPhEzEl36PS2jWtf9btjT3ziFiY+p0VaUbyazi6fpMapc/n1vmT0381/1TNcKTso+Uid7LlAz/yL9DqzEHvFNX+SsA2y8e9k0NtAdYm+33YHsHLR+K2xUgOopEdL+/yni0gO60kMCtTMbpy06mn1B5cObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RctkZgnLYr5X6nCvvCezoEehNsQJtd3uqezYJP4mzlc=;
 b=ef1M+UuhbqcgbWfxUBxj7xdIUHDYAS+rRFR0e9YnxYvOoAa6w1XmXv+6mPEddb6F/07PKuWIwJHF0iVBsWWUeBjhg9bhe7241jv2zG5vgAoJLRf3gCxgJo41BUtGhYD4vz6d0Ayae+Ojrfg84XP8+vUSKMWZpZcs+rqZELT4nPCBrzikiwmNAimncTwZp/NWXgK1iQ+7oXcvk+0quVy2tKQWkSul/Ur80tBbcJXb06VZYLE+ldRwUEqp2ZzJ4jGp+LExOWVxqoDUv1kCJMUX3uKsuth9rH4RvnyfSJXd9t6ERe7lusLcq6Dmgn8U8noKJHA43nOsOhjRz0uwcQg2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RctkZgnLYr5X6nCvvCezoEehNsQJtd3uqezYJP4mzlc=;
 b=aQRPDPDFt0FqN5YEus9iW4NwBcGb4z1J/RrXIVyABfCJ3ztAJwKUo3MBxV+YHzeEaKnF7Edf9ag6eWyUYAhJCU/xv98W+VFCxTphb+V2ND4Zivlmr07obcOTrYo5Y1pSfsQq4aZFW/Zc4VvdWMpRrZW7GzxhzcmD6GOSR6DELcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB8602.jpnprd01.prod.outlook.com (2603:1096:604:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:07:00 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:06:59 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: bmasney@redhat.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v4 0/8] arm64: dts: renesas: Add RZ/G3E audio enablement
Date: Mon, 25 May 2026 11:05:55 +0000
Message-Id: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::11) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OS3PR01MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0317db-8f09-4327-93f3-08deba4dbdde
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|11063799006|5023799004|6133799003|3023799007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dF1Fan7ZPMcgVe9+PVYu/B4wBkhMvE2V/xrMuexX4MKq5bWYjGYE5xm+2SIrPPMsT/z7GAlTCZYXKxN1II7SZcsQQQI19sGK97TZNoV6EOx32sVaY4gsiz69vWUkD8yw+REsCdtyrlGxdVKNKhh6RVxGjetziUW9kaHYdsEV91psM739G6WuH9LcM9Jg4t6CcMOvZLnhXw7qJ9MLo0MNcHzeAr4kejqZmJJXTfEyI3nmd67jTXVvm7dQaZOXKEh5ycre613+UNtZGowuu/KJHrT09sJr8czSyZuy05GoTdRG2oK/cC3MlVomdYe96iptgatq/unTnXuHBz5PdKzicky8C1XZScYo64GJ5EPjU8v5c56K8vLPxK83UUKX172y7MDUWK+j6KIk8lxmVC7a8/XT/wEQ8P5vvVTkrD0tBSes3K2xcMVmZeodthjJoY6IgMmi0w1zkVIQu+nWDJBtyuxIIVVZhG6sC6zIDkINHZsj6FS/VZWnML+CHAX1Kju5z0axpHB1MoI/E6VffepWxLe2J6gAWser+EhTHgTxejRHFK76yQ7WPXn0g0qsiKkIsUyGtqEFth+k5s1XnSOPxB5KRbnrX+pUjRdy+dy65Mq3AviybSw2h8yW8tgNNvSgr6K7i7hAf4fbXXBI86gwSG78437Bpmwvrn+I+EuS2KpM0rwA+lkqiFIBCghvWg+BWw1aO9uNBrwkI6rlwIMeRuzzHXROsR2gg47tvdmolFYprNHE9x1khX62Gw+necV3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(11063799006)(5023799004)(6133799003)(3023799007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ig9kI+v2VZmuoCZVJDEl5WJIST9UJj66w5TeWxJMRAKoYKTMdJ7L+eqo+nrs?=
 =?us-ascii?Q?+5LoaDYD3cHSO34Za1XMrITTWKD+EA96dhGwzFCdv9rvd47hNTz7be+u3Qgv?=
 =?us-ascii?Q?yD5oSTblIkgqCdfaW+XFuJys/XT+yULjE5G32MTPPTx/gycmBwZttRtoxYbC?=
 =?us-ascii?Q?CyQAgdOZC89h8fyhzOzm70/4zPAPVal2VRTvKf+HZu5eQTradH6IfRdEjfSl?=
 =?us-ascii?Q?KJlBk4kz8uUvqq4s7a25AZsswEaEutRZqhSPbCeUZQNOY/h6iSqjjf0xli/w?=
 =?us-ascii?Q?4Nna0ZRa557Lm/n3AW0g+VxBiwWAWQp4NihPqSUV3F4HPrrXO00C6X2+lxjY?=
 =?us-ascii?Q?2ESqY6/P8n5bfouJkpnQrKPpmaRJz9Q120DuYpqIlVi5ztoNn9a/Ur08OcsC?=
 =?us-ascii?Q?0FXYnHkPqFBxE9RtWymlVWsASjLERdwfff7NF8jIF/bScY2rMrbsU7QfQg/X?=
 =?us-ascii?Q?3bplk1/5HG1/6WpM5+lQaA7n7XSlF9iJD7q2buWXe7pX+7cvirvrCFhzBbYg?=
 =?us-ascii?Q?dDKYAOrnJKJn8XLqQK9zgHe+8/ktNup9Xy7OTHc1jgBOBKp4XahGuxGfxGKg?=
 =?us-ascii?Q?m5FcCdy72JibPGscEI2zSE5nxDsq11gxFMDxGTX/qkoanO/A9Mgi63+Qq3Jb?=
 =?us-ascii?Q?J0GTM8MeQcX+igIj2M1yWchMo6mNd9mH/3tAQ3NUrm1kStBX8+AS60CFeBUG?=
 =?us-ascii?Q?6zS9PPkZfYhWpjOk46sLH+yb1P1E1krdb7W8CQMsC68MsxXAmGPGRxnSqk2M?=
 =?us-ascii?Q?RgSyCnQJ9bVBbmz50iCJCtYEzEfcnh2mWneCdcGEewv2q9f4DhLlIfHJwwU4?=
 =?us-ascii?Q?3pe9pdNSCI2uu2yCiZPHH+MP7E87E0pJl3zU27kobF30OH2j9dENlFYKirIS?=
 =?us-ascii?Q?d0+qG9yCwAUehC9gWqJ9Gtl1CU2EcsRKjPYlIzI6szyHlXDwZMnjETQKMiD9?=
 =?us-ascii?Q?ISVCdTM7kmRksWgoSpPHrFJHJ/s2RDq1E2oy9oDOzGnrLzL0yNOvttb0FGCR?=
 =?us-ascii?Q?8zp/P+oHblQxq8w1D7wl9ZVFWjLhFcP5Om35X3CQ5fk0V86Snl3zep8bRvbV?=
 =?us-ascii?Q?1VL2ylbNl7eQXaonycCNmyjftONMSZgYOAxCWukAXnhQ0+yjbkNBBm2m3PGX?=
 =?us-ascii?Q?vHXMwTEpIH9+Ioz17T5HMphoPWxfnDglCU/30cBSsR0dS3IoWyBh3wh0LzNu?=
 =?us-ascii?Q?l7Hp7ruNeLHFD5UObYCW6ESKZLaWkhTpUDR32H+7AFOH3g1847ju/QJCRCtD?=
 =?us-ascii?Q?fagqAU5oHIits8PGFYcuW0g7eD3/bgKljjzzntAvIPnNAXcfBmYd5ZX1xjoD?=
 =?us-ascii?Q?bx4Vz2pxdvKH2mtuDIPPF6UeafGzQ7L65fesZq6UUE01sSNYiLlxG74h45SE?=
 =?us-ascii?Q?6NOB76Ic+zR4DpPDbWq27q9Wf0g/0drEET2U6LwFNm0wxYmBhtpvzAUITeNE?=
 =?us-ascii?Q?yzMxiIqBthauFMkc1Hjhr7FrUuXyZWBt+xqAbWS77uQZFq5imdsxsWkcbIAg?=
 =?us-ascii?Q?xe1hwcWeSTR77l0Qugn372JJFV0WpHcSGSwQllfu1FYc8O1NCnp8esdXIX0+?=
 =?us-ascii?Q?NFtIoGDYWJ3gb0mQ24S9ZwDpMpWu+k5yV0nQRIcErtV/AeUfmovhiKBxhGH9?=
 =?us-ascii?Q?9o8yWDFztTcStNhrn15w4ojhOL1xSWnsGbad/SAd7rvVDqIy5ZM6Jkqz6Ixz?=
 =?us-ascii?Q?TecCOie7PU7pRO+9x7PPFKeCWjedq5D1NtO58pdcpdGDgiOLCgwCQfAVw6+4?=
 =?us-ascii?Q?Nh3/oJnChBZtYx3P99FFYftwc/3Ot3E=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0317db-8f09-4327-93f3-08deba4dbdde
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:06:59.8069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AkYnV8HtBMnfH8bU5CJfP3Fv2A+mNrRbMv6WNiTLZwVV7y5cbErtNHxAnkYRD6lk5DgqjkbJpoSwH83fytXxkB6dHmVD7nhpuSA0QVEVThs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8602
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33086-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,bp.renesas.com,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 34B9A5C9A3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree support and board enablement for audio on the
RZ/G3E SMARC EVK with a Dialog DA7212 codec.

This series includes:
  - CPG clock binding update for optional audio clock inputs
  - CPG driver support for RZ/G3E audio clocks and resets
  - Audio clock input nodes for RZ/V2H family DTSIs
  - R-Car Sound node for RZ/G3E SoC DTSI
  - Board-level enablement: I2C1, Versa3 clock generator, audio
    pinmux, and DA7212 codec on SMARC EVK

Audio configuration on SMARC EVK:
  - Codec: Dialog DA7212 on I2C1
  - Playback: SSI3
  - Capture: SSI4 -> SRC0 -> DVC0
  - MCLK: 12.288MHz from Versa3 clock generator
  - Format: I2S, R-Car Sound as clock master
  - SSI4 shares clock pins with SSI3 (shared-pin)

Changes:

v4:
 - Rebased onto a newer renesas-devel base (the CPG driver now
   already carries the DSI/LCDC module clocks and resets).
 - dt-bindings and clk driver: drop the AUDIO_CLKA input. AUDIO_CLKA
   is fed internally by the AUDIO_EXTAL pin, which the binding
   already describes, so adg_0_audio_clka is reparented on
   CLK_AUDIO_EXTAL (Geert Uytterhoeven).
 - clk driver: drop the internal core clocks Geert flagged as unused
   (pllcm33_div4_ddiv2, pllcm33_div4_ddiv2_div2, pllcln_div32,
   plldty_div2, plldty_div4, cdiv5_mainosc). pllcln_div4 is kept,
   since scu_0_clkx2 is parented on it.
 - clk driver: rename the audio module clocks and resets to the
   names Geert suggested (ssif_0_clk, scu_0_clk, scu_0_clkx2,
   dmacpp_0_clk, adg_0_clks1, adg_0_clk_195m, adg_0_audio_clk{a,b,c},
   ssiu_supply_clk; SCU_0_RESET_SRU, DMACpp_0_ARST,
   ADG_0_RST_RESET_ADG).
 - clk driver: the adg_ssi[0-9]_clk parent is left as CLK_PLLCLN_DIV8.
   Geert questioned this; the parent is unchanged, and the commit
   message now explains that the ADG muxes these outputs at runtime
   via ADG_AUDIO_CLK_SEL{0,1,2}.
 - dts sound node: rename the indexed clock-names and reset-names
   from the dotted form (ssi.N, src.N, adg.ssi.N, clk_a/b/c/i) to
   the hyphenated form (ssi-N, src-N, adg-ssi-N, audio-clka/b/c/i),
   and rename the sub-nodes from rcar_sound,xxx to the unprefixed
   ssi/ssiu/src/dvc/mix/ctu, matching the new RZ/G3E sound binding.
 - dts sound node: reorder the clocks and resets lists into
   ascending index order, annotate each phandle with a per-line
   comment, and drop the #sound-dai-cells / #clock-cells comment
   blocks.
 - dts: drop the audio_clka fixed-clock node from the RZ/V2H family
   DTSIs and from the pinctrl clocks/clock-names lists, consistent
   with dropping the AUDIO_CLKA input from the binding and driver.
 - Link to v3 at [2].

v3:
 - Splitout from v2 [1]
 - No code changes

v2:
 - Fix Rob's comment on  maxItems not needed with items lists.
 - Drop DMA ACK second cell from DT specifier

[1]: https://lore.kernel.org/all/20260402090524.9137-1-john.madieu.xa@bp.renesas.com/
[2]: https://lore.kernel.org/all/20260402163126.12135-1-john.madieu.xa@bp.renesas.com/

John Madieu (8):
  dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
  clk: renesas: r9a09g047: Add audio clock and reset support
  arm64: dts: renesas: rzv2h: Add audio clock inputs
  arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
  arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
  arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
  arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
  arm64: dts: renesas: r9a09g047e57-smarc: add DA7212 audio codec
    support

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |   6 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 496 +++++++++++++++++-
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 114 ++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |  20 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  20 +-
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  44 ++
 drivers/clk/renesas/r9a09g047-cpg.c           | 112 +++-
 7 files changed, 805 insertions(+), 7 deletions(-)

-- 
2.25.1


