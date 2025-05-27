Return-Path: <linux-renesas-soc+bounces-17554-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A18F8AC4D39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 13:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8A953BFF4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 11:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B3E269B07;
	Tue, 27 May 2025 11:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="h64HR8+f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF50267F4A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345067; cv=none; b=sI3rVvjdE1I9OKbsMHGwKoKFMdboksvn3hyQuMZ206D+sc/6v+PROPL4WFnSO449Wa6LHTNXXXfrF7t8Vd+dVdpkmT1999N+V2+T85QUUSh3GG9MQE2zJugHuuAk/5yL9Lf7GIQkK07ApRAxXljF7eAZksvWJ51CWPI7Yoe858g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345067; c=relaxed/simple;
	bh=1Wc/0NTfO6vR39qGNcs23y8NbhBlrvyS///QtHFO5cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OHUb2SEBt928578yD1Wb5jQe11lAc3c6TgyQ25hrIVQo4DCLMsmJX0Li+eYwReyhlXvS5UA/j0qOeweevOmnKn5VOG5gwXisf77GbNC05ydV/xM0kFsT4BQ0sxCmZwxi9WFETtA1+Hfz3NUxL95HF5J+0xmvCRQoYCcDyCrv7+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=h64HR8+f; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad5394be625so600954766b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 04:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345063; x=1748949863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXcikDP+7h15uHsUNsfR2wErb/hEQPekWhl9Hi4yQMM=;
        b=h64HR8+f142Ewea8+5M2JDdP54lXaFxB2ygdVD2DAPACfzeSX1OaFOkSKRfkqc4LMQ
         ksRlDs/88AzFvMtkLgF0JGwobJyTomcl+hEewmZeE6Y/CjknUTN3+RM2Ob94XddkcwgQ
         GfqrBaHcqbcgjH7ywIQsQNoBYwMzz5nIbcfNibS8UC0XWPGhdMNPJsRp4NkQNdYhaScl
         leT6mUMpVozJYuOBdAepAWlKLmwfs+9YmfdQVBqQnHnlvFID5M00fwyavmzFbpYNSPaP
         2/3OQv9TrCa6C6bI3AYXhkX0HB/ngShulDCklc3c65NUU2GzB2TFCEQP7mDGVE5RJQoL
         O3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345063; x=1748949863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXcikDP+7h15uHsUNsfR2wErb/hEQPekWhl9Hi4yQMM=;
        b=Fx3YtlI8EEJ6BgRBVdayGo5k/qCk3dck91hGNTpujYrJlsQ8gBPSGBNsAYoaddZxla
         ++6OMJoUOh/WzcpTwbqnIre02Vg57zc2mhwlr3mfD/AUIMKdbGnuvnZz0wsWuwuwuFB9
         vubRcnrcgTgci2HlvA7K72SYW2NSwFoEPuHiJOZ4oNILR2hinuP96HJfoRB9krFw+VpC
         ixEQGMXLUUqgyu2K+/azNhFVwKcNoIhNumY9fekLup0lGfT8+P64ckPFPsTcdVkkb3Pt
         fIKNNJje6bWjv9XlhDnQ/hgn+3SD5mzeHgxAkAEr6L7PjDBCmcrRPp6jhYhuiBGW7/hC
         UK1g==
X-Forwarded-Encrypted: i=1; AJvYcCXqXmTUtA6ls6KItuyUKkpZIul9LAwNcUoW+QPHrH2UnYCJ1npFWHVXEgxBEP/qOcEhE/BvDVEgxwJR+UBYbuZmEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmS+qvQIDpcqkzcUn7T+GY/2Np57mA32rT0LrKzvfeGWBPrlFR
	Zf4l5xoAHxlYfH55YVY1VbWlBkVOxl1SBYvWYj7u0OsxCh/w+b7/fTuwAuCQTt9CbCU=
