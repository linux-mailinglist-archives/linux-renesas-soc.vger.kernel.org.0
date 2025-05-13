Return-Path: <linux-renesas-soc+bounces-17058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C132AB5901
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 17:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A1AF1786C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4382BEC50;
	Tue, 13 May 2025 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtgVW5OP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71122BE7BB;
	Tue, 13 May 2025 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151208; cv=none; b=J7QsCzw9jBXqAnoDWMJ1II3OBWoc3tF870jSmiwYl/6Y3Qfmma0N4UuPtKpMrKGphj1QspKrng7LypBG9WNTXvgMM7HGU6hwpRTKEIVOLe4VtGKwalnN7fB469cp80OtXc+11vqkiFTyA6ZIX1EBIRek2+tQi0T9pHomW90dyE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151208; c=relaxed/simple;
	bh=ND04u7mZCxafVj4HkDYoTBQzQ6yOCjXLrkgDWK76YaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eP3H8CielEiVvrNmNxRM2pRz5hJL5WAqzH8ipK7Ce8SjTIU8/6rMvdO3wJLIklakBtIoBcESEAVX4GcTvgFVGHL9ZRh/5HVhVx4BFln4nYOmzdDgC//Wq8VLpPlgQyDyzLA/UQAKudxuTRRFLmAiSOC6Ws678pKtoSOieHqeOrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtgVW5OP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so59655705e9.1;
        Tue, 13 May 2025 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747151205; x=1747756005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FefmbA6pOI8PMez6FVUK7e8M/BJCoNBt+TOUtcp4/mE=;
        b=RtgVW5OPGq+QFT+rUGwwHybPNiwtwgL+BwpBsYWu0f4MkJSq4e06QP9jV9kZ1n/gJO
         tvlDme3G1G3g0yj56jx4SNX5fP9l53QQIM8JjCvv5pIsjHl2qbZq3acXs97vdLRXfmH+
         FyZoB6VL9Dqj4TNDYMEPG1G7s3upzjV17Ih5n6XM5QIF3AGBAzkBKWitKAkpISJBGNK6
         vxI0Ls5p4uLj7afuxbIbNqvDUVZflKlvhIP5m+lix0Blm4UnHYRcEADm+04iQwC/PII7
         NkXe7ChpTCF8fmnnzizUBRj1/GpTVSQXduWNp870KjWYvEWzY74mHji0AxkE0lxU38Ch
         X6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151205; x=1747756005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FefmbA6pOI8PMez6FVUK7e8M/BJCoNBt+TOUtcp4/mE=;
        b=FUTdJ+5KSf5iPbxoQwv9QmNyO5EyPEUZhv+gTxFeQ1/s4NTjk+l4+ZCzcjRjuDApUU
         06WBOKqtYI1PrHGPBncpe68ERCFZMJ712TMl1jeUNaYgS2eLcy+MrT+qAyHxnTR9r/QD
         PWjEQ53Ut+TL1jvQ6zx0BePjFNeUPw5CKJQsaqrhlwFoHlgxHQ8qGkaSSTU/x6RYX2tp
         MbSd6E9R17dVUQGzpfpiqFKpogA8GHDAtseHfOSg5bpvQAO1jiOlUsHNVW4rRauhW3pi
         AH96VkHEQ8+NmmUWc3Dr42Mq0E0Uw6y3BN2IqidDOEyMV7PT88tV/fAJbJu17vmvm7jh
         w5cw==
X-Forwarded-Encrypted: i=1; AJvYcCWK6vCg/mNxtRCcqyZrTxSA6uHAt5ICe6qPtc7ZbK6U7EBmDinfWoeXPn07sfrBvAyGFLvDA9u6ffEhl6w=@vger.kernel.org, AJvYcCWQKCSU4xpL+weitoXpgzw2zwrVtHHasC92dqAli4e0mAegp9JgvTnI1/+gfawavWNVmqzb9V8Bi+CtxwSsOJMvPbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyni/UCuoWLX0QuvRkADXlINXSYT1D7Uzco756fF8iiiRXdDA8e
	/pjWMwe8kBa8z4Zcu3zGRTne5lvJ16jypuO3+0MdPye+bSN42+X9
