Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D154A2E2831
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 18:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgLXRGP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 12:06:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728891AbgLXRGO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 12:06:14 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5698DC0613ED;
        Thu, 24 Dec 2020 09:05:34 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id v3so2443459ilo.5;
        Thu, 24 Dec 2020 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zgC8hWEejAl7ji5lgCboCeRf8tvBCy5iybPT9Zk9Fss=;
        b=Q7kkH5UmwJ63ZacPk7bewGFySHCyJ1pxpwCGlAMNlcLja8BCsb+ckg6Ia9afl7/Of0
         rnrpC/m8jU/PgHSPvRbxxEz+qcqQuBXopZTLoVbX5IBcFq2tsYRWpNoB8jsH4Tm5Mjqw
         r4TBo/dWz5IiuPYwjjshHmsEl0flaE1eiAD6VIjUqtsU13x5+0B+NVHGZq4cM0lY3tKy
         9vlaGpIp77lAHzRAGc0ky9wwFltVRBGD0SAdZyvXhId6QI5FzKgnecRZxNbrkFVqOAIt
         UeIqb7AowGoHYR1A1Ss3viM3BGqojvxd4QYj7Rk16qPbDgl71usKH0c57JNBkDX3n3Z+
         LS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zgC8hWEejAl7ji5lgCboCeRf8tvBCy5iybPT9Zk9Fss=;
        b=TwToRneH6ENs/iEOcAPyrS5i86WvAh3jDOkZ92MZO9xQ0kFziJMgdBxd3/MZYF7oMV
         K/wG6SFQG33sazg42SdH+K0lQuJdk78vx2abuvXsh9WitkuXyOD6r5sBBUjokF/VDozG
         jS5H5fDktqnZkhdcqAQV7l4RKgy06GLhFGpah6H2s0S9H2egjkGgZww+wZK4UbedEeGi
         9tScDE5ihKRYankZIwOAKRdnAAzYln/HMciwZXeXZjsV2eC1FDvlR8QBggSD7h9b1q2Z
         aEk21KSOVgEbwYW9oW/0OCVpcYFbIWURm0YtJHUiOFbn2tpriKRQAxBC7Mue92nT8B4i
         K1GA==
X-Gm-Message-State: AOAM531gpq61yh9IaQI5gxHmkWFqW+knXTUDEt3bl24aFGJv2ZUyEvuZ
        s+MngMKc8ucynv3mxTm/sqc3bJkJ7IA=
X-Google-Smtp-Source: ABdhPJxB06iiioEvZW/IJKdzBmP7RZiz25WqLUKBDexNTHM4leqJQyqvK8LFquu+NYQ70IYoNThaBg==
X-Received: by 2002:a05:6e02:92f:: with SMTP id o15mr30019321ilt.130.1608829533381;
        Thu, 24 Dec 2020 09:05:33 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id f20sm9732965ilr.85.2020.12.24.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 09:05:32 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 5/9] arm64: dts: renesas: beacon: Cleanup USB References
Date:   Thu, 24 Dec 2020 11:04:58 -0600
Message-Id: <20201224170502.2254683-5-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224170502.2254683-1-aford173@gmail.com>
References: <20201224170502.2254683-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The programmable versaclock is used for the usb_extal reference clock for
the EHCI driver instead of a fixed-clock.  Because the versaclock needs to
be enabled, the clock reference needs to be added to the clocks list.

For the USB3 Phy, the perferred clock reference is usb3s_clk, so
remove the usb_extal reference.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Split this off into its own patch.

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index a54ec36c69e4..3b3efaf749bb 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -263,12 +263,22 @@ &du_out_rgb {
 &ehci0 {
 	dr_mode = "otg";
 	status = "okay";
-	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
+	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
 };
 
 &ehci1 {
 	status = "okay";
-	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
+	clocks = <&cpg CPG_MOD 702>, <&versaclock5 3>;
+};
+
+&gpio6 {
+
+	usb_hub_reset {
+		gpio-hog;
+		gpios = <10 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "usb-hub-reset";
+	};
 };
 
 &hdmi0 {
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index ade2f58ad99b..a6f7193e4d97 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -75,15 +75,6 @@ &extalr_clk {
 	clock-frequency = <32768>;
 };
 
-&gpio6 {
-	usb_hub_reset {
-		gpio-hog;
-		gpios = <10 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
-};
-
 &hscif0 {
 	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
@@ -315,16 +306,12 @@ &sdhi3 {
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
 	bus-width = <8>;
-	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 	non-removable;
 	fixed-emmc-driver-type = <1>;
 	status = "okay";
 };
 
-&usb_extal_clk {
-	clock-frequency = <50000000>;
-};
-
 &usb3s0_clk {
 	clock-frequency = <100000000>;
 };
-- 
2.25.1

