Return-Path: <linux-renesas-soc+bounces-4769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2968ACB52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 12:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D4991F210CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Apr 2024 10:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BDD8146597;
	Mon, 22 Apr 2024 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l6q05YOv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F127C146007
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713783246; cv=none; b=XLA4TRajgOLoMSIwdB3NDFy3GJA8X/uML41/jhAtiVNK3LzkK/y0VlKdkvbNGboI2a1WbhvSXWNaS03wgaRMcScI83ZuBxGzPfOj1ufem4Dd9JSHo0j0eXP8NWAA00m8e+3Glzn6OFd55Fskc2QfpvIZ/u36+TGieptgKCMpH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713783246; c=relaxed/simple;
	bh=zuBydgDK8eySkvZTtgHumqD0x7INAbqhfmpZNRl7iZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Kfvi3guS6ccFj6EPDnAAsZ59gfeCLptkwlAqPGVhZ8bYLgDbF2RH5+KFeUvQnYOpag3um+hAdMR6WuU+wa43uBZnpbY7Xlhz0UO5cA9HSmQBRhlNn8UzunfXv/v2rO8ol/SlE/98ISQ0XoTxAHbIJ6G7zz7cP4+PzIfxrNtrbSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l6q05YOv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41a7aa24c4fso2800105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Apr 2024 03:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713783243; x=1714388043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ARMUZPHrxZWnn6veFR4DVaFmlfvykL4Uf0lprJBp4A=;
        b=l6q05YOv/NICmclNiouKl5ViNuTPfVroav2ATHjaamWPSVxJY3sMzBWp+iL7pAkPlT
         +7C8hdW/N0wHBKiOnMziTRXvXRfrJ1pd1BwoGoq2SFCvHm+0fXH0QWLW+jHnrY5YncYU
         qwzbhR8VO1KXypTJgR7EPLtUKEY3YSa3IBymeAai6H9fg+45bpfiVOmxchj8bnEYlGXP
         McvEhw1DLD4YU/Q+Xx3iumUhzJmtKOC2w6zCe4stw6fUTadEZdsEndOmhjLBJjxFQcPs
         bj72sZq40vvuyRAG0FROysaEz5U2pEUZEfNoFTV7c9c+UENhLpsX2rn04HSmjJ9Hvqpo
         14AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713783243; x=1714388043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ARMUZPHrxZWnn6veFR4DVaFmlfvykL4Uf0lprJBp4A=;
        b=ERzhRrldfwWgixXlnNx3ZsP75L6qI2dTTfn0zCvi9EUSkXWRpRte/29vr2XPu20vPM
         zDp0KT2EzjEbB+4Pzyjh3Kh3cwUhglzFKSUH5W/FD48/S/jjYLy7FJ5jSpCqqAG6rh65
         Mj4fU8gQVvIhk/is19O5DgT9CJ8xe9517CFpOtUGxIfzoutOwQM6/KbMVGei28kRSUEe
         1znmfMfcpS8AmKtLClf+0TqRwbApd3wGprFDZedL3jsAAK2Avu9ckeOpKisR13SPrf/4
         bBRKH3juRZmhhESra/MzJlKtYx/SZuMky8XMgBnoqbAY+Pqo3G8yS5w+NOUW8kCmRZzv
         XwKw==
X-Gm-Message-State: AOJu0Yx6auAVMyWv6+o9yOWJWQnIcpitxT4lHZNEn5cxBvxrsh0YiOc9
	MhRUBbxmJkNdACI1wl1YEOorMlWTIUqXXKUT/4toNFXTXX0GIOZX7VFPckDkbrM=
