Return-Path: <linux-renesas-soc+bounces-33093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gALTHeYuFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:13:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E53AD5C9CA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C88B304A8C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30CEF37DAD7;
	Mon, 25 May 2026 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TvRc694p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15F25B085;
	Mon, 25 May 2026 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707262; cv=fail; b=Lik4+weBCPqDGwcjEW4XM3rDKZ2zXnLQBcoJJo2mjBApCsSUphIwzaQRXFObZkbOQ3og10sUtZGdGEGd4V+Yh1XXCzsWO+sA+JXJ6kNl81YP5yMGXQHuZL0MHgTE/PGnAbJCjcUOxWAdIYQ/lQVRHg+troz+vC7y5Ciqvi8SdYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707262; c=relaxed/simple;
	bh=lMwzgwcwktPTyXk2DDEPUnOT5HWs/tL4L3MSL0VonwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=En5jcsdEo975y61vT3OOOs1tJLEWqWBGHpzCkrjymrv6fvdpZs6nEGv7sfMe1RczwQf+GnpvCKpQLYPJT+MWvZKwgHN1rRgLJ75DKyKpQcwMLK6pla6o+OC9K8KADPcpUc7EcNXbsuM/HlvMJP1qE92/NgyeQzDfLYnt3gk530o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TvRc694p; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3jELLWJ1NHDPSdrRia2tFxNJcSy9WqrZVlkn30sMylK/4xbyGyZn6nig5C68oyXqZYUkQ4OuWgGWQlqEpXSagraORtNpfsm8AdhkrYm4CwWNPZW0VZbEnTM4d1E5MWch+at2SN6Yhw6lJcjA0X5SJIL6sA3prR3Vifpdcz/mYdBzhe98O29ArJtJ0rGztZ6h17WksJFEjB0colAvaUoJ7gU1Ungomj09JJNDc1o6NEu5tKeyzEtxBkXzjsRLX6+984W2kaOvovEQfN2u2BpvmeAIgcIw/Nt/0rtnfTG54kSrP1mUybN8E/K83dyTrTHAiqYJH73KR7Lw3+mduMspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UsVnPt7AvWn1sGiSZe5FBkCFLBic3kjWz8mzybnJK0=;
 b=izpwbJryIQ2NZPsnDZV4axz+AYsSrf+UAa1UuGW/gLAvkieOvwasHk/DWU5MYRUpWQrBnv3WukoFCD3KYM2PAYQHfrU5QkEDGy3pjZspyEgn+W7Y2HEOGovL1Pwi/enC2wTTYwtqepRUxdawq8qMz3uZHw7j8ddQ3rZo3cSmltWS+C0+8lWtZfactMfJrrpzlZP7gzqEqfhM9CxQ0rqngDzyjSdZb5Lx4PEy8UPvsBgwoJrgHYWSZ6cUAVlyJuwoCetRWGc3UXV2W9R/pQYo53p4DSPdxt8llvpy6vjUWY+9v12eS1B2iXP4aoreYqbMbrWTnbXuK0U+kveCCXA1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UsVnPt7AvWn1sGiSZe5FBkCFLBic3kjWz8mzybnJK0=;
 b=TvRc694pnzFURFRdBS0beqJawfFxPodtetoduuhqkfZE2uN2NtA0OS2N4faS0RAHZOCmQNHiq7jl1dRvLpdnrc75gJB1FQF7gRCcPaiHE8nEz0BFWBkiF2SfTpBJLleNqb0zg1nDCdwtQNlFHBtx9rekjJFR67UsasR+uw0pt9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB8484.jpnprd01.prod.outlook.com (2603:1096:604:189::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:07:38 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:07:38 +0000
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
Subject: [PATCH v4 7/8] arm64: dts: renesas: rzg3e-smarc-som: add audio pinmux definitions
Date: Mon, 25 May 2026 11:06:02 +0000
Message-Id: <20260525110603.4018170-8-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OSZPR01MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: b65cffc5-bf13-40bd-754d-08deba4dd4d6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|11063799006|3023799007|5023799004|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	sCiPJs92qwkBaxZs5wE2SDo7cPoporTB0Qfz1W9k+VQrtp08cEV3vEnW12fabgj6mWUcR12hzeShNoom6dsydEszbTa0RaTDRkORWryVIQoekhnlJTSEg4inYjO4xsMW0hFPCKkljgFuLQYOgKxm/sBQ7/o/WkUUMAEuxcrTMRBq+72xRQjXVq3XitnCBEqTkv2S6Rw131j+7lrMsQp6rR+jVNbXOs7Wunga8AhhpzJc8E7+YJc5uKsEBFe6t7E7tmAc7GCUpPh6Ze8WHl2JeIsfbko2jHcf4ueONRDXbK/llSju70UVjkfoO666KyE9IiIFwHSQt2XqPGrdCPuR3SdIGIn1po1VabZdkYveiFJNPTUxhHIpM/zeA/7USrSRX+63sYvTEMqNr8wHPokRVFHUDpz4DDGY8HHRKcrb9VbyD5WhL7LjD3mxCXj6mz6B8i22pxha9CK7Z+qBzNrgtD1qC+sqVC2ZTg/zI3r4Os3Qzsg/y+oNnaLHlcJi5QGgbSysAV7jnpZqFkbcp4BgYjLrsq4w95LsrPvadV9PRZokoq/PYlK/NgX9CGhCodYY+qHi9e3afBa6V25hdmOjLvMcYzhp0WWuRviNw9fO5YAZ/CVJ6ynEaKXgUFo6XfAP08oGtnf8x/ray3YDWKPKRpdm7MxemYk5QWBy+Ed1ZrBCxFe87tA7BbTDjH8Xekkc5Gq8krauFKDGhRG/2I8glDX7OmNmLaw35cMpxWNrIZkZ3XcsKU96yactnAGpva2Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(11063799006)(3023799007)(5023799004)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?25pVETIsHwlQJgBNxG5ySw1JeLbcR5iYm7wgVG6gyIdWingwUy6H/x96ULIH?=
 =?us-ascii?Q?+F5sHJ1KFHC3IGe20BygM0LI2iPvWlDF4NVWvO2PHU3qQDUc8ghMRUYWNO8r?=
 =?us-ascii?Q?8gl9IZH/IJ6EhgmQlDoMzRY/qcClN1qpd2Kztuw+qT+jXOEvvTIfFtsf/JXU?=
 =?us-ascii?Q?143hcmILbyC8YD/LdQIb6bxwmFmLKJcH8VPMKljO8lvfkkgjSea1dMW+a/gK?=
 =?us-ascii?Q?8cVY/EZIb5otAhCAZooEIo9UA0AgfZ6O7TRtw4CfXIrbfP0Ui5aq6Z1cfDA0?=
 =?us-ascii?Q?Xu2Vvl1MdaP1rKU4hMNnL/+/qkfojMnVMcL3x6sapsv0aTZ1V7/pbpdH1x1w?=
 =?us-ascii?Q?HtYru7wxCuwgdACMCkxMuiYXzEYbSjnxgb2DL+Lb4zAaiIAzKpDjd0BV0/0L?=
 =?us-ascii?Q?OrZMDBCzArPuGNubAMrC4WhHmk6YmmHFnyQcJMEQnfLyV0lY2YHbeStCxmY+?=
 =?us-ascii?Q?TPPz6hOwr0u/MXTnfSzD3P7glwxtWC4sgqs7d1+puAneh5EIKTTvx3pqTl5Q?=
 =?us-ascii?Q?6fG9G1tXTFXGOauzhRD7rmXiemqrq9O9ss7ZSKhoj8crHe5yMfw87iYvewXg?=
 =?us-ascii?Q?lG/P+Rqx46GuqxRU2aDs29KFZnxBeRLyAH++QKJqMfdaUrPaAaEaCNh4bWMK?=
 =?us-ascii?Q?82k3yHRDHWrDvZt7vplGF8AUQ8W92Pi8S2YLZQ/wiP6UlfJCmlyutSZb8cbi?=
 =?us-ascii?Q?+giZtggTNKvadHdhmTO9p8TlISdtByBiumBZOJIoyBh3pdloUWWTfigpq7SY?=
 =?us-ascii?Q?eC4xkMLUJid4JRnwWMqV+GoroPZ9V9POUFOiXuCFfy50TRQVgAbQpay3hcT4?=
 =?us-ascii?Q?c64wqj+IfD3RtD3Kcug6rRjbnA4D/4/ifHUrxqAC/Pn/oX+nlyskgGkT18CK?=
 =?us-ascii?Q?h79TrXuOmOXJ9IjxgfACVWvLFPaOHHHabXSDI0tw6pZC3wWOdaR67V2BnCLY?=
 =?us-ascii?Q?RnWFyat3n5iNCnrfzqTbnh5lL23PPmIWB/C2UJn3+vnorPbBvMgS2IBuGIeG?=
 =?us-ascii?Q?hmttNbLuDg0GdFYcAnfK+zEY0HUaIG4Q3nAa8y7MFJddf3GZNXfvDy74/hAT?=
 =?us-ascii?Q?yta2e59Sdxddc+0azq2VLL7ZLpVUaMpu+2Vi2m3wuZ5IiPE+XIP21adi6IBv?=
 =?us-ascii?Q?SXcWI5ga3fRV1OAx1Tded/ULPnG7NxPbk2CpdN6Tq60VdEWWeVj9P0uXEmTG?=
 =?us-ascii?Q?we+ZK/Gv2BxsLuaJANxZOkAe4m6l521p08t6b6y21rWWKtEUwZsHK+NwV3q/?=
 =?us-ascii?Q?y1kHGwBeUFquHiEeKDnAcDwU8L+1Ol8hMg8obMxdH+Q4jPWFL2MvMhh9UWi3?=
 =?us-ascii?Q?1LL8Tefqi6vO7EQJBQ4mximROtap5THJN1IFAP87CUFlrryYJGmit5sFwcNG?=
 =?us-ascii?Q?9MTvEx+Aq3JYwA5LKOOBz3VIuLSForzvYLYUUYcU+051YoHq1ALZnaRCn9DB?=
 =?us-ascii?Q?AU8EuEOTMWPeRt9mlcvM85pC6EmFd7gQ8MElKUTk2A32vvA2nx27+f3Rn7Cs?=
 =?us-ascii?Q?186K+cQLx2rwn5CajG0O08Dk5dl6/1pm+oH98JB/y6xHwHM9QzRhzRAwFMb6?=
 =?us-ascii?Q?g65aPiciEXgwEMK5t/pX2PVYSynSvwDFGajemk2DhPKmIbetO6KmFCS3/s6j?=
 =?us-ascii?Q?uG/Wt5sHeG3aC6S+2P3sOjjFPlm13KfjfCs1r/xv1tlUotOmFKYRZlQ4JMAm?=
 =?us-ascii?Q?gnxDhgQ5ewvpEz+/nRH2N4RHp0+KIY3WFulPa5CL5p7mrupZudDEfxXeBXQm?=
 =?us-ascii?Q?Q/+JpRd1jZIXpX2srJ8OnE9BR4RaCrs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65cffc5-bf13-40bd-754d-08deba4dd4d6
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:07:38.2576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bw3pEjygezz7XFLoUpTnFYRc756Xb1YoO2224Kwp5YkUn7CPNqfRfBOZgTJflbTjIobXmvTiQULQOCse7JTKAlwIH9TXW8+a6DBEHRyMA7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8484
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33093-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[redhat.com,bp.renesas.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E53AD5C9CA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add pinmux definitions for SSI3/SSI4 audio interface on RZ/G3E SMARC SoM:

- sound_clk_pins: AUDIO_CLKB and AUDIO_CLKC clock outputs
- sound_pins: SSI3_SCK, SSI3_WS, SSI3_SDATA (playback) and
  SSI4_SDATA (capture)

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v4: No changes
v3: No changes
v2: No changes

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 493f6783d583..f4532a06cc31 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -353,6 +353,18 @@ sd2-pwen {
 		};
 	};
 
+	sound_clk_pins: sound_clk {
+		pinmux = <RZG3E_PORT_PINMUX(4, 2, 8)>, /* AUDIO_CLKB */
+			 <RZG3E_PORT_PINMUX(4, 3, 8)>; /* AUDIO_CLKC */
+	};
+
+	sound_pins: sound {
+		pinmux = <RZG3E_PORT_PINMUX(0, 3, 9)>, /* SSI3_SCK */
+			 <RZG3E_PORT_PINMUX(0, 4, 9)>, /* SSI3_WS */
+			 <RZG3E_PORT_PINMUX(0, 2, 9)>, /* SSI3_SDATA */
+			 <RZG3E_PORT_PINMUX(0, 5, 9)>; /* SSI4_SDATA */
+	};
+
 	xspi_pins: xspi0 {
 		pinmux = <RZG3E_PORT_PINMUX(M, 0, 0)>, /* XSPI0_IO0 */
 			 <RZG3E_PORT_PINMUX(M, 1, 0)>, /* XSPI0_IO1 */
-- 
2.25.1


