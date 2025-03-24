Return-Path: <linux-renesas-soc+bounces-14769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82409A6DC4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 14:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B65273AB08E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 13:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65FB25FA1D;
	Mon, 24 Mar 2025 13:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dMzLGfD3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F3525F997
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 13:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824638; cv=none; b=M0q0Aii6zmSJBpvBufELP0pNQqnEBotxGyUooEG/nJO5w3EDGsgxleyhAL18jJByfhaa4QgKbdyTrfRzIaHYZmV3iTG1p9PPswoezmyh6ue/mlrI79ND8eUOmF6MIuWPXAgwf3Akn/Llsz9y+Gw6t7MYKcgpJWRyISLeUhWZ2gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824638; c=relaxed/simple;
	bh=kNDYGsurRMw1oAlr00fQlVE32k5QZ58+VqZ3UbAvmcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPvt6+EVdwcbrQOKp6ebudb4hSb/+VMOQUnd4rrBTzOKOX39gzPXmQXotzVLZe3hmzP01yh1I0KU8LF47Nt40pHaB8CVAEH2Ux7MVYmVXU5WUZSYHxk2LlDpdy8XLuVxOCqbP7XZ1pWDVyfDDIoe/B7ZOtmk2IWc5IOdmOpJi88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dMzLGfD3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso30719885e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742824635; x=1743429435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMplGUMafRwp7HXFHP8HY84mcYsdyQC2G6ObWF63fwE=;
        b=dMzLGfD3bv7xA5UI8z+RwWtjbubYG6t3fIEM77ru/yt6mXPin6B1+1jz5vFMeNzzPW
         7RRUTGqFS8OiMUj6Gz4aUZA8bl7hv4U4JKurKFqov/HsLRGCQar45ipm3jpyKvg/rDAw
         aNy4yJa2vDLyVttJJyU1CUJZJfVZG0ABZBBvmmgccdzMO7tXv1wN3tLLQks2Got6ZwO6
         AVh8J9zTXotr83m3j5QHYp5ob2120xPA1Ud/3HbpBMSuZDLMMtBwHrFGpIRBWBZK4S4/
         gVNZgoScgr4z86V0MwJldpJMwihapriD0c/Mkl2rhIDvKeir3Ckea/moneuX7b3Z1dRG
         fTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824635; x=1743429435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMplGUMafRwp7HXFHP8HY84mcYsdyQC2G6ObWF63fwE=;
        b=f6UL7lAP4UZP2VTrKJZqWfuVw7qr4YcfXG3sBJ9KkIdhMBhRW2O0SBGvEgoBpUCehJ
         SHTC5/L2ql/lBjUZn47Qdr9E/h57jNP9mwpx4WfxG+eki6X4T9/TkI9x0KPZUoe4rzm8
         MAwDr8cCD4+orRv9TWBYH2pGgOORfO5ueVe3Av1iigXF12Tlp3UeGxcSZ59por9OLxYa
         NjcU85XKbNGPig2cBdRl/Xmd52A+6x7vGBJCQpZjnDp7nSCspM8UTdBrBrph5YsuCCtp
         x5MQvqd5GYkRPhcG66nmklgXQdzDEhbqbk5pqnML2q82r/rIKEMg0sidKc7ilN7u4+So
         dU2w==
X-Forwarded-Encrypted: i=1; AJvYcCVhvhzGLpRhku4C8pQMAqXhv/VxmdUTiVDQf6lzCgRzDOp6eP5vvNyOaz3yR6zi/LCKTlCtT4qPpQ5c9P3d4XJLWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKeYBjsyO0rZDx5yjw1cNwiY8Mz0Msml3Sv5uIfIPLLjZnHtsx
	FD426cqW+rov0+WaiUbmLf9ViVGTZlYNW62zrHHz7uzWrE8ZtLGS4iK0qi8/ubQ=
X-Gm-Gg: ASbGncsGy2/BEhffFGA5v/Vf88qOpLzUp6vlpfiyPqysbEqPJYY9UbXz7x1woJEMd+B
	lu2nLhQbQ6O04t3uZrjWU9CJbXbNq71QuwenZFCZ2asZF+BqI1ngIizH5eAaMHbEwmYuE0J1lYI
	s9x2by0RzIGaR16qUa7OGCCZAWPykir2/4+JVU9c0qCCfjJjVGrY37V2noP6nuwYX7C1hKbcuWZ
	wX4vyomkc6sIzEUybAwZbBVAjMJrL4J0o6YkndQQzKNAcJyzMxVoQApp7cf9BJfj2+fly+loLPB
	JnsvsAG35HOKk1bt39mRQWEm4ltgRXxknsAbNI2ZWXueME9keXBDs5J3yncKYoiXY0Yh2gzgAQ=
	=
X-Google-Smtp-Source: AGHT+IHobCejWB+ti0E5Uw69+nVxjpEbVDbvYp3oPBiD2PXSMtx/XLxjlfZxbT4NY1k5LpuIjy51Hw==
X-Received: by 2002:a05:600c:1d15:b0:43c:fe85:e4a0 with SMTP id 5b1f17b1804b1-43d509ec36fmr89567225e9.7.1742824634707;
        Mon, 24 Mar 2025 06:57:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm120146525e9.35.2025.03.24.06.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:57:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 3/4] arm64: dts: renesas: r9a08g045: Add TSU node
Date: Mon, 24 Mar 2025 15:57:00 +0200
Message-ID: <20250324135701.179827-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
The temperature reported by the TSU can only be read through channel 8 of
the ADC. Therefore, enable the ADC by default.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected Geert's tag
- adjusted the trip points temperature as suggested in the review
  process
- added cpu_alert1 passive trip point as suggested in the review
  process; along with it changed the trip point nodes and label names

Hi, Geert,

I kept your Rb tag. Please let me know if it should be dropped.

Thank you,
Claudiu

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 49 ++++++++++++++++++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  4 --
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 0364f89776e6..3f56fff7d9b0 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -233,7 +233,6 @@ adc: adc@10058000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
-			status = "disabled";
 
 			channel@0 {
 				reg = <0>;
@@ -272,6 +271,17 @@ channel@8 {
 			};
 		};
 
+		tsu: thermal@10059000 {
+			compatible = "renesas,r9a08g045-tsu";
+			reg = <0 0x10059000 0 0x1000>;
+			clocks = <&cpg CPG_MOD R9A08G045_TSU_PCLK>;
+			resets = <&cpg R9A08G045_TSU_PRESETN>;
+			power-domains = <&cpg>;
+			#thermal-sensor-cells = <0>;
+			io-channels = <&adc 8>;
+			io-channel-names = "tsu";
+		};
+
 		vbattb: clock-controller@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
@@ -717,6 +727,43 @@ timer {
 				  "hyp-virt";
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsu>;
+			sustainable-power = <423>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device = <&cpu0 0 2>;
+					contribution = <1024>;
+				};
+			};
+
+			trips {
+				cpu_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+
+				cpu_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				cpu_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	vbattb_xtal: vbattb-xtal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..6f25ab617982 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -84,10 +84,6 @@ x3_clk: x3-clock {
 	};
 };
 
-&adc {
-	status = "okay";
-};
-
 #if SW_CONFIG3 == SW_ON
 &eth0 {
 	pinctrl-0 = <&eth0_pins>;
-- 
2.43.0


