Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B52A2D8F6A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728823AbgLMSnA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389529AbgLMSjy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:54 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FEFC0611CD;
        Sun, 13 Dec 2020 10:38:48 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id 75so1755616ilv.13;
        Sun, 13 Dec 2020 10:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8U041WmRtyq8BrXAJ3gOrPaoRGECeAfxoPRSHkkfdX8=;
        b=ScRCo9H/n9rcd41zcQ+TpdXmygMaZAocyJdzDRB9f+v9BNYWxVpGozPUIoAIBx//CO
         Q6OdVoCgB7G319Y4h+ulvlrQoiYhbQjthHbjfcs2Va1sjKZsoRpClnjmIdzbpcVeD700
         OGb/uKOZWNAlS7Ll9SWpppEcdNkbL1EvUCJU0OdA33WnVRXY29WxMqNZcAUX/e1WLlGL
         BiTHZCfuDwNcMUooCxJxlg33AgnlJNYtSQyLgyNV1mRukYzjDKXPAOheefKipYoqn/R7
         sFaW6PIMOIYap+oHK8IU4S/t9ZkmK2w7tiT7KMILpPh8/eJfZKtBbm4CaQRxWJ/5QkcS
         93+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8U041WmRtyq8BrXAJ3gOrPaoRGECeAfxoPRSHkkfdX8=;
        b=ZMyIimco08OuWhN7dsBUUasFtX7pdrMSCJDkbUSzkhkVLGpDbMZ616NG9qZ4Hvxjm0
         6E9a67b4BGDGT4zeeIgLDn6vJPxin0TczYqmuY1VlZGCv8tgWx1YhT1gsAn8a0Z11fwo
         GEm1d7hYbFEnSIAZUJkm/yZST9qkeLwxYx1xrh9Q5o7RdzkokptY1wQoass4f/2Q7a7p
         2xo/EYbjtEX1B7g6l1txwPFOKFycFwGZvEI391E0eu9BvZjzj6kNz2iZyZCSuLwFqlZ2
         QD1TPOuQ7K1RdBocr8ycgkcSpgcrfYccR/LXlkPkw4fBomXpX1DruvhFtF1hXyyq4pIE
         lxeA==
X-Gm-Message-State: AOAM532pxF9nTxoiZLmjTOHmC8Fq2iSxL8i4r+b6TmLPokyikJIV5zR4
        viHR8jPqrF1tPCxc6YxsqpLTw0bejaNwkA==
X-Google-Smtp-Source: ABdhPJzPYh8wQw0Vw60pTqRwBugHjKzTNFBVh5w9mw4JaSxbSt55aritY+vpq0jrkgg0C5H3nlguUA==
X-Received: by 2002:a92:cb0d:: with SMTP id s13mr30298321ilo.73.1607884727809;
        Sun, 13 Dec 2020 10:38:47 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:47 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 18/18] arm64: dts: renesas: Introduce r8a774e1-beacon-rzg2h-kit
Date:   Sun, 13 Dec 2020 12:37:58 -0600
Message-Id: <20201213183759.223246-19-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Beacon EmebeddedWorks is introducing a new kit based on the
RZ/G2H SoC from Renesas.

The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
cellular radio.

The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
along with a variety of push buttons and LED's, and support for
a parallel RGB and an LVDS display.  It uses the same baseboard
and SOM files as the RZ/G2M and RZ/G2N kits.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../dts/renesas/r8a774e1-beacon-rzg2h-kit.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts b/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
new file mode 100644
index 000000000000..8ff5856ac727
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
@@ -0,0 +1,48 @@
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

