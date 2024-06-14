Return-Path: <linux-renesas-soc+bounces-6191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD0590847B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22284286E06
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 07:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C9B149015;
	Fri, 14 Jun 2024 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="T5WzDbUj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0547186282
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349612; cv=none; b=evvCbaQUPbq4HrIXGhEDpKdjWC9fTfh5xoIdsOcVFWFMlUDz/HbOfUAjhbazV2yh1U5mApiNOU1agmD7xvdegpp+w/axPCEek4vfevWQ73Rm+slwTr1/kquDw3iO/if4FF2yavv6CSHp30WaxxJFhoHOBjo8H4cXGLslEB9L4cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349612; c=relaxed/simple;
	bh=StslRfIF9bjwc+yLkIUdqeGy286Yl+3QQGjH8oHwmbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oyq3XzzPndngUmjC6dLCLd1E0/B/dCKKSn1ge5gcoYIc38h+cCUYYqaXsdqS5+GHkcSf7/nOIyKO8+kBW/6Z1r6qwJIc4UY4Nd+kk+c361UELJNOW48I1mm9Jh8esGW3lzJKcpLHlqcqRKR6V8na8lZYlZj6dR9TQJOmUBVfkL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=T5WzDbUj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421798185f0so16072805e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349609; x=1718954409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXKVp/I1qd30TXm2YU7BrLpdhU1oFUuJMaRiNvsEfzg=;
        b=T5WzDbUj1QeqI67cP4qDub/EXbm30N1HsIBG0kN0N+gjMjA4g6JbNhQfSJwssXgYG7
         EYau1EgCQHlowyZ+MmPR0ig650XpdHgUc3Ta+Qb6x9zaF1gMGs3+hY/nnlzCt9CNVpGx
         EILBgasYxzeS+RtoTEto7GKKcqI0jX7g6zIEfzIAhulQLV4ixndMD6NIs/ZdcRUvKHPd
         72EcQmEOFuGWwgtHg9OAZSKKU/QwyvGbim10NdlPzlqJDUg9ndC1QLDeTUiJnpppGsGQ
         8zA2YONwcLK3C2+gg1X0pYxGz9ZaKEdFt/cLDiEFrQcAp7xbL0X/1v3Qm3jGlRIipexd
         AItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349609; x=1718954409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXKVp/I1qd30TXm2YU7BrLpdhU1oFUuJMaRiNvsEfzg=;
        b=S8ZNOxcpPedM76KVvHikFCtLtnX9eDSoZnh+Ud3CgYK59si8qLG0KxxIsct/lraKfq
         2eeiIPD3MaWoY7kBCkKk+YEVShY2v957UPBUnCk8UU+SlawgVG4NA+pv3PEquGY5Y+Oo
         swT7mA9SNOuLU5SxIk+hObbjen6TfT2QffklTV6SP/yYWbfaQxcHtpkQmTAbNZ+DmeFg
         /ev0wsKQl4ChOitzAl0Sd4WEt3pJOMzcS3oBt6sOwdJP27PvF5RZhZ+r1hYFvKf9IzvZ
         qp1ZEH7dYY80kOu8zfQt7LupMhBOenqZb6CfysDNwlH32NU2ej7MLq0HymmsL0XUahDn
         ZFxQ==
X-Gm-Message-State: AOJu0YzWqrRlxKslDQWC7a6tCdoDoKGM9YCRVXG0Uk96yaOeuMFJ/uC7
	MxSUw2Zgx4nMt9rLQ2pcYXdvvvG7+jBOYZx/XGdCEhvyXEbSyWkJxFLZYub7YkA=
X-Google-Smtp-Source: AGHT+IELHWn4BzKIGJx3SJDAu+6lh0yAH4ZMV9I9BhoPMupkp0AFTyAryhX00A34g6cHm0AlspWEVA==
X-Received: by 2002:a05:600c:358d:b0:422:683b:df4d with SMTP id 5b1f17b1804b1-4230481a008mr16406855e9.8.1718349601911;
        Fri, 14 Jun 2024 00:20:01 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:20:01 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
Date: Fri, 14 Jun 2024 10:19:27 +0300
Message-Id: <20240614071932.1014067-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the VBATTB IP along with DT bindings for the clock
it provides.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 2162c247d6de..b7bd2e1f3462 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -72,6 +72,31 @@ scif0: serial@1004b800 {
 			status = "disabled";
 		};
 
+		vbattb: vbattb@1005c000 {
+			compatible = "renesas,rzg3s-vbattb", "syscon", "simple-mfd";
+			reg = <0 0x1005c000 0 0x1000>;
+			ranges = <0 0 0 0x1005c000 0 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tampdi";
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>;
+			clock-names = "bclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			vbattclk: clock-controller@1c {
+				compatible = "renesas,rzg3s-vbattb-clk";
+				reg = <0 0x1c 0 0x10>;
+				clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb_xtal>;
+				clock-names = "bclk", "vbattb_xtal";
+				#clock-cells = <0>;
+				power-domains = <&cpg>;
+				status = "disabled";
+			};
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a08g045-cpg";
 			reg = <0 0x11010000 0 0x10000>;
@@ -296,4 +321,11 @@ timer {
 				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
 				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	vbattb_xtal: vbattb-xtal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board. */
+		clock-frequency = <0>;
+	};
 };
-- 
2.39.2


