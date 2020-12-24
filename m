Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF632E283C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 18:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgLXRGs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 12:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728462AbgLXRGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 12:06:47 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD567C061794;
        Thu, 24 Dec 2020 09:05:37 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id q137so2441295iod.9;
        Thu, 24 Dec 2020 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=keidSM+0JKPtXa4utKxP9pnPPIHIvqknPriiqSlZCi4=;
        b=HyanygRCeqhbYyrax3v/aUqpYWKjHVg8hSkGoeUIaCBWKCohAxoWrKK1Jy/2Es51p/
         CM15fNwAyW63WChJB9nn2Bh3TwwC6tf4MkzRRFNrAd7LlW/5M1GsO1FxQi29inFxjne5
         FaZsJ7pKnWdqM03R0iSFE3frtOQQw+SMwjS0wXlF1dXBq/ac6J9UC9kGkkE4XoKwhkLL
         pygw7pQ+FNGhPD9dCLbyVdf5xFJ9dAaoMuTKJ37+ptqI70HISdVXvuQa8VNZVMYxpsni
         rhpwbZG3kZVnv9vmVAzsRaTJ8oArHk08FHyJtAhXeGeookcPAjCqVx3huF/SXvQKGdDD
         gt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=keidSM+0JKPtXa4utKxP9pnPPIHIvqknPriiqSlZCi4=;
        b=ODbtqg6bVJq0g1h4If2h2YJy26LbjgHX34vvDQg9ocLx/rQuvmjlbrEGNm7wit28kR
         LM4Com7G6kj2GlhwBptz+UT3sVDUsWKK7TW81zjucw0//rTpbfajxKQhYTHBxisVKDcf
         FX4i+m1Pm+xKPytE8Re+jRimt3EsM0RCKK89Q46/yFTHFN4FyT/Xi+1LPI1AEBfovJ2r
         kYxv7fnkRzTHshp/zS04kxy78Y7VxTsfUM2J5pdIHlQ2sWZwAWOvFn++bQ4pbdC4+noO
         KUJ7xEC0k6U4XgRVS3yOMjuUv3Vi31ZjCrfQzgzbcVB5uxrD/X495xdT5gL2NpNJ0j2x
         cgBw==
X-Gm-Message-State: AOAM530KV1FKMbuIeqHOTGvZJRKEQnKrYhm2NiBWlyhbLKaeR87WMeSb
        6MDTre9QVBw8EZYRCiKiTaQnb3G0PBI=
X-Google-Smtp-Source: ABdhPJyPn3q0x4f7cw/HL6SgNRTlGqpnBT7YM85COnYOJqHkOTD6b5//+NelBW4ODR1VreUPxuttNg==
X-Received: by 2002:a02:9f19:: with SMTP id z25mr27203861jal.30.1608829536784;
        Thu, 24 Dec 2020 09:05:36 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id f20sm9732965ilr.85.2020.12.24.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 09:05:36 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 7/9] arm64: dts: renesas: Introduce r8a774b1-beacon-rzg2n-kit
Date:   Thu, 24 Dec 2020 11:05:00 -0600
Message-Id: <20201224170502.2254683-7-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224170502.2254683-1-aford173@gmail.com>
References: <20201224170502.2254683-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Beacon EmebeddedWorks is introducing a new kit based on the
RZ/G2N SoC from Renesas.

The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
cellular radio.

The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
along with a variety of push buttons and LED's, and support for
a parallel RGB and an LVDS display.  It uses the same baseboard
and SOM as the RZ/G2M.

This SOM has only 2GB of DDR, and beacon-renesom-som.dtsi contains
the base memory node, so an additional memory node isn't necessary.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Add missing du node entries.

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index dffefe030a76..cf7e2f77e4ea 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
 
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-beacon-rzg2n-kit.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
new file mode 100644
index 000000000000..71763f4402a7
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2020, Compass Electronics Group, LLC
+ */
+
+/dts-v1/;
+
+#include "r8a774b1.dtsi"
+#include "beacon-renesom-som.dtsi"
+#include "beacon-renesom-baseboard.dtsi"
+
+/ {
+	model = "Beacon Embedded Works RZ/G2N Development Kit";
+	compatible =	"beacon,beacon-rzg2n", "renesas,r8a774b1";
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
+		 <&cpg CPG_CORE R8A774B1_CLK_S0D4>;
+};
-- 
2.25.1

