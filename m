Return-Path: <linux-renesas-soc+bounces-4437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6844889F221
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 14:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 891C81C236EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 12:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E703E15D5CF;
	Wed, 10 Apr 2024 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="P0Q3SB/7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDFB15B14E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752035; cv=none; b=G5k3dSmn7z8TDzYWJ4/8TZcmZ4VRBaUEkbXm9Z2iLr73pj39rj8uPkoFaIE1tW8tWGtHQi6Lmopyo/zvtzmoQxFMHHDqKG99xMi7zUusP/Ke1UxUbcTB5PG6s9FLM5FPucPTOEZlZ+l24spfCWOj0S0XZSguUCbeE2tYY4dpsW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752035; c=relaxed/simple;
	bh=kt0T6oAjZ1lqWaIaUu8Sr09sefIFHdT0FJpsK8q8nM8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d2HTRfksQbpgq/qqhIb+Rvya2EuKkOaJw5dVLbUE0a2/9aKp1t1+S9hI0TMjuYRGBgxGmbNSmqumCnE0/yx17C69wMLsfjvrqMi6oZQ2fnePJZtxkZcLJZYQMuxSOIjqxN3NEVCy7LFuOagpUWYO63iG0lPRMv/2UQSqG3ZcF8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=P0Q3SB/7; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516cdb21b34so8603154e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712752031; x=1713356831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIDge7spa3NjlHFsGDVwHhao1cU+1T3vrFbJtXNX3p4=;
        b=P0Q3SB/74qhrxcW5rxZ2s59AdCM4X1hKKYU7Ebr2pM7wjPrrUh28mifYW468i7n/R+
         DoWF2+x+9D8sAmEix2SMFbAex+kGgcDoTW+W0Kiu+9WjqwYGgZ83fTDnBrHWDKvvTrAE
         3mdVA0GOxXrS7BinW4lCR/VAEV7eF1DAPTHnpW8VItdiKVHU70lx1iTyq5JedQDjiBUu
         Xt7fpmaS8QLI5odFyIy/+qqpo2DqP3Aee4FFPTEh4/niNAjqa7BFHLtwDPXCKDTtRdwJ
         VUuPebgVK094VSEsHnwCWWXHKDypcv3damhTNl2EkZ29lAMIYVf71pOGVBnpDJFWanfb
         7AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752031; x=1713356831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIDge7spa3NjlHFsGDVwHhao1cU+1T3vrFbJtXNX3p4=;
        b=WW7OhZV38Q3exmRMNRtcAhQu3ZDBr/wwF5f+EunSTQY8MOyhQ1RB0+/Lzc/28LOJ4G
         MsSEHKVVZHyDtxnFSwnBUFTZ+mE3afp5BOPN2Roiiti31yZVwI2BNxYMF/TFVJUj8VhW
         N4j4b8Cl8VadQNGXcqRBxoRiWO553nxmQbZEp7sPCoP6QyagNI1k9yaMc8esbuXlwi7M
         TxSwZJupIqfZVZ86uDMr/3/rwMxknAbiq8eRmVHfoxpaoo5pXz9l9Ikl0896VRZJ2w2L
         kSZRdSuJek1oWhqaQ2CwugXFDR0H+duTaF3t4ZrCSKXg4FNMVqaYCFqc7rcBdePHKPy1
         Jw0w==
X-Gm-Message-State: AOJu0YzuWSYT3xZdt6dJGPduLnXkffkEobtF4+XBcfHp45enL1FxKKhr
	hpaQXMQ3LyfVDSf9B0ewZQAYC4R4dCJUpEu5JdrgPJ7ng2QUq2XT956lfCvKR44=
X-Google-Smtp-Source: AGHT+IG7C1rxroDAU6W0bovwLXxkh24mVrENeNOi1KyVg7KJzkIr82Il2WrkW+2XbX41JWaolFOEXg==
X-Received: by 2002:a05:6512:3d01:b0:516:d1bd:7743 with SMTP id d1-20020a0565123d0100b00516d1bd7743mr1970235lfv.64.1712752030947;
        Wed, 10 Apr 2024 05:27:10 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c3b0200b004171f151a5csm1679446wms.16.2024.04.10.05.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:27:10 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/9] dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
