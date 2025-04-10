Return-Path: <linux-renesas-soc+bounces-15754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51766A845C2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 16:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA3419C27B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 14:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28E928CF71;
	Thu, 10 Apr 2025 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mUgtR2Jk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0528CF45
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294008; cv=none; b=ZL1vP2ir94NYKdmRT7aceY9wQIFcwtfavLKoSU/zkcMrkA7Fnjvb2UHxuxcBNPUObC7ePprvN7cBpjCiaw4oAIYDcsktXFQTi/KmWc4DxnRP3vXq67Pq/SToW7EdXeAbgJW75RogbnC3zLXvJv5tF1SkYu24Y3FC2NZJpJjznn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294008; c=relaxed/simple;
	bh=ARfSAGKInCVwP1Z+a3UX9JP9FtBFl0P6BC6G/21t+3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8R5F48FPH6em+BfotEkP7Wx7l1K/0Y5ERhEQD0BgoqxFYkDdntEH4x0J7gl8wfaqXDOe6/44n7gk+T4z8JAs7vCsD/z5KyeC6cpvIHp2Nf8IxEd4uf8BLFJUlm6oKQY+cDdWLyBWaBTNJT0SCFVX/WitXn1JBdgX7Xk9DamEEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mUgtR2Jk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39727fe912cso376790f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744294003; x=1744898803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kc4/2xSAZHneWmHH4qCjXgjV1apYvQWVl4vGU0ph9v0=;
        b=mUgtR2JkmTAN/iiN1hOGbLB5cSoLpbOBXWdv+gGoHx3c5IU4h5awXq+w2viyccjL/B
         MpFVZwZYAoPXr4nCANcJvALosDLZIx+U+ksKrCi1fEcl5bfIbTGyFuNx7qBBWltMurfq
         VhqoeJMU1WcvRTc6YgJoOCFl9rZQSzl+ZxmcLYnPXRK1NBERYdvwvEqQmiAW+ZBB8pkz
         WBkMTSpZNKT9YpULDuDw2LEzakG1f19nOIcCB/PdlVeYIuqFaaG2Ow0j4pUvcXKN9Qn2
         QOpdUojTasmhh2nVtvKShRfZhK87AQgNQSqhBtW5HAZC74Zzs2OAPPZm0AAd6e4534S7
         hVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294003; x=1744898803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kc4/2xSAZHneWmHH4qCjXgjV1apYvQWVl4vGU0ph9v0=;
        b=rVJ2wBbUhvs7XPijzE5RNzQtNBwf3wfesWRfZc5Y5qW3hcUPgU3HSTKYDF19/xtuXi
         L15imsKzbrRvES9Yf3dkAXX+upj4c0VSEaTUIeAAfkvILeN1191ag2gAU67h913Q+7wa
         KevCo81v9TGFNp5DUUNgV7Mippuzg4SQ693KSoGjr2yAHvfmjgROJ7ya8xg1bvMW5Jw9
         fBDFSFiyTO3jTVMo9DmB9svmpG+Opwhy/qWnUDl6CY4UbnI3HKzLFVu5BivFB+0lMF6z
         jxjMvn50/klAlg0kJB65y86QuUCxT31HHuB+uBHKWrGbogpneeB3dxxqcLGcC0Ukd8gX
         8MPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2CkPsJdX3SU45T8S7T8Eqp00arGIjQj+HvafdWhIwt6Io4OU+W4NqVLkmNSUmW5dURFaILHopB40YXqj2NIKsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxN96y0trlZqqVEfq4aczXtyhON5eJoJNRHa5VMOqEtGHmPZPDt
	L88X263EyzzUrGNHDGnHWZHdpN2vgpGUbchexQbo2cLxGv4IeZ2jweLzD+VZqkY=
X-Gm-Gg: ASbGncu/qroYBri1M/AqujOfDk46VkxWs2T2fchtE/TmSG31Jt8pRqE+Hh5R1XsCU4Y
	CcoH+pNvDE9Fbm8yxIBTcYBF98cec6QwNr/qogbNQVQflNpv2bm57t4sfgyW9C4fjSEcT1BHgno
	qha2uWvFubHQ1KXBMeAzvpGljD2bRiMjya5n4xKZNDUMvApmnIeA4RxjqSsOTdsgfRbdg+MfWqn
	nOKK+DEX13/6zc1Fkf0IPeSs/KnCtCq+vNtdEhhgkqzKGnwe7H4i8gHLp2M2NliB2OpDMHdp9Zc
	DoHp7bx5quFgYJ66KWV+jTNf3XGFgyYIJlA7bs2JvXuRy2DDuP5szAWCoOfMoWyyIwJvzw==
X-Google-Smtp-Source: AGHT+IGOpVgmbV6wpw3OdUHSjlk4SoJYrxHOuf9TRR+j7UnE3DWvNgMObHgOBffb22d1eD8BzUlAhA==
X-Received: by 2002:a05:6000:2481:b0:39c:dcc:6451 with SMTP id ffacd0b85a97d-39d8f4e88bfmr2512702f8f.43.1744294002842;
        Thu, 10 Apr 2025 07:06:42 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4806913f8f.40.2025.04.10.07.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:06:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in clock enable/disable API
Date: Thu, 10 Apr 2025 17:06:24 +0300
Message-ID: <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
module has one or more MSTOP bits associated with it, and these bits need
to be configured along with the module clocks. Setting the MSTOP bits
switches the module between normal and standby states.

Previously, MSTOP support was abstracted through power domains
(struct generic_pm_domain::{power_on, power_off} APIs). With this
abstraction, the order of setting the MSTOP and CLKON bits was as follows:

Previous Order:
A/ Switching to Normal State (e.g., during probe):
1/ Clear module MSTOP bits
2/ Set module CLKON bits

B/ Switching to Standby State (e.g., during remove):
1/ Clear CLKON bits
2/ Set MSTOP bits

However, in some cases (when the clock is disabled through devres), the
order may have been (due to the issue described in link section):

1/ Set MSTOP bits
2/ Clear CLKON bits

Recently, the hardware team has suggested that the correct order to set
the MSTOP and CLKON bits is:

Updated Order:
A/ Switching to Normal State (e.g., during probe):
1/ Set CLKON bits
2/ Clear MSTOP bits

B/ Switching to Standby State (e.g., during remove):
1/ Set MSTOP bits
2/ Clear CLKON bits

To prevent future issues due to incorrect ordering, the MSTOP setup has
now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
from the RZ/G3S HW manual.

Additionally, since multiple clocks of a single module may be mapped to a
single MSTOP bit, MSTOP setup is reference-counted.

