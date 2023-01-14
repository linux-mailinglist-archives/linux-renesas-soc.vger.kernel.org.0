Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92FBB66AE5B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 14 Jan 2023 23:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjANW45 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 14 Jan 2023 17:56:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbjANW4x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 14 Jan 2023 17:56:53 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90817EC3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 14:56:51 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id p189so93749iod.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 14 Jan 2023 14:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=agWn/nfzqUn1A4qzgpWPWDd5A81yML+jam2I/pU4qo4=;
        b=BGGvOWQne9gbF5gVeebLjVpYFbH/jBWMuD888GSiKUMBWZ7Dkan+zE8Ty/z0/2TYPd
         i5B7wobnOYc1UOT+L0PIloJx0HGuRxLYNQsdnSRcIfhFIGLSUY3594tdrHOCLv/Vzolj
         6cMSorZgugYV1A9DyQgBmgmEd3EnfuGYeuNLvaaXl2+l5dNV+J1xueXfG0wUYHy7cPJY
         uPxDtISekAf0glpEucthw+y8MRMFxVhLTtnC4bw3QwEtKEV6hCyc08bALKzqOLCZRlRs
         iYKjfrFAPXusWg9nbzzJ6qLVr47WdmW1KKVN9WyIOsH3c4X0AHn8qHla9JxbadayG9Hd
         GmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agWn/nfzqUn1A4qzgpWPWDd5A81yML+jam2I/pU4qo4=;
        b=0c+UKCfRS618qvxri03925+Qro3JluySG6jBM/WPI4VgsLcNCMMcNz/KTQUR3cOlgh
         MEM9qGHgPYuVULAXmDx3xK0nTNZrcFRCIDBjUDCWetwDnk7oFhDib4gXTJ3a9BselLF1
         z9V8qd8nJiV27BNAlDADtIyGDtVkYlypq4nRKHlM/goaaUGpv04EuZ3HAJAajh/FbySV
         2jVN1DAYZXklY+AX8cIm0T4FGTYH0X685fzBrk8NKotkPhbSTNM907S7+EHBZWkfyuvO
         cVubSpHF0l0rnX86/q6DxURsrW0MKRzE7gYcrfFgClDOcTDW6o21bUPWAPgdlcpxD4Lu
         CmIQ==
X-Gm-Message-State: AFqh2krE2qZuU4H4N0zu/PTzxHng6G2NglIu+n2emALF5j6Y3SBn6ZBI
        9Pzh7RbK5/35QSN4WeYtuG/efwH9s0U=
X-Google-Smtp-Source: AMrXdXtZ7Mw+7mjpzM0hXHqV3ywWD2WoHetArQQW/22v8ziGY2ONM/rdERNjiMgjpmJ6dDzFmwGXBw==
X-Received: by 2002:a5e:c80a:0:b0:6e3:f1da:fe9a with SMTP id y10-20020a5ec80a000000b006e3f1dafe9amr59519221iol.18.1673737010111;
        Sat, 14 Jan 2023 14:56:50 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan (c-75-72-166-104.hsd1.mn.comcast.net. [75.72.166.104])
        by smtp.gmail.com with ESMTPSA id c8-20020a6bfd08000000b006bbfb3856d6sm8374519ioi.5.2023.01.14.14.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 14:56:49 -0800 (PST)
From:   Adam Ford <aford173@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     geert+renesas@glider.be, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH 1/3] arm64: dts: beacon-renesom: Fix gpio expander reference
Date:   Sat, 14 Jan 2023 16:56:45 -0600
Message-Id: <20230114225647.227972-1-aford173@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The board used to originally introduce the Beacon Embedded
RZ/G2[M/N/H] boards had a GPIO expander with address 20, but
this was change when the final board went to production.

The production boards changed both the part itself and
the address.  With the incorrect address, the LCD cannot
come up.  If the LCD fails, the rcar-du driver fails to come up,
and that also breaks HDMI.

Pre-release board were not shipped to the general public, so it
should be safe to push this as a fix.  Anyone with a production
board would have video fail due to this GPIO expander change.

Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Update compatible to reflect the part change.

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index d3ec8c45d5af..518885cb1e7e 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -437,20 +437,6 @@ wm8962_endpoint: endpoint {
 		};
 	};
 
-	/* 0 - lcd_reset */
-	/* 1 - lcd_pwr */
-	/* 2 - lcd_select */
-	/* 3 - backlight-enable */
-	/* 4 - Touch_shdwn */
-	/* 5 - LCD_H_pol */
-	/* 6 - lcd_V_pol */
-	gpio_exp1: gpio@20 {
-		compatible = "onnn,pca9654";
-		reg = <0x20>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-
 	touchscreen@26 {
 		compatible = "ilitek,ili2117";
 		reg = <0x26>;
@@ -482,6 +468,21 @@ hd3ss3220_out_ep: endpoint {
 			};
 		};
 	};
+
+	gpio_exp1: gpio@70 {
+		compatible = "nxp,pca9538";
+		reg = <0x70>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"lcd_reset",
+			"lcd_pwr",
+			"lcd_select",
+			"backlight-enable",
+			"Touch_shdwn",
+			"LCD_H_pol",
+			"lcd_V_pol";
+	};
 };
 
 &lvds0 {
-- 
2.34.1

