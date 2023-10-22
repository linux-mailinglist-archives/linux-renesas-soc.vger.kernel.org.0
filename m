Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2F6E7D252A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Oct 2023 20:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbjJVSTc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 22 Oct 2023 14:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbjJVSTb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Oct 2023 14:19:31 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B08DD
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Oct 2023 11:19:29 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-53e855d7dacso3871071a12.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Oct 2023 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1697998768; x=1698603568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IapM57vvXfzQjqENXtjuM9JSp2fROAyan36M7VaIVMY=;
        b=P80bdufwEODPnniq0TMeKbnBm/KBDYuv2Wk2XQjdcD6uWLs8xJKxjWMba1JNBGsYFg
         JkWvYa9/KlDDdKmXbKh7zwZfh8MJgC8QVXbuNL/4uWa5GTB+HbxkzbTyzhs7VQABydyd
         WKfIbFjdd9x+2CNqYaP/HzafngZqEaBiMkf0TKmnqEo/OO0NnBqxVm80vFtr2TRIyGBB
         Dz+cQrZZvIF0BFvWRB6L2UGidJo9TK22SR2+bQdpWh7OQEy1ukMg/aAmlnuIRDGrA4Nu
         HTu2bil0QTDDE0GXXvm90xagIOCZU2MQft0wZnUxKBmvjdQ/xyhgbYDfclbwu6NjTAmR
         mRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697998768; x=1698603568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IapM57vvXfzQjqENXtjuM9JSp2fROAyan36M7VaIVMY=;
        b=E1HPaPtHrrhie8qwsTlu9vFt5i/wmalyd3O1uPmFo2XY9pEcqinuptpYdFo8bNm4YE
         nBDptbwh8NniEAmXZkvkRDmkwbhaVF4WiBFtFJNKbYdRZ/wo7W6Kiip/qPGP6IhHadLB
         8t8qo1g0VTNqk3i9WWyqCPUAbKiQOZpP9p38ducrIoymtpcKt+6KwjLmrAdmneyowYLF
         jkoHeXV5MN8aKoyh9dxN92w3kaRUa2Ta5T6lUtvh+PsVeGPIL6yvjluzHu+Nc8KyskD2
         bowRFNbtLclr0W3YHb5j7f48VQtZUxqApKR7kctiNKtXINMumyPS2JKysfA5pENQ+TGs
         xmjw==
X-Gm-Message-State: AOJu0Yy93yVceyNhfk3jBTEAuFCC0QchDZ4x2txV4KeYQWZhp43fHFfE
        G45i34yb7alfU5EEHKA2u5cpBw==
X-Google-Smtp-Source: AGHT+IFlj5GdhLU2TQwUvjeXwg2wlAakytjgIq95OhK7i9kgBaYhTzVFDrJqC/9ZNKxNpE21GxtN1w==
X-Received: by 2002:a50:8d11:0:b0:53e:8c4c:ab3e with SMTP id s17-20020a508d11000000b0053e8c4cab3emr5248673eds.19.1697998767640;
        Sun, 22 Oct 2023 11:19:27 -0700 (PDT)
Received: from sleipner.berto.se (p4fca2773.dip0.t-ipconnect.de. [79.202.39.115])
        by smtp.googlemail.com with ESMTPSA id h12-20020aa7de0c000000b0053e43492ef1sm5035159edv.65.2023.10.22.11.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 11:19:27 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] arm64: dts: renesas: draak: Make HDMI the default video input
Date:   Sun, 22 Oct 2023 20:19:09 +0200
Message-ID: <20231022181910.898040-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231022181910.898040-1-niklas.soderlund+renesas@ragnatech.se>
References: <20231022181910.898040-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Most Gen3 R-Car devices have HDMI as the default video input source,
align Draak with them and make HDMI the default.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Split moving the incorrect bus properties to separate patch.
---
 arch/arm64/boot/dts/renesas/draak.dtsi | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index ef3bb835d5c0..08b3458a5025 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -356,12 +356,9 @@ port@3 {
 				 * CVBS and HDMI inputs through SW[49-53]
 				 * switches.
 				 *
-				 * CVBS is the default selection, link it to
-				 * VIN4 here.
+				 * HDMI is the default selection, leave CVBS
+				 * not connected here.
 				 */
-				adv7180_out: endpoint {
-					remote-endpoint = <&vin4_in>;
-				};
 			};
 		};
 
@@ -423,13 +420,14 @@ port@2 {
 				 * CVBS and HDMI inputs through SW[49-53]
 				 * switches.
 				 *
-				 * CVBS is the default selection, leave HDMI
-				 * not connected here.
+				 * HDMI is the default selection, link it to
+				 * VIN4 here.
 				 */
 				adv7612_out: endpoint {
 					pclk-sample = <0>;
 					hsync-active = <0>;
 					vsync-active = <0>;
+					remote-endpoint = <&vin4_in>;
 				};
 			};
 		};
@@ -580,8 +578,8 @@ usb0_pins: usb0 {
 		function = "usb0";
 	};
 
-	vin4_pins_cvbs: vin4 {
-		groups = "vin4_data8", "vin4_sync", "vin4_clk";
+	vin4_pins: vin4 {
+		groups = "vin4_data24", "vin4_sync", "vin4_clk";
 		function = "vin4";
 	};
 };
@@ -729,7 +727,7 @@ &usb2_phy0 {
 };
 
 &vin4 {
-	pinctrl-0 = <&vin4_pins_cvbs>;
+	pinctrl-0 = <&vin4_pins>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -737,7 +735,7 @@ &vin4 {
 	ports {
 		port {
 			vin4_in: endpoint {
-				remote-endpoint = <&adv7180_out>;
+				remote-endpoint = <&adv7612_out>;
 			};
 		};
 	};
-- 
2.42.0

