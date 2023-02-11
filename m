Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57FCC6931DC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 16:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjBKPAi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 10:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjBKPAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 10:00:37 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396CA25BA6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 07:00:35 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id by3so6652136wrb.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 07:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKWJH1pdJSj4BwMbW1LpBbYc73p7bHXrQvbIq6oTDow=;
        b=eJjg/nDttybDH7OUkIrMuvVvtggDHg7do5+Y+VWBxC9MgsQiUg4rEIV5Bp5yfowvGf
         p4x+SGgpiHSmit9doE8+qmVZAN0usfse0eiRFJzI41/XOf08gppGHyXDe8uoEuOopnqc
         VuQ+vbNu0FmZVt1syxzJ9FEqd9ct7/RNI1EgoIFkP238Z73Vh2u5ivhpAqkdGhqeivVg
         SFnSM7UBwLbMAsC4AYoUUSaRsDxnWu7moztYRiew5gZjAsctJO8BiFjp+WTmIX1e7EIE
         JueWKGTp0oiAyuEa3XYKFEVnIC8XxFPKKE3mnQaYG4ElkyIkXWVTf1hmOgJgFqpC4V7b
         f0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKWJH1pdJSj4BwMbW1LpBbYc73p7bHXrQvbIq6oTDow=;
        b=hTqUhzMG1VubVBMcuFzRwXp7pr5WBWg/qPdm2IyqV2d35OSC6ye3f4FSg6dfSV4Bf/
         brJxR2dtPR/uJovmsMxki0k3QLsZO25NSFT03HLy34VQhDVrptw0VLr1zE9aMXkh5w4I
         Os5pa2/g84aMCfRqDZJT+tFyu+3TLqm6QJdrKWBHCCkiV/+6obsrunr5kGhL4oNwKzxf
         WIYXSMgLOxoy+acGiPQsg6DRiEsRluFvJRq7LmwRsPVVvZBxGU5D/Vkj8/tBcCYmc1ok
         BEgHluyVncw2Pp/PbKA86VvwK45S18aPIRUq2r4nzBB2EM0FZrWncs6n2sJi9ExL/DuG
         1t2A==
X-Gm-Message-State: AO0yUKXWj6naWF9etPX7fJwiCx7UU4cPuRRgSQHcQ46EnStMmWBAKWxl
        N5m21ZAcA35siTGAx8Xz9TwfYA==
X-Google-Smtp-Source: AK7set9YY8o+jrSxH9s8AdgqG+R2Kzn927/wOAA/AcWlGuDxcDUdHD1YQuo/Vvg3Z6XRlFYGb8d1bg==
X-Received: by 2002:adf:eb0c:0:b0:2c3:f812:1cad with SMTP id s12-20020adfeb0c000000b002c3f8121cadmr16935449wrn.37.1676127633857;
        Sat, 11 Feb 2023 07:00:33 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id v5-20020adfe4c5000000b002c549b91c54sm4231415wrm.52.2023.02.11.07.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 07:00:33 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: white-hawk: Add and connect MAX96712
Date:   Sat, 11 Feb 2023 16:00:12 +0100
Message-Id: <20230211150012.3824154-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211150012.3824154-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211150012.3824154-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The sub-board contains two MAX96712 connected to the main-board using
I2C and CSI-2, record the connections. Also enable all nodes (VIN, CSI-2
and ISP) that are part of the downstream video capture pipeline.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../renesas/r8a779g0-white-hawk-csi-dsi.dtsi  | 172 ++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi
index ae7522b60e5d..f8537f7ea4de 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi
@@ -5,7 +5,63 @@
  * Copyright (C) 2022 Glider bv
  */
 
+#include <dt-bindings/media/video-interfaces.h>
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
+				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3>;
+				remote-endpoint = <&max96712_out0>;
+			};
+		};
+	};
+};
+
+&csi41 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi41_in: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2 3>;
+				remote-endpoint = <&max96712_out1>;
+			};
+		};
+	};
+};
+
 &i2c0 {
+	pca9654_a: gpio@21 {
+		compatible = "onnn,pca9654";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	pca9654_b: gpio@22 {
+		compatible = "onnn,pca9654";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	eeprom@52 {
 		compatible = "rohm,br24g01", "atmel,24c01";
 		label = "csi-dsi-sub-board-id";
@@ -13,3 +69,119 @@ eeprom@52 {
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
+					bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
+					clock-lanes = <0>;
+					data-lanes = <1 2 3>;
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
+					bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
+					clock-lanes = <0>;
+					data-lanes = <1 2 3>;
+					remote-endpoint = <&csi41_in>;
+				};
+			};
+		};
+	};
+};
+
+&isp0 {
+	status = "okay";
+};
+
+&isp1 {
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
+&vin08 {
+	status = "okay";
+};
+
+&vin09 {
+	status = "okay";
+};
+
+&vin10 {
+	status = "okay";
+};
+
+&vin11 {
+	status = "okay";
+};
+
+&vin12 {
+	status = "okay";
+};
+
+&vin13 {
+	status = "okay";
+};
+
+&vin14 {
+	status = "okay";
+};
+
+&vin15 {
+	status = "okay";
+};
-- 
2.39.1

