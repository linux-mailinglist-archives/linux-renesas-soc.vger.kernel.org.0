Return-Path: <linux-renesas-soc+bounces-3556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA0875159
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 15:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84B8E1C24376
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 14:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E5B12EBDC;
	Thu,  7 Mar 2024 14:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="o4GPTDTa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B512DDB2
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Mar 2024 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820470; cv=none; b=u4JnqxU7uiGzUC3BU1iaYlsbhgia40jQu2PwyNUyYmf/zHurWH7pkt9H4Iitg/s9O823s/LqfkMumiSpCy0j8BgtUXg8L7hdCV4vA9OQi5ueg7JYR1xvYwSzwAN6nNLb4THBnNKpMZoOtA0ohVLbvD/wLJPstWerBp3D7WNG8l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820470; c=relaxed/simple;
	bh=o+isOLC/TWDf8QBrYF6fFqPfwMGPbt0wSxpYHU+dD5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g45SQwswJ3IYC7Q6xUiNLhlHKSp6rHk3g2VN3k4SOf1jOE710oRI0CBOezcGmHvVjSxz4Pym+07GT+63aiZkiPJIoCNS7I4L+/8YL9x4XkekE/kU+KUmnoWqUdjAj/MGu/UKMfR94cLP3LnaSok27c6xuSqxsJ5z37NO1ETorLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=o4GPTDTa; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5131a9b3d5bso1050457e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2024 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820467; x=1710425267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfoIgw8Unv2o4Ref3vnexmJsmRhKE911tIs07l/4sdo=;
        b=o4GPTDTaF1bqNc+dkKdV3IclpqmgzvUNnQQrp/0abpnpmdkbAMl5UenRMEinSsdtkJ
         YwSsN+MShVCNJkNyPAdtzZaccCkFHFEE/0ag6SxctCg7BMtRVADw885S05nzepo9mN0U
         BNfYl8xzG+FqnmCUQCYEsIu60/mQSMf4P0Yu17Wq0akhb4p6ezcni3Jf0YvtMGLj3lY3
         XWVIjrlY7q9klJQg5VioDrBE/Ndil+fE29fmM+dI4/0tFMuEw5mXZUmscyiYFS0OBjHV
         H0vtQcL6FVE0XYIzqNFSzhZ3FlQxunmY05Wy1SmAVNi+yWZwduFiyzDcHqtEjpHZsddi
         IQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820467; x=1710425267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfoIgw8Unv2o4Ref3vnexmJsmRhKE911tIs07l/4sdo=;
        b=QJjCVJGGjJ5eiJe8nA5P7UqLkH/Y+y2FfJOUiFhhEsfl+4IjlbVj5ddJM+BDFmmBab
         w/WH7Z9p6y+YQZpw8crmhJvyxCLSaH8ocbwEpinVLbilu8GkLehsvZ7I2JAhBDSKTDUJ
         wcQDtdglDmO8rRo9qjIUZAhWuZ05cG+jYa0TDtSlq81KDovdwPl6NMKwMx/R+Iwp6Rkn
         NGg6fZ4odHAsTUlRmw/xzoR09cYGHnGUAMFq6hLwOx2icbcwPO6YzB3n6JjDQuUO7is7
         N7RabMGtcaOj3SPmazcRXAjlCnPdmdSOUKnROAeHkfqO1uYUZ/4q4pFGuXP9MZ5fUJZr
         jBug==
X-Gm-Message-State: AOJu0YyBfXd3m0xGfUbZAhO8SkJ0hmRWyFBCYUwwPAGdhBHi54M8mEey
	fMO1+bBLrYpMITXFsO1TifYjk1sqQC1ZTGPhR8OV+YjDA2QydgvXsI/Fm5yibuY=
X-Google-Smtp-Source: AGHT+IFnmZHrky58RFBMdeu65Vl/I30y/4ADskPAIE5LOhPBlg6oJCaN2YulY/RMs1cYItpqq2bOeQ==
X-Received: by 2002:a05:6512:20c9:b0:513:ece:1fe1 with SMTP id u9-20020a05651220c900b005130ece1fe1mr1339326lfr.54.1709820466719;
        Thu, 07 Mar 2024 06:07:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:07:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 01/10] dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
Date: Thu,  7 Mar 2024 16:07:19 +0200
Message-Id: <20240307140728.190184-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/G2UL (R9A07G043) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- added "RZ/G2UL Only" comments to some defines
- added RZ/Five specific defines

 include/dt-bindings/clock/r9a07g043-cpg.h | 52 +++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
index 77cde8effdc7..ba9ea276c4a0 100644
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


