Return-Path: <linux-renesas-soc+bounces-1721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E65748391C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 15:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A00E1C21F04
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62C95D8F5;
	Tue, 23 Jan 2024 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Ck8EwNqH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806595C5FF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 14:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706021687; cv=none; b=dObi/lfhSLxJh+HBI9/snjVKJ4t5vInvIYl98mY6MrFEYPs0eHztjvHJtbCwUypZ2Mdn2nvHNmHzNQWIH28xx6V9TeIgt2KIE4H8oRiqwFokJgiBB8wSzBBS5ki0CBOVm6ZfvJ5Qno82HLgJm9EvYgeXnKBrtMrH1AIn+zcFN/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706021687; c=relaxed/simple;
	bh=gSJ1orbvGr+1ihOc0cJYe27rdeYMVmgHp8NvQ7zVsHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XWPgtC4vU4giF0YjjXygSbf40Gf8aB0Z2H+8y23s3NQyGA38/C2B0qgzkS1+0Fwj+HwGhBtXyv2CP1D3BF5SZuljA81oss6OsYMDjOeeZiKnoY2FpyRdMvCbCUN8c8aPakQu9c5C5u2WwQ5Jp1/9MNeL4nIT+p3ayN1zdfLoQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Ck8EwNqH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55a45a453eeso5607112a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1706021681; x=1706626481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2EieKrTyEuYjMh3Wo+2+3O4vUBWHeZwxVW/MCGZBmUI=;
        b=Ck8EwNqHKEOBtns1oKoy860/w7HJt0dadhmfDV/zcCBhkKMDZTdfegWaHcZbWBnUOh
         sO5Q5vPy+eLPvEw8omZidv3A/N9BQy5Qwcmqc92zpJ0/aKCJfG9yrYxQJVIPRk2Qk71/
         b6JVKu161owoBEvCq1Da0ML44XUSO8bkp3bYKf94CvBH4gZqnYh4cE8gimwUxNNWBimv
         DQYYeTkLIw2R49V2qFHcO+NTk5oZ/VB9QhdAppWcbMQMQhWFisaj5vxOuzfZm+jUnmYl
         vYqvLoBVA2NScYQEftJ07OzG2ekwn+QUraIsR75v6j6OdOgLsjhphK8JW4LEDftIcwfU
         n+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706021681; x=1706626481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EieKrTyEuYjMh3Wo+2+3O4vUBWHeZwxVW/MCGZBmUI=;
        b=XCni1THRmC0uAefGi4L99y+Y/q9CM1upJToL4OwqnCLprKqEbuPeXHWerxVz+yji2s
         sLl9RdAg8qhxIiX3bYVZZthMOPAro5eAJPAxhn3Ol3V9szN6EPBbWUJUzoNiPRT7smn+
         4aaoO5hDMDADx1q7CF7UTP0mZrRTra/G9r7F4JSJ/2VHDk1XqWxx4D3id0icEC9SdFM9
         Bqde+lOX0PdcUTsB+csSoUGwBIilPs0SYER+Nn/jcgFZQ6TTvtW0EY9TPhQT6ATZqV7e
         gxbqrDSbkIm84dPPzxrWPetWYzqMYKUnSmGNtPKoWkk9L2KWHyJNRIbAFH831tm1QXML
         iBRA==
X-Gm-Message-State: AOJu0YyFTYpMUn7LW6UmENHnWOQgVkI9WAQ5uiUyzylNBaqmnIcFi/8S
	aZKsB1AJ/LKEpbRWCmxx3SOwR+IeeYlCpWlo1b+xVYwwKa+QKk9obXnJy9PIlI8=
X-Google-Smtp-Source: AGHT+IGeNkrePGiXEJtJ87STg6Z9E4TPMnqL89kb2Rh6jz8xc2kA6Sr+U2uoJoJTPHsLqLjShyGeZA==
X-Received: by 2002:a05:6402:1ca5:b0:55c:6c21:5f0d with SMTP id cz5-20020a0564021ca500b0055c6c215f0dmr1030559edb.30.1706021681402;
        Tue, 23 Jan 2024 06:54:41 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id cs5-20020a0564020c4500b0055c875c2095sm651427edb.96.2024.01.23.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:54:40 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: eagle: Add capture overlay for expansion board
Date: Tue, 23 Jan 2024 15:53:54 +0100
Message-ID: <20240123145354.1571800-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Eagle board supports an optional expansion board. The expansion
board adds support for HDMI OUT, HDMI capture from two different sources
and eMMC.

