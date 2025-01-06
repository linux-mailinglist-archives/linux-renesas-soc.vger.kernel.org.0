Return-Path: <linux-renesas-soc+bounces-11886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C241FA03163
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 21:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA763A3FE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 20:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4663F1DEFF4;
	Mon,  6 Jan 2025 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7H7teZa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A0ADDBC;
	Mon,  6 Jan 2025 20:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736195342; cv=none; b=QdBLkfETsrbKICrEQoihO95yBw8NZ6TMUnbxXz/YzUQ88S/5oLI9DiPPcmm0jN3HvfGnEEaivh8MtSTy806GYgqAbJgTf5nJkyBhZc22P9BRl0dfbTLbkty66OcwdCG1Ol2Q/4/0jkv6YFbMTs8QBsC22HKF0oyb7x2oFHSkAtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736195342; c=relaxed/simple;
	bh=QtSw45YLjRRM3O//VNS3TLO/v7XxNO1sYrhBsOP5HVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=llkjJ0N3VcJR/AKIsBdThbIiQjv+Q09HM6Xc+5PiPH6wnwqg88f1LYD5ni19ELNqNc/y4AVFpR8Tqs3HG0yWgTfEM+67aVA3oLRqNHpyr1HWUD/Tf9fCGJjIyz4QhLst+TE/lREvBbPhPFy/Wj+aUvtFRaTkkCXV0YTYqK3lqeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7H7teZa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so20682815e9.1;
        Mon, 06 Jan 2025 12:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736195339; x=1736800139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izm+IdVITcWqCa/pkYl80o8uIjOdQ/cySGFqTEf8RKk=;
        b=B7H7teZa33+BIkHKEnkv19tUEDBjy11DalEgH1qzwGb9VyHLEtETiRbAEGEBYCavzt
         B9NihtwJNv4c2lv0/L6kkp+i4+CSIMAAd712pzZXFZHRgOqbTq2L3/iyKaFzk4DAQAml
         THra+kQCoSqpiecsnklCwwMthej4ALZ3jtt+L/HlyA+KzE29o1G/IMOF6jXFUBHpRwFc
         xo2iC5aD+hOos4Ad7nd3okyMHqpZ4ZD55gTeqY8/1Dr+PsfPPGf7rChon55k15bZMuzD
         ZMOnV5jdX2hV3eKxpXFCDqthiEDDBcyH+Yk7IMxOjcDMtqotYjbH5J7a8FiIC+p4UsJ7
         6snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195339; x=1736800139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izm+IdVITcWqCa/pkYl80o8uIjOdQ/cySGFqTEf8RKk=;
        b=SfV2oDcxWi3Rpjt+lXITc8DnjcMV3UGZjbIjPyIIgSPP2SQggEHosyOCieUdpTG6Ow
         Pb3ZxWNdOwxvItw/MYSUaysKPpgTEjyen2bAiYUckaW+OvYvkmiozpn7S5rH9/KLJB8O
         XZoNDDudT9oZhrv/0tZZAqSg3ev7N2slIjKT5whMyaWi4XIBJuGa3YdYH7VG6/L3YzTi
         yb7ETqAJB76NBGG/o0PD9n9t8n8OE9KrZkCL3U5S3AaNIEWvo1Unw1i4FLY3TLcZ4mkt
         rwZGf4uM2SDVullt5UhFSkdmQfGN5KkEtWCvJ1XIPbpA5k+TnG7YJzi95D+SYJB6GXfg
         qiUg==
X-Forwarded-Encrypted: i=1; AJvYcCX36g/P730i3Q3vhC9XBvA10RzeEIMusVzskCx+wp5QbtVFJWKmJWqk+nRr28B3lNmEm8nk3m/pkUU=@vger.kernel.org, AJvYcCX9yPrqSfLZS6wnrfxkUpKdkbRJGvOgiF2ERH9q37S3qi9PmQjAcJlbdvcW9eryoQjnSdC6Tr3LGD9MwMgm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6kCl5K2ZWNbY8jKboXJPCbXmYaz4qnZm2Wwt58EVQKY2QcrzE
	dxAbd1Bgx7FsWdVtcOhdUuCdgNRczETGPJ2U8pNagwoBn/6PScZh
X-Gm-Gg: ASbGnctuQZov5uBNtYb0sFmtbWp7pypU2qTDUaB52WFTArv/+v9GeFwpjuWdCVFpnv9
	FS4EPXvOBxifg4+OzJKuYwwf/zu0rKxoGdfz++tG68dQLmmRjiPl4mFSTGf/AlM7uQnfesOYs50
	p58e0VweOPv2c3k6RKvHVCuSzZKAJdSsqINeQZZmkzK+IX2wy9ZJYlz6qshTZVaA0zW/XhM19VH
	ilQxKr89Imww6vcCNIqv26yWc0dV9i4HIRl2s89azLnOwCrFA3UwtWoF310zsDE5myU8qEqeH0D
	xNyo8ynO
X-Google-Smtp-Source: AGHT+IGgBquHVLMfWKIpEUoRy56bGl227n8HFSBQk1637DjInHECKO3C1/hsSoSfwn2MRqTn9LewXA==
X-Received: by 2002:a05:6000:188e:b0:385:f840:e613 with SMTP id ffacd0b85a97d-38a223fd52dmr43994475f8f.51.1736195338397;
        Mon, 06 Jan 2025 12:28:58 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:da96:e87:47b7:8629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8475cesm48382673f8f.57.2025.01.06.12.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:28:57 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] clk: renesas: r9a07g044: Add clock and reset entry for DRP-AI
