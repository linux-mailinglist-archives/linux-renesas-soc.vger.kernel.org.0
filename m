Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CB42D8F78
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391674AbgLMSpn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732651AbgLMSjg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:36 -0500
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E7BC0617A7;
        Sun, 13 Dec 2020 10:38:26 -0800 (PST)
Received: by mail-il1-x142.google.com with SMTP id r17so13772180ilo.11;
        Sun, 13 Dec 2020 10:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LoYJAV8a2D1XCikJH3dylyQqJEhCNsWYACjX6vvO7SA=;
        b=HdMw7AzfRiMYReaepxBT02Hpr9D99wLw24Snl8YP8dqNUo1sGVfjYpC6NyKhNjB63P
         0sQcob654SRUwfwpCqmx5yymoIvsMrRO/Ppa4QqhNZVRuXZ7sZX9jJPDKa1rjC28Nh4b
         M1uOPixZ6zfNnOqOwp6cQgD9z2U16Mtt3lgFDF1gP5tHLk3Q8YQsY6TE6ESQIvyb3y/C
         GJeVksQlOK2+JkwoI2DyRFqk/oddajSvJYq3h4soyy21vsUzRK3aCATDZpYSadYiBtOi
         AbqTDDtXoNEiGle9fBF3L11fuRW0LPC0mzZKDRSU4qrEVOLLWgAlPOkC/TTCUnvssShg
         rJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LoYJAV8a2D1XCikJH3dylyQqJEhCNsWYACjX6vvO7SA=;
        b=V0H1Oei0scNt0neqCNZJ1GwxdPtrWDUtMXJlqC4TDfSq4qajZAD/JJE2Ts9BuNVDOW
         KZZay1t70DzYN4zMn8avnarNijkJfkHv8DbxPJSUGb/uB5RbXmqCLslbQ1b/BbO/YWGA
         WGDD4wEqs5JQHcwo2H1HMhXqfWXFtTWai+anosUX9bYp9ywBEpaPlXoqtOfYGvxZTiRN
         hRpWAOnNsnLx8n1Lqtj8pqTEO5ntH2aVAOw/hzyFz1/AIOhzAJUykSS8h7geWd18M4e9
         uo8m9tiadmAFVNNO8lmj2kS2AVVDK1hM7N/GyhJUs2YiWtns/E9tVtAqlmIrY1xDu2te
         K2mw==
X-Gm-Message-State: AOAM532fixItZFEhahyhVkHM6tugp3eoqf+qtLy15QF7MWQp71jeXzxl
        GbSxVE2BARISkmNehVjH5BizAG8BnLIl3Q==
X-Google-Smtp-Source: ABdhPJyLXRJ7g0VJnUtnVX+tJrrg9KdPSuX2wZRv4X7nEFFZxP6rdkv6sVdoKLKb8zKZrBi2mRj8Vw==
X-Received: by 2002:a92:6b11:: with SMTP id g17mr414121ilc.287.1607884705996;
        Sun, 13 Dec 2020 10:38:25 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:25 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/18] arm64: dts: renesas: beacon: Fix LVDS PWM Backlight
Date:   Sun, 13 Dec 2020 12:37:47 -0600
Message-Id: <20201213183759.223246-8-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201213183759.223246-1-aford173@gmail.com>
References: <20201213183759.223246-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The backlight didn't really work correctly due to some updates that were
made in hardware.  It should be safe to apply these, because the older
hardware was never shipped to anyone, so it shouldn't break anything.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi     | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 130993b1b20a..aab39aae5ccb 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -11,8 +11,8 @@ / {
 	backlight_lvds: backlight-lvds {
 		compatible = "pwm-backlight";
 		power-supply = <&reg_lcd>;
-		enable-gpios = <&gpio_exp1 3 GPIO_ACTIVE_LOW>;
-		pwms = <&pwm2 0 50000>;
+		enable-gpios = <&gpio_exp1 3 GPIO_ACTIVE_HIGH>;
+		pwms = <&pwm2 0 25000>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
 	};
@@ -119,9 +119,9 @@ panel-timing {
 			hback-porch = <40>;
 			vfront-porch = <13>;
 			vback-porch = <29>;
-			vsync-len = <3>;
+			vsync-len = <1>;
 			hsync-active = <1>;
-			vsync-active = <1>;
+			vsync-active = <3>;
 			de-active = <1>;
 			pixelclk-active = <0>;
 		};
@@ -575,7 +575,7 @@ pwm0_pins: pwm0 {
 
 	pwm2_pins: pwm2 {
 		groups = "pwm2_a";
-		function = "pwm2_a";
+		function = "pwm2";
 	};
 
 	sdhi0_pins: sd0 {
-- 
2.25.1