Furthermore, as all modules start in the normal state after reset, if the
module clocks are disabled, the module state is switched to standby. This
prevents keeping the module in an invalid state, as recommended by the
hardware team.

Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 132 ++++++-------
 drivers/clk/renesas/r9a07g044-cpg.c | 168 ++++++++---------
 drivers/clk/renesas/r9a08g045-cpg.c | 105 +++++------
 drivers/clk/renesas/r9a09g011-cpg.c | 116 ++++++------
 drivers/clk/renesas/rzg2l-cpg.c     | 279 +++++++++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  17 +-
 6 files changed, 551 insertions(+), 266 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index fce2eecfa8c0..02dc5cecfd8d 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -164,143 +164,143 @@ static const struct cpg_core_clk r9a07g043_core_clks[] __initconst = {
 static const struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 #ifdef CONFIG_ARM64
 	DEF_MOD("gic",		R9A07G043_GIC600_GICCLK, R9A07G043_CLK_P1,
-				0x514, 0),
+				0x514, 0, 0),
 	DEF_MOD("ia55_pclk",	R9A07G043_IA55_PCLK, R9A07G043_CLK_P2,
-				0x518, 0),
+				0x518, 0, 0),
 	DEF_MOD("ia55_clk",	R9A07G043_IA55_CLK, R9A07G043_CLK_P1,
-				0x518, 1),
+				0x518, 1, 0),
 #endif
 #ifdef CONFIG_RISCV
 	DEF_MOD("iax45_pclk",	R9A07G043_IAX45_PCLK, R9A07G043_CLK_P2,
-				0x518, 0),
+				0x518, 0, 0),
 	DEF_MOD("iax45_clk",	R9A07G043_IAX45_CLK, R9A07G043_CLK_P1,
-				0x518, 1),
+				0x518, 1, 0),
 #endif
 	DEF_MOD("dmac_aclk",	R9A07G043_DMAC_ACLK, R9A07G043_CLK_P1,
-				0x52c, 0),
+				0x52c, 0, 0),
 	DEF_MOD("dmac_pclk",	R9A07G043_DMAC_PCLK, CLK_P1_DIV2,
-				0x52c, 1),
+				0x52c, 1, 0),
 	DEF_MOD("ostm0_pclk",	R9A07G043_OSTM0_PCLK, R9A07G043_CLK_P0,
-				0x534, 0),
+				0x534, 0, 0),
 	DEF_MOD("ostm1_pclk",	R9A07G043_OSTM1_PCLK, R9A07G043_CLK_P0,
-				0x534, 1),
+				0x534, 1, 0),
 	DEF_MOD("ostm2_pclk",	R9A07G043_OSTM2_PCLK, R9A07G043_CLK_P0,
-				0x534, 2),
+				0x534, 2, 0),
 	DEF_MOD("mtu_x_mck",	R9A07G043_MTU_X_MCK_MTU3, R9A07G043_CLK_P0,
-				0x538, 0),
+				0x538, 0, 0),
 	DEF_MOD("wdt0_pclk",	R9A07G043_WDT0_PCLK, R9A07G043_CLK_P0,
-				0x548, 0),
+				0x548, 0, 0),
 	DEF_MOD("wdt0_clk",	R9A07G043_WDT0_CLK, R9A07G043_OSCCLK,
-				0x548, 1),
+				0x548, 1, 0),
 	DEF_MOD("spi_clk2",	R9A07G043_SPI_CLK2, R9A07G043_CLK_SPI1,
-				0x550, 0),
+				0x550, 0, 0),
 	DEF_MOD("spi_clk",	R9A07G043_SPI_CLK, R9A07G043_CLK_SPI0,
-				0x550, 1),
+				0x550, 1, 0),
 	DEF_MOD("sdhi0_imclk",	R9A07G043_SDHI0_IMCLK, CLK_SD0_DIV4,
-				0x554, 0),
+				0x554, 0, 0),
 	DEF_MOD("sdhi0_imclk2",	R9A07G043_SDHI0_IMCLK2, CLK_SD0_DIV4,
-				0x554, 1),
+				0x554, 1, 0),
 	DEF_MOD("sdhi0_clk_hs",	R9A07G043_SDHI0_CLK_HS, R9A07G043_CLK_SD0,
-				0x554, 2),
+				0x554, 2, 0),
 	DEF_MOD("sdhi0_aclk",	R9A07G043_SDHI0_ACLK, R9A07G043_CLK_P1,
-				0x554, 3),
+				0x554, 3, 0),
 	DEF_MOD("sdhi1_imclk",	R9A07G043_SDHI1_IMCLK, CLK_SD1_DIV4,
-				0x554, 4),
+				0x554, 4, 0),
 	DEF_MOD("sdhi1_imclk2",	R9A07G043_SDHI1_IMCLK2, CLK_SD1_DIV4,
-				0x554, 5),
+				0x554, 5, 0),
 	DEF_MOD("sdhi1_clk_hs",	R9A07G043_SDHI1_CLK_HS, R9A07G043_CLK_SD1,
-				0x554, 6),
+				0x554, 6, 0),
 	DEF_MOD("sdhi1_aclk",	R9A07G043_SDHI1_ACLK, R9A07G043_CLK_P1,
-				0x554, 7),
+				0x554, 7, 0),
 #ifdef CONFIG_ARM64
 	DEF_MOD("cru_sysclk",   R9A07G043_CRU_SYSCLK, CLK_M2_DIV2,
-				0x564, 0),
+				0x564, 0, 0),
 	DEF_MOD("cru_vclk",     R9A07G043_CRU_VCLK, R9A07G043_CLK_M2,
-				0x564, 1),
+				0x564, 1, 0),
 	DEF_MOD("cru_pclk",     R9A07G043_CRU_PCLK, R9A07G043_CLK_ZT,
-				0x564, 2),
+				0x564, 2, 0),
 	DEF_MOD("cru_aclk",     R9A07G043_CRU_ACLK, R9A07G043_CLK_M0,
-				0x564, 3),
+				0x564, 3, 0),
 	DEF_COUPLED("lcdc_clk_a", R9A07G043_LCDC_CLK_A, R9A07G043_CLK_M0,
-				0x56c, 0),
+				0x56c, 0, 0),
 	DEF_COUPLED("lcdc_clk_p", R9A07G043_LCDC_CLK_P, R9A07G043_CLK_ZT,
-				0x56c, 0),
+				0x56c, 0, 0),
 	DEF_MOD("lcdc_clk_d",	R9A07G043_LCDC_CLK_D, R9A07G043_CLK_M3,
-				0x56c, 1),
+				0x56c, 1, 0),
 #endif
 	DEF_MOD("ssi0_pclk",	R9A07G043_SSI0_PCLK2, R9A07G043_CLK_P0,
-				0x570, 0),
+				0x570, 0, 0),
 	DEF_MOD("ssi0_sfr",	R9A07G043_SSI0_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 1),
+				0x570, 1, 0),
 	DEF_MOD("ssi1_pclk",	R9A07G043_SSI1_PCLK2, R9A07G043_CLK_P0,
-				0x570, 2),
+				0x570, 2, 0),
 	DEF_MOD("ssi1_sfr",	R9A07G043_SSI1_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 3),
+				0x570, 3, 0),
 	DEF_MOD("ssi2_pclk",	R9A07G043_SSI2_PCLK2, R9A07G043_CLK_P0,
-				0x570, 4),
+				0x570, 4, 0),
 	DEF_MOD("ssi2_sfr",	R9A07G043_SSI2_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 5),
+				0x570, 5, 0),
 	DEF_MOD("ssi3_pclk",	R9A07G043_SSI3_PCLK2, R9A07G043_CLK_P0,
-				0x570, 6),
+				0x570, 6, 0),
 	DEF_MOD("ssi3_sfr",	R9A07G043_SSI3_PCLK_SFR, R9A07G043_CLK_P0,
-				0x570, 7),
+				0x570, 7, 0),
 	DEF_MOD("usb0_host",	R9A07G043_USB_U2H0_HCLK, R9A07G043_CLK_P1,
-				0x578, 0),
+				0x578, 0, 0),
 	DEF_MOD("usb1_host",	R9A07G043_USB_U2H1_HCLK, R9A07G043_CLK_P1,
-				0x578, 1),
+				0x578, 1, 0),
 	DEF_MOD("usb0_func",	R9A07G043_USB_U2P_EXR_CPUCLK, R9A07G043_CLK_P1,
-				0x578, 2),
+				0x578, 2, 0),
 	DEF_MOD("usb_pclk",	R9A07G043_USB_PCLK, R9A07G043_CLK_P1,
-				0x578, 3),
+				0x578, 3, 0),
 	DEF_COUPLED("eth0_axi",	R9A07G043_ETH0_CLK_AXI, R9A07G043_CLK_M0,
-				0x57c, 0),
+				0x57c, 0, 0),
 	DEF_COUPLED("eth0_chi",	R9A07G043_ETH0_CLK_CHI, R9A07G043_CLK_ZT,
-				0x57c, 0),
+				0x57c, 0, 0),
 	DEF_COUPLED("eth1_axi",	R9A07G043_ETH1_CLK_AXI, R9A07G043_CLK_M0,
-				0x57c, 1),
+				0x57c, 1, 0),
 	DEF_COUPLED("eth1_chi",	R9A07G043_ETH1_CLK_CHI, R9A07G043_CLK_ZT,
-				0x57c, 1),
+				0x57c, 1, 0),
 	DEF_MOD("i2c0",		R9A07G043_I2C0_PCLK, R9A07G043_CLK_P0,
-				0x580, 0),
+				0x580, 0, 0),
 	DEF_MOD("i2c1",		R9A07G043_I2C1_PCLK, R9A07G043_CLK_P0,
-				0x580, 1),
+				0x580, 1, 0),
 	DEF_MOD("i2c2",		R9A07G043_I2C2_PCLK, R9A07G043_CLK_P0,
-				0x580, 2),
+				0x580, 2, 0),
 	DEF_MOD("i2c3",		R9A07G043_I2C3_PCLK, R9A07G043_CLK_P0,
-				0x580, 3),
+				0x580, 3, 0),
 	DEF_MOD("scif0",	R9A07G043_SCIF0_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 0),
+				0x584, 0, 0),
 	DEF_MOD("scif1",	R9A07G043_SCIF1_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 1),
+				0x584, 1, 0),
 	DEF_MOD("scif2",	R9A07G043_SCIF2_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 2),
+				0x584, 2, 0),
 	DEF_MOD("scif3",	R9A07G043_SCIF3_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 3),
+				0x584, 3, 0),
 	DEF_MOD("scif4",	R9A07G043_SCIF4_CLK_PCK, R9A07G043_CLK_P0,
-				0x584, 4),
+				0x584, 4, 0),
 	DEF_MOD("sci0",		R9A07G043_SCI0_CLKP, R9A07G043_CLK_P0,
-				0x588, 0),
+				0x588, 0, 0),
 	DEF_MOD("sci1",		R9A07G043_SCI1_CLKP, R9A07G043_CLK_P0,
-				0x588, 1),
+				0x588, 1, 0),
 	DEF_MOD("rspi0",	R9A07G043_RSPI0_CLKB, R9A07G043_CLK_P0,
-				0x590, 0),
+				0x590, 0, 0),
 	DEF_MOD("rspi1",	R9A07G043_RSPI1_CLKB, R9A07G043_CLK_P0,
-				0x590, 1),
+				0x590, 1, 0),
 	DEF_MOD("rspi2",	R9A07G043_RSPI2_CLKB, R9A07G043_CLK_P0,
-				0x590, 2),
+				0x590, 2, 0),
 	DEF_MOD("canfd",	R9A07G043_CANFD_PCLK, R9A07G043_CLK_P0,
-				0x594, 0),
+				0x594, 0, 0),
 	DEF_MOD("gpio",		R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
-				0x598, 0),
+				0x598, 0, 0),
 	DEF_MOD("adc_adclk",	R9A07G043_ADC_ADCLK, R9A07G043_CLK_TSU,
-				0x5a8, 0),
+				0x5a8, 0, 0),
 	DEF_MOD("adc_pclk",	R9A07G043_ADC_PCLK, R9A07G043_CLK_P0,
-				0x5a8, 1),
+				0x5a8, 1, 0),
 	DEF_MOD("tsu_pclk",	R9A07G043_TSU_PCLK, R9A07G043_CLK_TSU,
-				0x5ac, 0),
+				0x5ac, 0, 0),
 #ifdef CONFIG_RISCV
 	DEF_MOD("nceplic_aclk",	R9A07G043_NCEPLIC_ACLK, R9A07G043_CLK_P1,
-				0x608, 0),
+				0x608, 0, 0),
 #endif
 };
 
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 77ca3a789568..c851d4eeebbe 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -242,176 +242,176 @@ static const struct {
 } mod_clks = {
 	.common = {
 		DEF_MOD("gic",		R9A07G044_GIC600_GICCLK, R9A07G044_CLK_P1,
-					0x514, 0),
+					0x514, 0, 0),
 		DEF_MOD("ia55_pclk",	R9A07G044_IA55_PCLK, R9A07G044_CLK_P2,
-					0x518, 0),
+					0x518, 0, 0),
 		DEF_MOD("ia55_clk",	R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
-					0x518, 1),
+					0x518, 1, 0),
 		DEF_MOD("dmac_aclk",	R9A07G044_DMAC_ACLK, R9A07G044_CLK_P1,
-					0x52c, 0),
+					0x52c, 0, 0),
 		DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
