Return-Path: <linux-renesas-soc+bounces-18866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696DAEC140
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C944817081F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEBF12EE60B;
	Fri, 27 Jun 2025 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlDhl3it"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170842ED87F;
	Fri, 27 Jun 2025 20:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056972; cv=none; b=IZzO5EQvsXQqA/snCI1UOXsgSEtDI9/oGosLdtNFtkq7mphI3U0Mjp5nO9w1nLxQV//2jmkKdtuGgAIw0GFeQLKHRXRg7OWuVoLF0bZgp39JK36YVo5t3dV1aNdsxA65m3vUEmmgRRrrWHcYM/LOJO65FU82KRUl6xkMKMoNgY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056972; c=relaxed/simple;
	bh=Rn9pfAcowx2/U0zv8GrGTgjvNzJYKWAr45yLJKG2uFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0S0Ktku3a8l/05m2BJE6nVqi7XZRd6FJnDooIlWVvnlvN5q+r1G7zD0tkNw3GcfIxxK+D2fuDXPEcs0g93PaD0TNgp84LwMww0/F30MtDljk6dvTd1PyxV3I24x2m2jDmHWS9DEcviw6CbB7w/bBGfEblUZhK6LGVZw72Pr0t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlDhl3it; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so1621085e9.3;
        Fri, 27 Jun 2025 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751056969; x=1751661769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZtbeHePDwzUGvaaFl6xJfMuHc0+qQxRTnSZ8unq5YA=;
        b=BlDhl3ittASv9JI8pc+9Eo2/gv/yM4aj0fvGKqyM9ZieS4c6d07rlg+niKRB6hJEwJ
         aYKBeh7+DcZCPzi+gkiVOfCn0pTE2H9kGijiv+4Ggjod5KsFYp3+nYeA/WHtVBQrO8U5
         Oz76aCKUWyuW5iQK3A/AGgV/IOTTrqWyre8MNVFm9u3g0cEmGLKOTbQhlUUIy/Zx4v/O
         c9+bn72VYM414JxDA+/vaJvCjUCW8BIIoF0L3CN0KEVkGmhOVnz6xgiSfveixJ0jnWwg
         /Adg9iwY0lbGGbGv0WxpeCZamOOOa5QxcXbde6/vB90w7YgOpdxwye1x8BLRtNbIicJh
         r2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056969; x=1751661769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZtbeHePDwzUGvaaFl6xJfMuHc0+qQxRTnSZ8unq5YA=;
        b=t7bExYJNq93/41Ns9YSscGJi+3yg3ymzcjhBM22aRAB9nJSFdZ4idWQdcwP8VOc/eb
         4LvsYHwzpwWW2gYIxCrUPFPg7l8jvdRCrOeT3HsTtR8m8KiGM7nPcYuYKpuQE8vnuSGK
         Zr89hgPYzohViK2BrA25VP9YDQ+q5N22w9GBumaVegdxhrU9/gxptsiVfBO2mFStAiDB
         QVl/I5V4vUKNgCNHzDQ4ZjX76EmQBxJgFzuMpDB2VyAOUkXZ1CCPQY2pnZEzpm1gzJGD
         +sXt/58iX64DXxJneoEhfpML/vzbv6J5c7dFVYBQqSRynFvBYYLZB7PqtYpcHMVr4SBo
         foIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtrRLDgOrZGwgAo9h073v2sVpYA8xK1/MhEwtn7yk6PeOxLhrf1JLlYjxofBs9IYu29nqHZvaEOdFB@vger.kernel.org, AJvYcCWWcq7urg+g6KK4v7RCot3f2gSqW+E5Hbu3u+MMtmkKZpKc27aFA6N8LImYQ3BAdcZ6hCwiWcyzy/fX@vger.kernel.org, AJvYcCXB0R++8iQhVmZkOvXGI/HzEZxyImPRoUrUbDoZ82sBT9Uu5BAkKCyjC4AqaAZjQjs3N2hbubpL9CwqZRyd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz7xcPmv9X756C2UsikQWcylu5s+fh6BzywoW7kh3bRD3qanss
	t1MZ4vzsU5fdr+KTnMfqqFgET5oA8Tz1WlWbrzzBALg82ku8I1WlPzN/
