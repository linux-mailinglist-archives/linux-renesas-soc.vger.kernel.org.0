Return-Path: <linux-renesas-soc+bounces-30788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK6+AmydzmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30788-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:46:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673238C22D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D19A30BC371
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208003F210D;
	Thu,  2 Apr 2026 16:32:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF67E3F1658;
	Thu,  2 Apr 2026 16:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147556; cv=none; b=HmxQM9QrGWD6QndaK5ciIUGWZIoDtp/XfEyACO/3WyoVPdviMYhtbVBN74dVPYKmlNmORQDyqStHtUj6Bi3SulFsz0padfREG5pR8ms1VgKyt4wf4csWS0SOtWF6YLyiLMtTO6av3AHp+7tX16XBVUCSD/i0p2ia3RGYEFZV3wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147556; c=relaxed/simple;
	bh=htY4R93hUQvqMTXVC9Z8Fx0GPcaYzhokDYmPN4X0WMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFep07e3cis7F5Df1YhnSWCpZvw1/PJqF2ATNNXecWlcPvC5e8d9q4aPLRQBXuVrXSxE9+gzj6tFm3gXFnDRNZ4qqEA6siSRqxZa0ObKgJXLyBGIBpnrCZgQ9S3oQCVprWx6J5wcehjrsEbEcGG1nbBpTE1qEU4AsqBq8HgvS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Crn6D5xmQh6e+cfVCKTxWg==
X-CSE-MsgGUID: Juo0+x9UT6ylVpn8fFqUTw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Apr 2026 01:32:33 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0BD7D40083E2;
	Fri,  3 Apr 2026 01:32:28 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCh v3 2/8] clk: renesas: r9a09g047: Add audio clock and reset support
Date: Thu,  2 Apr 2026 18:31:20 +0200
Message-ID: <20260402163126.12135-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
References: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30788-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.951];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 2673238C22D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clock and reset entries for audio-related modules on the RZ/G3E SoC.

Target modules are:
 - SSIU (Serial Sound Interface Unit) with SSI ch0-ch9
 - SCU (Sampling Rate Converter Unit) with SRC ch0-ch9, DVC ch0-ch1,
   CTU/MIX ch0-ch1
 - ADMAC (Audio DMA Controller)
 - ADG (Audio Clock Generator) with divider input clocks and audio
   master clock outputs