X-Gm-Gg: ASbGnctfPW25Mdpp4U0eU2ws0Ugjcl5LkTTa26GM/jQ0/kg5iY7aZaBRj/CO/Qg+GK2
	9Ctu3Lc7hljIC7Di+NgPRFVIq4rtkRpkRUF+y9N25uUU0BsyHl8fZFDsvIpztLe5WOTTzNl/z7l
	cx6Dwo0OtdDvLFpbA0kJCEKLaegH4ylStbKGWW9MUjCwRIl6wn7xMpI4cL62qLQ3ESfVUqMlQCL
	ATC4GceUk1hiwSfmy3XMaV6H7Y/Bth1TAgW7OV6Qv/Cke3IF7rIbWKb4Tj+fXPsO5lys2Bmu96n
	uErBrDdnIORndlJkEhIlyOZj9xKtxY0tIY4tiShanvb/rK5onGnvhz72378LQLC63eD4FjfyOLz
	c1uq5YreVxGxUIGlSdUsu
X-Google-Smtp-Source: AGHT+IFd8YocAXJjTASlpGSxIniCnwA35PkUAppMddBcuuzZsCyPcwTDS+GvCWNTdIIq1aTPh1OcOQ==
X-Received: by 2002:a05:600c:6487:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-442d6d516efmr165814595e9.19.1747151204757;
        Tue, 13 May 2025 08:46:44 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d596a5e4sm183724645e9.31.2025.05.13.08.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:46:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] clk: renesas: r9a09g056: Add clocks and resets for Mali-G31 GPU
Date: Tue, 13 May 2025 16:46:35 +0100
Message-ID: <20250513154635.273664-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset support for the Mali-G31 GPU on the Renesas RZ/V2N
(R9A09G056) SoC. This includes adding clock sources required for the
module clocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g056-cpg.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 7e34c4259a6c..13b5db79aab4 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -29,6 +29,7 @@ enum clk_ids {
 	CLK_PLLDTY,
 	CLK_PLLCA55,
 	CLK_PLLETH,
+	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV16,
@@ -36,6 +37,7 @@ enum clk_ids {
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
 	CLK_PLLDTY_ACPU,
+	CLK_PLLDTY_ACPU_DIV2,
 	CLK_PLLDTY_ACPU_DIV4,
 	CLK_PLLDTY_DIV8,
 	CLK_PLLETH_DIV_250_FIX,
@@ -46,6 +48,7 @@ enum clk_ids {
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
 	CLK_SMUX2_GBE1_RXCLK,
+	CLK_PLLGPU_GEAR,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -93,6 +96,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
+	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
@@ -102,6 +106,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
 
 	DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
+	DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
 	DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
 	DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
 
@@ -116,6 +121,8 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
 	DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
 
+	DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G056_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G056_CA55_0_CORE_CLK0, CLK_PLLCA55,
@@ -236,6 +243,12 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(8, BIT(6))),
 	DEF_MOD("gbeth_1_aclk_i",		CLK_PLLDTY_DIV8, 12, 3, 6, 3,
 						BUS_MSTOP(8, BIT(6))),
+	DEF_MOD("gpu_0_clk",			CLK_PLLGPU_GEAR, 15, 0, 7, 16,
+						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("gpu_0_axi_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
+						BUS_MSTOP(3, BIT(4))),
+	DEF_MOD("gpu_0_ace_clk",		CLK_PLLDTY_ACPU_DIV2, 15, 2, 7, 18,
+						BUS_MSTOP(3, BIT(4))),
 };
 
 static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
@@ -269,6 +282,9 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
 	DEF_RST(11, 0, 5, 1),		/* GBETH_0_ARESETN_I */
 	DEF_RST(11, 1, 5, 2),		/* GBETH_1_ARESETN_I */
+	DEF_RST(13, 13, 6, 14),		/* GPU_0_RESETN */
+	DEF_RST(13, 14, 6, 15),		/* GPU_0_AXI_RESETN */
+	DEF_RST(13, 15, 6, 16),		/* GPU_0_ACE_RESETN */
 };
 
 const struct rzv2h_cpg_info r9a09g056_cpg_info __initconst = {
-- 
2.49.0