Date: Wed, 10 Apr 2024 15:26:49 +0300
Message-Id: <20240410122657.2051132-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240410122657.2051132-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/G2UL (R9A07G043) SoC.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- added "RZ/G2UL Only" comments to some defines
- added RZ/Five specific defines

 include/dt-bindings/clock/r9a07g043-cpg.h | 52 +++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
index a64139fec815..131993343777 100644
--- a/include/dt-bindings/clock/r9a07g043-cpg.h
+++ b/include/dt-bindings/clock/r9a07g043-cpg.h
@@ -200,5 +200,57 @@
 #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
 #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
 
+/* Power domain IDs. */
+#define R9A07G043_PD_ALWAYS_ON		0
+#define R9A07G043_PD_GIC		1	/* RZ/G2UL Only */
+#define R9A07G043_PD_IA55		2	/* RZ/G2UL Only */
+#define R9A07G043_PD_MHU		3	/* RZ/G2UL Only */
+#define R9A07G043_PD_CORESIGHT		4	/* RZ/G2UL Only */
+#define R9A07G043_PD_SYC		5	/* RZ/G2UL Only */
+#define R9A07G043_PD_DMAC		6
+#define R9A07G043_PD_GTM0		7
+#define R9A07G043_PD_GTM1		8
+#define R9A07G043_PD_GTM2		9
+#define R9A07G043_PD_MTU		10
+#define R9A07G043_PD_POE3		11
+#define R9A07G043_PD_WDT0		12
+#define R9A07G043_PD_SPI		13
+#define R9A07G043_PD_SDHI0		14
+#define R9A07G043_PD_SDHI1		15
+#define R9A07G043_PD_ISU		16	/* RZ/G2UL Only */
+#define R9A07G043_PD_CRU		17	/* RZ/G2UL Only */
+#define R9A07G043_PD_LCDC		18	/* RZ/G2UL Only */
+#define R9A07G043_PD_SSI0		19
+#define R9A07G043_PD_SSI1		20
+#define R9A07G043_PD_SSI2		21
+#define R9A07G043_PD_SSI3		22
+#define R9A07G043_PD_SRC		23
+#define R9A07G043_PD_USB0		24
+#define R9A07G043_PD_USB1		25
+#define R9A07G043_PD_USB_PHY		26
+#define R9A07G043_PD_ETHER0		27
+#define R9A07G043_PD_ETHER1		28
+#define R9A07G043_PD_I2C0		29
+#define R9A07G043_PD_I2C1		30
+#define R9A07G043_PD_I2C2		31
+#define R9A07G043_PD_I2C3		32
+#define R9A07G043_PD_SCIF0		33
+#define R9A07G043_PD_SCIF1		34
+#define R9A07G043_PD_SCIF2		35
+#define R9A07G043_PD_SCIF3		36
+#define R9A07G043_PD_SCIF4		37
+#define R9A07G043_PD_SCI0		38
+#define R9A07G043_PD_SCI1		39
+#define R9A07G043_PD_IRDA		40
+#define R9A07G043_PD_RSPI0		41
+#define R9A07G043_PD_RSPI1		42
+#define R9A07G043_PD_RSPI2		43
+#define R9A07G043_PD_CANFD		44
+#define R9A07G043_PD_ADC		45
+#define R9A07G043_PD_TSU		46
+#define R9A07G043_PD_PLIC		47	/* RZ/Five Only */
+#define R9A07G043_PD_IAX45		48	/* RZ/Five Only */
+#define R9A07G043_PD_NCEPLDM		49	/* RZ/Five Only */
+#define R9A07G043_PD_NCEPLMT		50	/* RZ/Five Only */
 
 #endif /* __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__ */
-- 
2.39.2