-					0x52c, 1),
+					0x52c, 1, 0),
 		DEF_MOD("ostm0_pclk",	R9A07G044_OSTM0_PCLK, R9A07G044_CLK_P0,
-					0x534, 0),
+					0x534, 0, 0),
 		DEF_MOD("ostm1_pclk",	R9A07G044_OSTM1_PCLK, R9A07G044_CLK_P0,
-					0x534, 1),
+					0x534, 1, 0),
 		DEF_MOD("ostm2_pclk",	R9A07G044_OSTM2_PCLK, R9A07G044_CLK_P0,
-					0x534, 2),
+					0x534, 2, 0),
 		DEF_MOD("mtu_x_mck",	R9A07G044_MTU_X_MCK_MTU3, R9A07G044_CLK_P0,
-					0x538, 0),
+					0x538, 0, 0),
 		DEF_MOD("gpt_pclk",	R9A07G044_GPT_PCLK, R9A07G044_CLK_P0,
-					0x540, 0),
+					0x540, 0, 0),
 		DEF_MOD("poeg_a_clkp",	R9A07G044_POEG_A_CLKP, R9A07G044_CLK_P0,
-					0x544, 0),
+					0x544, 0, 0),
 		DEF_MOD("poeg_b_clkp",	R9A07G044_POEG_B_CLKP, R9A07G044_CLK_P0,
-					0x544, 1),
+					0x544, 1, 0),
 		DEF_MOD("poeg_c_clkp",	R9A07G044_POEG_C_CLKP, R9A07G044_CLK_P0,
-					0x544, 2),
+					0x544, 2, 0),
 		DEF_MOD("poeg_d_clkp",	R9A07G044_POEG_D_CLKP, R9A07G044_CLK_P0,
-					0x544, 3),
+					0x544, 3, 0),
 		DEF_MOD("wdt0_pclk",	R9A07G044_WDT0_PCLK, R9A07G044_CLK_P0,
-					0x548, 0),
+					0x548, 0, 0),
 		DEF_MOD("wdt0_clk",	R9A07G044_WDT0_CLK, R9A07G044_OSCCLK,
-					0x548, 1),
+					0x548, 1, 0),
 		DEF_MOD("wdt1_pclk",	R9A07G044_WDT1_PCLK, R9A07G044_CLK_P0,
-					0x548, 2),
+					0x548, 2, 0),
 		DEF_MOD("wdt1_clk",	R9A07G044_WDT1_CLK, R9A07G044_OSCCLK,
-					0x548, 3),
+					0x548, 3, 0),
 		DEF_MOD("spi_clk2",	R9A07G044_SPI_CLK2, R9A07G044_CLK_SPI1,
-					0x550, 0),
+					0x550, 0, 0),
 		DEF_MOD("spi_clk",	R9A07G044_SPI_CLK, R9A07G044_CLK_SPI0,
-					0x550, 1),
+					0x550, 1, 0),
 		DEF_MOD("sdhi0_imclk",	R9A07G044_SDHI0_IMCLK, CLK_SD0_DIV4,
-					0x554, 0),
+					0x554, 0, 0),
 		DEF_MOD("sdhi0_imclk2",	R9A07G044_SDHI0_IMCLK2, CLK_SD0_DIV4,
-					0x554, 1),
+					0x554, 1, 0),
 		DEF_MOD("sdhi0_clk_hs",	R9A07G044_SDHI0_CLK_HS, R9A07G044_CLK_SD0,
-					0x554, 2),
+					0x554, 2, 0),
 		DEF_MOD("sdhi0_aclk",	R9A07G044_SDHI0_ACLK, R9A07G044_CLK_P1,
-					0x554, 3),
+					0x554, 3, 0),
 		DEF_MOD("sdhi1_imclk",	R9A07G044_SDHI1_IMCLK, CLK_SD1_DIV4,
-					0x554, 4),
+					0x554, 4, 0),
 		DEF_MOD("sdhi1_imclk2",	R9A07G044_SDHI1_IMCLK2, CLK_SD1_DIV4,
-					0x554, 5),
+					0x554, 5, 0),
 		DEF_MOD("sdhi1_clk_hs",	R9A07G044_SDHI1_CLK_HS, R9A07G044_CLK_SD1,
-					0x554, 6),
+					0x554, 6, 0),
 		DEF_MOD("sdhi1_aclk",	R9A07G044_SDHI1_ACLK, R9A07G044_CLK_P1,
-					0x554, 7),
+					0x554, 7, 0),
 		DEF_MOD("gpu_clk",	R9A07G044_GPU_CLK, R9A07G044_CLK_G,
-					0x558, 0),
+					0x558, 0, 0),
 		DEF_MOD("gpu_axi_clk",	R9A07G044_GPU_AXI_CLK, R9A07G044_CLK_P1,
-					0x558, 1),
+					0x558, 1, 0),
 		DEF_MOD("gpu_ace_clk",	R9A07G044_GPU_ACE_CLK, R9A07G044_CLK_P1,
-					0x558, 2),
+					0x558, 2, 0),
 		DEF_MOD("cru_sysclk",   R9A07G044_CRU_SYSCLK, CLK_M2_DIV2,
-					0x564, 0),
+					0x564, 0, 0),
 		DEF_MOD("cru_vclk",     R9A07G044_CRU_VCLK, R9A07G044_CLK_M2,
-					0x564, 1),
+					0x564, 1, 0),
 		DEF_MOD("cru_pclk",     R9A07G044_CRU_PCLK, R9A07G044_CLK_ZT,
-					0x564, 2),
+					0x564, 2, 0),
 		DEF_MOD("cru_aclk",     R9A07G044_CRU_ACLK, R9A07G044_CLK_M0,
-					0x564, 3),
+					0x564, 3, 0),
 		DEF_MOD("dsi_pll_clk",	R9A07G044_MIPI_DSI_PLLCLK, R9A07G044_CLK_M1,
-					0x568, 0),
+					0x568, 0, 0),
 		DEF_MOD("dsi_sys_clk",	R9A07G044_MIPI_DSI_SYSCLK, CLK_M2_DIV2,
-					0x568, 1),
+					0x568, 1, 0),
 		DEF_MOD("dsi_aclk",	R9A07G044_MIPI_DSI_ACLK, R9A07G044_CLK_P1,
-					0x568, 2),
+					0x568, 2, 0),
 		DEF_MOD("dsi_pclk",	R9A07G044_MIPI_DSI_PCLK, R9A07G044_CLK_P2,
-					0x568, 3),
+					0x568, 3, 0),
 		DEF_MOD("dsi_vclk",	R9A07G044_MIPI_DSI_VCLK, R9A07G044_CLK_M3,
-					0x568, 4),
+					0x568, 4, 0),
 		DEF_MOD("dsi_lpclk",	R9A07G044_MIPI_DSI_LPCLK, R9A07G044_CLK_M4,
-					0x568, 5),
+					0x568, 5, 0),
 		DEF_COUPLED("lcdc_a",	R9A07G044_LCDC_CLK_A, R9A07G044_CLK_M0,
-					0x56c, 0),
+					0x56c, 0, 0),
 		DEF_COUPLED("lcdc_p",	R9A07G044_LCDC_CLK_P, R9A07G044_CLK_ZT,
-					0x56c, 0),
+					0x56c, 0, 0),
 		DEF_MOD("lcdc_clk_d",	R9A07G044_LCDC_CLK_D, R9A07G044_CLK_M3,
-					0x56c, 1),
+					0x56c, 1, 0),
 		DEF_MOD("ssi0_pclk",	R9A07G044_SSI0_PCLK2, R9A07G044_CLK_P0,
-					0x570, 0),
+					0x570, 0, 0),
 		DEF_MOD("ssi0_sfr",	R9A07G044_SSI0_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 1),
+					0x570, 1, 0),
 		DEF_MOD("ssi1_pclk",	R9A07G044_SSI1_PCLK2, R9A07G044_CLK_P0,
-					0x570, 2),
+					0x570, 2, 0),
 		DEF_MOD("ssi1_sfr",	R9A07G044_SSI1_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 3),
+					0x570, 3, 0),
 		DEF_MOD("ssi2_pclk",	R9A07G044_SSI2_PCLK2, R9A07G044_CLK_P0,
-					0x570, 4),
+					0x570, 4, 0),
 		DEF_MOD("ssi2_sfr",	R9A07G044_SSI2_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 5),
+					0x570, 5, 0),
 		DEF_MOD("ssi3_pclk",	R9A07G044_SSI3_PCLK2, R9A07G044_CLK_P0,
-					0x570, 6),
+					0x570, 6, 0),
 		DEF_MOD("ssi3_sfr",	R9A07G044_SSI3_PCLK_SFR, R9A07G044_CLK_P0,
-					0x570, 7),
+					0x570, 7, 0),
 		DEF_MOD("usb0_host",	R9A07G044_USB_U2H0_HCLK, R9A07G044_CLK_P1,
-					0x578, 0),
+					0x578, 0, 0),
 		DEF_MOD("usb1_host",	R9A07G044_USB_U2H1_HCLK, R9A07G044_CLK_P1,
-					0x578, 1),
+					0x578, 1, 0),
 		DEF_MOD("usb0_func",	R9A07G044_USB_U2P_EXR_CPUCLK, R9A07G044_CLK_P1,
-					0x578, 2),
+					0x578, 2, 0),
 		DEF_MOD("usb_pclk",	R9A07G044_USB_PCLK, R9A07G044_CLK_P1,
-					0x578, 3),
+					0x578, 3, 0),
 		DEF_COUPLED("eth0_axi",	R9A07G044_ETH0_CLK_AXI, R9A07G044_CLK_M0,
-					0x57c, 0),
+					0x57c, 0, 0),
 		DEF_COUPLED("eth0_chi",	R9A07G044_ETH0_CLK_CHI, R9A07G044_CLK_ZT,
-					0x57c, 0),
+					0x57c, 0, 0),
 		DEF_COUPLED("eth1_axi",	R9A07G044_ETH1_CLK_AXI, R9A07G044_CLK_M0,
-					0x57c, 1),
+					0x57c, 1, 0),
 		DEF_COUPLED("eth1_chi",	R9A07G044_ETH1_CLK_CHI, R9A07G044_CLK_ZT,
-					0x57c, 1),
+					0x57c, 1, 0),
 		DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
