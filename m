Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAAF32D81F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 17:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238648AbhCDQyN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Mar 2021 11:54:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238613AbhCDQxv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 11:53:51 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AA6C061756;
        Thu,  4 Mar 2021 08:53:11 -0800 (PST)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01AD527A;
        Thu,  4 Mar 2021 17:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614876789;
        bh=EgoIjy06XpRjO0qHELBlmd9eCc8NGIkomXCVGwX+OBA=;
        h=From:To:Cc:Subject:Date:From;
        b=AWyqLiu9HO5G3vqleQdWaJm0GLAfmCDxU8LhuKPgl5d5cI0ynQlv6CItMPnc2Dcj3
         sFtI3O7J/sb4+DGPU7wCERszr4vyrbRLWeI+IQ6h9dm8fG4JsvFi+whTEyaPrcwT0w
         eLrkP59SndDQ/8X+8NmB7vzY6NsRIo0J4VAro0WI=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] arm64: dts: renesas: falcon: Add GP LEDs
Date:   Thu,  4 Mar 2021 16:53:00 +0000
Message-Id: <20210304165300.295952-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Three general purpose LEDs are provided on the Falcon CPU board.

Connect GP_LED1, GP_LED2, and GP_LED3 to the gpio-leds frameworks.
These LEDs are arranged in a block of four LEDs on the board itself, but
the fourth LED is as yet unidentified.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 5617b81dd7dc..a18f84128fe1 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -20,6 +20,20 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+		};
+		led2 {
+			gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
+		};
+		led3 {
+			gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &rwdt {
-- 
2.25.1

