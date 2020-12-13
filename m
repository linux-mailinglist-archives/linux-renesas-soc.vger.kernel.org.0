Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C00A2D8F5B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730828AbgLMSkB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:40:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389284AbgLMSjy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:54 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24900C0611CA;
        Sun, 13 Dec 2020 10:38:43 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id d9so14773757iob.6;
        Sun, 13 Dec 2020 10:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R/HHs2XgLog47FdAUtHaQujfusotHEedoMJlKH9zwmk=;
        b=jYsGGsVM0QKqTXmeCErNRsNXjwg7cc5lRzK+aZV/8OGSzNpTUmGH7xT8WGoKEDRlWp
         VvWbM5Q1tWA04Uwp0tF/UBggOG2EFkk2+DhcCkjZ/HZP45ZP0wfqEQQxOfY1ul6UKYhR
         +2F4NfzJZ0XU7IvlNTo4nFLsJea2vOnfVf/GNBbuVRBt3IuQxPYczzd3azBja1dxf7mg
         mlKbeO5zG3e9CwWSS9MYF1yeIaCXk7Z4nLr3XFQySL/lUJLA8zvggI1L8AIpdJ11ThdP
         /LAboHtwCZpc+ONw/3LwiXLIpuBBlRGY+jA64tkxdB05ImrSkIwA2o5G+L1cc0jKIMgz
         iuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R/HHs2XgLog47FdAUtHaQujfusotHEedoMJlKH9zwmk=;
        b=of8759x0jBWZ6Q2/elenYk282+Lg30ZDuYCC+5mTiMfclBbAA865sdWQoBKH+Nqg9d
         XsWL2O42n7QGt4L93AGGzDNdt1xvH6PIH/eqF+90SPCXpWR0PW0RP/Luk/vzBcFF0b1I
         DGAO+YAzTYZVRQVK2jX8KM/IaEtCR1wKABs7F/1YNE9x+RipWHGBYjE2z8GejptQXd49
         C/L81OSBXw6H6YxzO/HEGZ04HPIyhYpH96iEEPotV0vV7yqI3p7BxZ4bOmnatXz/PmIZ
         zh8aspOWIdUkYxvy5wGIRiJ9W08zaHVtvnMZ10pdlscZoTOGBoGR7jf4an8LhNajuio8
         m6KQ==
X-Gm-Message-State: AOAM532Jgd+5+bDKLJZUGzPJTNsY5yiOLL5JDuYXT+8vgDmHJ8HQOS8e
        9oa+RTq+ELAyt06DsbkvNw3boi23SVk8Xw==
X-Google-Smtp-Source: ABdhPJyM6GnHCP2QOQDXtZxhfEY7KSS2FagUd1OXFXY1aPRVzb8Bc49EfVzD6PYN09W7GR+kc9qClA==
X-Received: by 2002:a02:63cd:: with SMTP id j196mr1468494jac.61.1607884722006;
        Sun, 13 Dec 2020 10:38:42 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:41 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/18] arm64: dts: renesas: beacon-rzg2m-kit: Rearange SoC unique functions
Date:   Sun, 13 Dec 2020 12:37:55 -0600
Message-Id: <20201213183759.223246-16-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
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
 .../dts/renesas/beacon-renesom-baseboard.dtsi    | 15 ---------------
 .../boot/dts/renesas/beacon-renesom-som.dtsi     |  5 -----
 .../dts/renesas/r8a774a1-beacon-rzg2m-kit.dts    | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 7f499282f851..facb3e6d8010 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -273,21 +273,6 @@ &can1 {
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
index b5ba45261c0b..d68e9f5b8b38 100644
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
index 2c5b057c30c6..581e4ec36bcb 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
@@ -26,4 +26,20 @@ aliases {
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
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&versaclock5 1>,
+		 <&x302_clk>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2",
+		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
-- 
2.25.1

