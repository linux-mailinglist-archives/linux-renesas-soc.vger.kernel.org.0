Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9DCD2D8F7F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730331AbgLMSi4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgLMSi4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:38:56 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C49C0613D3;
        Sun, 13 Dec 2020 10:38:15 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id r17so13771909ilo.11;
        Sun, 13 Dec 2020 10:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bnNZpouDtXZ6JVyCncpzFotVu0pnppWoVOkCUxQE8Kk=;
        b=tPWnADUhR7aRXU2NMjgNc8UCES6BFUd4OQaTV0WixYzX2fZr6eY+/vvzF4/rdxpzns
         ISDr6Puy50iN8SxlMsGMK5VEl8DCgYrHQlrLjZIW0naeSKtrReMZUnhuULH3BxVY1leb
         80AFCZ0WkFGxVbz/PdF1IG07IYu15GHL64kA5R0PAQ9XNT9zfThUKi8HKK2m0T8H6jhI
         3ldcZooZhkj10/AEzph8p3Lfy1ad5YPkF0qLSS12leeTG8K2D4ddMABleneEl/bfA7lq
         sFRhsEKZkjmWkMXAFIlRqPcj42029ycz0jB7S6daV5vbZ1bHAuHaRA4eqV1m7vcXIxpW
         VlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bnNZpouDtXZ6JVyCncpzFotVu0pnppWoVOkCUxQE8Kk=;
        b=MZTA8/2cT6fVlp9oAh85Q0wCQZYWIhD9A4A6+hI5M28WPznesEvVuLBWfQPEjAzZ4n
         eGcRjsmNwIndRfVoi60nxYqJSakCVwf8et7fl/xBTBinIJ4uIr25qx7ULTRCMVx3vF3T
         QJ093RY5/uWKbSoxK8p3NjnVdSL6KIf2V4WCwbggwj8NMDL1UNGqo+Ty1RdwVZewF9Hb
         IBNDAEnEPUlnGYfV7hE7Kbtn2SG6vQdFq8LNtQMi8yXh+SqWx8/309o28m8lRpjWHpBG
         qINjWyMrNQ/LI8xTjZeMxjAjquTT2Z6dHr13zuTBmKSAqNTJ2OV+g/6zndVTRmFOvF+I
         dYLw==
X-Gm-Message-State: AOAM531y1ZHquZxc8bQLMiwNtSvIIwlG3Lxc8d7XQ3Na7q6NvotpRFsE
        vHoYmLcbWw9O7Grc3AjiiL/huIzLcPbO1g==
X-Google-Smtp-Source: ABdhPJwN/nI/i2pLjiO0PKCttMVyRi1o2TCgBn8hm4+nb10IEp3CPl72fSS27gv+oo0wbU99US8ubQ==
X-Received: by 2002:a92:d9cd:: with SMTP id n13mr28771012ilq.96.1607884694353;
        Sun, 13 Dec 2020 10:38:14 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:13 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/18] arm64: dts: renesas: beacon kit: Configure programmable clocks
Date:   Sun, 13 Dec 2020 12:37:41 -0600
Message-Id: <20201213183759.223246-2-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When the board was added, clock drivers were being updated done at
the same time to allow the versaclock driver to properly configure
the modes.  Unforutnately, the updates were not applied to the board
files at the time they should have been, so do it now.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../dts/renesas/beacon-renesom-baseboard.dtsi | 35 +++++++++++++++++--
 .../boot/dts/renesas/beacon-renesom-som.dtsi  | 26 ++++++++++++++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index e66b5b36e489..3c84e060c69f 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/clk/versaclock.h>
 
 / {
 	backlight_lvds: backlight-lvds {
@@ -294,12 +295,12 @@ &du_out_rgb {
 &ehci0 {
 	dr_mode = "otg";
 	status = "okay";
-	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
+	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
 };
 
 &ehci1 {
 	status = "okay";
-	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
+	clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>, <&versaclock5 3>;
 };
 
 &hdmi0 {
@@ -373,12 +374,40 @@ versaclock6_bb: clock-controller@6a {
 		#clock-cells = <1>;
 		clocks = <&x304_clk>;
 		clock-names = "xin";
-		/* CSI0_MCLK, CSI1_MCLK, AUDIO_CLKIN, USB_HUB_MCLK_BB */
+		clock-output-names = "versaclock6_bb.out0_sel_i2cb",
+				      "versaclock6_bb.out1",
+				      "versaclock6_bb.out2",
+				      "versaclock6_bb.out3",
+				      "versaclock6_bb.out4";
 		assigned-clocks = <&versaclock6_bb 1>,
 				   <&versaclock6_bb 2>,
 				   <&versaclock6_bb 3>,
 				   <&versaclock6_bb 4>;
 		assigned-clock-rates =	<24000000>, <24000000>, <24000000>, <24576000>;
+
+		OUT1 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolts = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT2 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolts = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT3 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolts = <3300000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT4 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolts = <3300000>;
+			idt,slew-percent = <100>;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 8ac167aa18f0..449ff5937fc6 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clk/versaclock.h>
 
 / {
 	memory@48000000 {
@@ -170,7 +171,32 @@ versaclock5: versaclock_som@6a {
 				   <&versaclock5 2>,
 				   <&versaclock5 3>,
 				   <&versaclock5 4>;
+
 		assigned-clock-rates = <33333333>, <33333333>, <50000000>, <125000000>;
+
+		OUT1 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolts = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT2 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolts = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT3 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolts = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT4 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolts = <3300000>;
+			idt,slew-percent = <100>;
+		};
 	};
 };
 
-- 
2.25.1