This change only adds support for the two HDMI capture sources.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../dts/renesas/r8a77970-eagle-expansion.dtso | 214 ++++++++++++++++++
 2 files changed, 216 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8ea68d582710..38fadc161709 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -62,6 +62,8 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
+r8a77970-eagle-expansion-dtbs := r8a77970-eagle.dtb r8a77970-eagle-expansion.dtbo
+dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle-expansion.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-v3msk.dtb
 
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtso b/arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtso
new file mode 100644
index 000000000000..bd32f263e740
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-expansion.dtso
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Eagle V3M expansion board.
+ *
+ * Copyright (C) 2024 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/dts-v1/;
+/plugin/;
+
+/ {
+	/* CN4 */
+	/* Eagle: SW18 set to OFF */
+	cvbs-in-cn4 {
+		compatible = "composite-video-connector";
+		label = "CVBS IN CN4";
+
+		port {
+			cvbs_con: endpoint {
+				remote-endpoint = <&adv7482_ain7>;
+			};
+		};
+	};
+
+	/* CN3 */
+	/* Eagle: SW18 set to OFF */
+	hdmi-in-cn3 {
+		compatible = "hdmi-connector";
+		label = "HDMI IN CN3";
+		type = "a";
+
+		port {
+			hdmi_in_con: endpoint {
+				remote-endpoint = <&adv7482_hdmi>;
+			};
+		};
+	};
+
+	/* CN2 */
+	/* Eagle: SW35 set 5, 6 and 8 to OFF */
+	hdmi-in-cn2 {
+		compatible = "hdmi-connector";
+		label = "HDMI IN CN2";
+		type = "a";
+
+		port {
+			hdmi_in_con2: endpoint {
+				remote-endpoint = <&adv7612_in>;
+			};
+		};
+	};
+};
+
+/* Disconnect MAX9286 GMSL i2c. */
+&i2c3 {
+	status = "disabled";
+};
+
+/* Connect expansion board i2c. */
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	io_expander_27: gpio@27 {
+		compatible = "onnn,pca9654";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		vin0_adv7612_en {
+                       gpio-hog;
+                       gpios = <0x3 0x0>;
+                       output-low;
+                       line-name = "VIN0_ADV7612_ENn";
+               };
+	};
+
+	dmi-decoder@4c {
+		compatible = "adi,adv7612";
+		reg = <0x4c>, <0x50>, <0x52>, <0x54>, <0x56>, <0x58>;
+		reg-names = "main", "afe", "rep", "edid", "hdmi", "cp";
+		interrupt-parent = <&gpio3>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		default-input = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7612_in: endpoint {
+					remote-endpoint = <&hdmi_in_con2>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				adv7612_out: endpoint {
+					remote-endpoint = <&vin0_in>;
+				};
+			};
+		};
+	};
+
+	adv7482_70: video-receiver@70 {
+		compatible = "adi,adv7482";
+		reg = <0x70 0x71 0x72 0x73 0x74 0x75
+		       0x60 0x61 0x62 0x63 0x64 0x65>;
+		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
+		interrupt-parent = <&gpio3>;
+		interrupts = <03 IRQ_TYPE_LEVEL_LOW>, <04 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "intrq1", "intrq2";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@7 {
+				reg = <7>;
+
+				adv7482_ain7: endpoint {
+					remote-endpoint = <&cvbs_con>;
+				};
+			};
+
+			port@8 {
+				reg = <8>;
+
+				adv7482_hdmi: endpoint {
+					remote-endpoint = <&hdmi_in_con>;
+				};
+			};
+
+			port@a {
+				reg = <10>;
+
+				adv7482_txa: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+	};
+
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
+				remote-endpoint = <&adv7482_txa>;
+			};
+		};
+	};
+};
+
+&pfc {
+	vin0_pins_parallel: vin0 {
+		groups = "vin0_data12", "vin0_sync", "vin0_clk", "vin0_clkenb";
+		function = "vin0";
+	};
+};
+
+&vin0 {
+	status = "okay";
+
+	pinctrl-0 = <&vin0_pins_parallel>;
+	pinctrl-names = "default";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			vin0_in: endpoint {
+				pclk-sample = <0>;
+				hsync-active = <0>;
+				vsync-active = <0>;
+				remote-endpoint = <&adv7612_out>;
+			};
+		};
+	};
+};
+
+&vin1 {
+	status = "okay";
+};
+
+&vin2 {
+	status = "okay";
+};
+
+&vin3 {
+	status = "okay";
+};
-- 
2.43.0


