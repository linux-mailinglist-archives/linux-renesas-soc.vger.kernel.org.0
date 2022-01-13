Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0507F48DBD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jan 2022 17:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbiAMQdR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jan 2022 11:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229474AbiAMQdQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 11:33:16 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081A0C06161C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jan 2022 08:33:16 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id q9-20020a7bce89000000b00349e697f2fbso5156530wmj.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Jan 2022 08:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q6GFT2ixRW30hP/0bwri1JVcs7qEOztPYhRtjbFHkBY=;
        b=sw6imboVI3AyYmaqSo8AXTILvZ2nF9CZa5VBSLT+2cc+2aHzDLvh6Mbrr6zk0/xT5I
         yjwmFYoLGwetoJ1vPmqBsT5oouxLYZx/yIcFDZOneDez8yrkMsArlftDhzB0Gh/WF40A
         BmAmHiO+ZoruxQ1P+Wvp/zsAUUKztJQrLTBEDS6MlTWP2ZhGj4S6nbfhikpNJnre1Uy8
         O7wk+wLQmxZxOhi0/F23uITx4hloKT68hHRaVRKLqjZgHHnG5nlBp2uVG7oeBib6dYwu
         g8IcHVFZK6A4Du1se6Zp9JXTW8pbMVSRg3/pzecVQ2uIXA8W7FyZuCdUrue/QfFKGI/V
         HitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q6GFT2ixRW30hP/0bwri1JVcs7qEOztPYhRtjbFHkBY=;
        b=XmewvXF3OXb6u6+JcsgjF6bN6w+B42Naj825z4IQS9YJ1iq1D5YdIdxn+cqv3h5U8i
         aVsh2P+gsItks8KXq90S40nqF1lnLkJdCyLNmQ0bb+TONUKXnEBubz671mPP35zanokr
         uMtMi+CvV5BPE1qX8kBMJlCYFKoe8hcawNyuo7Og96fuuDu0pdzs9sIfDSagyTey01ZK
         mpWryar1BFjpagaXZCW0iaLBVdP/pj3l4mukngTCzHmCd+Qh2k0TbZN8rKdd5vzPlpKz
         Fjk/G8scDMCB5y2y8ezV6V/VukBFQ/vo0oMobIGg9qGpDuq0dknwwlXIz7QUjvcAz7GU
         rFtA==
X-Gm-Message-State: AOAM530mGqAcvR41mG42qLmDDZYjHDjjrpYsUJBR3v+4fviLxf1skuB1
        dsmQ+bJXCzprLqgO2rfU7V+VbzbnCT74nA==
X-Google-Smtp-Source: ABdhPJyCLDfjQcrUwYMnq0+UEeAi/hc0h6FX6mgJ33VJtFV/x1TUzEF7h91sgWf6jBlybPySZPFmzQ==
X-Received: by 2002:a05:600c:a10:: with SMTP id z16mr4490551wmp.120.1642091594569;
        Thu, 13 Jan 2022 08:33:14 -0800 (PST)
Received: from bismarck.berto.se (p54ac53e2.dip0.t-ipconnect.de. [84.172.83.226])
        by smtp.googlemail.com with ESMTPSA id j13sm9151872wmq.11.2022.01.13.08.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 08:33:14 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] arm64: dts: renesas: falcon-csi-dsi: Add and connect MAX96712
Date:   Thu, 13 Jan 2022 17:32:39 +0100
Message-Id: <20220113163239.3035073-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The sub-board contains three MAX96712 connected to the main-board using
I2C and CSI-2, record the connections. Also enable all nodes (VIN, CSI-2
and ISP) that are part of the downstream video capture pipeline.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Rebase on latest renesas-drivers.

Hi Geert,

The bindings and the driver itself are now merged upstream so I think
this is ready to be merged as well. With this final patch capture on V3U
can be demonstrated out-of-the box using the MAX9612 self pattern mode.

