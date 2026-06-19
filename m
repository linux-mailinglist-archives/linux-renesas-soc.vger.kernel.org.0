Return-Path: <linux-renesas-soc+bounces-34232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EH60JRUBNWqclwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:43:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8967E6A4AB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:43:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=WDpbDUBu;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16975302ACAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 08:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4FC35DA56;
	Fri, 19 Jun 2026 08:40:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5112C31E825;
	Fri, 19 Jun 2026 08:40:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858448; cv=fail; b=Ta5i5H8/lhcmPwUCKT7TdJdh/qMuPFy8tYtHetpbLUw0GMMxJd3plyo/1QnrWCBg7W6NJ6bjIzn91KlQXpqLa6Gu+bCpQGeSrMhTin0KNDf9nL/I3q/19JZYF+GS9xH3YHzf5RTEA3k8Q8SCxmtJBjnqd14b1It79qE/4IlBGZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858448; c=relaxed/simple;
	bh=PdXfZwM/poZAS1NVyi872VumZOAJGnMvSxa5ICjI/A0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WglanGsWj/0O+AgXA6KKQG1whKpH3H3bEzHjDMu+hnrGQ0MVKeO3oyiyEnolPUv7l2i4YLR6gv4+4D4PbmP2x+p4hoq4mIP+S8bwDoYs70EEsL5kHA3I8ljhZxWMgBvm6WwR4hfPvvs7n70NSCtPOtuXCVVJ7LnjiAXbV8529EY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WDpbDUBu; arc=fail smtp.client-ip=52.101.229.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMsMm992xc2fo1p/3hZJFYpJP9+BI3E0+sTXH/eXFLYqjMC7Zd93uOFvaHtjqTTmN3HFXh0rhmGddO20/yn7iM3LBsq+xT2/05TjfPXBVcZs0aRIxnkdLsuwm3h15n2mA4Cqrme7QEbrcK3yQBJidY56Y2CLnqgR3FiCI15aO9nbNE8q3c8gxkK2U+35kdZgDymcks/qwZa8aLqiUh/qYHL+4Tv34sqN++gstsU9f+2gghfH74dpR5Og3KaVSevKhUg3TBpR8+YRvXYiml+WnhSF0rFAfL2pVHXPCF9QD8g/7Ansz3CNEv4va3zRZnMGlV+FB/UJ/iwS9zpMd4XzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeESRk4BzCG49qY1ZILIllYd1AuhdKpzjVM0fjAoBjQ=;
 b=UI78zcA/hcTBnaX81rS44cMqsPn9PeT8e7xkEEKWh5u1TsrlvjoWmKR/VMdi22OBi/rwHkPeYegi+9QwtKXOC28E64D41f0IXEupycyS8f82YcTJtt0mmJYHK1w/qSprmZTf/usJ3G/lj7n9nE90jIeKZng6/Sz9aktQ41BkX7Rv0gAcOl4vuNEhqSB3bvpZpY1lfIQKbvBig8itYEVX/DcYzbTqBUMHsXwMXecqucINEYyP2ohwK8ke2VXO868toPAgKomC6vZzNRcET/z1s6RnLY9NS0BkOL39AvvKmxWjILJbDxkquqcSV6A/puzfKzeTxwd9gzRiwUiOApEk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeESRk4BzCG49qY1ZILIllYd1AuhdKpzjVM0fjAoBjQ=;
 b=WDpbDUBuAVNR0y5ANMHPkjnTGTscxoA43kbjmTeITxetq6/mkPQEZWrDG4ALW3t9DTBGsECgpjFErBYnm8LcSxLdY4x1uZDZVXP94x5PZ4w/Cnzlv57RI4l6Su9nIQW2gsSF1hrUMvUV0gix/ZI/zGsR64ypjE9P33F7myaJLpE=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB13920.jpnprd01.prod.outlook.com (2603:1096:405:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 08:40:43 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 08:40:43 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	john.madieu@gmail.com,
	biju.das.jz@bp.renesas.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v6 1/4] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
