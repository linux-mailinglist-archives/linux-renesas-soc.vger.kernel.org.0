Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C8B2D8F65
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393138AbgLMSnA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389478AbgLMSjy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:54 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C87C0611CC;
        Sun, 13 Dec 2020 10:38:46 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id t8so14763201iov.8;
        Sun, 13 Dec 2020 10:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hxZ75yiZZjAmfO6Ayk+Zr2KNsAPQLuLMGWRzVxl4gr4=;
        b=sxQM6RlnYDm2xBZqQULcTvLUhCf7CrRuNtZOSAWIFgoy/nEP9dQOlN1gi/FPGQjSsx
         sHAF+toiJwjd8moQRtjNoh727fnSjL2cgDUNb8Iy3fM5jaIoQAa/zBiiHvd8U4U5biyx
         sr6N6o/NVeheuH4nXA3AuyyS+um1Pr151DvFVZ74xEpzEzfnzdfp5PaKkxDDb/gjioyZ
         0FYmKuCMYIZb3qtYM8A/jKdXc9rll0CJJYxguQ68Dh9qtU0zwumL3ik0qqqO6cgvd32N
         FORADDX+EkGsSHaKqd48/KRUg0KsJr6ufUlkXf2LKczVaA6JZ6mUx1W288bPeU+0CFN3
         m66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hxZ75yiZZjAmfO6Ayk+Zr2KNsAPQLuLMGWRzVxl4gr4=;
        b=M/mt5uOW5ngNajv/3KVnrXXeymKE0J0xYUxo1nS7pePfWxq4/HD3DvQJ3EBDldt4cc
         p/Ga5VevZelaPEmYLcY4+gI6UhffHjQ8nFROJmGf/4xiR/l0IXEgsbTw7mG/gfnez+lB
         lIjUSrQlbsFnEuTP/ybbn8qYn115S2Q+lupFEWeTh8xnLZd0eJXY0l2svMYJlXu7CjWp
         av3xoDUud4iXQl6enGJij+2b4aGnaXLZMiHxkGuJQmYU18zlC6raUtRPE+Hh4IOrOvIc
         TNu4XmpztFwCvG/2CLBINYlku5SGRTNra3x8Lwo6tYHE1ze/HLuAPcp2/Ann6Jj9aRGi
         pHnA==
X-Gm-Message-State: AOAM530z6Fq0MdjJlCNihBMPOqIZ8PZJkh3QoJbxYZM44cIXUqvy0AVm
        QxDvuhrzilg3glxX9KGYc223I4FUCM4WDg==
X-Google-Smtp-Source: ABdhPJywZrNKw5UvV6rXCm8Fmco+wQfuX1BR4kFryNMxnKCP74V5fJh3Q+Ko+kgi+JcawF4us2CiyA==
X-Received: by 2002:a05:6638:f89:: with SMTP id h9mr28686537jal.89.1607884725882;
        Sun, 13 Dec 2020 10:38:45 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:45 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 17/18] arm64: dts: renesas: Introduce r8a774b1-beacon-rzg2n-kit
Date:   Sun, 13 Dec 2020 12:37:57 -0600
Message-Id: <20201213183759.223246-18-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
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

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../dts/renesas/r8a774b1-beacon-rzg2n-kit.dts | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 3b8b03705917..ea3d7d9bc52e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
 
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-beacon-rzg2n-kit.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
new file mode 100644
index 000000000000..01a233102976
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts
@@ -0,0 +1,43 @@
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
-- 
2.25.1