-					0x580, 0),
+					0x580, 0, 0),
 		DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
-					0x580, 1),
+					0x580, 1, 0),
 		DEF_MOD("i2c2",		R9A07G044_I2C2_PCLK, R9A07G044_CLK_P0,
-					0x580, 2),
+					0x580, 2, 0),
 		DEF_MOD("i2c3",		R9A07G044_I2C3_PCLK, R9A07G044_CLK_P0,
-					0x580, 3),
+					0x580, 3, 0),
 		DEF_MOD("scif0",	R9A07G044_SCIF0_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 0),
+					0x584, 0, 0),
 		DEF_MOD("scif1",	R9A07G044_SCIF1_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 1),
+					0x584, 1, 0),
 		DEF_MOD("scif2",	R9A07G044_SCIF2_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 2),
+					0x584, 2, 0),
 		DEF_MOD("scif3",	R9A07G044_SCIF3_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 3),
+					0x584, 3, 0),
 		DEF_MOD("scif4",	R9A07G044_SCIF4_CLK_PCK, R9A07G044_CLK_P0,
-					0x584, 4),
+					0x584, 4, 0),
 		DEF_MOD("sci0",		R9A07G044_SCI0_CLKP, R9A07G044_CLK_P0,
-					0x588, 0),
+					0x588, 0, 0),
 		DEF_MOD("sci1",		R9A07G044_SCI1_CLKP, R9A07G044_CLK_P0,
-					0x588, 1),
+					0x588, 1, 0),
 		DEF_MOD("rspi0",	R9A07G044_RSPI0_CLKB, R9A07G044_CLK_P0,
-					0x590, 0),
+					0x590, 0, 0),
 		DEF_MOD("rspi1",	R9A07G044_RSPI1_CLKB, R9A07G044_CLK_P0,
-					0x590, 1),
+					0x590, 1, 0),
 		DEF_MOD("rspi2",	R9A07G044_RSPI2_CLKB, R9A07G044_CLK_P0,
-					0x590, 2),
+					0x590, 2, 0),
 		DEF_MOD("canfd",	R9A07G044_CANFD_PCLK, R9A07G044_CLK_P0,
-					0x594, 0),
+					0x594, 0, 0),
 		DEF_MOD("gpio",		R9A07G044_GPIO_HCLK, R9A07G044_OSCCLK,
-					0x598, 0),
+					0x598, 0, 0),
 		DEF_MOD("adc_adclk",	R9A07G044_ADC_ADCLK, R9A07G044_CLK_TSU,
-					0x5a8, 0),
+					0x5a8, 0, 0),
 		DEF_MOD("adc_pclk",	R9A07G044_ADC_PCLK, R9A07G044_CLK_P0,
-					0x5a8, 1),
+					0x5a8, 1, 0),
 		DEF_MOD("tsu_pclk",	R9A07G044_TSU_PCLK, R9A07G044_CLK_TSU,
-					0x5ac, 0),
+					0x5ac, 0, 0),
 	},
 #ifdef CONFIG_CLK_R9A07G054
 	.drp = {
 		DEF_MOD("stpai_initclk", R9A07G054_STPAI_INITCLK, R9A07G044_OSCCLK,
-					0x5e8, 0),
+					0x5e8, 0, 0),
 		DEF_MOD("stpai_aclk",	R9A07G054_STPAI_ACLK, R9A07G044_CLK_P1,
-					0x5e8, 1),
+					0x5e8, 1, 0),
 		DEF_MOD("stpai_mclk",	R9A07G054_STPAI_MCLK, R9A07G054_CLK_DRP_M,
-					0x5e8, 2),
+					0x5e8, 2, 0),
 		DEF_MOD("stpai_dclkin",	R9A07G054_STPAI_DCLKIN, R9A07G054_CLK_DRP_D,
-					0x5e8, 3),
+					0x5e8, 3, 0),
 		DEF_MOD("stpai_aclk_drp", R9A07G054_STPAI_ACLK_DRP, R9A07G054_CLK_DRP_A,
-					0x5e8, 4),
+					0x5e8, 4, 0),
 	},
 #endif
 };
diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 4035f3443598..ddc5d6cd572b 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -192,58 +192,59 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 };
 
 static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
