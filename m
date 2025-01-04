Return-Path: <linux-renesas-soc+bounces-11853-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4642DA01630
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 18:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F28323A3D13
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jan 2025 17:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8911B87FF;
	Sat,  4 Jan 2025 17:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCvCrPt/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93524149E17;
	Sat,  4 Jan 2025 17:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736013242; cv=none; b=aT/F0rzXWeat5M3XnVKuiPkU80JI0fGq058pyBxIVkMnQSxDWBTdwLQpILkDrdceJrhWHuKK/YjtLQ2IIo12qpQCzK0T2s7jaYhx5sySD9QpIDDzpM2gxukmWBP48EtJqH60eWLMLo56ZkPL18nEVr3Mux/sHfc6q8pSTq2SwWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736013242; c=relaxed/simple;
	bh=Qm2SoZM4stcxB399XphxITkJI+QCFLBu8dRmJQqS/b8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oNV3/T8/Hv1bRIBVfJkVmPQc7j1mnoQygVlmt1OunqOocsYjqrUGRN5L6qQqZFPmQIwhT4/xzULDEYvocDL178JmjgbsMsqDmxSecPOK5zOSV68wO2FnEqoPgTusWx7lYJyyWrXoqIzOuBV81AnqBnTnRUvNbrApZx4+UMh65zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCvCrPt/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436249df846so91037265e9.3;
        Sat, 04 Jan 2025 09:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736013239; x=1736618039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EE4XPce77KF3pYncLvKZ4cV7BRKfotXlhaeKdV5BDFE=;
        b=fCvCrPt/8aKJFdyREuIh5Owd1N/mGEeE+Ysq1nPaqmcncSqWlEn1seWOHoYGkzVF8H
         0uAbbWmX97/MDG0Hcr0L9iy7x5AXXBsUqKbdQ/LP+wcGhrScL2UFD9oAny3YsWND5ndm
         urA+Mooscpv/3Wu33B6TQhruYSL/Y+npdPrgECJgU8fTIxGriyl03K7Kvrsg/+v7b/5t
         avLqEAavvOBdqUpjM547OTsnKuiA5rPtjEcbnPysvmVPibv03H7gXiBre6bTuA1CRI6H
         abuZQB4bC4zXRGHVTuv2YvbX3TISBdqINCknZMtGlRbpARJGp5HjTobx+9isvPOjQa4v
         cALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736013239; x=1736618039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EE4XPce77KF3pYncLvKZ4cV7BRKfotXlhaeKdV5BDFE=;
        b=ogddrmy4hYHKzaNps3n8tkCXmbf0zEIrFSinYvquKj5WRmhzlYLHNhUTLU9QcWGo/M
         rbUhHI70mGgngpymD8M0/OAcBDUchQ310rM5xxRuXhoRwlNXG/HGrI+7wgDbVTrIF19s
         ZgyfgD7wkW1HfgktcCafcoiXRLKKgrvTRGLLRtC+my7NBPg6t1dirCnmRY/tPJD0j4q0
         R7Ju+6eGsCVc9e4YQL/u/0vZ2T1bJgYIsATYveRiEugZj0Twq0d10HtLQ353PTPXTOyx
         3K/JtvrTfOQ8jqXFzd5WYdl0EKUGppLiMIfisd7SwFaWOJaBA+xme51MlFjGORxiLIgl
         AgPg==
X-Forwarded-Encrypted: i=1; AJvYcCVN8dJQaJmzNRxTIwO1dTooxeoPNTLEo13u2Vn9hzjaTlT5/g9ekFrEOz+nLlqkN0t2748afWlmSVQ=@vger.kernel.org, AJvYcCXyfo+5h6r0bQClNAeAmEEI4IzvLVyPj/rArprMw2lBjMFpOr8c1Q33BAQyxYY/CTVvya7ucd4mpKDlsM6C@vger.kernel.org
X-Gm-Message-State: AOJu0YyuAZLbfwOhTzOcrx5T4fLxGo8EGQsgx0LuyJxzoH49Xkn4hviC
	2+6PgZbFiR+2dOnbASAMb6UQGVD0KEe4NvZF/dV5bUIuRPhliVnb
X-Gm-Gg: ASbGncv3xb0GHuFY35gqVixrl8KGNjKxl4qpsv9jrSWP0Rqqojxq74f3iUf/SoiYAzB
	3i5BNU4bA3zf0lGFQhGLk57DfQmZf/UWpsaid+xYmJIKdG3MlWnoUkr3ffPtU49U4AmLqcBzaZH
	iZdRLKo+6YLMNFf67Nezq16+fp5qfIQVw2dtcWsyZsqKUYsjDCxlVd6qm/o4rAA98xmAwvSe5Oq
	AC5LNOqSWrrdrxF4Z7qKjPXwP2kLKHnXoiB5JfzCErLTE8deQPLryw7lX1ytuZmzYsfwLFrzfc+
	QIFx68L7Ow==
X-Google-Smtp-Source: AGHT+IFBAILlxZpXLZx6BkGXE2hVuPzLF5q2nVfjIhywp4zKWt47SHdTZJAi7t6tAoh+NQA/930kEQ==
X-Received: by 2002:a05:600c:4f12:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-4366864369amr423817825e9.11.1736013238560;
        Sat, 04 Jan 2025 09:53:58 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:7e3e:b5da:8327:e39b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11aecsm550252365e9.23.2025.01.04.09.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 09:53:56 -0800 (PST)
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
Subject: [PATCH] clk: renesas: r9a07g044: Add clock and reset entry for DRP-AI
Date: Sat,  4 Jan 2025 17:53:46 +0000
Message-ID: <20250104175346.656352-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/r9a07g044-cpg.c | 53 +++++++++++++++++++++++++++--
 drivers/clk/renesas/rzg2l-cpg.h     |  2 ++
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index d5979270f4ae..ac86bfdb70aa 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -95,6 +95,39 @@ static const struct clk_div_table dtable_1_32[] = {
 	{0, 0},
 };
 
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
+
 static const struct clk_div_table dtable_16_128[] = {
 	{0, 16},
 	{1, 32},
@@ -115,7 +148,7 @@ static const u32 mtable_sdhi[] = { 1, 2, 3 };
 static const struct {
 	struct cpg_core_clk common[56];
 #ifdef CONFIG_CLK_R9A07G054
-	struct cpg_core_clk drp[0];
+	struct cpg_core_clk drp[3];
 #endif
 } core_clks __initconst = {
 	.common = {
@@ -193,6 +226,9 @@ static const struct {
 	},
 #ifdef CONFIG_CLK_R9A07G054
 	.drp = {
+		DEF_FIXED("DRP_M", R9A07G054_CLK_DRP_M, CLK_PLL3, 1, 5),
+		DEF_FIXED("DRP_D", R9A07G054_CLK_DRP_D, CLK_PLL3, 1, 2),
+		DEF_DIV("DRP_A", R9A07G054_CLK_DRP_A, CLK_PLL3, DIVPL3E, dtable_4_32),
 	},
 #endif
 };
@@ -200,7 +236,7 @@ static const struct {
 static const struct {
 	struct rzg2l_mod_clk common[79];
 #ifdef CONFIG_CLK_R9A07G054
-	struct rzg2l_mod_clk drp[0];
+	struct rzg2l_mod_clk drp[5];
 #endif
 } mod_clks = {
 	.common = {
@@ -365,6 +401,16 @@ static const struct {
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
@@ -431,6 +477,9 @@ static const struct rzg2l_reset r9a07g044_resets[] = {
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