Date: Mon,  6 Jan 2025 20:28:53 +0000
Message-ID: <20250106202853.262787-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add clock and reset entries for the DRP-AI block, which is available only
on the Renesas RZ/V2L SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Made dtable_4_32 available only when CONFIG_CLK_R9A07G054 is defined
---
 drivers/clk/renesas/r9a07g044-cpg.c | 55 +++++++++++++++++++++++++++--
 drivers/clk/renesas/rzg2l-cpg.h     |  2 ++
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index d5979270f4ae..182dc39fac43 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -95,6 +95,41 @@ static const struct clk_div_table dtable_1_32[] = {
 	{0, 0},
 };
 
+#ifdef CONFIG_CLK_R9A07G054
+static const struct clk_div_table dtable_4_32[] = {
+	{3, 4},
+	{4, 5},
+	{5, 6},
+	{6, 7},
+	{7, 8},
+	{8, 9},
+	{9, 10},
+	{10, 11},
+	{11, 12},
+	{12, 13},
+	{13, 14},
+	{14, 15},
+	{15, 16},
+	{16, 17},
+	{17, 18},
+	{18, 19},
+	{19, 20},
+	{20, 21},
+	{21, 22},
+	{22, 23},
+	{23, 24},
+	{24, 25},
+	{25, 26},
+	{26, 27},
+	{27, 28},
+	{28, 29},
+	{29, 30},
+	{30, 31},
+	{31, 32},
+	{0, 0},
+};
+#endif
+
 static const struct clk_div_table dtable_16_128[] = {
 	{0, 16},
 	{1, 32},
@@ -115,7 +150,7 @@ static const u32 mtable_sdhi[] = { 1, 2, 3 };
 static const struct {
 	struct cpg_core_clk common[56];
 #ifdef CONFIG_CLK_R9A07G054
-	struct cpg_core_clk drp[0];
+	struct cpg_core_clk drp[3];
 #endif
 } core_clks __initconst = {
 	.common = {
@@ -193,6 +228,9 @@ static const struct {
 	},
 #ifdef CONFIG_CLK_R9A07G054
 	.drp = {
+		DEF_FIXED("DRP_M", R9A07G054_CLK_DRP_M, CLK_PLL3, 1, 5),
+		DEF_FIXED("DRP_D", R9A07G054_CLK_DRP_D, CLK_PLL3, 1, 2),
+		DEF_DIV("DRP_A", R9A07G054_CLK_DRP_A, CLK_PLL3, DIVPL3E, dtable_4_32),
 	},
 #endif
 };
@@ -200,7 +238,7 @@ static const struct {
 static const struct {
 	struct rzg2l_mod_clk common[79];
 #ifdef CONFIG_CLK_R9A07G054
-	struct rzg2l_mod_clk drp[0];
+	struct rzg2l_mod_clk drp[5];
 #endif
 } mod_clks = {
 	.common = {
@@ -365,6 +403,16 @@ static const struct {
 	},
 #ifdef CONFIG_CLK_R9A07G054
 	.drp = {
+		DEF_MOD("stpai_initclk", R9A07G054_STPAI_INITCLK, R9A07G044_OSCCLK,
+					0x5e8, 0),
+		DEF_MOD("stpai_aclk",	R9A07G054_STPAI_ACLK, R9A07G044_CLK_P1,
+					0x5e8, 1),
+		DEF_MOD("stpai_mclk",	R9A07G054_STPAI_MCLK, R9A07G054_CLK_DRP_M,
+					0x5e8, 2),
+		DEF_MOD("stpai_dclkin",	R9A07G054_STPAI_DCLKIN, R9A07G054_CLK_DRP_D,
+					0x5e8, 3),
+		DEF_MOD("stpai_aclk_drp", R9A07G054_STPAI_ACLK_DRP, R9A07G054_CLK_DRP_A,
+					0x5e8, 4),
 	},
 #endif
 };
@@ -431,6 +479,9 @@ static const struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_ADC_PRESETN, 0x8a8, 0),
 	DEF_RST(R9A07G044_ADC_ADRST_N, 0x8a8, 1),
 	DEF_RST(R9A07G044_TSU_PRESETN, 0x8ac, 0),
+#ifdef CONFIG_CLK_R9A07G054
+	DEF_RST(R9A07G054_STPAI_ARESETN, 0x8e8, 0),
+#endif
 };
 
 static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 975a8e09f7d3..e2743201102f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -21,6 +21,7 @@
 #define CPG_PL2_DDIV		(0x204)
 #define CPG_PL3A_DDIV		(0x208)
 #define CPG_PL6_DDIV		(0x210)
+#define CPG_PL3C_SDIV		(0x214)
 #define CPG_CLKSTATUS		(0x280)
 #define CPG_PL3_SSEL		(0x408)
 #define CPG_PL6_SSEL		(0x414)
@@ -71,6 +72,7 @@
 #define DIVPL3A		DDIV_PACK(CPG_PL3A_DDIV, 0, 3)
 #define DIVPL3B		DDIV_PACK(CPG_PL3A_DDIV, 4, 3)
 #define DIVPL3C		DDIV_PACK(CPG_PL3A_DDIV, 8, 3)
+#define DIVPL3E		DDIV_PACK(CPG_PL3C_SDIV, 8, 5)
 #define DIVGPU		DDIV_PACK(CPG_PL6_DDIV, 0, 2)
 
 #define SEL_PLL_PACK(offset, bitpos, size) \
-- 
2.43.0


