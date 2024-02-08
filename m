Return-Path: <linux-renesas-soc+bounces-2465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071784E0E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 13:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B249287338
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728D876410;
	Thu,  8 Feb 2024 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IZzsvGBR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28601762FE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 12:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396231; cv=none; b=XjcGWQ6g0Tt6Ku2+kbsOE+snScluJXGbmro+VM3NVXDIbGWeGXuws+cKZCSOVX7HnWoUSiH+u8RsVYcC92JZCT2Aj32jsTjwFQ9P+6zDNAawlzL6zYNlC7ZOz1FFVkTzQCfF5Vvit+x4pEzSLC/XXaOTTFb4ksCFkPyZG0k78JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396231; c=relaxed/simple;
	bh=ebSKImTpj6nC/M3T1nDE3L8Vn9ABqzsptRiZJ56M2ho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IT4I2jJrucRYkrNVFRK4NMg4BkjHl+Lknj6kcNjfEJOxZ9kOqxeqauIg5Gzb1NKYuEDDvZZ3RelyWUye5chFLXQ7Iu5sbwo2P2kIL5LhGnzO32rnPGdp2maUBJ2Q/sIaMXGFc4Wq6mLtUAkof4Azqwe7MNPh4gHwuHBylN8j8sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IZzsvGBR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4101fc00832so11198205e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 04:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396227; x=1708001027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdJLmKQ65BMtsSQC9cqhbiLHAUPTKIBgtUh7WrB9pSE=;
        b=IZzsvGBRxvb5YInLajrQPrI7u7LV2O3FUJtNS5nVRKWbW1FwEjvV9q9neycCcfN6Sm
         4p82lwxi8z30YI3/vqeoi70a3tyOgMhTVAg8/huq5GbHTOUw9/CqZFPWbUdeVIe7nmGs
         XVc/skPxI5IenzJAPo5uRFVutLq3qeYbDsj/6ApL49oRuAbL5LagKTFf7vdFS/9Bphps
         lzieqclrMgRtkWjN4xhsGKjoXSY0lsWu0QhLVsp69CD+dG8hHwGtgaOzwjrT5U/E4aCk
         PI2/4o6bIp/WgKnv1TlJItqqRAO0Io85NjqdXoKQqd+GmKwAj7Ga/0Cj5mMLFSd8fTZT
         YjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396227; x=1708001027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdJLmKQ65BMtsSQC9cqhbiLHAUPTKIBgtUh7WrB9pSE=;
        b=Lchr4hUzlNxQhZ6pTLPhTs8hzpVOKx0urbtsG4bTkmyRGrWsrwyHZR/DQlsM7ua6G4
         GrV2jd42RYTFu7q/uqXEMHoG8rlkntjsTfnkq06ygM9MnGQ9f3rjpR4EMo3Y/osaR+eX
         txSZWumlrqc2cWuwsEkq5CU1new36ppE5hzSjs3DZN3ZLtpFXf88ocMixWQkHH9gVfZn
         2FcC/BxpAfDNEozsnDdV5BheziLlYUIC1uSfvUhtU3WJx/quRjPvw4jXuh7WegHUjk0e
         vtNJNKySpmi9he9613agyB/nORLKGH3hz1SSPaZ80nfbJG5PjK9VNPNiMkx0r6eC7h5G
         Pszg==
X-Gm-Message-State: AOJu0YzQAKbHU0gG+nHUJPMcf8QsuLiVsZrBZBDJFpKxYrPwjTWKIWM6
	/9amG0IO4xlND3Q9EXNUJ/qOsml89ooh+aYYDUYo3aTnd0rJk75mA3+ljcs6pfc=
X-Google-Smtp-Source: AGHT+IEjy8hQ+TSiHVJKiUqNNydluQHd6TNFcWITSFbJ7yO1R4sQYbtx3f8HLiTkAgnMhX1JsqcKMA==
X-Received: by 2002:a05:600c:3146:b0:40d:484e:935 with SMTP id h6-20020a05600c314600b0040d484e0935mr6819781wmo.12.1707396227293;
        Thu, 08 Feb 2024 04:43:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVv8f4Ko9nDmMnhQcD+XqT4xiktMTJPAPIzXZALmF0IeJIKbHi21a9P1UYargWoyYD35zeuFwvcORn0X1aUKUSIvHJs9z6sKCp87goXE1fkaNg3tNdgRbZfUe/9mTr1qjKLKiTaGY6vvQDcopC4+Gn3xmWyOi1Eey2+ccLr2dT9TWvpj6gWW4Z4ThI0xeiOHHpYVLTObPcJz/S7YTYodC1alWrFJUgmQcvm8sB0x9KWrKaYuK9yJQWrKivcMp70tZWkBOuA9A7/baO/+IwAVRx3/El5I+NK4ksm8C/I7pZ8JNtHKXAC4yPHIWP3rLpAtVAfah3zuVqTfl956yTEvz/dnfESGOYSt61b2WaqlJ5oDL3JjJgq7To/aB2Z/ft/Km4tgbLJHzlKm8wPfgDE0Ic9uAIjoH9BVGMgUX8T6EP+LCWuV+pAa67itNIFupr4vbRM7kkC1v8cpdPu8S+FDH2TM5zGFmpDVftKzjPXu2ssz4WJs7EG0JTeUfmHHsgy8mKGOiJ5TJegROJop0lEU1CmR+RfetLNIES+eNYpKaeqRwaLV5bbykE4PLIyHv7Jkfk=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 02/17] dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
Date: Thu,  8 Feb 2024 14:42:45 +0200
Message-Id: <20240208124300.2740313-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/G2L (R9A07G044) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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


