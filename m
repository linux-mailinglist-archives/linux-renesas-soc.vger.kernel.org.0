Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2CE36932A4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Feb 2023 17:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjBKQ6z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Feb 2023 11:58:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjBKQ6y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 11:58:54 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9542E26BD
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 08:58:52 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a2so8157039wrd.6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Feb 2023 08:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKHa2WXs3N1837KLyPrWv8Z3wmI3snRyJspZOs7w6zo=;
        b=X11T3XAsvpVim8jfkl7QVbyPlbYU1robyzaiuk2tR1QNQr0e9VB0gN/YLzemY9CHpn
         jdC1VMEC6xBezfXczDMYJARlZFsHWfXYIgQBD7zeQfx0+Ih/JuKenLAv13zJ0nT+FqtO
         6WVyAnuplj9NsLdx8u91HOhASJrF4x9S2/I0aRfTe4J0Ps7pLBQ6CB+j0PE8Lj2H9TAW
         FZEfjhuhhJKf1wUKss9dPnZyAK+7Gq6wT3kq/EYxgm/+7JdWdFLcdQcFFvt7ggjpbGQA
         j8Gw76deBmSs1sZgiEqhZm9ljE3Ps8tb6/VKKZ6xc0B21V99lLXtOMyi5GXlI+UvAFqM
         62ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKHa2WXs3N1837KLyPrWv8Z3wmI3snRyJspZOs7w6zo=;
        b=QMILtjMv5G0RFJAqA98zD4ovpTdvH8HT7t7G779hNpsAxEq5yZNZiI80NCA3uq7iO3
         gjThapp4b54l+fxz2J6nNG8YxwqzSHGdXF6o8ufKJ5boyp9c3hvkmRa/50NwtMvWgw7L
         nVmmwEYN0itNjb9Qsl40t5sOL095u4pGnWDf9+Hi0s8yAvN7AnAIoYETHz6KbddLDbkl
         MUHFnjeSC3pHTIrZo41GaU/+LajTQc8uRULFiAix3fourRuRZmG0pF7nRwR+yEWskH6G
         q9IeZmogYFQ1r26N7PQd4e6u2l8hzOBOdOOx7ntPmJ2oljpJTXAtrJEBqiY13h10MKuJ
         ky2A==
X-Gm-Message-State: AO0yUKVhtc9L0I5uJ90Z7BHomTTN9TOg707cwMDjvzaolh/tzo8Q3cvp
        exdlW6AEZjYf4BEopQMm5tmtYw==
X-Google-Smtp-Source: AK7set/X/r/WgS5SA9zfJCgLU0EBExTO0k6yjqVuwnp0Ihc3WbhsouErp+2PAboLKux3bSKIi3ik0g==
X-Received: by 2002:a05:6000:1144:b0:242:1809:7e17 with SMTP id d4-20020a056000114400b0024218097e17mr16188284wrx.6.1676134731196;
        Sat, 11 Feb 2023 08:58:51 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id y13-20020a5d614d000000b002c5526234d2sm887064wrt.8.2023.02.11.08.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 08:58:50 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: draak: Make HDMI the default video input
Date:   Sat, 11 Feb 2023 17:57:14 +0100
Message-Id: <20230211165715.4024992-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230211165715.4024992-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Most Gen3 R-Car devices have HDMI as the default video input source,
align Draak with them and make HDMI the default. While at it move the
bus properties to the VIN node where they can be consumed correctly by
the driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/draak.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index ef3bb835d5c0..e248866c7871 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -356,11 +356,10 @@ port@3 {
 				 * CVBS and HDMI inputs through SW[49-53]
 				 * switches.
 				 *
-				 * CVBS is the default selection, link it to
-				 * VIN4 here.
+				 * HDMI is the default selection, leave CVBS
+				 * not connected here.
 				 */
 				adv7180_out: endpoint {
-					remote-endpoint = <&vin4_in>;
 				};
 			};
 		};
@@ -423,13 +422,11 @@ port@2 {
 				 * CVBS and HDMI inputs through SW[49-53]
 				 * switches.
 				 *
-				 * CVBS is the default selection, leave HDMI
-				 * not connected here.
+				 * HDMI is the default selection, link it to
+				 * VIN4 here.
 				 */
 				adv7612_out: endpoint {
-					pclk-sample = <0>;
-					hsync-active = <0>;
-					vsync-active = <0>;
+					remote-endpoint = <&vin4_in>;
 				};
 			};
 		};
@@ -580,8 +577,8 @@ usb0_pins: usb0 {
 		function = "usb0";
 	};
 
-	vin4_pins_cvbs: vin4 {
-		groups = "vin4_data8", "vin4_sync", "vin4_clk";
+	vin4_pins: vin4 {
+		groups = "vin4_data24", "vin4_sync", "vin4_clk";
 		function = "vin4";
 	};
 };
@@ -729,7 +726,7 @@ &usb2_phy0 {
 };
 
 &vin4 {
-	pinctrl-0 = <&vin4_pins_cvbs>;
+	pinctrl-0 = <&vin4_pins>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -737,7 +734,10 @@ &vin4 {
 	ports {
 		port {
 			vin4_in: endpoint {
-				remote-endpoint = <&adv7180_out>;
+				pclk-sample = <0>;
+				hsync-active = <0>;
+				vsync-active = <0>;
+				remote-endpoint = <&adv7612_out>;
 			};
 		};
 	};
-- 
2.39.1

