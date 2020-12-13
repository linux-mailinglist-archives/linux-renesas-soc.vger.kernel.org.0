Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15872D8F56
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Dec 2020 19:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388079AbgLMSjl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 13 Dec 2020 13:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732756AbgLMSjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 Dec 2020 13:39:37 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AF0C06138C;
        Sun, 13 Dec 2020 10:38:30 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id x15so13824608ilq.1;
        Sun, 13 Dec 2020 10:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O1ofCR4SUjXYMe9N9sbwulVEYc062acKW/2Q1L8oy2A=;
        b=PfkbrkyP283kZpJ2dD5xV4G/6CVkRCXBf1Xdojba88UmtM4e6WvyUMuBRP/MdUVX9u
         BXLAHc+oPQ6T6Iv8DjhkitiqGONIXyCUpiU93LvX/wT65QpDkgnzwUyh59m6/SG6D95g
         S4P2Hg+CdBZi900i8llkBkWsPN1t099Qy+kiTru5X/VsNaNPeK/GxPZL/QOLeeYn74A/
         2xzX8GlQgXTbt6mBjcesg+jBNYIYShPTOczwqa6Gj1PjlMrqgsGFloj1cz6J9zQPdNPu
         PW/x4LT6fx00zE0hyMw5GpvKan+l2Ajbnl4dA6c9UKgc9XrvUXky3GD7pjzVaskwArPM
         0e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O1ofCR4SUjXYMe9N9sbwulVEYc062acKW/2Q1L8oy2A=;
        b=FpLfD7AzIekz3Zai2+2GoTo0bkyj5ZQmPRdM5HQnR954uqoFML5yCnNJ/d6HFYpEeK
         4KeVy1HT50rFGyTp/nUNbtO9eZey2CPGmdVqsLa54hrOK/EtixRFZ/8HxjzAkCr07tQG
         eKFJTxWP3m0hxJUehGkvps5OFV3G/7OJfXqZi0CFlDe5TYieSvQI+D9w3UdOlgjU4o5I
         9AIIj9vwfsHEjHt4bLUHueJH9yG2YaW0XvTai/FIJaSzn0MxvmKNnqm0orXdxYmqmHmD
         +Fv3AlXs2e8TkqV4+Pw/BOMkTyoEXXhlbEOBtIHO9PGidkbZwlgzsZ+gUFTunThGDqEe
         7TEA==
X-Gm-Message-State: AOAM533LOUSDuwnvt3CO7zq9f2/ghcfJv8rMRQ/IZH7wPwGXLla9cO0N
        ccNk+T9gloAqX/mzvvLrRgpldtcunu5GmA==
X-Google-Smtp-Source: ABdhPJwptzTJmi8v6kTUJS1r9DxmXNy5TJtDR4V6qHc+KAu7UTZVHs9ToWl32dh/Tdblq+iE3u01Lw==
X-Received: by 2002:a92:d44e:: with SMTP id r14mr28850227ilm.83.1607884709943;
        Sun, 13 Dec 2020 10:38:29 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:f45d:df49:9a4c:4914])
        by smtp.gmail.com with ESMTPSA id o11sm7804532ioa.37.2020.12.13.10.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 10:38:29 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/18] arm64: dts: renesas: beacon: Fix RGB Display PWM Backlight
Date:   Sun, 13 Dec 2020 12:37:49 -0600
Message-Id: <20201213183759.223246-10-aford173@gmail.com>
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
Because the display driver refers to the display as DPI, this also
renames the backlight to use DPI for consistency.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index bf047a9836ed..87a0f556cd2f 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -17,12 +17,12 @@ backlight_lvds: backlight-lvds {
 		default-brightness-level = <6>;
 	};
 
-	backlight_rgb: backlight-rgb {
+	backlight_dpi: backlight-dpi {
 		compatible = "pwm-backlight";
 		power-supply = <&reg_lcd>;
 		enable-gpios = <&gpio_exp1 7 GPIO_ACTIVE_LOW>;
-		pwms = <&pwm0 0 50000>;
-		brightness-levels = <0 4 8 16 32 64 128 255>;
+		pwms = <&pwm0 0 25000>;
+		brightness-levels = <0 25 33 50 63 75 88 100>;
 		default-brightness-level = <6>;
 	};
 
@@ -136,7 +136,7 @@ panel_in: endpoint {
 	rgb {
 		/* Different LCD with compatible timings */
 		compatible = "rocktech,rk070er9427";
-		backlight = <&backlight_rgb>;
+		backlight = <&backlight_dpi>;
 		enable-gpios = <&gpio1 21 GPIO_ACTIVE_HIGH>;
 		power-supply = <&reg_lcd>;
 		port {
-- 
2.25.1