Date: Fri, 19 Jun 2026 08:39:48 +0000
Message-Id: <20260619083951.3777556-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com>
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::20) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|TY4PR01MB13920:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c33d0e4-3330-4ae9-5cca-08decdde7324
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|18002099003|22082099003|38350700014|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	JB4/bJW7f9xf4ufTy38yld0wUVAvAg2uWpCFa8kXtPltEBnO3rEh8UyAhNKYwGBQ5e51mk4LHNAQJmQh0OhijumwDSKAQUJdVs8x8DEDc3SlE8T3AuEuaXz6ISPoD9ajfudiOHsm9nlPFapxjdhVm2JsNB+wVlNTnvcQno25hBsEsmfMsRLwQUjyPUrY2tJ4Mqh/lskqH7HhQ8TDu45+fw3inPTtd+L+cFOwoUCT59xLwgo4OSVb8IoiSqQC6iVU4R1I6UXM2ItO5AJgO6FDaXq3+W20/MXTHnBU9XODi0woHUNlEaHunFGbBByDCfLji8kPLDQ6bdy4qsMxtpt3KBECJ87yLoc2RHxF7gronskTcuk6vd0vgiYFB+OIzukfmVscO0ICBs6nO6mu153AR2X2c3IHVtqrjwUBrkxVO+5O+I4sLzzGHR+A53240OJ7KppIjegJHkXEfStl6REubgVwofY/07WqOOVy9tuSe8UrgfSlZ6/CJ7PjLmCN7p2VIeW6b4G9NIjvkClxt0CGRfYf5egLCdDl/+LoBTxiImdNdeYP5lf36KlN2fXNNwc/jKsbQOq79+iiVJkOV+g+InEbpnlNvODeegmVXBijqPrYtHJraERBwOdxf6Q5Nm4AjL44114kCrc7YI8RF9i/Nypfx1QBjtFOkhE0zx78qTU277oltlSQzj/wC7udWICMg2HfVm1ZRYd3WJQGsMHsoLA6NesZTB4v6MQweSVICgY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(18002099003)(22082099003)(38350700014)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xdXApOWgpIObgLWmJJHdtlOiftZLejGFgxWNUY/Pbg1x2u71aN6ty+pQtHuu?=
 =?us-ascii?Q?Q0hnxjJOeRAH/NVbomSDjYD/M7b3F5OBkVsrKV+MsQ9EG+5ZWk2T5t7LYLNY?=
 =?us-ascii?Q?oN9q/Q/WG0HeAcMWhJnY64gvIV6qcFx8JMTA+QZD0e3nVOobfTLgUhCl0EsZ?=
 =?us-ascii?Q?GRys6vCQBhL5jZQp1di/FeHEDAi2d/Nuh6lsyeGvuFKFaP72ad3l6Ls7iupY?=
 =?us-ascii?Q?fkgFlC3DimtPIBRdXegwkMeHFlPFGFI/tRQhmdvyHkGSxmEsAs6o80su1Gva?=
 =?us-ascii?Q?kq60ssmaK7a8yeXs91QlQDewMb63dT0S8EyH0DxpTYEfze59QM2DIIgFnoJd?=
 =?us-ascii?Q?WwobgnN52shfI8JlCgxxRZxFuy/m2IvKtgVjZreL25FXxCMajf8IZXZ+aaCV?=
 =?us-ascii?Q?wyQvSRQY4C5scF312kIcIuWaYgxpFB/IriC03cUDGWcueqUGD5DrRtTc5ANC?=
 =?us-ascii?Q?GjTTg/zl9Lw56GjXt2MXEW94sPOT3Pe0Epi6OLFUhUmx133rdFS19J/aiCke?=
 =?us-ascii?Q?rg1TlU8CbBYUN+Tu6ii9/t+ReOHRxJKBbWmeyZk62zg7/+YZUpkk5VPRWzMs?=
 =?us-ascii?Q?ihtlvalV1yW7bPfDbIDOa4N+6kpGSW3sVsbKT6Y66Q/J6amvdHr+jiUiJ/9A?=
 =?us-ascii?Q?rURQVJqTVLPDLzAhGcsh4oxzSJyEdgnQKT+wJekeWiT1hmc8yG7heqEWF/FQ?=
 =?us-ascii?Q?iGsSGsl8oC4lIgIpoQBgkpZB4awBaeoFMMw2DyrUD5Vts23Fsu+vLi2FGxzI?=
 =?us-ascii?Q?k+pcAocpOyhAnLNVwDh2X6zk4V3L2+yVImG2xn4yN7WJOubie7qNXZvjUW5P?=
 =?us-ascii?Q?5sSkTt8ewweCXBjn7PpXjcit1vMLqKCAwlp44Ffv3n2Nf3AJp/bfchYHoqLK?=
 =?us-ascii?Q?3uV8sDzFdcfwQUMvcQ1vC07jgyfi2RG/PDZauQqE8QvlG9UK/UeMwT+zuLvI?=
 =?us-ascii?Q?F9ubYR+AiO/E8kZG1cNtZ1SRazaIxWR4JzJnSB9V2FQmRapGJvBSuTMlB4WV?=
 =?us-ascii?Q?7SbSdtGMGRgsNHOqF2HPKzEl6/aH/1I5Wua2dqEdIWFI8vioCIGu48+nQo+C?=
 =?us-ascii?Q?P3s6x0luPI9ZW5qR8dwXDtTXcZcRDkC5LkcTNu9Lymu+Nq7c7iz0pWeGuLBa?=
 =?us-ascii?Q?hw88PZRIA6yvwN7KG1AJ89I5ETjcTJdZxUS/aFtC+reLOPYAiHYMa8a8lc2M?=
 =?us-ascii?Q?uTroQVTPH0xOBWYjoq5B426dY4lJ/mXFMqXvBTx+4fjxelAczi+kMZm0AsaL?=
 =?us-ascii?Q?B5Hb2so3QgtKL9o1QqKuSyQJJkM0k5wVEseW0UOpCAW8Xj1z7pjXQM0ROR8v?=
 =?us-ascii?Q?f8+9iIpjnTf5vfgp7iyEUCxlxuvbx5+jTeOfFNgEGIiGIuG5x4hR8QrWxrN/?=
 =?us-ascii?Q?rhAEK+OGD/iuCi1HpblBL0zHm5xPBlAh9cn4O+QhOb2nXqgfFDoUdX6s4OLg?=
 =?us-ascii?Q?1vbLl/jCaMKvJALQv7ko7QbbT/1Hy0F42fOdrKJkLm+tFjXID88n/hJ7+rR+?=
 =?us-ascii?Q?tyG/noPkli8PvCagsatRBlUTzyDNoYTgZAx6QAYavIUxtc/atoH0giPjfcZx?=
 =?us-ascii?Q?/UkeI/e/bgQ+K7xqWWxnZ6bgLQ7stbBKWHdMvj7REevzqvIxquzut/lRxMIQ?=
 =?us-ascii?Q?pd+/sAUTY85NN0U19/7tlTtA94Wevgsx8VLW0d6UVhiAKXbIErgyWnvLTOCR?=
 =?us-ascii?Q?OJkDvOSK+N50yGURmhkPqXiEEA4SNbGWhCYy8HPQGc9vp6COVUMr/NGfLK2p?=
 =?us-ascii?Q?3zsUWGNyOV3m6YPl1P3PP+PIX9XT43E=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c33d0e4-3330-4ae9-5cca-08decdde7324
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 08:40:43.6441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WcHW+Hd5JBOftSWUMJ53oRpxSxlW8LJL3eyD2DR2KiCsU9LAY5n36p+cS5HYyU6XVXROddUgNHBclGCuQzoAIXG70rO71Miqiz8C//9Scs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13920
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-34232-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:john.madieu.xa@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8967E6A4AB4

