Return-Path: <linux-renesas-soc+bounces-4438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6874B89F222
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 14:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 918DEB236C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Apr 2024 12:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF8115DBA9;
	Wed, 10 Apr 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z+cKRR5x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448415CD42
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 12:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752036; cv=none; b=dR//C32cxQg4pZcdpJCArpEXnpxE5GUxEio7mP0kLGujwsNnMRL/ntqGaWXYoyxMgA6A9ujahTO1s/7L3TPHE9f5+VqhoMJcQht5UCDjoxiBU+duF0270R0wPCIbnsJDrbIC3166nNrh6lsz4MVO4KP4FADNr3YPr6kUkeCi0/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752036; c=relaxed/simple;
	bh=j5NkVwThTYOctnMRuOhsIyhDYIZOpNgQG2UaZ+Y5cEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JW0LdSPH59in2vLX1uTwGHW7RsFZMDq10hVUsKEe1JL82yx9v0SMzNi6AVButJ4hRH3jTQyISWk8YA7UfP0uHjdkDMaLiKJdm3T+HODr4A3y5oozONAlpcUh/tG2KtM5FH4VYdNZ2fnGs5veeQYhHpm92s+0cKQEtocwcccOees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z+cKRR5x; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-417c5cc6be0so572465e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Apr 2024 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712752033; x=1713356833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHndeNmrhAYSgtndICjc+xdLbeIt1RU9dM0BrLcclVg=;
        b=Z+cKRR5x5FdJmagYDDg8UJuWPTZoyWp6Re3n/JPppetuotCnbmCpMkYo2cDbFn1rwQ
         6yXhIwVGkE8XtLk6of7oRSj6vWBCmi2ls7dA4Gp7417/28cezJOHUBcs8GDCekVrLFmo
         B7TlLYBemLTNkpCxLOMYnufYuuGu9m6xdUcjoZxCtVV1Zbh6uzRvwS2JHkfI1tWzm50o
         auSo8kYjL+RSMWMXlu9SJeBTwY8cPAOx+PTEi462bOC8CVGtZNAyqyORmaNC1S1gNBEI
         Jz9gHdocSB/X91mTPg8j/jdgLay8PDrWGJnngq+N6gBxNgvsIarJg9p0cLVIosDYMUOS
         spfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752033; x=1713356833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHndeNmrhAYSgtndICjc+xdLbeIt1RU9dM0BrLcclVg=;
        b=xI7umEvcDEb1MJmZkzEFy1SYax/zcKQcSVOfiokPSxEbfFEf+3IE/qcMG5Ok5W6ja/
         sUPyMh2e052RxwVeWt/ON8g/uPG3y8VXLmeL9t4M7bQ61HtQmqnNRKH728BdF1MK26fT
         HU2OIWYZRIEQSOGJ5Hl1UAqsyesUXW35gJQUzktv1pXheJ5tUeLOvE6D9XFxiIMzsjeg
         HMmNWMy8Dqc+B+RmYEmnhoIsV7TXLMWWnO1rlo1v3jgUE4UcJaWBUtdihyKmUsvI0pub
         1Db+xTuVqv1MHfIgqiNrprjFPqKY+fXQ6zN1lEfjko7flR474n2AtNByXMTAQ09aK+RD
         ptWw==
X-Gm-Message-State: AOJu0Yxv3eb5QEROmHZBDXr/Ul89Oaj8L+USjXVB1y6MKr4S7hq6k0mw
	RshgHTmiUUq/jRFLmVUc7vfvQOl22Udf35yq/ogVaVDDN48mlfnMd0BhxkrWusY=
X-Google-Smtp-Source: AGHT+IGXOBd33oqYWjMMGoLNAXTxZZ+JRVqjdww4qlZJX6f7d3dbGtXMBqHbp2ACuWM4VWRVrEHzDw==
X-Received: by 2002:a05:600c:5012:b0:415:540e:760d with SMTP id n18-20020a05600c501200b00415540e760dmr1818730wmr.5.1712752032768;
        Wed, 10 Apr 2024 05:27:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c3b0200b004171f151a5csm1679446wms.16.2024.04.10.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:27:12 -0700 (PDT)
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
Subject: [PATCH v3 2/9] dt-bindings: clock: r9a07g044-cpg: Add power domain IDs
Date: Wed, 10 Apr 2024 15:26:50 +0300
Message-Id: <20240410122657.2051132-3-claudiu.beznea.uj@bp.renesas.com>
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

Add power domain IDs for RZ/G2L (R9A07G044) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