X-Gm-Gg: ASbGncuwgyMRCt8ZqnADKzeJYrjBwxY0Z+UEAn52QMQusoltt4F/8YDf5nOfI70+PWW
	qI0sasadLms3O/H9ZSvBEzBMqjdFZInprVCMDj0XnRYfk8HNH2ccBnuUBADOkJyM1YtpE2pT5Dn
	IwQ1qAW7j+Jt7wg8Urf7XVecolUBdliCQg/gf+45E2f/1LyM6j0Q/zWDcvIp/4qVd+P8Q+BfxTf
	YH41Q/4KnBLKxt2EFdFTPhJlmFHPTtXItZKdHzJ3YWwcPeJzz+rjumUkfT6cUYDzIfZdgSQ1Rz5
	KVfuGIeG4RjwV/4Ow+9aOQ8pwTA349N28t/jlASS8/xlZwtsXIdABYmgV81Aw1zKZiDIk9rmLoI
	0l1GUVd4lh3FQlGI=
X-Google-Smtp-Source: AGHT+IF5fOK92Ohva2xDPPee68fs0wAd8cjZjFAFktWEYnoovVHwHRcYiwwzNUQZ1QG+NYZjhqk2hA==
X-Received: by 2002:a17:907:da7:b0:ad2:23fd:cce0 with SMTP id a640c23a62f3a-ad85b0465e5mr1174671966b.19.1748345063010;
        Tue, 27 May 2025 04:24:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:22 -0700 (PDT)
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
Subject: [PATCH v3 7/8] dt-bindings: clock: rzg2l-cpg: Drop power domain IDs
Date: Tue, 27 May 2025 14:24:02 +0300
Message-ID: <20250527112403.1254122-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Since the configuration order between the individual MSTOP and CLKON bits
cannot be preserved with the power domain abstraction, drop the power
domain IDs. The corresponding code has also been removed. Currently, there
are no device tree users for these IDs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 include/dt-bindings/clock/r9a07g043-cpg.h | 53 -----------------
 include/dt-bindings/clock/r9a07g044-cpg.h | 58 ------------------
 include/dt-bindings/clock/r9a07g054-cpg.h | 58 ------------------
 include/dt-bindings/clock/r9a08g045-cpg.h | 71 -----------------------
 4 files changed, 240 deletions(-)

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
index 131993343777..e1f65f1928cf 100644
--- a/include/dt-bindings/clock/r9a07g043-cpg.h
+++ b/include/dt-bindings/clock/r9a07g043-cpg.h
@@ -200,57 +200,4 @@
 #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
 #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
 
-/* Power domain IDs. */
-#define R9A07G043_PD_ALWAYS_ON		0
-#define R9A07G043_PD_GIC		1	/* RZ/G2UL Only */
-#define R9A07G043_PD_IA55		2	/* RZ/G2UL Only */
-#define R9A07G043_PD_MHU		3	/* RZ/G2UL Only */
-#define R9A07G043_PD_CORESIGHT		4	/* RZ/G2UL Only */
-#define R9A07G043_PD_SYC		5	/* RZ/G2UL Only */
-#define R9A07G043_PD_DMAC		6
-#define R9A07G043_PD_GTM0		7
-#define R9A07G043_PD_GTM1		8
-#define R9A07G043_PD_GTM2		9
-#define R9A07G043_PD_MTU		10
-#define R9A07G043_PD_POE3		11
-#define R9A07G043_PD_WDT0		12
-#define R9A07G043_PD_SPI		13
-#define R9A07G043_PD_SDHI0		14
-#define R9A07G043_PD_SDHI1		15
-#define R9A07G043_PD_ISU		16	/* RZ/G2UL Only */
-#define R9A07G043_PD_CRU		17	/* RZ/G2UL Only */
-#define R9A07G043_PD_LCDC		18	/* RZ/G2UL Only */
-#define R9A07G043_PD_SSI0		19
-#define R9A07G043_PD_SSI1		20
-#define R9A07G043_PD_SSI2		21
-#define R9A07G043_PD_SSI3		22
-#define R9A07G043_PD_SRC		23
-#define R9A07G043_PD_USB0		24
-#define R9A07G043_PD_USB1		25
-#define R9A07G043_PD_USB_PHY		26
-#define R9A07G043_PD_ETHER0		27
-#define R9A07G043_PD_ETHER1		28
-#define R9A07G043_PD_I2C0		29
-#define R9A07G043_PD_I2C1		30
-#define R9A07G043_PD_I2C2		31
-#define R9A07G043_PD_I2C3		32
-#define R9A07G043_PD_SCIF0		33
-#define R9A07G043_PD_SCIF1		34
-#define R9A07G043_PD_SCIF2		35
-#define R9A07G043_PD_SCIF3		36
-#define R9A07G043_PD_SCIF4		37
-#define R9A07G043_PD_SCI0		38
-#define R9A07G043_PD_SCI1		39
-#define R9A07G043_PD_IRDA		40
-#define R9A07G043_PD_RSPI0		41
-#define R9A07G043_PD_RSPI1		42
-#define R9A07G043_PD_RSPI2		43
-#define R9A07G043_PD_CANFD		44
-#define R9A07G043_PD_ADC		45
-#define R9A07G043_PD_TSU		46
-#define R9A07G043_PD_PLIC		47	/* RZ/Five Only */
-#define R9A07G043_PD_IAX45		48	/* RZ/Five Only */
-#define R9A07G043_PD_NCEPLDM		49	/* RZ/Five Only */
-#define R9A07G043_PD_NCEPLMT		50	/* RZ/Five Only */
-
 #endif /* __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__ */
diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-bindings/clock/r9a07g044-cpg.h
index e209f96f92b7..0bb17ff1a01a 100644
--- a/include/dt-bindings/clock/r9a07g044-cpg.h
+++ b/include/dt-bindings/clock/r9a07g044-cpg.h
@@ -217,62 +217,4 @@
 #define R9A07G044_ADC_ADRST_N		82
 #define R9A07G044_TSU_PRESETN		83
 
-/* Power domain IDs. */
-#define R9A07G044_PD_ALWAYS_ON		0
-#define R9A07G044_PD_GIC		1
-#define R9A07G044_PD_IA55		2
-#define R9A07G044_PD_MHU		3
-#define R9A07G044_PD_CORESIGHT		4
-#define R9A07G044_PD_SYC		5
-#define R9A07G044_PD_DMAC		6
-#define R9A07G044_PD_GTM0		7
-#define R9A07G044_PD_GTM1		8
-#define R9A07G044_PD_GTM2		9
-#define R9A07G044_PD_MTU		10
-#define R9A07G044_PD_POE3		11
-#define R9A07G044_PD_GPT		12
-#define R9A07G044_PD_POEGA		13
-#define R9A07G044_PD_POEGB		14
-#define R9A07G044_PD_POEGC		15
-#define R9A07G044_PD_POEGD		16
-#define R9A07G044_PD_WDT0		17
-#define R9A07G044_PD_WDT1		18
-#define R9A07G044_PD_SPI		19
-#define R9A07G044_PD_SDHI0		20
-#define R9A07G044_PD_SDHI1		21
-#define R9A07G044_PD_3DGE		22
-#define R9A07G044_PD_ISU		23
-#define R9A07G044_PD_VCPL4		24
-#define R9A07G044_PD_CRU		25
-#define R9A07G044_PD_MIPI_DSI		26
-#define R9A07G044_PD_LCDC		27
-#define R9A07G044_PD_SSI0		28
-#define R9A07G044_PD_SSI1		29
-#define R9A07G044_PD_SSI2		30
-#define R9A07G044_PD_SSI3		31
-#define R9A07G044_PD_SRC		32
-#define R9A07G044_PD_USB0		33
-#define R9A07G044_PD_USB1		34
-#define R9A07G044_PD_USB_PHY		35
-#define R9A07G044_PD_ETHER0		36
-#define R9A07G044_PD_ETHER1		37
-#define R9A07G044_PD_I2C0		38
-#define R9A07G044_PD_I2C1		39
-#define R9A07G044_PD_I2C2		40
-#define R9A07G044_PD_I2C3		41
-#define R9A07G044_PD_SCIF0		42
-#define R9A07G044_PD_SCIF1		43
-#define R9A07G044_PD_SCIF2		44
-#define R9A07G044_PD_SCIF3		45
-#define R9A07G044_PD_SCIF4		46
-#define R9A07G044_PD_SCI0		47
-#define R9A07G044_PD_SCI1		48
-#define R9A07G044_PD_IRDA		49
-#define R9A07G044_PD_RSPI0		50
-#define R9A07G044_PD_RSPI1		51
-#define R9A07G044_PD_RSPI2		52
-#define R9A07G044_PD_CANFD		53
-#define R9A07G044_PD_ADC		54
-#define R9A07G044_PD_TSU		55
-
 #endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