-	DEF_MOD("gic_gicclk",		R9A08G045_GIC600_GICCLK, R9A08G045_CLK_P1, 0x514, 0),
-	DEF_MOD("ia55_pclk",		R9A08G045_IA55_PCLK, R9A08G045_CLK_P2, 0x518, 0),
-	DEF_MOD("ia55_clk",		R9A08G045_IA55_CLK, R9A08G045_CLK_P1, 0x518, 1),
-	DEF_MOD("dmac_aclk",		R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0),
-	DEF_MOD("dmac_pclk",		R9A08G045_DMAC_PCLK, CLK_P3_DIV2, 0x52c, 1),
-	DEF_MOD("wdt0_pclk",		R9A08G045_WDT0_PCLK, R9A08G045_CLK_P0, 0x548, 0),
-	DEF_MOD("wdt0_clk",		R9A08G045_WDT0_CLK, R9A08G045_OSCCLK, 0x548, 1),
-	DEF_MOD("sdhi0_imclk",		R9A08G045_SDHI0_IMCLK, CLK_SD0_DIV4, 0x554, 0),
-	DEF_MOD("sdhi0_imclk2",		R9A08G045_SDHI0_IMCLK2, CLK_SD0_DIV4, 0x554, 1),
-	DEF_MOD("sdhi0_clk_hs",		R9A08G045_SDHI0_CLK_HS, R9A08G045_CLK_SD0, 0x554, 2),
-	DEF_MOD("sdhi0_aclk",		R9A08G045_SDHI0_ACLK, R9A08G045_CLK_P1, 0x554, 3),
-	DEF_MOD("sdhi1_imclk",		R9A08G045_SDHI1_IMCLK, CLK_SD1_DIV4, 0x554, 4),
-	DEF_MOD("sdhi1_imclk2",		R9A08G045_SDHI1_IMCLK2, CLK_SD1_DIV4, 0x554, 5),
-	DEF_MOD("sdhi1_clk_hs",		R9A08G045_SDHI1_CLK_HS, R9A08G045_CLK_SD1, 0x554, 6),
-	DEF_MOD("sdhi1_aclk",		R9A08G045_SDHI1_ACLK, R9A08G045_CLK_P1, 0x554, 7),
-	DEF_MOD("sdhi2_imclk",		R9A08G045_SDHI2_IMCLK, CLK_SD2_DIV4, 0x554, 8),
-	DEF_MOD("sdhi2_imclk2",		R9A08G045_SDHI2_IMCLK2, CLK_SD2_DIV4, 0x554, 9),
-	DEF_MOD("sdhi2_clk_hs",		R9A08G045_SDHI2_CLK_HS, R9A08G045_CLK_SD2, 0x554, 10),
-	DEF_MOD("sdhi2_aclk",		R9A08G045_SDHI2_ACLK, R9A08G045_CLK_P1, 0x554, 11),
-	DEF_MOD("ssi0_pclk2",		R9A08G045_SSI0_PCLK2, R9A08G045_CLK_P0, 0x570, 0),
-	DEF_MOD("ssi0_sfr",		R9A08G045_SSI0_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 1),
-	DEF_MOD("ssi1_pclk2",		R9A08G045_SSI1_PCLK2, R9A08G045_CLK_P0, 0x570, 2),
-	DEF_MOD("ssi1_sfr",		R9A08G045_SSI1_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 3),
-	DEF_MOD("ssi2_pclk2",		R9A08G045_SSI2_PCLK2, R9A08G045_CLK_P0, 0x570, 4),
-	DEF_MOD("ssi2_sfr",		R9A08G045_SSI2_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 5),
-	DEF_MOD("ssi3_pclk2",		R9A08G045_SSI3_PCLK2, R9A08G045_CLK_P0, 0x570, 6),
-	DEF_MOD("ssi3_sfr",		R9A08G045_SSI3_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 7),
-	DEF_MOD("usb0_host",		R9A08G045_USB_U2H0_HCLK, R9A08G045_CLK_P1, 0x578, 0),
-	DEF_MOD("usb1_host",		R9A08G045_USB_U2H1_HCLK, R9A08G045_CLK_P1, 0x578, 1),
-	DEF_MOD("usb0_func",		R9A08G045_USB_U2P_EXR_CPUCLK, R9A08G045_CLK_P1, 0x578, 2),
-	DEF_MOD("usb_pclk",		R9A08G045_USB_PCLK, R9A08G045_CLK_P1, 0x578, 3),
-	DEF_COUPLED("eth0_axi",		R9A08G045_ETH0_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 0),
-	DEF_COUPLED("eth0_chi",		R9A08G045_ETH0_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 0),
-	DEF_MOD("eth0_refclk",		R9A08G045_ETH0_REFCLK, R9A08G045_CLK_HP, 0x57c, 8),
-	DEF_COUPLED("eth1_axi",		R9A08G045_ETH1_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 1),
-	DEF_COUPLED("eth1_chi",		R9A08G045_ETH1_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 1),
-	DEF_MOD("eth1_refclk",		R9A08G045_ETH1_REFCLK, R9A08G045_CLK_HP, 0x57c, 9),
-	DEF_MOD("i2c0_pclk",		R9A08G045_I2C0_PCLK, R9A08G045_CLK_P0, 0x580, 0),
-	DEF_MOD("i2c1_pclk",		R9A08G045_I2C1_PCLK, R9A08G045_CLK_P0, 0x580, 1),
-	DEF_MOD("i2c2_pclk",		R9A08G045_I2C2_PCLK, R9A08G045_CLK_P0, 0x580, 2),
-	DEF_MOD("i2c3_pclk",		R9A08G045_I2C3_PCLK, R9A08G045_CLK_P0, 0x580, 3),
-	DEF_MOD("scif0_clk_pck",	R9A08G045_SCIF0_CLK_PCK, R9A08G045_CLK_P0, 0x584, 0),
-	DEF_MOD("scif1_clk_pck",	R9A08G045_SCIF1_CLK_PCK, R9A08G045_CLK_P0, 0x584, 1),
-	DEF_MOD("scif2_clk_pck",	R9A08G045_SCIF2_CLK_PCK, R9A08G045_CLK_P0, 0x584, 2),
-	DEF_MOD("scif3_clk_pck",	R9A08G045_SCIF3_CLK_PCK, R9A08G045_CLK_P0, 0x584, 3),
-	DEF_MOD("scif4_clk_pck",	R9A08G045_SCIF4_CLK_PCK, R9A08G045_CLK_P0, 0x584, 4),
-	DEF_MOD("scif5_clk_pck",	R9A08G045_SCIF5_CLK_PCK, R9A08G045_CLK_P0, 0x584, 5),
-	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0),
-	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
-	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
-	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0),
-	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
+	DEF_MOD("gic_gicclk",		R9A08G045_GIC600_GICCLK, R9A08G045_CLK_P1, 0x514, 0, 0),
+	DEF_MOD("ia55_pclk",		R9A08G045_IA55_PCLK, R9A08G045_CLK_P2, 0x518, 0, 0),
+	DEF_MOD("ia55_clk",		R9A08G045_IA55_CLK, R9A08G045_CLK_P1, 0x518, 1, 0),
+	DEF_MOD("dmac_aclk",		R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0, 0),
+	DEF_MOD("dmac_pclk",		R9A08G045_DMAC_PCLK, CLK_P3_DIV2, 0x52c, 1, 0),
+	DEF_MOD("wdt0_pclk",		R9A08G045_WDT0_PCLK, R9A08G045_CLK_P0, 0x548, 0, 0),
+	DEF_MOD("wdt0_clk",		R9A08G045_WDT0_CLK, R9A08G045_OSCCLK, 0x548, 1, 0),
+	DEF_MOD("sdhi0_imclk",		R9A08G045_SDHI0_IMCLK, CLK_SD0_DIV4, 0x554, 0, 0),
+	DEF_MOD("sdhi0_imclk2",		R9A08G045_SDHI0_IMCLK2, CLK_SD0_DIV4, 0x554, 1, 0),
+	DEF_MOD("sdhi0_clk_hs",		R9A08G045_SDHI0_CLK_HS, R9A08G045_CLK_SD0, 0x554, 2, 0),
+	DEF_MOD("sdhi0_aclk",		R9A08G045_SDHI0_ACLK, R9A08G045_CLK_P1, 0x554, 3, 0),
+	DEF_MOD("sdhi1_imclk",		R9A08G045_SDHI1_IMCLK, CLK_SD1_DIV4, 0x554, 4, 0),
+	DEF_MOD("sdhi1_imclk2",		R9A08G045_SDHI1_IMCLK2, CLK_SD1_DIV4, 0x554, 5, 0),
+	DEF_MOD("sdhi1_clk_hs",		R9A08G045_SDHI1_CLK_HS, R9A08G045_CLK_SD1, 0x554, 6, 0),
+	DEF_MOD("sdhi1_aclk",		R9A08G045_SDHI1_ACLK, R9A08G045_CLK_P1, 0x554, 7, 0),
+	DEF_MOD("sdhi2_imclk",		R9A08G045_SDHI2_IMCLK, CLK_SD2_DIV4, 0x554, 8, 0),
+	DEF_MOD("sdhi2_imclk2",		R9A08G045_SDHI2_IMCLK2, CLK_SD2_DIV4, 0x554, 9, 0),
+	DEF_MOD("sdhi2_clk_hs",		R9A08G045_SDHI2_CLK_HS, R9A08G045_CLK_SD2, 0x554, 10, 0),
+	DEF_MOD("sdhi2_aclk",		R9A08G045_SDHI2_ACLK, R9A08G045_CLK_P1, 0x554, 11, 0),
+	DEF_MOD("ssi0_pclk2",		R9A08G045_SSI0_PCLK2, R9A08G045_CLK_P0, 0x570, 0, 0),
+	DEF_MOD("ssi0_sfr",		R9A08G045_SSI0_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 1, 0),
+	DEF_MOD("ssi1_pclk2",		R9A08G045_SSI1_PCLK2, R9A08G045_CLK_P0, 0x570, 2, 0),
+	DEF_MOD("ssi1_sfr",		R9A08G045_SSI1_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 3, 0),
+	DEF_MOD("ssi2_pclk2",		R9A08G045_SSI2_PCLK2, R9A08G045_CLK_P0, 0x570, 4, 0),
+	DEF_MOD("ssi2_sfr",		R9A08G045_SSI2_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 5, 0),
+	DEF_MOD("ssi3_pclk2",		R9A08G045_SSI3_PCLK2, R9A08G045_CLK_P0, 0x570, 6, 0),
+	DEF_MOD("ssi3_sfr",		R9A08G045_SSI3_PCLK_SFR, R9A08G045_CLK_P0, 0x570, 7, 0),
+	DEF_MOD("usb0_host",		R9A08G045_USB_U2H0_HCLK, R9A08G045_CLK_P1, 0x578, 0, 0),
+	DEF_MOD("usb1_host",		R9A08G045_USB_U2H1_HCLK, R9A08G045_CLK_P1, 0x578, 1, 0),
+	DEF_MOD("usb0_func",		R9A08G045_USB_U2P_EXR_CPUCLK, R9A08G045_CLK_P1, 0x578, 2,
+					0),
+	DEF_MOD("usb_pclk",		R9A08G045_USB_PCLK, R9A08G045_CLK_P1, 0x578, 3, 0),
+	DEF_COUPLED("eth0_axi",		R9A08G045_ETH0_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 0, 0),
+	DEF_COUPLED("eth0_chi",		R9A08G045_ETH0_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 0, 0),
+	DEF_MOD("eth0_refclk",		R9A08G045_ETH0_REFCLK, R9A08G045_CLK_HP, 0x57c, 8, 0),
+	DEF_COUPLED("eth1_axi",		R9A08G045_ETH1_CLK_AXI, R9A08G045_CLK_M0, 0x57c, 1, 0),
+	DEF_COUPLED("eth1_chi",		R9A08G045_ETH1_CLK_CHI, R9A08G045_CLK_ZT, 0x57c, 1, 0),
+	DEF_MOD("eth1_refclk",		R9A08G045_ETH1_REFCLK, R9A08G045_CLK_HP, 0x57c, 9, 0),
+	DEF_MOD("i2c0_pclk",		R9A08G045_I2C0_PCLK, R9A08G045_CLK_P0, 0x580, 0, 0),
+	DEF_MOD("i2c1_pclk",		R9A08G045_I2C1_PCLK, R9A08G045_CLK_P0, 0x580, 1, 0),
+	DEF_MOD("i2c2_pclk",		R9A08G045_I2C2_PCLK, R9A08G045_CLK_P0, 0x580, 2, 0),
+	DEF_MOD("i2c3_pclk",		R9A08G045_I2C3_PCLK, R9A08G045_CLK_P0, 0x580, 3, 0),
+	DEF_MOD("scif0_clk_pck",	R9A08G045_SCIF0_CLK_PCK, R9A08G045_CLK_P0, 0x584, 0, 0),
+	DEF_MOD("scif1_clk_pck",	R9A08G045_SCIF1_CLK_PCK, R9A08G045_CLK_P0, 0x584, 1, 0),
+	DEF_MOD("scif2_clk_pck",	R9A08G045_SCIF2_CLK_PCK, R9A08G045_CLK_P0, 0x584, 2, 0),
+	DEF_MOD("scif3_clk_pck",	R9A08G045_SCIF3_CLK_PCK, R9A08G045_CLK_P0, 0x584, 3, 0),
+	DEF_MOD("scif4_clk_pck",	R9A08G045_SCIF4_CLK_PCK, R9A08G045_CLK_P0, 0x584, 4, 0),
+	DEF_MOD("scif5_clk_pck",	R9A08G045_SCIF5_CLK_PCK, R9A08G045_CLK_P0, 0x584, 5, 0),
+	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0, 0),
+	DEF_MOD("adc_adclk",		R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0, 0),
+	DEF_MOD("adc_pclk",		R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1, 0),
+	DEF_MOD("tsu_pclk",		R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0, 0),
+	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0, 0),
 };
 
 static const struct rzg2l_reset r9a08g045_resets[] = {
diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index 22272279b104..ba25429c244d 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -151,64 +151,64 @@ static const struct cpg_core_clk r9a09g011_core_clks[] __initconst = {
 };
 
 static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
-	DEF_MOD("pfc",		R9A09G011_PFC_PCLK,	 CLK_MAIN,     0x400, 2),
-	DEF_MOD("gic",		R9A09G011_GIC_CLK,	 CLK_SEL_B_D2, 0x400, 5),
-	DEF_MOD("sdi0_aclk",	R9A09G011_SDI0_ACLK,	 CLK_SEL_D,    0x408, 0),
-	DEF_MOD("sdi0_imclk",	R9A09G011_SDI0_IMCLK,	 CLK_SEL_SDI,  0x408, 1),
-	DEF_MOD("sdi0_imclk2",	R9A09G011_SDI0_IMCLK2,	 CLK_SEL_SDI,  0x408, 2),
-	DEF_MOD("sdi0_clk_hs",	R9A09G011_SDI0_CLK_HS,	 CLK_PLL2_800, 0x408, 3),
-	DEF_MOD("sdi1_aclk",	R9A09G011_SDI1_ACLK,	 CLK_SEL_D,    0x408, 4),
-	DEF_MOD("sdi1_imclk",	R9A09G011_SDI1_IMCLK,	 CLK_SEL_SDI,  0x408, 5),
-	DEF_MOD("sdi1_imclk2",	R9A09G011_SDI1_IMCLK2,	 CLK_SEL_SDI,  0x408, 6),
-	DEF_MOD("sdi1_clk_hs",	R9A09G011_SDI1_CLK_HS,	 CLK_PLL2_800, 0x408, 7),
-	DEF_MOD("emm_aclk",	R9A09G011_EMM_ACLK,	 CLK_SEL_D,    0x408, 8),
-	DEF_MOD("emm_imclk",	R9A09G011_EMM_IMCLK,	 CLK_SEL_SDI,  0x408, 9),
-	DEF_MOD("emm_imclk2",	R9A09G011_EMM_IMCLK2,	 CLK_SEL_SDI,  0x408, 10),
-	DEF_MOD("emm_clk_hs",	R9A09G011_EMM_CLK_HS,	 CLK_PLL2_800, 0x408, 11),
-	DEF_COUPLED("eth_axi",	R9A09G011_ETH0_CLK_AXI,	 CLK_PLL2_200, 0x40c, 8),
-	DEF_COUPLED("eth_chi",	R9A09G011_ETH0_CLK_CHI,	 CLK_PLL2_100, 0x40c, 8),
-	DEF_MOD("eth_clk_gptp",	R9A09G011_ETH0_GPTP_EXT, CLK_PLL2_100, 0x40c, 9),
-	DEF_MOD("usb_aclk_h",	R9A09G011_USB_ACLK_H,	 CLK_SEL_D,    0x40c, 4),
-	DEF_MOD("usb_aclk_p",	R9A09G011_USB_ACLK_P,	 CLK_SEL_D,    0x40c, 5),
-	DEF_MOD("usb_pclk",	R9A09G011_USB_PCLK,	 CLK_SEL_E,    0x40c, 6),
-	DEF_MOD("syc_cnt_clk",	R9A09G011_SYC_CNT_CLK,	 CLK_MAIN_24,  0x41c, 12),
-	DEF_MOD("iic_pclk0",	R9A09G011_IIC_PCLK0,	 CLK_SEL_E,    0x420, 12),
-	DEF_MOD("cperi_grpb",	R9A09G011_CPERI_GRPB_PCLK, CLK_SEL_E,  0x424, 0),
-	DEF_MOD("tim_clk_8",	R9A09G011_TIM8_CLK,	 CLK_MAIN_2,   0x424, 4),
-	DEF_MOD("tim_clk_9",	R9A09G011_TIM9_CLK,	 CLK_MAIN_2,   0x424, 5),
-	DEF_MOD("tim_clk_10",	R9A09G011_TIM10_CLK,	 CLK_MAIN_2,   0x424, 6),
-	DEF_MOD("tim_clk_11",	R9A09G011_TIM11_CLK,	 CLK_MAIN_2,   0x424, 7),
-	DEF_MOD("tim_clk_12",	R9A09G011_TIM12_CLK,	 CLK_MAIN_2,   0x424, 8),
-	DEF_MOD("tim_clk_13",	R9A09G011_TIM13_CLK,	 CLK_MAIN_2,   0x424, 9),
-	DEF_MOD("tim_clk_14",	R9A09G011_TIM14_CLK,	 CLK_MAIN_2,   0x424, 10),
-	DEF_MOD("tim_clk_15",	R9A09G011_TIM15_CLK,	 CLK_MAIN_2,   0x424, 11),
-	DEF_MOD("iic_pclk1",	R9A09G011_IIC_PCLK1,	 CLK_SEL_E,    0x424, 12),
-	DEF_MOD("cperi_grpc",	R9A09G011_CPERI_GRPC_PCLK, CLK_SEL_E,  0x428, 0),
-	DEF_MOD("tim_clk_16",	R9A09G011_TIM16_CLK,	 CLK_MAIN_2,   0x428, 4),
-	DEF_MOD("tim_clk_17",	R9A09G011_TIM17_CLK,	 CLK_MAIN_2,   0x428, 5),
-	DEF_MOD("tim_clk_18",	R9A09G011_TIM18_CLK,	 CLK_MAIN_2,   0x428, 6),
-	DEF_MOD("tim_clk_19",	R9A09G011_TIM19_CLK,	 CLK_MAIN_2,   0x428, 7),
-	DEF_MOD("tim_clk_20",	R9A09G011_TIM20_CLK,	 CLK_MAIN_2,   0x428, 8),
-	DEF_MOD("tim_clk_21",	R9A09G011_TIM21_CLK,	 CLK_MAIN_2,   0x428, 9),
-	DEF_MOD("tim_clk_22",	R9A09G011_TIM22_CLK,	 CLK_MAIN_2,   0x428, 10),
-	DEF_MOD("tim_clk_23",	R9A09G011_TIM23_CLK,	 CLK_MAIN_2,   0x428, 11),
-	DEF_MOD("wdt0_pclk",	R9A09G011_WDT0_PCLK,	 CLK_SEL_E,    0x428, 12),
-	DEF_MOD("wdt0_clk",	R9A09G011_WDT0_CLK,	 CLK_MAIN,     0x428, 13),
-	DEF_MOD("cperi_grpf",	R9A09G011_CPERI_GRPF_PCLK, CLK_SEL_E,  0x434, 0),
-	DEF_MOD("pwm8_clk",	R9A09G011_PWM8_CLK,	 CLK_MAIN,     0x434, 4),
-	DEF_MOD("pwm9_clk",	R9A09G011_PWM9_CLK,	 CLK_MAIN,     0x434, 5),
-	DEF_MOD("pwm10_clk",	R9A09G011_PWM10_CLK,	 CLK_MAIN,     0x434, 6),
-	DEF_MOD("pwm11_clk",	R9A09G011_PWM11_CLK,	 CLK_MAIN,     0x434, 7),
-	DEF_MOD("pwm12_clk",	R9A09G011_PWM12_CLK,	 CLK_MAIN,     0x434, 8),
-	DEF_MOD("pwm13_clk",	R9A09G011_PWM13_CLK,	 CLK_MAIN,     0x434, 9),
-	DEF_MOD("pwm14_clk",	R9A09G011_PWM14_CLK,	 CLK_MAIN,     0x434, 10),
-	DEF_MOD("cperi_grpg",	R9A09G011_CPERI_GRPG_PCLK, CLK_SEL_E,  0x438, 0),
-	DEF_MOD("cperi_grph",	R9A09G011_CPERI_GRPH_PCLK, CLK_SEL_E,  0x438, 1),
-	DEF_MOD("urt_pclk",	R9A09G011_URT_PCLK,	 CLK_SEL_E,    0x438, 4),
-	DEF_MOD("urt0_clk",	R9A09G011_URT0_CLK,	 CLK_SEL_W0,   0x438, 5),
-	DEF_MOD("csi0_clk",	R9A09G011_CSI0_CLK,	 CLK_SEL_CSI0, 0x438, 8),
-	DEF_MOD("csi4_clk",	R9A09G011_CSI4_CLK,	 CLK_SEL_CSI4, 0x438, 12),
-	DEF_MOD("ca53",		R9A09G011_CA53_CLK,	 CLK_DIV_A,    0x448, 0),
+	DEF_MOD("pfc",		R9A09G011_PFC_PCLK,	 CLK_MAIN,     0x400, 2, 0),
+	DEF_MOD("gic",		R9A09G011_GIC_CLK,	 CLK_SEL_B_D2, 0x400, 5, 0),
+	DEF_MOD("sdi0_aclk",	R9A09G011_SDI0_ACLK,	 CLK_SEL_D,    0x408, 0, 0),
+	DEF_MOD("sdi0_imclk",	R9A09G011_SDI0_IMCLK,	 CLK_SEL_SDI,  0x408, 1, 0),
+	DEF_MOD("sdi0_imclk2",	R9A09G011_SDI0_IMCLK2,	 CLK_SEL_SDI,  0x408, 2, 0),
+	DEF_MOD("sdi0_clk_hs",	R9A09G011_SDI0_CLK_HS,	 CLK_PLL2_800, 0x408, 3, 0),
+	DEF_MOD("sdi1_aclk",	R9A09G011_SDI1_ACLK,	 CLK_SEL_D,    0x408, 4, 0),
+	DEF_MOD("sdi1_imclk",	R9A09G011_SDI1_IMCLK,	 CLK_SEL_SDI,  0x408, 5, 0),
+	DEF_MOD("sdi1_imclk2",	R9A09G011_SDI1_IMCLK2,	 CLK_SEL_SDI,  0x408, 6, 0),
+	DEF_MOD("sdi1_clk_hs",	R9A09G011_SDI1_CLK_HS,	 CLK_PLL2_800, 0x408, 7, 0),
+	DEF_MOD("emm_aclk",	R9A09G011_EMM_ACLK,	 CLK_SEL_D,    0x408, 8, 0),
+	DEF_MOD("emm_imclk",	R9A09G011_EMM_IMCLK,	 CLK_SEL_SDI,  0x408, 9, 0),
+	DEF_MOD("emm_imclk2",	R9A09G011_EMM_IMCLK2,	 CLK_SEL_SDI,  0x408, 10, 0),
+	DEF_MOD("emm_clk_hs",	R9A09G011_EMM_CLK_HS,	 CLK_PLL2_800, 0x408, 11, 0),
+	DEF_COUPLED("eth_axi",	R9A09G011_ETH0_CLK_AXI,	 CLK_PLL2_200, 0x40c, 8, 0),
+	DEF_COUPLED("eth_chi",	R9A09G011_ETH0_CLK_CHI,	 CLK_PLL2_100, 0x40c, 8, 0),
+	DEF_MOD("eth_clk_gptp",	R9A09G011_ETH0_GPTP_EXT, CLK_PLL2_100, 0x40c, 9, 0),
+	DEF_MOD("usb_aclk_h",	R9A09G011_USB_ACLK_H,	 CLK_SEL_D,    0x40c, 4, 0),
+	DEF_MOD("usb_aclk_p",	R9A09G011_USB_ACLK_P,	 CLK_SEL_D,    0x40c, 5, 0),
+	DEF_MOD("usb_pclk",	R9A09G011_USB_PCLK,	 CLK_SEL_E,    0x40c, 6, 0),
+	DEF_MOD("syc_cnt_clk",	R9A09G011_SYC_CNT_CLK,	 CLK_MAIN_24,  0x41c, 12, 0),
+	DEF_MOD("iic_pclk0",	R9A09G011_IIC_PCLK0,	 CLK_SEL_E,    0x420, 12, 0),
+	DEF_MOD("cperi_grpb",	R9A09G011_CPERI_GRPB_PCLK, CLK_SEL_E,  0x424, 0, 0),
+	DEF_MOD("tim_clk_8",	R9A09G011_TIM8_CLK,	 CLK_MAIN_2,   0x424, 4, 0),
+	DEF_MOD("tim_clk_9",	R9A09G011_TIM9_CLK,	 CLK_MAIN_2,   0x424, 5, 0),
+	DEF_MOD("tim_clk_10",	R9A09G011_TIM10_CLK,	 CLK_MAIN_2,   0x424, 6, 0),
+	DEF_MOD("tim_clk_11",	R9A09G011_TIM11_CLK,	 CLK_MAIN_2,   0x424, 7, 0),
+	DEF_MOD("tim_clk_12",	R9A09G011_TIM12_CLK,	 CLK_MAIN_2,   0x424, 8, 0),
+	DEF_MOD("tim_clk_13",	R9A09G011_TIM13_CLK,	 CLK_MAIN_2,   0x424, 9, 0),
+	DEF_MOD("tim_clk_14",	R9A09G011_TIM14_CLK,	 CLK_MAIN_2,   0x424, 10, 0),
+	DEF_MOD("tim_clk_15",	R9A09G011_TIM15_CLK,	 CLK_MAIN_2,   0x424, 11, 0),
+	DEF_MOD("iic_pclk1",	R9A09G011_IIC_PCLK1,	 CLK_SEL_E,    0x424, 12, 0),
+	DEF_MOD("cperi_grpc",	R9A09G011_CPERI_GRPC_PCLK, CLK_SEL_E,  0x428, 0, 0),
+	DEF_MOD("tim_clk_16",	R9A09G011_TIM16_CLK,	 CLK_MAIN_2,   0x428, 4, 0),
+	DEF_MOD("tim_clk_17",	R9A09G011_TIM17_CLK,	 CLK_MAIN_2,   0x428, 5, 0),
+	DEF_MOD("tim_clk_18",	R9A09G011_TIM18_CLK,	 CLK_MAIN_2,   0x428, 6, 0),
+	DEF_MOD("tim_clk_19",	R9A09G011_TIM19_CLK,	 CLK_MAIN_2,   0x428, 7, 0),
+	DEF_MOD("tim_clk_20",	R9A09G011_TIM20_CLK,	 CLK_MAIN_2,   0x428, 8, 0),
+	DEF_MOD("tim_clk_21",	R9A09G011_TIM21_CLK,	 CLK_MAIN_2,   0x428, 9, 0),
+	DEF_MOD("tim_clk_22",	R9A09G011_TIM22_CLK,	 CLK_MAIN_2,   0x428, 10, 0),
+	DEF_MOD("tim_clk_23",	R9A09G011_TIM23_CLK,	 CLK_MAIN_2,   0x428, 11, 0),
+	DEF_MOD("wdt0_pclk",	R9A09G011_WDT0_PCLK,	 CLK_SEL_E,    0x428, 12, 0),
+	DEF_MOD("wdt0_clk",	R9A09G011_WDT0_CLK,	 CLK_MAIN,     0x428, 13, 0),
+	DEF_MOD("cperi_grpf",	R9A09G011_CPERI_GRPF_PCLK, CLK_SEL_E,  0x434, 0, 0),
+	DEF_MOD("pwm8_clk",	R9A09G011_PWM8_CLK,	 CLK_MAIN,     0x434, 4, 0),
+	DEF_MOD("pwm9_clk",	R9A09G011_PWM9_CLK,	 CLK_MAIN,     0x434, 5, 0),
+	DEF_MOD("pwm10_clk",	R9A09G011_PWM10_CLK,	 CLK_MAIN,     0x434, 6, 0),
+	DEF_MOD("pwm11_clk",	R9A09G011_PWM11_CLK,	 CLK_MAIN,     0x434, 7, 0),
+	DEF_MOD("pwm12_clk",	R9A09G011_PWM12_CLK,	 CLK_MAIN,     0x434, 8, 0),
+	DEF_MOD("pwm13_clk",	R9A09G011_PWM13_CLK,	 CLK_MAIN,     0x434, 9, 0),
+	DEF_MOD("pwm14_clk",	R9A09G011_PWM14_CLK,	 CLK_MAIN,     0x434, 10, 0),
+	DEF_MOD("cperi_grpg",	R9A09G011_CPERI_GRPG_PCLK, CLK_SEL_E,  0x438, 0, 0),
+	DEF_MOD("cperi_grph",	R9A09G011_CPERI_GRPH_PCLK, CLK_SEL_E,  0x438, 1, 0),
+	DEF_MOD("urt_pclk",	R9A09G011_URT_PCLK,	 CLK_SEL_E,    0x438, 4, 0),
+	DEF_MOD("urt0_clk",	R9A09G011_URT0_CLK,	 CLK_SEL_W0,   0x438, 5, 0),
+	DEF_MOD("csi0_clk",	R9A09G011_CSI0_CLK,	 CLK_SEL_CSI0, 0x438, 8, 0),
+	DEF_MOD("csi4_clk",	R9A09G011_CSI4_CLK,	 CLK_SEL_CSI4, 0x438, 12, 0),
+	DEF_MOD("ca53",		R9A09G011_CA53_CLK,	 CLK_DIV_A,    0x448, 0, 0),
 };
 
 static const struct rzg2l_reset r9a09g011_resets[] = {
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index bf2453900f36..b2252df6dba3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -12,9 +12,11 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -25,6 +27,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
+#include <linux/refcount.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include <linux/units.h>
@@ -1180,27 +1183,147 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 		core->name, PTR_ERR(clk));
 }
 
