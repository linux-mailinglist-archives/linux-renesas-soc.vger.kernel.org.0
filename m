Return-Path: <linux-renesas-soc+bounces-20198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 646CFB1F9E2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 14:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3E61798EF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 12:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BD725BEF2;
	Sun, 10 Aug 2025 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FuO/LNNt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512C1258CDA
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754828510; cv=none; b=jK16GZv7VEYyahjRQL0iqfvXMpgqY9SSxnGUlnqEJ52pDGW5XgP2iThku125HSK//MolgwMmlKEG5vMptCHqebWobyRJNQP5c4J3wUQOyZALH/33epyP2fDnG1wHhaorGF2D1sVf54Z25Yv62FJV+DZPtixP8SyejZ8FP3is44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754828510; c=relaxed/simple;
	bh=iTQFHP39FE3WpDLqzx5etZHG59YzOhgdZXjfCTF7D4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzMg+TcuRtrEAizMaK9vVhnOjsm7ACO5BRXOWcoPPqO+r7Zp1FpKf7FuczuIQDWrIjNjoruQN3ETLelZJRbBkDTLSjZRFmL80GcaKMXB0WDddS/EpGG/fXFHu1ekrMal/hzvdZe0chs/Tx2NEWZZu6yNqumVzl45xj7ER4bV8SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FuO/LNNt; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61530559887so5664451a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 05:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754828506; x=1755433306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czkhJoG2Gc/7FyisTMqLRYvCWAiMp1iGp7hQ46B82n8=;
        b=FuO/LNNtb9AL7ex5Xq0ehWh1O4WK/foeQ9v+WFrZUJkhohPDdK+zM0ppOSYLMYTxiK
         89BXDWBaWdCPQvjOGCHhMMCxFPjkUqrIcdwD+AGiB0s5sn/lC/bsGh4/oTQznHlEQHVF
         BEmiPqYsI91yLG0Px2wQV20EtrmMwc5X3fg8jDfmGQD/I28M0chpAiQLp7Gnq3dGLg65
         jcosbfjWPu/al/plgAqRzvy4q3kiHF4A7far0Q3Dr2La8NuwGwqfcIDxPDvYtWu+G3c7
         XR6pn27E8CdP6tj6LK9IFe8nlrjJMAyPoaUFKBRCPOqT+lqqP+1+FZ+N6WFOJLqbpvN7
         dT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754828507; x=1755433307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czkhJoG2Gc/7FyisTMqLRYvCWAiMp1iGp7hQ46B82n8=;
        b=heHPGXjafTsYilKfkvYJ+IY0wiWaEuFYj5X1nxqC4JUThi3+gyk7oW3PwxEOB4nKD0
         mxg1PqealW+vMFEFaCjBawZPNOJnUNvdpo9JwvRU5I2KhEM+VHLsS/JF178uqS0ZBj3H
         vmgt0dZsBpsudn0CRP+I1ZhFKo8SICkXN2tGZm1gipXw96mk55MQDNr67Q3yeZaTsJgn
         00S+9dxvDe6mB8roQYm+wjzzTsfGmYuf0iru38FdZ2YtL4KHDkZd1nUZiKsQDvVnTFUP
         sez5fqjc6Ciiu6hGZXbs00Nx+NjZIRviBY+SidF9vIB9O+A8b+ZOCq95Ap9qXMmZimYA
         CuiA==
X-Forwarded-Encrypted: i=1; AJvYcCWdEAX0dfR/Q3GtNBAY5BFkOtIWPBCZQ1VRzlzYv03Y38jyojrWVdKPQoFUgxC0en9oSCv3TyYwObpim+/Sd5x9IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKWMegF+fPjt2doKf1Kzasj3daEic2jnbLUrfKit6JN6cviv5U
	bmR8OVZLb7EuUYtdK0xnM/mfvJU7KSReU/4Axm84JbT6UfB/Dxo9fTJdW7EZ4mBDvBg=
X-Gm-Gg: ASbGncs8HdTBT4hDjw+dHe4NKNX1X9EioHQsIn5qZvvB/DJ94589rnHjSCwM9WSnLdp
	+ojAgpbt3SWxb35txh+jVxLrTrpusMrcFvtG66di/ACAFYcsOAPh3rxYPauUX2EbNxUK/1VoZFw
	+AUE697wXLkG+GWF2OO1XbgSOvFY5xCtt2hjKEVuT+CHMrij2E3qvu0e7P4BhDLqliK+kCg8KB1
	gsFVDDfhqBrse5yrUkqnOE14tO+CHjUdqz3lUQ7ksvCJ1bJqe1okFEiKMgrNHZnc/C/mvWTn34x
	+rb8N/xhSm0OoOyM2VB4VQcdGpLn9f/LTBZgwFjzev+Fji/Dc0vbe2Nm+DK1DkXx1QlTkvq/YWY
	GCTTKeF4n/AjM/jHUppir5VQ/neZfhAIFpJ3ruVNXJVfQY9RLbVF1
X-Google-Smtp-Source: AGHT+IEtxors3X7Rdp3bYfeRsAV85kpmN7w+thRk3VDKj4rUsmhSECv/3nQi8r+6f+zFV+oHk5YoZw==
X-Received: by 2002:a17:907:d23:b0:ae3:635c:53c1 with SMTP id a640c23a62f3a-af9c6518c68mr911773766b.54.1754828506589;
        Sun, 10 Aug 2025 05:21:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a86758fcsm16611897a12.0.2025.08.10.05.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:21:45 -0700 (PDT)
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
	niklas.soderlund@ragnatech.se,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 3/4] arm64: dts: renesas: r9a08g045: Add TSU node
Date: Sun, 10 Aug 2025 15:21:24 +0300
Message-ID: <20250810122125.792966-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v4:
- none

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