Add the snd_rzg3e node for the RZ/G3E SoC with all sub-components:

- SSI (Serial Sound Interface) units 0-9
- SSIU (Serial Sound Interface Unit) units 0-27
- SRC (Sample Rate Converter) units 0-9
- CTU (Channel Transfer Unit) units 0-7
- DVC (Digital Volume Control) units 0-1
- MIX (Mixer) units 0-1

Sub-node names follow the new RZ/G3E sound binding: unprefixed
'ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu' wrapper nodes instead of
the legacy 'rcar_sound,xxx' R-Car prefix.

Wire up all 5 DMA controllers (dmac0-dmac4) for each audio sub-node
with repeated channel names, so that the DMA core can pick the first
available controller.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Chqnges:

v6: No changes.
v5:
 - Use hexadecimal CPG module clock and reset numbers, for easier
   matching with the documentation.
 - Use lowercase hex for the SSI reg size (0x1f000).
 - Extend the scu reg region to 0x20000 to include the SCU DMAC.
 - Drop the per-line clock / reset comments, as clock-names and
   reset-names already serve that purpose

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 462 +++++++++++++++++++++
 1 file changed, 462 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 1251e329e380..881124f31849 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -912,6 +912,468 @@ rsci9: serial@12803000 {
 			status = "disabled";
 		};
 