+/**
+ * struct mstop - MSTOP specific data structure
+ * @refcnt: reference counter for MSTOP settings (when zero the settings
+ *          are applied to register)
+ * @conf: MSTOP configuration (register offset, setup bits)
+ */
+struct mstop {
+	refcount_t refcnt;
+	u32 conf;
+};
+
 /**
  * struct mstp_clock - MSTP gating clock
  *
  * @priv: CPG/MSTP private data
  * @sibling: pointer to the other coupled clock
+ * @mstop: MSTOP configuration
+ * @shared_mstop_clks: clocks sharing the MSTOP with this clock
  * @hw: handle between common and hardware-specific interfaces
  * @off: register offset
  * @bit: ON/MON bit
+ * @num_shared_mstop_clks: number of the clocks sharing MSTOP with this clock
  * @enabled: soft state of the clock, if it is coupled with another clock
+ * @critical: specifies if this clock is critical
  */
 struct mstp_clock {
 	struct rzg2l_cpg_priv *priv;
 	struct mstp_clock *sibling;
+	struct mstop *mstop;
+	struct mstp_clock **shared_mstop_clks;
 	struct clk_hw hw;
 	u16 off;
 	u8 bit;
+	u8 num_shared_mstop_clks;
 	bool enabled;
+	bool critical;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
+/* Need to be called with a lock held to avoid concurrent access to mstop->refcnt. */
+static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
+					     bool standby)
+{
+	struct rzg2l_cpg_priv *priv = clock->priv;
+	struct mstop *mstop = clock->mstop;
+	bool update = false;
+	u32 value;
+
+	if (!mstop)
+		return;
+
+	value = MSTOP_MASK(mstop->conf) << 16;
+
+	if (standby) {
+		unsigned int criticals = 0;
+
+		for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {
+			struct mstp_clock *clk = clock->shared_mstop_clks[i];
+
+			if (clk->critical)
+				criticals++;
+		}
+
+		/* Increment if clock is critical, too. */
+		if (clock->critical)
+			criticals++;
+
+		/*
+		 * If this is a shared MSTOP and it is shared with critical clocks,
+		 * and the system boots up with this clock enabled but no driver
+		 * uses it the CCF will disable it (as it is unused). As we don't
+		 * increment reference counter for it at registration (to avoid
+		 * messing with clocks enabled at probe but later used by drivers)
+		 * do not set the MSTOP here too if it is shared with critical
+		 * clocks and ref counted only by those critical clocks.
+		 */
+		if (criticals && criticals == refcount_read(&mstop->refcnt))
+			return;
+
+		value |= MSTOP_MASK(mstop->conf);
+
+		/* Allow updates on probe when refcnt = 0. */
+		if (!refcount_read(&mstop->refcnt))
+			update = true;
+		else
+			update = refcount_dec_and_test(&mstop->refcnt);
+	} else {
+		if (!refcount_read(&mstop->refcnt)) {
+			refcount_set(&mstop->refcnt, 1);
+			update = true;
+		} else {
+			refcount_inc(&mstop->refcnt);
+		}
+	}
+
+	if (update)
+		writel(value, priv->base + MSTOP_OFF(mstop->conf));
+}
+
+static int rzg2l_cpg_mstop_show(struct seq_file *s, void *what)
+{
+	struct rzg2l_cpg_priv *priv = s->private;
+
+	seq_printf(s, "%-20s %-5s %-10s\n", "", "", "MSTOP");
+	seq_printf(s, "%-20s %-5s %-10s\n", "", "clk", "-------------------------");
+	seq_printf(s, "%-20s %-5s %-5s %-5s %-6s %-6s\n",
+		   "clk_name", "cnt", "cnt", "off", "val", "shared");
+	seq_printf(s, "%-20s %-5s %-5s %-5s %-6s %-6s\n",
+		   "--------", "-----", "-----", "-----", "------", "------");
+
+	for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
+		struct mstp_clock *clk;
+		struct clk_hw *hw;
+		u32 val;
+
+		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
+			continue;
+
+		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
+		clk = to_mod_clock(hw);
+		if (!clk || !clk->mstop)
+			continue;
+
+		val = readl(priv->base + MSTOP_OFF(clk->mstop->conf)) &
+		      MSTOP_MASK(clk->mstop->conf);
+
+		seq_printf(s, "%-20s %-5d %-5d 0x%-3lx 0x%-4x ", clk_hw_get_name(hw),
+			   __clk_get_enable_count(hw->clk), refcount_read(&clk->mstop->refcnt),
+			   MSTOP_OFF(clk->mstop->conf), val);
+
+		for (unsigned int i = 0; i < clk->num_shared_mstop_clks; i++)
+			seq_printf(s, "%pC ", clk->shared_mstop_clks[i]->hw.clk);
+
+		seq_puts(s, "\n");
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(rzg2l_cpg_mstop);
+
 static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mod_clock(hw);
@@ -1223,7 +1346,15 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	if (enable)
 		value |= bitmask;
 
-	writel(value, priv->base + CLK_ON_R(reg));
+	scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
+		if (enable) {
+			writel(value, priv->base + CLK_ON_R(reg));
+			rzg2l_mod_clock_module_set_state(clock, false);
+		} else {
+			rzg2l_mod_clock_module_set_state(clock, true);
+			writel(value, priv->base + CLK_ON_R(reg));
+		}
+	}
 
 	if (!enable)
 		return 0;
