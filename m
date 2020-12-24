Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8A42E283D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 18:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgLXRGs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 12:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728350AbgLXRGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 12:06:47 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233FDC061786;
        Thu, 24 Dec 2020 09:05:36 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id m23so2491275ioy.2;
        Thu, 24 Dec 2020 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I0f0TxXOUN4NNq0oJ349J0HL3TvRTCvF4USIwrL91MU=;
        b=r7M/rtpSrKNMy0EPW8om8aW4fYGUopsJAE7W4GieKkD/FYWcNUhHj0Kyi8epR0Zzz/
         V10iX83RhGa7El7VVMqqqtCvb95ASL8q2JwjPyP9B3zXtEmajTPSUVscRtW7OcyWr5BX
         LAZ5cjyyIkcdy9DliXhzYQAxT4t3Qc6rsK8rVukl0C/rKoJN+HNXMWnQJ5YV6jWWiAAi
         cKKOPhgKl0VsjpUA6pctk6wN2+N+grFL6oTuvYR1pg63m2uHfgjmXSb6T/wOQlX2kylG
         s39FGfpvDsewznt83EPsIfPWCh4thwjgkQfcDEE77QIloBUO8UNBjlyiRREitqj5ndUm
         tlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I0f0TxXOUN4NNq0oJ349J0HL3TvRTCvF4USIwrL91MU=;
        b=BsZIGUTsNWALhaCGbqFm4AorNJepwcz4xdKxgyV8n1ofMOZnzsY34ArrsAT66Q7OJq
         BBLXIFm2k2L/fBd2EdfXiTGjNSLeXaqhJoyLmDx8U1b8QiKyop1Lk451MiPpBk27vaNw
         pI6wMKmR/ey303vaVTMoY/eoIuAkwwXQKNTzVRZyyChklY3Frd24tn/OwNHewq2EYdUk
         DvxgsZBbOndAUuzIKmnfkr9iOr+xozdgUSON0bCYY7n3MlH2o+3poLEzib8VLWtdy5C9
         aU7U7US9fZ6sELYAwgK8kEKmBUS/f6VOR+2QklDjzs/WPmxhaY+y6Zt/qMRVeMlejGHt
         WIvg==
X-Gm-Message-State: AOAM531Er90t6kgI5e+ZL7m/JzOH1ZcCnDE9a6fW5nT+h6GDGx7/OOZg
        pt7umgsnDyZj8w7fVR5oM8qlb2dnULs=
X-Google-Smtp-Source: ABdhPJxbl9NX0/u2Tpqc25MWdfp+nUSulT03xixJN4vO2897zFnAmOu+O5dinCwFvlrpPxwKSOiAdA==
X-Received: by 2002:a05:6602:20ca:: with SMTP id 10mr25752163ioz.51.1608829535101;
        Thu, 24 Dec 2020 09:05:35 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id f20sm9732965ilr.85.2020.12.24.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 09:05:34 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 6/9] arm64: dts: renesas: beacon-rzg2m-kit: Rearange SoC unique functions
Date:   Thu, 24 Dec 2020 11:04:59 -0600
Message-Id: <20201224170502.2254683-6-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201224170502.2254683-1-aford173@gmail.com>
References: <20201224170502.2254683-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In preparation for adding new dev kits, move anything specific to the
RZ/G2M from the SOM-level and baseboard-levels and move them to the
kit-level.  This allows the SOM and baseboard to be reused with
other SoC's.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Fix missing entries in dts file.

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 3b3efaf749bb..a6aa0b815c46 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -241,21 +241,6 @@ &can1 {
 	status = "okay";
 };
 
-&du {
-	pinctrl-0 = <&du_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-
-	clocks = <&cpg CPG_MOD 724>,
-		<&cpg CPG_MOD 723>,
-		<&cpg CPG_MOD 722>,
-		<&versaclock5 1>,
-		<&x302_clk>,
-		<&versaclock5 2>;
-	clock-names = "du.0", "du.1", "du.2",
-		"dclkin.0", "dclkin.1", "dclkin.2";
-};
-
 &du_out_rgb {
 	remote-endpoint = <&rgb_panel>;
 };
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index a6f7193e4d97..b34ffa1e77fa 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -13,11 +13,6 @@ memory@48000000 {
 		reg = <0x0 0x48000000 0x0 0x78000000>;
 	};
 
-	memory@600000000 {
-		device_type = "memory";
-		reg = <0x6 0x00000000 0x0 0x80000000>;
-	};
-
 	osc_32k: osc_32k {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
index 25eeac411f12..501cb05da228 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
@@ -26,6 +26,26 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x80000000>;
+	};
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&versaclock5 1>,
+		 <&x302_clk>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2",
+		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
 
 /* Reference versaclock instead of audio_clk_a */
-- 
2.25.1

