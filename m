Return-Path: <linux-renesas-soc+bounces-13603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C13A429F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 18:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5722B3B2C4A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 17:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD30266180;
	Mon, 24 Feb 2025 17:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="leDzknSq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C51265CB2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 17:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740418330; cv=none; b=ITq+pm1wFWsQfeOeosl347RsgPUFJsLW68EIxc04RCXqouo7BjEw1+lULbCyCEr2IuF5k1Go625BaaMhRt1IhzVYsctewJaU6KIopCY6KGukZttjd7eDjNbv2MKKLbJA3suo5qo2VjF3G+4dXsqo3crLSSHoSnkrEDhHSBXogCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740418330; c=relaxed/simple;
	bh=JTUCCbCCWqHuncZ5oHBOQmD62rGMndm5FqoLy/lZso8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDVaa75qYsT6MW/Qqy0ZOG+6B+66fq2Zkp+fQ+42NH3u4I9q2oq9YBjt6JHK6rOIDxm//AJZVr/xtdyXIFJ+mLgl09C0ri+rPQgxdxUWb8eGVyWZqh1nn27OeZ0itF941ra3vzlRDuncUSaQErWzm8foQb+UJzxir6or+uLZXL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=leDzknSq; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso7548448a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 09:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740418325; x=1741023125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1yo3qtSfIhFeGAEiRzmVMQo73ZalEAsSnX/cJq79kA=;
        b=leDzknSqCqtMKvI2s5QNRZEAmzUK7/zFE1HCb4C9M9pdUjBxLVSAFDWI/k7bUoxiCq
         9TP+LX+26cTn4Vgo3ZB9xvKYQrRG5FYGP7fYYrIt2acEiMXB5l5u83mUPGZR9glr+W9D
         jwZ1rlQ0GkLW5TuFEuB8Kt6meJlqEesbGSLXD3To/oTjlgre3w4VXRDv/VmFs66Gr/gS
         AHcxITptoU6Ox+4y/BsW6bN/68yNVe5RrE1n+kLhCdEl3vAA/PlvF+4GJ36i62sFFgcQ
         JCzBjK1/YDxlLdPJslxZWLS+th6+F4YjmODsxm8uEwgPkAiXdHT9TTTooTU17f4dZw1W
         tfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740418325; x=1741023125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1yo3qtSfIhFeGAEiRzmVMQo73ZalEAsSnX/cJq79kA=;
        b=ncPoHhFn7rII+D/YmkvEGZ3l2bG8EDWm0RipJOZSOMfQ9C/v72AAXryjd9CZe7WhZB
         1u1F+5Yh0mVKH5wk4yiEW9HrIpct/PG/ieC5omNf1yukg8JkiODPzZSOaQYVlxwYIuGV
         9bus0n2hgoCt/Dm4HGm89hRQrMi9Z8qOE/7uJOJ6yu8KIidpFzlIrpOwl9uc49LIqPiD
         2DvpZpmyeLwN9GIjvoALF9kKy9bm64lfM1RWqz7M2w4y26VXyFiW50sx/qP+3m+MJ4tw
         ikzH8lpjRnqD9m85iNy60SOrZPRtmVIdcTCiVvaaiOZ4CzU3kEzFKY9Wtu3rrkkcPrTR
         RmcA==
X-Forwarded-Encrypted: i=1; AJvYcCUYmZPBDUEiXVOEzD5cC/suqyUaaiRu9ojN6hrNN67QDvj//S89eQNJud/FsbNvU41x57E1m5biUkFwB01PfWCk2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6JzpcgZjWhHc6zVhxsCfZGvRJaN8BJGErinHI6GPmxsOy1VAu
	HakLaH9Dg6v3twmL5YAGyqS5+VkAmzGGz5xOVjl1oteV6gaag+7AzOOnChySzVA=
X-Gm-Gg: ASbGnctSP+D0A+gmxjcF8WAeGggnQ8RLdfd695zPedVIefAvnjoGaQIJc9nABGaBkvr
	fZgfr9IsoKV70VDibg1sS+x1eZp/tlRoXSCQhQOJf1obXd7to8YWe1Aj2U6Oa+DhKfaOdMNAzdz
	TcjoI9XAKrAVBL/AIkzN5D6hlQGmjFpoJ+Z4mVGNW/z/ryucII/aEo44Syf7OukmKY7lNc3EoKD
	fdlYuyiQ70y1WOF2j1NFyiYGIB5TP/ook+4AqfT9ldOE/pdBuTvrUVIJUSwLRx3DrsB10kob1J7
	JE0C7s55gF6edtja9Yu1FqqHbwie5kLKhcbe6xejzZt23Dk/vTjxt/Y=
X-Google-Smtp-Source: AGHT+IEvfXereLG4YfzIby0vL8BC3Kca01jNjsC9KnxwSBKk7fKmr/umERW/k7CxUdOT/iVLoKfvqg==
X-Received: by 2002:a17:907:6d02:b0:ab7:b5d6:2696 with SMTP id a640c23a62f3a-abc09b1470amr1217759666b.32.1740418325327;
        Mon, 24 Feb 2025 09:32:05 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm18674357a12.58.2025.02.24.09.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 09:32:04 -0800 (PST)
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
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a08g045: Add TSU node
Date: Mon, 24 Feb 2025 19:31:43 +0200
Message-ID: <20250224173144.1952801-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
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