@@ -1334,6 +1465,108 @@ static struct mstp_clock
 	return NULL;
 }
 
+static struct mstop *rzg2l_mod_clock_get_mstop(struct rzg2l_cpg_priv *priv, u32 conf)
+{
+	for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
+		struct mstp_clock *clk;
+		struct clk_hw *hw;
+
+		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
+			continue;
+
+		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
+		clk = to_mod_clock(hw);
+		if (!clk->mstop)
+			continue;
+
+		if (clk->mstop->conf == conf)
+			return clk->mstop;
+	}
+
+	return NULL;
+}
+
+static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
+{
+	for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
+		struct mstp_clock *clk;
+		struct clk_hw *hw;
+
+		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
+			continue;
+
+		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
+		clk = to_mod_clock(hw);
+		if (!clk->mstop)
+			continue;
+
+		/*
+		 * Out of reset all modules are enabled. Set module state
+		 * in case associated clocks are disabled at probe. Otherwise
+		 * module is in invalid HW state.
+		 */
+		scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
+			if (!rzg2l_mod_clock_is_enabled(&clk->hw))
+				rzg2l_mod_clock_module_set_state(clk, true);
+		}
+	}
+}
+
+static int rzg2l_cpg_add_shared_mstop_clock(struct device *dev,
+					    struct mstp_clock *target,
+					    struct mstp_clock *added)
+{
+	for (u8 i = 0; i < target->num_shared_mstop_clks; i++) {
+		if (target->shared_mstop_clks[i] == added)
+			return 0;
+	}
+
+	target->shared_mstop_clks = devm_krealloc(dev, target->shared_mstop_clks,
+						  sizeof(*target->shared_mstop_clks) *
+						  (target->num_shared_mstop_clks + 1),
+						  GFP_KERNEL);
+	if (!target->shared_mstop_clks)
+		return -ENOMEM;
+
+	target->shared_mstop_clks[target->num_shared_mstop_clks++] = added;
+
+	return 0;
+}
+
+static int rzg2l_cpg_update_shared_mstop_clocks(struct rzg2l_cpg_priv *priv,
+						struct mstp_clock *clock)
+{
+	if (!clock->mstop)
+		return 0;
+
+	for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
+		struct mstp_clock *clk;
+		struct clk_hw *hw;
+		int ret;
+
+		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
+			continue;
+
+		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
+		clk = to_mod_clock(hw);
+		if (clk == clock)
+			continue;
+
+		if (!clk->mstop || clk->mstop != clock->mstop)
+			continue;
+
+		ret = rzg2l_cpg_add_shared_mstop_clock(priv->dev, clock, clk);
+		if (ret)
+			return ret;
+
+		ret = rzg2l_cpg_add_shared_mstop_clock(priv->dev, clk, clock);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void __init
 rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 			   const struct rzg2l_cpg_info *info,
@@ -1373,6 +1606,7 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 			dev_dbg(dev, "CPG %s setting CLK_IS_CRITICAL\n",
 				mod->name);
 			init.flags |= CLK_IS_CRITICAL;
+			clock->critical = true;
 			break;
 		}
 