+		snd_rzg3e: sound@13c00000 {
+			compatible = "renesas,r9a09g047-sound";
+			reg = <0 0x13c00000 0 0x20000>, /* SCU */
+			      <0 0x13c20000 0 0x10000>, /* ADG */
+			      <0 0x13c30000 0 0x1000>,  /* SSIU */
+			      <0 0x13c31000 0 0x1f000>, /* SSI */
+			      <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
+			reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
+			clocks = <&cpg CPG_MOD 0xf5>,
+				<&cpg CPG_MOD 0x181>, <&cpg CPG_MOD 0x182>,
+				<&cpg CPG_MOD 0x183>, <&cpg CPG_MOD 0x184>,
+				<&cpg CPG_MOD 0x185>, <&cpg CPG_MOD 0x186>,
+				<&cpg CPG_MOD 0x187>, <&cpg CPG_MOD 0x188>,
+				<&cpg CPG_MOD 0x189>, <&cpg CPG_MOD 0x18a>,
+				<&cpg CPG_MOD 0x174>, <&cpg CPG_MOD 0x175>,
+				<&cpg CPG_MOD 0x176>, <&cpg CPG_MOD 0x177>,
+				<&cpg CPG_MOD 0x178>, <&cpg CPG_MOD 0x179>,
+				<&cpg CPG_MOD 0x17a>, <&cpg CPG_MOD 0x17b>,
+				<&cpg CPG_MOD 0x17c>, <&cpg CPG_MOD 0x17d>,
+				<&cpg CPG_MOD 0x172>, <&cpg CPG_MOD 0x173>,
+				<&cpg CPG_MOD 0x172>, <&cpg CPG_MOD 0x173>,
+				<&cpg CPG_MOD 0x170>, <&cpg CPG_MOD 0x171>,
+				<&cpg CPG_MOD 0xfb>, <&cpg CPG_MOD 0xfc>,
+				<&cpg CPG_MOD 0xfd>, <&cpg CPG_MOD 0xfa>,
+				<&cpg CPG_MOD 0x180>,
+				<&cpg CPG_MOD 0xf6>, <&cpg CPG_MOD 0xf7>,
+				<&cpg CPG_MOD 0x17e>,
+				<&cpg CPG_MOD 0x160>, <&cpg CPG_MOD 0x161>,
+				<&cpg CPG_MOD 0x162>, <&cpg CPG_MOD 0x163>,
+				<&cpg CPG_MOD 0x164>, <&cpg CPG_MOD 0x165>,
+				<&cpg CPG_MOD 0x166>, <&cpg CPG_MOD 0x167>,
+				<&cpg CPG_MOD 0x168>, <&cpg CPG_MOD 0x169>,
+				<&cpg CPG_MOD 0xf8>, <&cpg CPG_MOD 0xf9>;
+			clock-names = "ssi-all",
+				       "ssi-0", "ssi-1",
+				       "ssi-2", "ssi-3",
+				       "ssi-4", "ssi-5",
+				       "ssi-6", "ssi-7",
+				       "ssi-8", "ssi-9",
+				       "src-0", "src-1",
+				       "src-2", "src-3",
+				       "src-4", "src-5",
+				       "src-6", "src-7",
+				       "src-8", "src-9",
+				       "mix-0", "mix-1",
+				       "ctu-0", "ctu-1",
+				       "dvc-0", "dvc-1",
+				       "audio-clka", "audio-clkb",
+				       "audio-clkc", "audio-clki",
+				       "ssif_supply",
+				       "scu", "scu_x2",
+				       "scu_supply",
+				       "adg-ssi-0", "adg-ssi-1",
+				       "adg-ssi-2", "adg-ssi-3",
+				       "adg-ssi-4", "adg-ssi-5",
+				       "adg-ssi-6", "adg-ssi-7",
+				       "adg-ssi-8", "adg-ssi-9",
+				       "audmapp", "adg";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xe1>,
+				 <&cpg 0xe2>, <&cpg 0xe3>,
+				 <&cpg 0xe4>, <&cpg 0xe5>,
+				 <&cpg 0xe6>, <&cpg 0xe7>,
+				 <&cpg 0xe8>, <&cpg 0xe9>,
+				 <&cpg 0xea>, <&cpg 0xeb>,
+				 <&cpg 0xec>, <&cpg 0xee>,
+				 <&cpg 0xed>;
+			reset-names = "ssi-all",
+				       "ssi-0", "ssi-1",
+				       "ssi-2", "ssi-3",
+				       "ssi-4", "ssi-5",
+				       "ssi-6", "ssi-7",
+				       "ssi-8", "ssi-9",
+				       "scu", "adg",
+				       "audmapp";
+			status = "disabled";
+
+			ctu {
+				ctu00: ctu-0 { };
+				ctu01: ctu-1 { };
+				ctu02: ctu-2 { };
+				ctu03: ctu-3 { };
+				ctu10: ctu-4 { };
+				ctu11: ctu-5 { };
+				ctu12: ctu-6 { };
+				ctu13: ctu-7 { };
+			};
+
+			dvc {
+				dvc0: dvc-0 {
+					dmas = <&dmac0 0x1db3>, <&dmac1 0x1db3>,
+					       <&dmac2 0x1db3>, <&dmac3 0x1db3>,
+					       <&dmac4 0x1db3>;
+					dma-names = "tx", "tx", "tx", "tx", "tx";
+				};
+				dvc1: dvc-1 {
+					dmas = <&dmac0 0x1db4>, <&dmac1 0x1db4>,
+					       <&dmac2 0x1db4>, <&dmac3 0x1db4>,
+					       <&dmac4 0x1db4>;
+					dma-names = "tx", "tx", "tx", "tx", "tx";
+				};
+			};
+
+			mix {
+				mix0: mix-0 { };
+				mix1: mix-1 { };
+			};
+
+			src {
+				src0: src-0 {
+					interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
+					       <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
+					       <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
+					       <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
+					       <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src1: src-1 {
+					interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da0>, <&dmac0 0x1daa>,
+					       <&dmac1 0x1da0>, <&dmac1 0x1daa>,
+					       <&dmac2 0x1da0>, <&dmac2 0x1daa>,
+					       <&dmac3 0x1da0>, <&dmac3 0x1daa>,
+					       <&dmac4 0x1da0>, <&dmac4 0x1daa>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src2: src-2 {
+					interrupts = <GIC_SPI 904 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da1>, <&dmac0 0x1dab>,
+					       <&dmac1 0x1da1>, <&dmac1 0x1dab>,
+					       <&dmac2 0x1da1>, <&dmac2 0x1dab>,
+					       <&dmac3 0x1da1>, <&dmac3 0x1dab>,
+					       <&dmac4 0x1da1>, <&dmac4 0x1dab>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src3: src-3 {
+					interrupts = <GIC_SPI 905 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da2>, <&dmac0 0x1dac>,
+					       <&dmac1 0x1da2>, <&dmac1 0x1dac>,
+					       <&dmac2 0x1da2>, <&dmac2 0x1dac>,
+					       <&dmac3 0x1da2>, <&dmac3 0x1dac>,
+					       <&dmac4 0x1da2>, <&dmac4 0x1dac>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src4: src-4 {
+					interrupts = <GIC_SPI 906 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da3>, <&dmac0 0x1dad>,
+					       <&dmac1 0x1da3>, <&dmac1 0x1dad>,
+					       <&dmac2 0x1da3>, <&dmac2 0x1dad>,
+					       <&dmac3 0x1da3>, <&dmac3 0x1dad>,
+					       <&dmac4 0x1da3>, <&dmac4 0x1dad>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src5: src-5 {
+					interrupts = <GIC_SPI 907 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da4>, <&dmac0 0x1dae>,
+					       <&dmac1 0x1da4>, <&dmac1 0x1dae>,
+					       <&dmac2 0x1da4>, <&dmac2 0x1dae>,
+					       <&dmac3 0x1da4>, <&dmac3 0x1dae>,
+					       <&dmac4 0x1da4>, <&dmac4 0x1dae>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src6: src-6 {
+					interrupts = <GIC_SPI 908 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da5>, <&dmac0 0x1daf>,
+					       <&dmac1 0x1da5>, <&dmac1 0x1daf>,
+					       <&dmac2 0x1da5>, <&dmac2 0x1daf>,
+					       <&dmac3 0x1da5>, <&dmac3 0x1daf>,
+					       <&dmac4 0x1da5>, <&dmac4 0x1daf>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src7: src-7 {
+					interrupts = <GIC_SPI 909 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da6>, <&dmac0 0x1db0>,
+					       <&dmac1 0x1da6>, <&dmac1 0x1db0>,
+					       <&dmac2 0x1da6>, <&dmac2 0x1db0>,
+					       <&dmac3 0x1da6>, <&dmac3 0x1db0>,
+					       <&dmac4 0x1da6>, <&dmac4 0x1db0>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src8: src-8 {
+					interrupts = <GIC_SPI 910 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da7>, <&dmac0 0x1db1>,
+					       <&dmac1 0x1da7>, <&dmac1 0x1db1>,
+					       <&dmac2 0x1da7>, <&dmac2 0x1db1>,
+					       <&dmac3 0x1da7>, <&dmac3 0x1db1>,
+					       <&dmac4 0x1da7>, <&dmac4 0x1db1>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+				src9: src-9 {
+					interrupts = <GIC_SPI 911 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&dmac0 0x1da8>, <&dmac0 0x1db2>,
+					       <&dmac1 0x1da8>, <&dmac1 0x1db2>,
+					       <&dmac2 0x1da8>, <&dmac2 0x1db2>,
+					       <&dmac3 0x1da8>, <&dmac3 0x1db2>,
+					       <&dmac4 0x1da8>, <&dmac4 0x1db2>;
+					dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";
+				};
+			};
+
+			ssi {
+				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 889 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi1: ssi-1 {
+					interrupts = <GIC_SPI 890 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi2: ssi-2 {
+					interrupts = <GIC_SPI 891 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi3: ssi-3 {
+					interrupts = <GIC_SPI 892 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi4: ssi-4 {
+					interrupts = <GIC_SPI 893 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi5: ssi-5 {
+					interrupts = <GIC_SPI 894 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi6: ssi-6 {
+					interrupts = <GIC_SPI 895 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi7: ssi-7 {
+					interrupts = <GIC_SPI 896 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi8: ssi-8 {
+					interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
+				};
+				ssi9: ssi-9 {
+					interrupts = <GIC_SPI 898 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+
+			ssiu {
+				ssiu00: ssiu-0 {
+					dmas = <&dmac0 0x1d61>, <&dmac0 0x1d62>,
+					       <&dmac1 0x1d61>, <&dmac1 0x1d62>,
+					       <&dmac2 0x1d61>, <&dmac2 0x1d62>,
+					       <&dmac3 0x1d61>, <&dmac3 0x1d62>,
+					       <&dmac4 0x1d61>, <&dmac4 0x1d62>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu01: ssiu-1 {
+					dmas = <&dmac0 0x1d63>, <&dmac0 0x1d64>,
+					       <&dmac1 0x1d63>, <&dmac1 0x1d64>,
+					       <&dmac2 0x1d63>, <&dmac2 0x1d64>,
+					       <&dmac3 0x1d63>, <&dmac3 0x1d64>,
+					       <&dmac4 0x1d63>, <&dmac4 0x1d64>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu02: ssiu-2 {
+					dmas = <&dmac0 0x1d65>, <&dmac0 0x1d66>,
+					       <&dmac1 0x1d65>, <&dmac1 0x1d66>,
+					       <&dmac2 0x1d65>, <&dmac2 0x1d66>,
+					       <&dmac3 0x1d65>, <&dmac3 0x1d66>,
+					       <&dmac4 0x1d65>, <&dmac4 0x1d66>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu03: ssiu-3 {
+					dmas = <&dmac0 0x1d67>, <&dmac0 0x1d68>,
+					       <&dmac1 0x1d67>, <&dmac1 0x1d68>,
+					       <&dmac2 0x1d67>, <&dmac2 0x1d68>,
+					       <&dmac3 0x1d67>, <&dmac3 0x1d68>,
+					       <&dmac4 0x1d67>, <&dmac4 0x1d68>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu10: ssiu-4 {
+					dmas = <&dmac0 0x1d69>, <&dmac0 0x1d6a>,
+					       <&dmac1 0x1d69>, <&dmac1 0x1d6a>,
+					       <&dmac2 0x1d69>, <&dmac2 0x1d6a>,
+					       <&dmac3 0x1d69>, <&dmac3 0x1d6a>,
+					       <&dmac4 0x1d69>, <&dmac4 0x1d6a>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu11: ssiu-5 {
+					dmas = <&dmac0 0x1d6b>, <&dmac0 0x1d6c>,
+					       <&dmac1 0x1d6b>, <&dmac1 0x1d6c>,
+					       <&dmac2 0x1d6b>, <&dmac2 0x1d6c>,
+					       <&dmac3 0x1d6b>, <&dmac3 0x1d6c>,
+					       <&dmac4 0x1d6b>, <&dmac4 0x1d6c>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu12: ssiu-6 {
+					dmas = <&dmac0 0x1d6d>, <&dmac0 0x1d6e>,
+					       <&dmac1 0x1d6d>, <&dmac1 0x1d6e>,
+					       <&dmac2 0x1d6d>, <&dmac2 0x1d6e>,
+					       <&dmac3 0x1d6d>, <&dmac3 0x1d6e>,
+					       <&dmac4 0x1d6d>, <&dmac4 0x1d6e>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu13: ssiu-7 {
+					dmas = <&dmac0 0x1d6f>, <&dmac0 0x1d70>,
+					       <&dmac1 0x1d6f>, <&dmac1 0x1d70>,
+					       <&dmac2 0x1d6f>, <&dmac2 0x1d70>,
+					       <&dmac3 0x1d6f>, <&dmac3 0x1d70>,
+					       <&dmac4 0x1d6f>, <&dmac4 0x1d70>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu20: ssiu-8 {
+					dmas = <&dmac0 0x1d71>, <&dmac0 0x1d72>,
+					       <&dmac1 0x1d71>, <&dmac1 0x1d72>,
+					       <&dmac2 0x1d71>, <&dmac2 0x1d72>,
+					       <&dmac3 0x1d71>, <&dmac3 0x1d72>,
+					       <&dmac4 0x1d71>, <&dmac4 0x1d72>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu21: ssiu-9 {
+					dmas = <&dmac0 0x1d73>, <&dmac0 0x1d74>,
+					       <&dmac1 0x1d73>, <&dmac1 0x1d74>,
+					       <&dmac2 0x1d73>, <&dmac2 0x1d74>,
+					       <&dmac3 0x1d73>, <&dmac3 0x1d74>,
+					       <&dmac4 0x1d73>, <&dmac4 0x1d74>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu22: ssiu-10 {
+					dmas = <&dmac0 0x1d75>, <&dmac0 0x1d76>,
+					       <&dmac1 0x1d75>, <&dmac1 0x1d76>,
+					       <&dmac2 0x1d75>, <&dmac2 0x1d76>,
+					       <&dmac3 0x1d75>, <&dmac3 0x1d76>,
+					       <&dmac4 0x1d75>, <&dmac4 0x1d76>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu23: ssiu-11 {
+					dmas = <&dmac0 0x1d77>, <&dmac0 0x1d78>,
+					       <&dmac1 0x1d77>, <&dmac1 0x1d78>,
+					       <&dmac2 0x1d77>, <&dmac2 0x1d78>,
+					       <&dmac3 0x1d77>, <&dmac3 0x1d78>,
+					       <&dmac4 0x1d77>, <&dmac4 0x1d78>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu30: ssiu-12 {
+					dmas = <&dmac0 0x1d79>, <&dmac0 0x1d7a>,
+					       <&dmac1 0x1d79>, <&dmac1 0x1d7a>,
+					       <&dmac2 0x1d79>, <&dmac2 0x1d7a>,
+					       <&dmac3 0x1d79>, <&dmac3 0x1d7a>,
+					       <&dmac4 0x1d79>, <&dmac4 0x1d7a>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu31: ssiu-13 {
+					dmas = <&dmac0 0x1d7b>, <&dmac0 0x1d7c>,
+					       <&dmac1 0x1d7b>, <&dmac1 0x1d7c>,
+					       <&dmac2 0x1d7b>, <&dmac2 0x1d7c>,
+					       <&dmac3 0x1d7b>, <&dmac3 0x1d7c>,
+					       <&dmac4 0x1d7b>, <&dmac4 0x1d7c>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu32: ssiu-14 {
+					dmas = <&dmac0 0x1d7d>, <&dmac0 0x1d7e>,
+					       <&dmac1 0x1d7d>, <&dmac1 0x1d7e>,
+					       <&dmac2 0x1d7d>, <&dmac2 0x1d7e>,
+					       <&dmac3 0x1d7d>, <&dmac3 0x1d7e>,
+					       <&dmac4 0x1d7d>, <&dmac4 0x1d7e>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu33: ssiu-15 {
+					dmas = <&dmac0 0x1d7f>, <&dmac0 0x1d80>,
+					       <&dmac1 0x1d7f>, <&dmac1 0x1d80>,
+					       <&dmac2 0x1d7f>, <&dmac2 0x1d80>,
+					       <&dmac3 0x1d7f>, <&dmac3 0x1d80>,
+					       <&dmac4 0x1d7f>, <&dmac4 0x1d80>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu40: ssiu-16 {
+					dmas = <&dmac0 0x1d81>, <&dmac0 0x1d82>,
+					       <&dmac1 0x1d81>, <&dmac1 0x1d82>,
+					       <&dmac2 0x1d81>, <&dmac2 0x1d82>,
+					       <&dmac3 0x1d81>, <&dmac3 0x1d82>,
+					       <&dmac4 0x1d81>, <&dmac4 0x1d82>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu41: ssiu-17 {
+					dmas = <&dmac0 0x1d83>, <&dmac0 0x1d84>,
+					       <&dmac1 0x1d83>, <&dmac1 0x1d84>,
+					       <&dmac2 0x1d83>, <&dmac2 0x1d84>,
+					       <&dmac3 0x1d83>, <&dmac3 0x1d84>,
+					       <&dmac4 0x1d83>, <&dmac4 0x1d84>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu42: ssiu-18 {
+					dmas = <&dmac0 0x1d85>, <&dmac0 0x1d86>,
+					       <&dmac1 0x1d85>, <&dmac1 0x1d86>,
+					       <&dmac2 0x1d85>, <&dmac2 0x1d86>,
+					       <&dmac3 0x1d85>, <&dmac3 0x1d86>,
+					       <&dmac4 0x1d85>, <&dmac4 0x1d86>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu43: ssiu-19 {
+					dmas = <&dmac0 0x1d87>, <&dmac0 0x1d88>,
+					       <&dmac1 0x1d87>, <&dmac1 0x1d88>,
+					       <&dmac2 0x1d87>, <&dmac2 0x1d88>,
+					       <&dmac3 0x1d87>, <&dmac3 0x1d88>,
+					       <&dmac4 0x1d87>, <&dmac4 0x1d88>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu50: ssiu-20 {
+					dmas = <&dmac0 0x1d89>, <&dmac0 0x1d8a>,
+					       <&dmac1 0x1d89>, <&dmac1 0x1d8a>,
+					       <&dmac2 0x1d89>, <&dmac2 0x1d8a>,
+					       <&dmac3 0x1d89>, <&dmac3 0x1d8a>,
+					       <&dmac4 0x1d89>, <&dmac4 0x1d8a>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu60: ssiu-21 {
+					dmas = <&dmac0 0x1d8b>, <&dmac0 0x1d8c>,
+					       <&dmac1 0x1d8b>, <&dmac1 0x1d8c>,
+					       <&dmac2 0x1d8b>, <&dmac2 0x1d8c>,
+					       <&dmac3 0x1d8b>, <&dmac3 0x1d8c>,
+					       <&dmac4 0x1d8b>, <&dmac4 0x1d8c>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu70: ssiu-22 {
+					dmas = <&dmac0 0x1d8d>, <&dmac0 0x1d8e>,
+					       <&dmac1 0x1d8d>, <&dmac1 0x1d8e>,
+					       <&dmac2 0x1d8d>, <&dmac2 0x1d8e>,
+					       <&dmac3 0x1d8d>, <&dmac3 0x1d8e>,
+					       <&dmac4 0x1d8d>, <&dmac4 0x1d8e>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu80: ssiu-23 {
+					dmas = <&dmac0 0x1d8f>, <&dmac0 0x1d90>,
+					       <&dmac1 0x1d8f>, <&dmac1 0x1d90>,
+					       <&dmac2 0x1d8f>, <&dmac2 0x1d90>,
+					       <&dmac3 0x1d8f>, <&dmac3 0x1d90>,
+					       <&dmac4 0x1d8f>, <&dmac4 0x1d90>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu90: ssiu-24 {
+					dmas = <&dmac0 0x1d91>, <&dmac0 0x1d92>,
+					       <&dmac1 0x1d91>, <&dmac1 0x1d92>,
+					       <&dmac2 0x1d91>, <&dmac2 0x1d92>,
+					       <&dmac3 0x1d91>, <&dmac3 0x1d92>,
+					       <&dmac4 0x1d91>, <&dmac4 0x1d92>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu91: ssiu-25 {
+					dmas = <&dmac0 0x1d93>, <&dmac0 0x1d94>,
+					       <&dmac1 0x1d93>, <&dmac1 0x1d94>,
+					       <&dmac2 0x1d93>, <&dmac2 0x1d94>,
+					       <&dmac3 0x1d93>, <&dmac3 0x1d94>,
+					       <&dmac4 0x1d93>, <&dmac4 0x1d94>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu92: ssiu-26 {
+					dmas = <&dmac0 0x1d95>, <&dmac0 0x1d96>,
+					       <&dmac1 0x1d95>, <&dmac1 0x1d96>,
+					       <&dmac2 0x1d95>, <&dmac2 0x1d96>,
+					       <&dmac3 0x1d95>, <&dmac3 0x1d96>,
+					       <&dmac4 0x1d95>, <&dmac4 0x1d96>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+				ssiu93: ssiu-27 {
+					dmas = <&dmac0 0x1d97>, <&dmac0 0x1d98>,
+					       <&dmac1 0x1d97>, <&dmac1 0x1d98>,
+					       <&dmac2 0x1d97>, <&dmac2 0x1d98>,
+					       <&dmac3 0x1d97>, <&dmac3 0x1d98>,
+					       <&dmac4 0x1d97>, <&dmac4 0x1d98>;
+					dma-names = "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx";
+				};
+			};
+		};
+
 		wdt1: watchdog@14400000 {
 			compatible = "renesas,r9a09g047-wdt", "renesas,r9a09g057-wdt";
 			reg = <0 0x14400000 0 0x400>;
-- 
2.25.1