X-Google-Smtp-Source: AGHT+IG/XJfjVTtfgJu/B4SxRIVqJ7/0zbQ8suItMSeCB50ek873cr/z9HpliECLOR1uLqeG0AMU2Q==
X-Received: by 2002:a05:600c:198b:b0:418:ea91:a579 with SMTP id t11-20020a05600c198b00b00418ea91a579mr6499785wmq.23.1713783243094;
        Mon, 22 Apr 2024 03:54:03 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0041a3f700ccesm4321037wmn.40.2024.04.22.03.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:54:02 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 2/8] dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
Date: Mon, 22 Apr 2024 13:53:49 +0300
Message-Id: <20240422105355.1622177-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/G2L (R9A07G044) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- collected tag

 include/dt-bindings/clock/r9a07g044-cpg.h | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-bindings/clock/r9a07g044-cpg.h
index 0bb17ff1a01a..e209f96f92b7 100644
--- a/include/dt-bindings/clock/r9a07g044-cpg.h
+++ b/include/dt-bindings/clock/r9a07g044-cpg.h
@@ -217,4 +217,62 @@
 #define R9A07G044_ADC_ADRST_N		82
 #define R9A07G044_TSU_PRESETN		83
 
+/* Power domain IDs. */
+#define R9A07G044_PD_ALWAYS_ON		0
+#define R9A07G044_PD_GIC		1
+#define R9A07G044_PD_IA55		2
+#define R9A07G044_PD_MHU		3
+#define R9A07G044_PD_CORESIGHT		4
+#define R9A07G044_PD_SYC		5
+#define R9A07G044_PD_DMAC		6
+#define R9A07G044_PD_GTM0		7
+#define R9A07G044_PD_GTM1		8
+#define R9A07G044_PD_GTM2		9
+#define R9A07G044_PD_MTU		10
+#define R9A07G044_PD_POE3		11
+#define R9A07G044_PD_GPT		12
+#define R9A07G044_PD_POEGA		13
+#define R9A07G044_PD_POEGB		14
+#define R9A07G044_PD_POEGC		15
+#define R9A07G044_PD_POEGD		16
+#define R9A07G044_PD_WDT0		17
+#define R9A07G044_PD_WDT1		18
+#define R9A07G044_PD_SPI		19
+#define R9A07G044_PD_SDHI0		20
+#define R9A07G044_PD_SDHI1		21
+#define R9A07G044_PD_3DGE		22
+#define R9A07G044_PD_ISU		23
+#define R9A07G044_PD_VCPL4		24
+#define R9A07G044_PD_CRU		25
+#define R9A07G044_PD_MIPI_DSI		26
+#define R9A07G044_PD_LCDC		27
+#define R9A07G044_PD_SSI0		28
+#define R9A07G044_PD_SSI1		29
+#define R9A07G044_PD_SSI2		30
+#define R9A07G044_PD_SSI3		31
+#define R9A07G044_PD_SRC		32
+#define R9A07G044_PD_USB0		33
+#define R9A07G044_PD_USB1		34
+#define R9A07G044_PD_USB_PHY		35
+#define R9A07G044_PD_ETHER0		36
+#define R9A07G044_PD_ETHER1		37
+#define R9A07G044_PD_I2C0		38
+#define R9A07G044_PD_I2C1		39
+#define R9A07G044_PD_I2C2		40
+#define R9A07G044_PD_I2C3		41
+#define R9A07G044_PD_SCIF0		42
+#define R9A07G044_PD_SCIF1		43
+#define R9A07G044_PD_SCIF2		44
+#define R9A07G044_PD_SCIF3		45
+#define R9A07G044_PD_SCIF4		46
+#define R9A07G044_PD_SCI0		47
+#define R9A07G044_PD_SCI1		48
+#define R9A07G044_PD_IRDA		49
+#define R9A07G044_PD_RSPI0		50
+#define R9A07G044_PD_RSPI1		51
+#define R9A07G044_PD_RSPI2		52
+#define R9A07G044_PD_CANFD		53
+#define R9A07G044_PD_ADC		54
+#define R9A07G044_PD_TSU		55
+
 #endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
-- 
2.39.2