@@ -1385,6 +1619,21 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 	clock->priv = priv;
 	clock->hw.init = &init;
 
+	if (mod->mstop_conf) {
+		struct mstop *mstop = rzg2l_mod_clock_get_mstop(priv, mod->mstop_conf);
+
+		if (!mstop) {
+			mstop = devm_kzalloc(dev, sizeof(*mstop), GFP_KERNEL);
+			if (!mstop) {
+				clk = ERR_PTR(-ENOMEM);
+				goto fail;
+			}
+			mstop->conf = mod->mstop_conf;
+			refcount_set(&mstop->refcnt, 0);
+		}
+		clock->mstop = mstop;
+	}
+
 	ret = devm_clk_hw_register(dev, &clock->hw);
 	if (ret) {
 		clk = ERR_PTR(ret);
@@ -1406,6 +1655,12 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		}
 	}
 
+	ret = rzg2l_cpg_update_shared_mstop_clocks(priv, clock);
+	if (ret) {
+		clk = ERR_PTR(ret);
+		goto fail;
+	}
+
 	return;
 
 fail:
@@ -1877,6 +2132,13 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	for (i = 0; i < info->num_mod_clks; i++)
 		rzg2l_cpg_register_mod_clk(&info->mod_clks[i], info, priv);
 
+	/*
+	 * Initialize MSTOP after all the clocks were registered to avoid
+	 * invalid reference counting when multiple clocks (critical,
+	 * non-critical) shares the same MSTOP.
+	 */
+	rzg2l_mod_clock_init_mstop(priv);
+
 	error = of_clk_add_provider(np, rzg2l_cpg_clk_src_twocell_get, priv);
 	if (error)
 		return error;
@@ -1893,9 +2155,23 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_cpg_mstop_fops);
 	return 0;
 }
 
+static int rzg2l_cpg_resume(struct device *dev)
+{
+	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+
+	rzg2l_mod_clock_init_mstop(priv);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rzg2l_cpg_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, rzg2l_cpg_resume)
+};
+
 static const struct of_device_id rzg2l_cpg_match[] = {
 #ifdef CONFIG_CLK_R9A07G043
 	{
@@ -1934,6 +2210,7 @@ static struct platform_driver rzg2l_cpg_driver = {
 	.driver		= {
 		.name	= "rzg2l-cpg",
 		.of_match_table = rzg2l_cpg_match,
+		.pm	= pm_sleep_ptr(&rzg2l_cpg_pm_ops),
 	},
 };
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index b6eece5ffa20..503a60ba7ff3 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -82,6 +82,10 @@
 #define SEL_PLL6_2	SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
 #define SEL_GPU2	SEL_PLL_PACK(CPG_PL6_SSEL, 12, 1)
 
+#define MSTOP(name, bitmask)	((CPG_##name##_MSTOP) << 16 | (bitmask))
+#define MSTOP_OFF(conf)		FIELD_GET(GENMASK(31, 16), (conf))
+#define MSTOP_MASK(conf)	FIELD_GET(GENMASK(15, 0), (conf))
+
 #define EXTAL_FREQ_IN_MEGA_HZ	(24)
 
 /**
@@ -201,6 +205,7 @@ enum clk_types {
  * @name: handle between common and hardware-specific interfaces
  * @id: clock index in array containing all Core and Module Clocks
  * @parent: id of parent clock
+ * @mstop_conf: MSTOP configuration
  * @off: register offset
  * @bit: ON/MON bit
  * @is_coupled: flag to indicate coupled clock
@@ -209,26 +214,28 @@ struct rzg2l_mod_clk {
 	const char *name;
 	unsigned int id;
 	unsigned int parent;
+	u32 mstop_conf;
 	u16 off;
 	u8 bit;
 	bool is_coupled;
 };
 
-#define DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _is_coupled)	\
+#define DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _mstop_conf, _is_coupled)	\
 	{ \
 		.name = _name, \
 		.id = MOD_CLK_BASE + (_id), \
 		.parent = (_parent), \
+		.mstop_conf = (_mstop_conf), \
 		.off = (_off), \
 		.bit = (_bit), \
 		.is_coupled = (_is_coupled), \
 	}
 
-#define DEF_MOD(_name, _id, _parent, _off, _bit)	\
-	DEF_MOD_BASE(_name, _id, _parent, _off, _bit, false)
+#define DEF_MOD(_name, _id, _parent, _off, _bit, _mstop_conf)	\
+	DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _mstop_conf, false)
 
-#define DEF_COUPLED(_name, _id, _parent, _off, _bit)	\
-	DEF_MOD_BASE(_name, _id, _parent, _off, _bit, true)
+#define DEF_COUPLED(_name, _id, _parent, _off, _bit, _mstop_conf)	\
+	DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _mstop_conf, true)
 
 /**
  * struct rzg2l_reset - Reset definitions
-- 
2.43.0


