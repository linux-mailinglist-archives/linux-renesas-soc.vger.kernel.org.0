Return-Path: <linux-renesas-soc+bounces-18665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DFFAE6D92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD6D617F1AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1DE2E7F2F;
	Tue, 24 Jun 2025 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T48Z5IEc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C962E762C;
	Tue, 24 Jun 2025 17:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786243; cv=none; b=Wo5HMHPfl2o1ZRus4q8Fj+eMMjvqOiM3t9yDccgIFHPCQeRHJk1921ZYkiam4YHQT+xgGK+Q02c8oMTka2q06EQLTLPGX7DlnbEJ8Y9D56TooRPBBWVRgh8n+fEUnTffQjEjPXnIlAv+/o3EfAHdgBzpRN+Fx+72ajFY4H2YNRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786243; c=relaxed/simple;
	bh=pauJs4BU7uWbM9MMX8vR+VYB5wfokBF6mkOLCILpzdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NuGdMeofgkTsQ5wrQXbxOVkH0oWsURZZQTlutL/0dfjeGqx5RsVgjrG4dPYJQ3qeanbCrxs7KzXMH2i5jbxhL6pRn/AaDqnd7XLdrDSLwnmLd2RwaT50MVce6gPREBueW9O8DKVU4XKwRoAuThxerfjzOg3akXfuGIqUz5V5/FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T48Z5IEc; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so586565f8f.2;
        Tue, 24 Jun 2025 10:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786240; x=1751391040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwhSlWerG+8T4+prUat9IsNl8NdxT3TFxF7x4Oqs4qM=;
        b=T48Z5IEcqicB3AYjOWAerTA2wh2QwhZ44CKZGLkM/ATRltU5NYAejmJZ/1VsjsMR3S
         syXzLnTN+loD4yq0h0eOGPWscmHt72grcb5TR5W33/5ejBhWk/9MhstFaHz/qEn8LZWu
         N+kjW1eItC1azKAMMGstQCdShGNG25BzlHQjOiCD2IyyHK1IayBDf05nR2+/360p6Tat
         9l5ef5/VUGRT7z7H2FQUJ7exd00t78i0yLlhcavXGe1n34BSkpeC6gG0R3/XGsiRiX7Q
         8U32tv4Ul+vAP9LJrGJ/as1jZRye0fJeJF7sqYPNMwakEJnTBShIOEPXK2Hoc6PaXNI0
         MTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786240; x=1751391040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwhSlWerG+8T4+prUat9IsNl8NdxT3TFxF7x4Oqs4qM=;
        b=l9exQRfyd14dSIWcaynF11NWUbuLbPvvO70xptzd/Lp95Hcr7Kb7Z3hDJDdtEF9WCx
         b7ELBIFveCAJqTNTTsumo5/MQv67QVw+IWyRY2jTgqzbI1UA5384EDjMlSOUyiT+EV0z
         /sH+26dmysMfrMwyNP2K4yENLe9exAQS30ybO/wx4NEqwwZcJNIxw9BY/5M75NxwVdW/
         X6l2Wg9RUcc2MxOoInnOwkrshhsMXj1PpA6ViIOZG2/9PIUnOiuLs/Pu7006W/vAwsrQ
         VzVCy1RriNBBK07jY/3AX92w59uc3pGF+CAOHTirWqOckasWGKtDIQW0e6uHNjeDzN0l
         Qsdw==
X-Forwarded-Encrypted: i=1; AJvYcCUczo6Gk7B6bqiNnPad+vVTS7OnRvMt4HMFqOvHPA7grcF6aDWibyJ5NsuuN8d0O5NQzxrYXfzfhVfC@vger.kernel.org, AJvYcCVOSw3BtW11ttf0c8dhPd3PSl+oUqJPi0qhhcxGwWbLewoYa+XSELn+O0HKzoyxf0razJmNq7E8N+O4r3C8@vger.kernel.org, AJvYcCXfZezIsCYd2zTsBHhUNMQgD8UUsukmYSrNKvR+OVupLsfBkX9yq8BQJelqGBh+nWuGfqP/zlrypfTS@vger.kernel.org
X-Gm-Message-State: AOJu0YyiROD9EmAUu+cUasam9Jv2dRdX/cdvw42YFvH4Rm0ID19emPOD
	M+bVBvRmojkSkI+O5SrtRA/In6Zor0EDiWlN4TFzdDQSLyTmOPb1R+eq
X-Gm-Gg: ASbGncsQ0ffFGwSW59KZX72HTREb7WeELl7NgD5xWdZexeo7T5bfbFRNrXO2/+2oSu6
	vq1WD/X1R5xzRfqgM+flx5NWQzqCKoqejj2pzAa5ulqFALf3O83WQpKrU4IDBKnERqZDWb7aGy9
	aBBhqicrc4AtQRT/q71PX66r86balAU4JoYTGN8MV3PSPegInoSqpv2m9m+ptYscrSwBrQVnMYO
	TmK0HXGjQclF/BlF79NYMzac/TuxbruktX4YWwGu9dlIR7Dz7FWeuPgGGrYIjFpP8Y37f1KmKJF
	MVTvUGKZX/Yx2HVJ1hjvJHnNwtlxmQ8OCpTO7KQYlW6P+0IXtRcMNuJIzuHhXsU3MnvMoBBdt8T
	Oj+YWEBg89b08XwE0kmOe
X-Google-Smtp-Source: AGHT+IFci8RguuhhZRjRHIGlONaqNWhKtwS2A9YaHlkYOKp2HzfYZa1M3jCzpgBvldqyWLc4YmRHWA==
X-Received: by 2002:a05:6000:2409:b0:3a4:dfc2:b9e1 with SMTP id ffacd0b85a97d-3a6d1192b3fmr15315984f8f.2.1750786239475;
        Tue, 24 Jun 2025 10:30:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm181662565e9.27.2025.06.24.10.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:30:38 -0700 (PDT)
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
Subject: [PATCH 5/6] clk: renesas: r9a09g056: Add XSPI clock/reset
Date: Tue, 24 Jun 2025 18:30:29 +0100
Message-ID: <20250624173030.472196-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 317c8ee2e2d5..42b7c7e13284 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -148,6 +148,8 @@ struct fixed_mod_conf {
 				 FIELD_PREP_CONST(BUS_MSTOP_BITS_MASK, (mask)))
 #define BUS_MSTOP_NONE		GENMASK(31, 0)
 
+#define FIXED_MOD_CONF_XSPI	FIXED_MOD_CONF_PACK(5, 1)
+
 /**
  * Definitions of CPG Core Clocks
  *
-- 
2.49.0