diff --git a/include/dt-bindings/clock/r9a07g054-cpg.h b/include/dt-bindings/clock/r9a07g054-cpg.h
index 2c99f89397c4..43f4dbda872c 100644
--- a/include/dt-bindings/clock/r9a07g054-cpg.h
+++ b/include/dt-bindings/clock/r9a07g054-cpg.h
@@ -226,62 +226,4 @@
 #define R9A07G054_TSU_PRESETN		83
 #define R9A07G054_STPAI_ARESETN		84
 
-/* Power domain IDs. */
-#define R9A07G054_PD_ALWAYS_ON		0
-#define R9A07G054_PD_GIC		1
-#define R9A07G054_PD_IA55		2
-#define R9A07G054_PD_MHU		3
-#define R9A07G054_PD_CORESIGHT		4
-#define R9A07G054_PD_SYC		5
-#define R9A07G054_PD_DMAC		6
-#define R9A07G054_PD_GTM0		7
-#define R9A07G054_PD_GTM1		8
-#define R9A07G054_PD_GTM2		9
-#define R9A07G054_PD_MTU		10
-#define R9A07G054_PD_POE3		11
-#define R9A07G054_PD_GPT		12
-#define R9A07G054_PD_POEGA		13
-#define R9A07G054_PD_POEGB		14
-#define R9A07G054_PD_POEGC		15
-#define R9A07G054_PD_POEGD		16
-#define R9A07G054_PD_WDT0		17
-#define R9A07G054_PD_WDT1		18
-#define R9A07G054_PD_SPI		19
-#define R9A07G054_PD_SDHI0		20
-#define R9A07G054_PD_SDHI1		21
-#define R9A07G054_PD_3DGE		22
-#define R9A07G054_PD_ISU		23
-#define R9A07G054_PD_VCPL4		24
-#define R9A07G054_PD_CRU		25
-#define R9A07G054_PD_MIPI_DSI		26
-#define R9A07G054_PD_LCDC		27
-#define R9A07G054_PD_SSI0		28
-#define R9A07G054_PD_SSI1		29
-#define R9A07G054_PD_SSI2		30
-#define R9A07G054_PD_SSI3		31
-#define R9A07G054_PD_SRC		32
-#define R9A07G054_PD_USB0		33
-#define R9A07G054_PD_USB1		34
-#define R9A07G054_PD_USB_PHY		35
-#define R9A07G054_PD_ETHER0		36
-#define R9A07G054_PD_ETHER1		37
-#define R9A07G054_PD_I2C0		38
-#define R9A07G054_PD_I2C1		39
-#define R9A07G054_PD_I2C2		40
-#define R9A07G054_PD_I2C3		41
-#define R9A07G054_PD_SCIF0		42
-#define R9A07G054_PD_SCIF1		43
-#define R9A07G054_PD_SCIF2		44
-#define R9A07G054_PD_SCIF3		45
-#define R9A07G054_PD_SCIF4		46
-#define R9A07G054_PD_SCI0		47
-#define R9A07G054_PD_SCI1		48
-#define R9A07G054_PD_IRDA		49
-#define R9A07G054_PD_RSPI0		50
-#define R9A07G054_PD_RSPI1		51
-#define R9A07G054_PD_RSPI2		52
-#define R9A07G054_PD_CANFD		53
-#define R9A07G054_PD_ADC		54
-#define R9A07G054_PD_TSU		55
-
 #endif /* __DT_BINDINGS_CLOCK_R9A07G054_CPG_H__ */