X-Gm-Gg: ASbGncvKgY7rukwBJFSOMKfPaon4Z4g7oltiv/acytFpX74ECFQ0zwW57RYgGu2QdtB
	1KhtCe6WBruIlBiMUJlWCbVAxrO6l5qgJqq5RpMSewvoF0SR1Dc3D8lmJhekGalZyBFxMSwBxHB
	bxna5RFnW+mdzmWS6b750GNMxV7Kop0HCzl55wulUPutnCPd+WG6kBLfE/WGseKYeIlObQnklk9
	xxIsr3nrtPASVV/sa7gpxkHmMv5gMq73ltBlrqsdREjdxS6PsNZFWF1MfYVpCQwYnQFdURiOdIl
	4TfP/Fp8QEgn1dSw/+AYXhToMTT37IfZK/nGeeyMjODYpuZQRp8kq/oev6VZXqr784EZfStFtpZ
	/qinWBodlxV4LILG9fxi8
X-Google-Smtp-Source: AGHT+IFP5XKyc46bSY0EZCnqmllTXQdFcaNZ5BaNKttpx8zs0KUHJBZ0IPBjmeM0kwghNrNWGPM1FA==
X-Received: by 2002:a05:6000:280d:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a8f4453e2bmr3439861f8f.7.1751056969212;
        Fri, 27 Jun 2025 13:42:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b46:edb1:4d0:593b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm3609322f8f.24.2025.06.27.13.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:42:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/6] clk: renesas: r9a09g056: Add XSPI clock/reset
Date: Fri, 27 Jun 2025 21:42:36 +0100
Message-ID: <20250627204237.214635-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add XSPI clock and reset entries.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1-> v2:
- No change.
---
 drivers/clk/renesas/r9a09g056-cpg.c | 12 ++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index 040acd4ae5dd..437af86f49dd 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -39,6 +39,7 @@ enum clk_ids {
 	CLK_SMUX2_XSPI_CLK0,
 	CLK_SMUX2_XSPI_CLK1,
 	CLK_PLLCM33_XSPI,
+	CLK_PLLCM33_GEAR,
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
@@ -123,6 +124,7 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
 	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
 		  dtable_2_16),
+	DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
 
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
@@ -162,6 +164,8 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
 	DEF_FIXED("gbeth_1_clk_ptp_ref_i", R9A09G056_GBETH_1_CLK_PTP_REF_I,
 		  CLK_PLLETH_DIV_125_FIX, 1, 1),
+	DEF_FIXED_MOD_STATUS("spi_clk_spi", R9A09G056_SPI_CLK_SPI, CLK_PLLCM33_XSPI, 1, 2,
+			     FIXED_MOD_CONF_XSPI),
 };
 
 static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
@@ -219,6 +223,12 @@ static const struct rzv2h_mod_clk r9a09g056_mod_clks[] __initconst = {
 						BUS_MSTOP(1, BIT(7))),
 	DEF_MOD("riic_7_ckm",			CLK_PLLCLN_DIV16, 9, 11, 4, 27,
 						BUS_MSTOP(1, BIT(8))),
+	DEF_MOD("spi_hclk",			CLK_PLLCM33_GEAR, 9, 15, 4, 31,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_MOD("spi_aclk",			CLK_PLLCM33_GEAR, 10, 0, 5, 0,
+						BUS_MSTOP(4, BIT(5))),
+	DEF_MOD("spi_clk_spix2",		CLK_PLLCM33_XSPI, 10, 1, 5, 2,
+						BUS_MSTOP(4, BIT(5))),
 	DEF_MOD("sdhi_0_imclk",			CLK_PLLCLN_DIV8, 10, 3, 5, 3,
 						BUS_MSTOP(8, BIT(2))),
 	DEF_MOD("sdhi_0_imclk2",		CLK_PLLCLN_DIV8, 10, 4, 5, 4,
@@ -307,6 +317,8 @@ static const struct rzv2h_reset r9a09g056_resets[] __initconst = {
 	DEF_RST(9, 14, 4, 15),		/* RIIC_6_MRST */
 	DEF_RST(9, 15, 4, 16),		/* RIIC_7_MRST */
 	DEF_RST(10, 0, 4, 17),		/* RIIC_8_MRST */
+	DEF_RST(10, 3, 4, 20),          /* SPI_HRESETN */
+	DEF_RST(10, 4, 4, 21),          /* SPI_ARESETN */
 	DEF_RST(10, 7, 4, 24),		/* SDHI_0_IXRST */
 	DEF_RST(10, 8, 4, 25),		/* SDHI_1_IXRST */
 	DEF_RST(10, 9, 4, 26),		/* SDHI_2_IXRST */
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index ba4f0196643f..840eed25aeda 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -149,6 +149,8 @@ struct fixed_mod_conf {
 				 FIELD_PREP_CONST(BUS_MSTOP_BITS_MASK, (mask)))
 #define BUS_MSTOP_NONE		GENMASK(31, 0)
 
+#define FIXED_MOD_CONF_XSPI	FIXED_MOD_CONF_PACK(5, 1)
+
 /**
  * Definitions of CPG Core Clocks
  *
-- 
2.49.0


