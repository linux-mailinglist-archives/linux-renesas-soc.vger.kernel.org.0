Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1188F2E2843
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 18:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgLXRGv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 12:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgLXRGt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 12:06:49 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D5BC061795;
        Thu, 24 Dec 2020 09:05:39 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id q1so2437128ilt.6;
        Thu, 24 Dec 2020 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j7X1G182saei3dJQmiiQQ5UtIbBKwYAlQwp9FT+Vpcw=;
        b=TF7/m1TcQmFs3wUqNmyn2LO5o1aOnxLjw+q5O43Ma/H9kpD+VkHns4dWMQsDmT7qu/
         EijKmels9uauOR6+qkbz8w6N+v2JiXhngmsRgVA7eOLnSvXoF2MZLjRJ+BrqczM3HMii
         mvHBGsv7Dl9GXzhj3VlaiN/+4bvn6l09BQlerMKsQuQmJ5JZigt6SySVfVkqHC6q9s94
         Uy1AKXJ12LlHaTmcfWlXT5U01wk8+SSkHmmUXh3WiZlpJffuR7agw3N1Y15W8iOuWgqD
         8dbmbQ3DRn8ZvlGy5toWpxnH97lSZdXYbKl+eEYR4GNFo6cyWRfi+eWQQ/5Dx0EXUKt0
         o4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j7X1G182saei3dJQmiiQQ5UtIbBKwYAlQwp9FT+Vpcw=;
        b=HXLilGBgRDfIY6+Y7jm3fp6LhpzrqevgfYX50tCVjzALNZVKOuhjJQxw8Kmul2AHHX
         ziBIzrudIAFi5tcK+q3WrQApCKndB/KB5Y9xk7VVNMwOA0L0c97NUcgfjm+c0opkgWpK
         2TrLA0sT+p3ISXKOwz43q24hTHO5IMwf0z1eLm+1pabv0RWyd3P/y9QifCD5TCqsHzHL
         HvjGgQ6XHF6m35tRIdJpnhcID3kk9kep2Fr1dL2rL/30B9qj2IlgekH0GO/ucQasMFrl
         cXSkWc8T2Xro2FcEucTWwgZI5xpcFHcTS0PiEVRtuOMdyOVwSAXW9GxDQEfn15kkBrgx
         47tw==
X-Gm-Message-State: AOAM533DUBW2kKMe/zv6R0adJbuMMyhr8AU3pXlJ3tNOJPSF4ux78hPz
        UxYhd0QAGESpLAteWx8Zavr6qtXzhfk=
X-Google-Smtp-Source: ABdhPJyYdr4hYnKH7Lei2YUKkd6Yz4e2Q11jBf35p+Ezv7erD6zJuT18fdc9ebK88erHyHT0mxe74Q==
X-Received: by 2002:a92:d84a:: with SMTP id h10mr29391060ilq.77.1608829538478;
        Thu, 24 Dec 2020 09:05:38 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id f20sm9732965ilr.85.2020.12.24.09.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 09:05:37 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 8/9] arm64: dts: renesas: Introduce r8a774e1-beacon-rzg2h-kit
Date:   Thu, 24 Dec 2020 11:05:01 -0600
Message-Id: <20201224170502.2254683-8-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224170502.2254683-1-aford173@gmail.com>
References: <20201224170502.2254683-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

eacon EmebeddedWorks is introducing a new kit based on the
RZ/G2H SoC from Renesas.

The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
cellular radio.

The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
along with a variety of push buttons and LED's, and support for
a parallel RGB and an LVDS display.  It uses the same baseboard
and SOM files as the RZ/G2M and RZ/G2N kits.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Add missing du node entries

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index cf7e2f77e4ea..5c68de184501 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -20,6 +20,7 @@ dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874-idk-2121wr.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874-mipi-2.1.dtb
 
+dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-beacon-rzg2h-kit.dtb
 dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h.dtb
 dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts b/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
new file mode 100644
index 000000000000..273f062f2909
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020, Compass Electronics Group, LLC
+ */
+
+/dts-v1/;
+
+#include "r8a774e1.dtsi"
+#include "beacon-renesom-som.dtsi"
+#include "beacon-renesom-baseboard.dtsi"
+
+/ {
+	model = "Beacon Embedded Works RZ/G2H Development Kit";
+	compatible =	"beacon,beacon-rzg2h", "renesas,r8a774e1";
+
+	aliases {
+		serial0 = &scif2;
+		serial1 = &hscif0;
+		serial2 = &hscif1;
+		serial3 = &scif0;
+		serial4 = &hscif2;
+		serial5 = &scif5;
+		serial6 = &scif4;
+		ethernet0 = &avb;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0x0 0x80000000>;
+	};
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 724>,
+		<&cpg CPG_MOD 723>,
+		<&cpg CPG_MOD 721>,
+		<&versaclock5 1>,
+		<&x302_clk>,
+		<&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.3",
+		"dclkin.0", "dclkin.1", "dclkin.3";
+};
+
+/* Reference versaclock instead of audio_clk_a */
+&rcar_sound {
+	clocks = <&cpg CPG_MOD 1005>,
+		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
+		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
+		 <&cpg CPG_MOD 1010>, <&cpg CPG_MOD 1011>,
+		 <&cpg CPG_MOD 1012>, <&cpg CPG_MOD 1013>,
+		 <&cpg CPG_MOD 1014>, <&cpg CPG_MOD 1015>,
+		 <&cpg CPG_MOD 1022>, <&cpg CPG_MOD 1023>,
+		 <&cpg CPG_MOD 1024>, <&cpg CPG_MOD 1025>,
+		 <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
+		 <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
+		 <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
+		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
+		 <&versaclock6_bb 4>, <&audio_clk_b>,
+		 <&audio_clk_c>,
+		 <&cpg CPG_CORE R8A774E1_CLK_S0D4>;
+};
-- 
2.25.1