diff --git a/include/dt-bindings/clock/r9a08g045-cpg.h b/include/dt-bindings/clock/r9a08g045-cpg.h
index 311521fe4b59..410725b778a8 100644
--- a/include/dt-bindings/clock/r9a08g045-cpg.h
+++ b/include/dt-bindings/clock/r9a08g045-cpg.h
@@ -239,75 +239,4 @@
 #define R9A08G045_I3C_PRESETN		92
 #define R9A08G045_VBAT_BRESETN		93
 
-/* Power domain IDs. */
-#define R9A08G045_PD_ALWAYS_ON		0
-#define R9A08G045_PD_GIC		1
-#define R9A08G045_PD_IA55		2
-#define R9A08G045_PD_MHU		3
-#define R9A08G045_PD_CORESIGHT		4
-#define R9A08G045_PD_SYC		5
-#define R9A08G045_PD_DMAC		6
-#define R9A08G045_PD_GTM0		7
-#define R9A08G045_PD_GTM1		8
-#define R9A08G045_PD_GTM2		9
-#define R9A08G045_PD_GTM3		10
-#define R9A08G045_PD_GTM4		11
-#define R9A08G045_PD_GTM5		12
-#define R9A08G045_PD_GTM6		13
-#define R9A08G045_PD_GTM7		14
-#define R9A08G045_PD_MTU		15
-#define R9A08G045_PD_POE3		16
-#define R9A08G045_PD_GPT		17
-#define R9A08G045_PD_POEGA		18
-#define R9A08G045_PD_POEGB		19
-#define R9A08G045_PD_POEGC		20
-#define R9A08G045_PD_POEGD		21
-#define R9A08G045_PD_WDT0		22
-#define R9A08G045_PD_XSPI		23
-#define R9A08G045_PD_SDHI0		24
-#define R9A08G045_PD_SDHI1		25
-#define R9A08G045_PD_SDHI2		26
-#define R9A08G045_PD_SSI0		27
-#define R9A08G045_PD_SSI1		28
-#define R9A08G045_PD_SSI2		29
-#define R9A08G045_PD_SSI3		30
-#define R9A08G045_PD_SRC		31
-#define R9A08G045_PD_USB0		32
-#define R9A08G045_PD_USB1		33
-#define R9A08G045_PD_USB_PHY		34
-#define R9A08G045_PD_ETHER0		35
-#define R9A08G045_PD_ETHER1		36
-#define R9A08G045_PD_I2C0		37
-#define R9A08G045_PD_I2C1		38
-#define R9A08G045_PD_I2C2		39
-#define R9A08G045_PD_I2C3		40
-#define R9A08G045_PD_SCIF0		41
-#define R9A08G045_PD_SCIF1		42
-#define R9A08G045_PD_SCIF2		43
-#define R9A08G045_PD_SCIF3		44
-#define R9A08G045_PD_SCIF4		45
-#define R9A08G045_PD_SCIF5		46
-#define R9A08G045_PD_SCI0		47
-#define R9A08G045_PD_SCI1		48
-#define R9A08G045_PD_IRDA		49
-#define R9A08G045_PD_RSPI0		50
-#define R9A08G045_PD_RSPI1		51
-#define R9A08G045_PD_RSPI2		52
-#define R9A08G045_PD_RSPI3		53
-#define R9A08G045_PD_RSPI4		54
-#define R9A08G045_PD_CANFD		55
-#define R9A08G045_PD_ADC		56
-#define R9A08G045_PD_TSU		57
-#define R9A08G045_PD_OCTA		58
-#define R9A08G045_PD_PDM		59
-#define R9A08G045_PD_PCI		60
-#define R9A08G045_PD_SPDIF		61
-#define R9A08G045_PD_I3C		62
-#define R9A08G045_PD_VBAT		63
-
-#define R9A08G045_PD_DDR		64
-#define R9A08G045_PD_TZCDDR		65
-#define R9A08G045_PD_OTFDE_DDR		66
-#define R9A08G045_PD_RTC		67
-
 #endif /* __DT_BINDINGS_CLOCK_R9A08G045_CPG_H__ */
-- 
2.43.0


