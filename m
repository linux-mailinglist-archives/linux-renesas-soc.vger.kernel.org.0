Return-Path: <linux-renesas-soc+bounces-34234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id POPEMLIANWqDlwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:41:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EEC6A4A7F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 10:41:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="ee+/2GfY";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34234-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5FED3017EC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 08:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E8735F5E1;
	Fri, 19 Jun 2026 08:40:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011067.outbound.protection.outlook.com [52.101.125.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9732360EC3;
	Fri, 19 Jun 2026 08:40:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858459; cv=fail; b=RzMgdBDH5y6/TQUy3cPkQgk2AfaY5er/2FMnB5W4bry1meGGA/GDH0iUuGN85CcMXjdGbtpPCUs6nk9lE7YTTFKVnbchamtmnaUA8cJ20OHSvFtkRDVcRdEr6hCA/Wj78RfpBZWqXJxq7Go1VawceZFtAcIbqpwEx1kmLBV/CqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858459; c=relaxed/simple;
	bh=6MteDWTZuCV9cyiRa4gySy7Pgi4MsqISD+54GZzJOrs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OdlLBTIljx91FxpeWkbJHYZ+gPbbJYLc3tgXvtrWRh/f5iK9Q8CbUS90/Nugb59MB54seF553jKNfrhUkhJWQPsPQS49FddBgb/35cZeuzqTNoLxCXyE8unEpJNBf6GIM90VyPNqIouaxfa9bq3U/UztyKK9c2/t+ZaPjM5iYuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ee+/2GfY; arc=fail smtp.client-ip=52.101.125.67
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FVCaMnOjuuPToZNbuICd8ta2LFYAd2lFmomzh9CpEzWiuNVIT4BdVFFQCltMrOhc9nljPHOpRvag/GgFLQ8cmekTF74+RotFXYmgrggTeerGeGFY2sojCgMRUmCfU6iQhCTtPhRV46r/FMSjH7t9hHjeMQ55HZZgpN7RXc54KNj7czOLwiMX4Vlo5cSMPbT4wPinXIU+uUaEo/595i9Fsc5OEZXWZg1uvqJYqIDV/AP4T0MlzMAfJX0VbCJXFzz9Qv4eM1s3NguvlSphncqM9TNvQX92dYMKQXg3oHxSvPOl4mdawHvCqVca6MX2Gva2ZNRR5Q6ZDEo2LqFIlSNW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsuDzioW1/ypAzoI0ltcHWtg/jDZ3T6dQbVeh1DCAKQ=;
 b=dvTLvmNgBZYrtA5P3whcch0WZuHM+XJBORrtMSyQNpncas2YJzTNoIljtTTevpon3qvRP1TUt4bWwwAKyaHswkJXoKDZ6PmzSYbS6XiBEHNZvl2XGJgVeGRc8WK+xRuiVCgQf6kTb5UD5/Lxhz7nkv644+3KhAlG8KsBdXYVTzCp4/PThzNb9lfk++pnm6ITSN91nc0pnXIGhqJWZsUXxLNgGPhvspA2NchGkE1yE5RRBoHWP7xofS2Cv3hB1ol4gapj+3axVA9Y04YsCTQ/1NSNsTH50jZGvYQYcv3NqOxsEDjsdEEGlq4Uote311W+lUdrGLccPZ/hgqbIQD7JJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsuDzioW1/ypAzoI0ltcHWtg/jDZ3T6dQbVeh1DCAKQ=;
 b=ee+/2GfYLIlkEcTbqHxRu4xvZ3bQoc8rTRvOpz0EsgQ2cmg2CQ8Sh45okbHVbEjtfo77hWg2MnGhUEhgCvQkZrQTvHYjzpgEMkPVppXoev+1jhYsqvKKcYM8KRff5i6htRvhhdQyx0D0li33qME0XFXUkuTvzyp3/RGsH/LLDSs=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY4PR01MB13920.jpnprd01.prod.outlook.com (2603:1096:405:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 08:40:55 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 08:40:55 +0000
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
Subject: [PATCH v6 3/4] arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
Date: Fri, 19 Jun 2026 08:39:50 +0000
Message-Id: <20260619083951.3777556-4-john.madieu.xa@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1865bb4d-6b02-4cd0-40d1-08decdde7a42
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|18002099003|22082099003|3023799007|38350700014|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yAwaP7A/las2R1S3ymRMS6gVO5sgfv4V8KN4OsOzu3YGXhxunlY2q5bhbZkBUtu4BT0ZsucuR76jGmhpe5yalDCKgBdkaphpa9exGDB7tcm7AnUGw+TfB53LuftEM1qrD6ShYyh8YlaXTPFsP6apdbbAfL7cjkurklbRjrDEoDvF55bAuhF10TVqZcTMJRRILQcuaapqiLfj2oiEVClh83byUMQNh3NUNHgF05/uRGQtq9Yv7DeEcNGzG30UbR2QXSZ5G/+SPP5Rrlcl+vKL8i62drn2u6IFc0FMH9Ihr3B1SdYFSr7hzVNjW4FZ7F+BGowOhbqt4Bi1P6L3R1i+LNln6nbR5zB6TdMbL/QmWXrC7uRMOiPeQMhvHgZuNzwvK3mXd5s2Mm0F/0dBfHWEMw3P91GTVbK6+VGGmzFYHnz8rrCnOfhd9KN0M1ygBZ6fU5ktWw0o+K9FoIGlKN53T968W67IlNHkvQKf7WQ+J41NiRf6WAvRlxYpW0K+q9lRC2CeSBujRIoL3Wf384VgTDRg8TH/oD1RW6woA37D7QNXuadXX/sLP79pVcdj+N2ktUZ4Afx0z9Zn15NdvSoMI39iKsLoOcrbXrc9moeBtLbRrCkyKOgkhzqjv+fmJpg0xTV+L6GmCfbZowgUzoq3UF4Cwz7AZYB+B2e3Bs/mj1VsS19Z9hKM6gexcP8+j0jbEs2gwjpQfrPKj+/Njqn9V/edsjar5VDnl/SmgDgXx5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(18002099003)(22082099003)(3023799007)(38350700014)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JI7tqAm/ysn8ciREGYvWqyeonknJlfVlnRxzpPNSey3f+LURR+JqWndDl9za?=
 =?us-ascii?Q?e5zY+Np6XkxCINqWscTTlcd/Sr8awiSe4YOHXNNO0q9f2V4st4PYUntWrlvy?=
 =?us-ascii?Q?eUeuEKeTiD0fTWUEZc54QHWCZwpXtJj5o/lxA+jKK+l3fH8E+1xXM5ke024m?=
 =?us-ascii?Q?cpub2YhgwC9liIqy6z2OhGO7k1zyRyod58Hh/26NS4QCuyixU6HRb9zcuH7j?=
 =?us-ascii?Q?oOU+Azg0E1IqFTN4cqMgJvv0jHkPg+BI+FebiXKrgmgGGXLiGE3ZRO5CXFkW?=
 =?us-ascii?Q?BvSBth6qRNgvV9AIzb08jphmH9zJeggcLrCVg3s0Wgn8VPDCVqXYRf/+aSv7?=
 =?us-ascii?Q?7Bx7Ee7s83Ow35weQ+0ulZKR46wSEdI5kYsOAGqOJfNWAWAAVesqjUF5PlOB?=
 =?us-ascii?Q?sZ2E4gpAIThHHD/JsU48l2zRMbXPORFct3WuEABfzaj2mK8lVuEPLw03v+3t?=
 =?us-ascii?Q?F0tu6zaNYSu8lrfyC83M7Iaz9IAKR37KLdAZF8ndU6JlnPl7luhNLOk1lghP?=
 =?us-ascii?Q?b3YbVNJscAFBdfNgRZs623TojgdPoNbB1fLqfHGDAoT02tnsNcjo2kTe6JxG?=
 =?us-ascii?Q?mRKm8gXdZ1fiI4fgSiV3XkuCQXRlkyi6qyBHNrW9SpUzdh0IUCDl3IBYSJd4?=
 =?us-ascii?Q?4dHYGa8Jf0/O/UHrxVXJdxHF5vRtGuEu7jv0sIkPLK6AN5ND1RPvA2prV42I?=
 =?us-ascii?Q?wqBnGMXRkd0+OdXheVZa+f7x6mWj0oODdDnjtpoIAxfwOk+UYSPPTchcYHnI?=
 =?us-ascii?Q?kq5zLcIKqM4HdOE5MOfWiNEnj1DLvwhplx9DBWYJBn0OP8kPUBHtNXy5fzXc?=
 =?us-ascii?Q?Sgslm6ElLO6cM1Shh2p9hgrngLeY5RA5cVLTylgAxnvGWlYrCqeg5Ey62LOd?=
 =?us-ascii?Q?GMkGEoYDoksMbsjnaxK/7/IyjtlK21qpldNiWJsSUIoCdnyDG0Kx+ycFux39?=
 =?us-ascii?Q?LBPlpzfh+NLTGOcD0WdHnSNTLGaRjGeuskn7YV4KZ42NP08zxSbG+hoVCmHn?=
 =?us-ascii?Q?SkFgauYVHODJh6iZcG+QgkapSy9yk702aDXq9IdI5HUK2C1hd442yC3A35Ol?=
 =?us-ascii?Q?UMaj8npCMNSfWs34yoITm27eLgZ1ekPLqi5kBZTBGVyh7xcSWkLE07eF3J/q?=
 =?us-ascii?Q?l2IAfgycapCcAuyCEwnnH1m29yTWowatPtmHhQW5TgedOiAmZd/lpZHO8keI?=
 =?us-ascii?Q?S/hdNKiLb9YlQvf3qZrFLiNd8w6lohPOlVvmbC01hFtVzhBXPaZE+t41XIT2?=
 =?us-ascii?Q?VAmwTJ5dCudFLIqfzgAoCiQdaIn2mQ4XBkwaNoxMq8ILTkdyOmJ6K5/r/8vS?=
 =?us-ascii?Q?GEW9KwmeyN2pl0NuU2L+Nws7zKAq6/YWhMiRYPgI1zolqnAqWvHoyFOJd7VU?=
 =?us-ascii?Q?FRLzz9geuKG5At5GdTLy9E+Nr7Adgw1I9JiULiwHxSnmbU2yMCbTBSig2adD?=
 =?us-ascii?Q?naON2r4NSTCGG5WUk3cXqO3AyvXZJ7ucZqwoXiW5+137yvrCyicH18wcjFEC?=
 =?us-ascii?Q?VikxuX0o/aMeRjACa5YfJ8OvS9DwLY/BabD8J26q547h4j9IsNDDGZt4/kjw?=
 =?us-ascii?Q?437Akufppo1BKRVfr6Zk+SPDfhF1ScdMgDzyhEUbrhQivM9SNT3oR8SPod//?=
 =?us-ascii?Q?Blywy4DfJCXboogUxNU2UwMseFo5no8cvUykhL3Xo7H6/JkRGRSKGvsp5acL?=
 =?us-ascii?Q?EIjr5kdY1IVCBj/fMWrEGqEm+BTeWrM0dWdOOb3mMvzphTZY2gYFhbsnGUaN?=
 =?us-ascii?Q?ZtdvSK7IKUs/xUUCVEI3JqodKx3eUrY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1865bb4d-6b02-4cd0-40d1-08decdde7a42
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 08:40:55.1910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQVG7v7IHYJVEKUvhc3yAsPgVYjYM7tl+UNaQDbh4kXGWkk9du0I/tYJxwMVuxY2Kl7PGzNj7Jh/OB3dX2aV/PcP6pAcIHDOhu9zNadXKaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13920
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	TAGGED_FROM(0.00)[bounces-34234-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,bp.renesas.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56EEC6A4A7F

Add pinmux definitions for SSI3/SSI4 audio interface on RZ/G3E SMARC SoM:

- sound_clk_pins: AUDIO_CLKB and AUDIO_CLKC clock outputs
- sound_pins: SSI3_SCK, SSI3_WS, SSI3_SDATA (playback) and
  SSI4_SDATA (capture)

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes.
v5:
 - Rename the sound_clk / sound pinctrl node names to use hyphens
   instead of underscores.
 - Sort the sound pinmux entries by GPIO number.

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 455ed35ae5d3..0e6dc84e0199 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -352,6 +352,18 @@ sd2-pwen {
 		};
 	};
 
+	sound_clk_pins: sound-clk {
+		pinmux = <RZG3E_PORT_PINMUX(4, 2, 8)>, /* AUDIO_CLKB */
+			 <RZG3E_PORT_PINMUX(4, 3, 8)>; /* AUDIO_CLKC */
+	};
+
+	sound_pins: sound {
+		pinmux = <RZG3E_PORT_PINMUX(0, 2, 9)>, /* SSI3_SDATA */
+			 <RZG3E_PORT_PINMUX(0, 3, 9)>, /* SSI3_SCK */
+			 <RZG3E_PORT_PINMUX(0, 4, 9)>, /* SSI3_WS */
+			 <RZG3E_PORT_PINMUX(0, 5, 9)>; /* SSI4_SDATA */
+	};
+
 	xspi_pins: xspi0 {
 		pinmux = <RZG3E_PORT_PINMUX(M, 0, 0)>, /* XSPI0_IO0 */
 			 <RZG3E_PORT_PINMUX(M, 1, 0)>, /* XSPI0_IO1 */
-- 
2.25.1