A simple test procedure,

        # Configure media graph
        media-ctl -d /dev/media0 -V "'rcar_csi2 feaa0000.csi2':0 [fmt:RGB888_1X24/1920x1080 field:none]"
        media-ctl -d /dev/media0 -V "'rcar_isp fed00000.isp':0 [fmt:RGB888_1X24/1920x1080 field:none]"
        yavta -s 1920x1080 /dev/video0
        v4l2-ctl -v pixelformat=AR24

        # Capture checkerboard pattern
        yavta -c10 --file=frame-#.bin /dev/video0

        # Switch pattern and capture gradients
        yavta --set-control '0x009f0903 1' /dev/v4l-subdev6
        yavta -c10 --file=frame-#.bin /dev/video0

This series is based and tested on the latest available renesas-drivers,
renesas-drivers-2022-01-11-v5.16.
---
 .../dts/renesas/r8a779a0-falcon-csi-dsi.dtsi  | 229 ++++++++++++++++++
 1 file changed, 229 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
index f791c76f1bcff92f..a3ac35c0eb6908a0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
@@ -34,3 +34,232 @@ eeprom@52 {
 		pagesize = <8>;
 	};
 };
+
+&i2c1 {
+	gmsl0: gmsl-deserializer@49 {
+		compatible = "maxim,max96712";
+		reg = <0x49>;
+		enable-gpios = <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@4 {
+				reg = <4>;
+				max96712_out0: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+	};
+
+	gmsl1: gmsl-deserializer@4b {
+		compatible = "maxim,max96712";
+		reg = <0x4b>;
+		enable-gpios = <&pca9654_b 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@4 {
+				reg = <4>;
+				max96712_out1: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					lane-polarities = <0 0 0 0 1>;
+					remote-endpoint = <&csi42_in>;
+				};
+			};
+		};
+	};
+
+	gmsl2: gmsl-deserializer@6b {
+		compatible = "maxim,max96712";
+		reg = <0x6b>;
+		enable-gpios = <&pca9654_c 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@4 {
+				reg = <4>;
+				max96712_out2: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					lane-polarities = <0 0 0 0 1>;
+					remote-endpoint = <&csi43_in>;
+				};
+			};
+		};
+	};
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max96712_out0>;
+			};
+		};
+	};
+};
+
+&csi42 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi42_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max96712_out1>;
+			};
+		};
+	};
+};
+
+&csi43 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi43_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max96712_out2>;
+			};
+		};
+	};
+};
+
+&isp0 {
+	status = "okay";
+};
+
+&isp2 {
+	status = "okay";
+};
+
+&isp3 {
+	status = "okay";
+};
+
+&vin00 {
+	status = "okay";
+};
+
+&vin01 {
+	status = "okay";
+};
+
+&vin02 {
+	status = "okay";
+};
+
+&vin03 {
+	status = "okay";
+};
+
+&vin04 {
+	status = "okay";
+};
+
+&vin05 {
+	status = "okay";
+};
+
+&vin06 {
+	status = "okay";
+};
+
+&vin07 {
+	status = "okay";
+};
+
+&vin16 {
+	status = "okay";
+};
+
+&vin17 {
+	status = "okay";
+};
+
+&vin18 {
+	status = "okay";
+};
+
+&vin19 {
+	status = "okay";
+};
+
+&vin20 {
+	status = "okay";
+};
+
+&vin21 {
+	status = "okay";
+};
+
+&vin22 {
+	status = "okay";
+};
+
+&vin23 {
+	status = "okay";
+};
+
+&vin24 {
+	status = "okay";
+};
+
+&vin25 {
+	status = "okay";
+};
+
+&vin26 {
+	status = "okay";
+};
+
+&vin27 {
+	status = "okay";
+};
+
+&vin28 {
+	status = "okay";
+};
+
+&vin29 {
+	status = "okay";
+};
+
+&vin30 {
+	status = "okay";
+};
+
+&vin31 {
+	status = "okay";
+};
-- 
2.34.1