While at it, reorder plldty_div16 to group it with other plldty fixed
dividers.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: No changes

 drivers/clk/renesas/r9a09g047-cpg.c | 129 +++++++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index e59ac4a05a7f..2d7e58f155f6 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -22,6 +22,9 @@ enum clk_ids {
 	CLK_AUDIO_EXTAL,
 	CLK_RTXIN,
 	CLK_QEXTAL,
+	CLK_AUDIO_CLKA,
+	CLK_AUDIO_CLKB,
+	CLK_AUDIO_CLKC,
 
 	/* PLL Clocks */
 	CLK_PLLCM33,
@@ -34,6 +37,8 @@ enum clk_ids {
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV3,
 	CLK_PLLCM33_DIV4,
+	CLK_PLLCM33_DIV4_DDIV2,
+	CLK_PLLCM33_DIV4_DDIV2_DIV2,
 	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
 	CLK_PLLCM33_GEAR,
@@ -41,15 +46,19 @@ enum clk_ids {
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
 	CLK_PLLCLN_DIV2,
+	CLK_PLLCLN_DIV4,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
 	CLK_PLLCLN_DIV20,
+	CLK_PLLCLN_DIV32,
 	CLK_PLLCLN_DIV64,
 	CLK_PLLCLN_DIV256,
 	CLK_PLLCLN_DIV1024,
 	CLK_PLLDTY_ACPU,
 	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
+	CLK_PLLDTY_DIV2,
+	CLK_PLLDTY_DIV4,
 	CLK_PLLDTY_DIV8,
 	CLK_PLLDTY_RCPU,
 	CLK_PLLDTY_RCPU_DIV4,
@@ -64,6 +73,7 @@ enum clk_ids {
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_GPU,
+	CLK_CDIV5_MAINOSC,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -120,6 +130,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
 	DEF_INPUT("rtxin", CLK_RTXIN),
 	DEF_INPUT("qextal", CLK_QEXTAL),
+	DEF_INPUT("audio_clka", CLK_AUDIO_CLKA),
+	DEF_INPUT("audio_clkb", CLK_AUDIO_CLKB),
+	DEF_INPUT("audio_clkc", CLK_AUDIO_CLKC),
 
 	/* PLL Clocks */
 	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
@@ -135,6 +148,11 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
 
+	DEF_DDIV(".pllcm33_div4_ddiv2", CLK_PLLCM33_DIV4_DDIV2, CLK_PLLCM33_DIV4,
+		 CDDIV0_DIVCTL1, dtable_2_64),
+	DEF_FIXED(".pllcm33_div4_ddiv2_div2", CLK_PLLCM33_DIV4_DDIV2_DIV2,
+		  CLK_PLLCM33_DIV4_DDIV2, 1, 2),
+
 	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 
 	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
@@ -142,9 +160,11 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
 		  dtable_2_16),
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
+	DEF_FIXED(".pllcln_div4", CLK_PLLCLN_DIV4, CLK_PLLCLN, 1, 4),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
 	DEF_FIXED(".pllcln_div20", CLK_PLLCLN_DIV20, CLK_PLLCLN, 1, 20),
+	DEF_FIXED(".pllcln_div32", CLK_PLLCLN_DIV32, CLK_PLLCLN, 1, 32),
 	DEF_FIXED(".pllcln_div64", CLK_PLLCLN_DIV64, CLK_PLLCLN, 1, 64),
 	DEF_FIXED(".pllcln_div256", CLK_PLLCLN_DIV256, CLK_PLLCLN, 1, 256),
 	DEF_FIXED(".pllcln_div1024", CLK_PLLCLN_DIV1024, CLK_PLLCLN, 1, 1024),
@@ -152,7 +172,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
+	DEF_FIXED(".plldty_div2", CLK_PLLDTY_DIV2, CLK_PLLDTY, 1, 2),
+	DEF_FIXED(".plldty_div4", CLK_PLLDTY_DIV4, CLK_PLLDTY, 1, 4),
 	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
+	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 
 	DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
 	DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
@@ -164,9 +187,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
-	DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
 	DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
 	DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
+	DEF_FIXED(".cdiv5_mainosc", CLK_CDIV5_MAINOSC, CLK_QEXTAL, 1, 5),
 
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
@@ -460,6 +483,96 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
 						BUS_MSTOP(2, BIT(15))),
+	DEF_MOD("ssif_clk",			CLK_PLLCLN_DIV8, 15, 5, 7, 21,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("scu_clk",			CLK_PLLCLN_DIV8, 15, 6, 7, 22,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("scu_clkx2",			CLK_PLLCLN_DIV4, 15, 7, 7, 23,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("admac_clk",			CLK_PLLCLN_DIV8, 15, 8, 7, 24,
+						BUS_MSTOP(2, BIT(5))),
+	DEF_MOD("adg_clks1",			CLK_PLLCLN_DIV8, 15, 9, 7, 25,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_clk_200m",			CLK_PLLCLN_DIV8, 15, 10, 7, 26,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_audio_clka",		CLK_AUDIO_CLKA, 15, 11, 7, 27,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_audio_clkb",		CLK_AUDIO_CLKB, 15, 12, 7, 28,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_audio_clkc",		CLK_AUDIO_CLKC, 15, 13, 7, 29,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi0_clk",			CLK_PLLCLN_DIV8, 22, 0, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi1_clk",			CLK_PLLCLN_DIV8, 22, 1, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi2_clk",			CLK_PLLCLN_DIV8, 22, 2, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi3_clk",			CLK_PLLCLN_DIV8, 22, 3, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi4_clk",			CLK_PLLCLN_DIV8, 22, 4, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi5_clk",			CLK_PLLCLN_DIV8, 22, 5, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi6_clk",			CLK_PLLCLN_DIV8, 22, 6, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi7_clk",			CLK_PLLCLN_DIV8, 22, 7, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi8_clk",			CLK_PLLCLN_DIV8, 22, 8, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("adg_ssi9_clk",			CLK_PLLCLN_DIV8, 22, 9, -1, -1,
+						BUS_MSTOP(2, BIT(2))),
+	DEF_MOD("dvc0_clk",			CLK_PLLCLN_DIV8, 23, 0, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("dvc1_clk",			CLK_PLLCLN_DIV8, 23, 1, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("ctu0_mix0_clk",		CLK_PLLCLN_DIV8, 23, 2, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("ctu1_mix1_clk",		CLK_PLLCLN_DIV8, 23, 3, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src0_clk",			CLK_PLLCLN_DIV8, 23, 4, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src1_clk",			CLK_PLLCLN_DIV8, 23, 5, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src2_clk",			CLK_PLLCLN_DIV8, 23, 6, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src3_clk",			CLK_PLLCLN_DIV8, 23, 7, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src4_clk",			CLK_PLLCLN_DIV8, 23, 8, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src5_clk",			CLK_PLLCLN_DIV8, 23, 9, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src6_clk",			CLK_PLLCLN_DIV8, 23, 10, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src7_clk",			CLK_PLLCLN_DIV8, 23, 11, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src8_clk",			CLK_PLLCLN_DIV8, 23, 12, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("src9_clk",			CLK_PLLCLN_DIV8, 23, 13, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("scu_supply_clk",		CLK_PLLCLN_DIV8, 23, 14, -1, -1,
+						BUS_MSTOP(2, BIT(0) | BIT(1))),
+	DEF_MOD("ssif_supply_clk",		CLK_PLLCLN_DIV8, 24, 0, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi0_clk",			CLK_PLLCLN_DIV8, 24, 1, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi1_clk",			CLK_PLLCLN_DIV8, 24, 2, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi2_clk",			CLK_PLLCLN_DIV8, 24, 3, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi3_clk",			CLK_PLLCLN_DIV8, 24, 4, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi4_clk",			CLK_PLLCLN_DIV8, 24, 5, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi5_clk",			CLK_PLLCLN_DIV8, 24, 6, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi6_clk",			CLK_PLLCLN_DIV8, 24, 7, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi7_clk",			CLK_PLLCLN_DIV8, 24, 8, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi8_clk",			CLK_PLLCLN_DIV8, 24, 9, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
+	DEF_MOD("ssi9_clk",			CLK_PLLCLN_DIV8, 24, 10, -1, -1,
+						BUS_MSTOP(2, BIT(3) | BIT(4))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -538,6 +651,20 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
+	DEF_RST(14, 1, 6, 18),		/* SSIF_0_ASYNC_RESET_SSI */
+	DEF_RST(14, 2, 6, 19),		/* SSIF_0_SYNC_RESET_SSI0 */
+	DEF_RST(14, 3, 6, 20),		/* SSIF_0_SYNC_RESET_SSI1 */
+	DEF_RST(14, 4, 6, 21),		/* SSIF_0_SYNC_RESET_SSI2 */
+	DEF_RST(14, 5, 6, 22),		/* SSIF_0_SYNC_RESET_SSI3 */
+	DEF_RST(14, 6, 6, 23),		/* SSIF_0_SYNC_RESET_SSI4 */
+	DEF_RST(14, 7, 6, 24),		/* SSIF_0_SYNC_RESET_SSI5 */
+	DEF_RST(14, 8, 6, 25),		/* SSIF_0_SYNC_RESET_SSI6 */
+	DEF_RST(14, 9, 6, 26),		/* SSIF_0_SYNC_RESET_SSI7 */
+	DEF_RST(14, 10, 6, 27),		/* SSIF_0_SYNC_RESET_SSI8 */
+	DEF_RST(14, 11, 6, 28),		/* SSIF_0_SYNC_RESET_SSI9 */
+	DEF_RST(14, 12, 6, 29),		/* SCU_RESET_SRU */
+	DEF_RST(14, 13, 6, 30),		/* ADMAC_ARESETN */
+	DEF_RST(14, 14, 6, 31),		/* ADG_RST_RESET_ADG */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
 };
 
-- 
2.25.1


