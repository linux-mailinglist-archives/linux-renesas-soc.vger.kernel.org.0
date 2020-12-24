Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3DE2E2837
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Dec 2020 18:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgLXRGH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Dec 2020 12:06:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728039AbgLXRGH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Dec 2020 12:06:07 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A084C061573;
        Thu, 24 Dec 2020 09:05:27 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id w17so2427128ilj.8;
        Thu, 24 Dec 2020 09:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cscvb+iV0cTVUXsER3fqU+Aouxqzhaf8csA4Jzg4/vY=;
        b=LKwenKmc68uaJtfE5Ov1WAbDbE8Qm9Cdjr9HNWu02yK3bMMhc8yJP0Q3MvwqD/qYhD
         hH7DsQv6HRmPVvT5jos3trpPY2RJuEKKEnemb+qDNgOGik0sgyAwfV1gKz8VCCletluF
         qWYSB2LTznOB4qdj4XOhrp5s3BshLKQo3xUsA24ortJTo4EivDsFVERkJj70DucK1g+Y
         YI8CdjzS+wNCoO5BCm1zvzYKNv4D49BtyJSdfhOS7ckz49mcldX06zDeCvq6I3aEyt0w
         4vuDRnYUMSpgLsp2jINM4HXNuZXELxKZM2z4nYI+8Cc1T/Sc9SgDQoGcEI/d0VcWF54r
         RdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cscvb+iV0cTVUXsER3fqU+Aouxqzhaf8csA4Jzg4/vY=;
        b=Rr+YDlgSXURZJvKe81ihHKNoVz/EzdQXLHWn6aSloTas+8noKUN1YAQ/thvRet/1e9
         HCbsaEayO/hzWDkGhB3SEShsXDqvaeA6oyvH15vfBSJ2nFONLJ2inbp+ru0lqLb07K5S
         ddhFe0Y2WNMZQbQrpPGzq1bZqwe3P/jxo04D4yNGQfb7po/BRSZVxlc0RvhEeRJagRF9
         mAJwA/AZIPTddags6KHL/+41SQfkMsZHmrNCvWWGxFkbpgi5kNV9maM2YLQoocEADmEq
         jPrkzZ1ynDTgTkq4jFH1LkfrfMN8xYhKwyGcsYdZfGFYnM1SzjnQXoLI7q6NWTXIPTyW
         3/MA==
X-Gm-Message-State: AOAM531gjskIntt1tLFIXIRl8YtNhG2LBB0DMAXCI3t1w7CJ3tOzRMcV
        CggYY+VCTf9bAQPv6XcICPqJORy2gT4=
X-Google-Smtp-Source: ABdhPJySsXcTNSwJup1rLaeM9loH5F1aU/FNU78D6OvBIJW0Oqelj0yIWgkDkM7q3u/eECJUo1Ob2Q==
X-Received: by 2002:a92:9f59:: with SMTP id u86mr30535429ili.205.1608829526376;
        Thu, 24 Dec 2020 09:05:26 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id f20sm9732965ilr.85.2020.12.24.09.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 09:05:25 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/9] arm64: dts: renesas: beacon kit: Configure programmable clocks
Date:   Thu, 24 Dec 2020 11:04:54 -0600
Message-Id: <20201224170502.2254683-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When the board was added, clock drivers were being updated done at
the same time to allow the versaclock driver to properly configure
the modes.  Unfortunately, the updates were not applied to the board
files at the time they should have been, so do it now.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Limit the changes to the versaclocks chips.

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index cc0e7ce8e503..46a3ba895330 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/clk/versaclock.h>
 
 / {
 	backlight_lvds: backlight-lvds {
@@ -347,12 +348,36 @@ versaclock6_bb: clock-controller@6a {
 		#clock-cells = <1>;
 		clocks = <&x304_clk>;
 		clock-names = "xin";
-		/* CSI0_MCLK, CSI1_MCLK, AUDIO_CLKIN, USB_HUB_MCLK_BB */
+
 		assigned-clocks = <&versaclock6_bb 1>,
 				   <&versaclock6_bb 2>,
 				   <&versaclock6_bb 3>,
 				   <&versaclock6_bb 4>;
 		assigned-clock-rates =	<24000000>, <24000000>, <24000000>, <24576000>;
+
+		OUT1 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolt = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT2 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolt = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT3 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolt = <3300000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT4 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolt = <3300000>;
+			idt,slew-percent = <100>;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index e6885d50bb62..ade2f58ad99b 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clk/versaclock.h>
 
 / {
 	memory@48000000 {
@@ -169,7 +170,32 @@ versaclock5: versaclock_som@6a {
 				   <&versaclock5 2>,
 				   <&versaclock5 3>,
 				   <&versaclock5 4>;
+
 		assigned-clock-rates = <33333333>, <33333333>, <50000000>, <125000000>;
+
+		OUT1 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolt = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT2 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolt = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT3 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolt = <1800000>;
+			idt,slew-percent = <100>;
+		};
+
+		OUT4 {
+			idt,mode = <VC5_CMOS>;
+			idt,voltage-microvolt = <3300000>;
+			idt,slew-percent = <100>;
+		};
 	};
 };
 
-- 
2.25.1

