Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16E6B1897FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2020 10:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgCRJfg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Mar 2020 05:35:36 -0400
Received: from mail-pj1-f47.google.com ([209.85.216.47]:56086 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgCRJfg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Mar 2020 05:35:36 -0400
Received: by mail-pj1-f47.google.com with SMTP id mj6so1084200pjb.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2020 02:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=6+L0FIU2A+7B4LV7MqEmMouLnYI7ObBztyd+zUMY9rw=;
        b=CWRVpgxhdoN+lMWVml4YxQDkNh0vkY7jj/kRybowThG3SKIFL3YvF4GHPIbz3D63PK
         4XCb5x0AmjnnatvZDp1tL8nKnlI7IIoQRDgYZY01jHURYVLRPfGPdyLCTjqMfHKoIaKW
         lux4FfEABJbjitIuafY0bLc/gGaL5phY/kgzrpey3Ae0uxWwU06UQXBGiE4T3CnZqrrY
         oCGzEraFLkZgRKpjbzUnMxjQCA88xDfwAC75B1XZfVL0f/jLKCPU6n5CG9eaNET6cER+
         78OwZVRXTgo2mtkz0CxI3vM7qkhoWnpiyGwa03ojjXlCTRHevY0ufZce/qcswV36wmmX
         Yu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=6+L0FIU2A+7B4LV7MqEmMouLnYI7ObBztyd+zUMY9rw=;
        b=eusvjJPenJO+dGRitWHwrnX7mEDBDcYq61ASi3xq5WunsGKsX8lFExLiX6Ey+PZrbx
         FJDOhj/gLsOXqioTa43KhqBsUy9GnAUfOCgKgMF2PxFsxhTHfDjhAGCsJ+oMylOaw7Je
         GQ4Oa51Mz7f8ylxh4w4x0sIZiIOa+vwPayYdwn16maaynSnaqlrTH5PN/pI0/Z31oMx3
         Vce4DNb5FPisDc556AcdZihyzuN5IO9CFVlyzEijX8qLo6jOtrqHuyg8L1VGvZNtsVvL
         r5i4SG/6Nt9O3T2cEZ1Rx/wjjUMDLRByP+NV4/Cjvethm1HVmS0zFlFQ4hgp9Ctf4YDk
         ZKEg==
X-Gm-Message-State: ANhLgQ3Q9o04VfOP1p+gter0Idp5dPmxLv8O8CPjc7SkzK3h+muEZKOe
        2A1+j0GoyVMjH9NYgLVzMWTQqWLP
X-Google-Smtp-Source: ADFU+vudpofHWhcu10ig89GG/clY0KsX2/E3ODE/59IQoQWq37wN7ijDZ5IDnMjVnouEo4/KCdazlQ==
X-Received: by 2002:a17:90a:240a:: with SMTP id h10mr3639997pje.123.1584524134878;
        Wed, 18 Mar 2020 02:35:34 -0700 (PDT)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id y22sm6141394pfr.68.2020.03.18.02.35.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Mar 2020 02:35:33 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>, geert@glider.be
Date:   Wed, 18 Mar 2020 18:27:51 +0900
Message-Id: <158452367157.23699.16109085564905174396.sendpatchset@octo>
Subject: [PATCH/RFC] arm64: dts: renesas: salvator-common: gpio-leds prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

This patch adds support for a couple of LEDs on Salvator-X and XS boards.

I've verified that LED4, LED5 and LED6 work by exporting GPIOs for GP6_11,
GP6_12 and GP6_13 on the board on port 9011. This patch has not yet been
tested though. Also to make matters slightly more complicated, even if LEDs
might work with this patch as-is, the code in this patch is most likely not
suitable for upstream consumption. This since SW20, SW21 and SW22 are also
using the same GPIOs as the LEDs.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/boot/dts/renesas/salvator-common.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- 0001/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ work/arch/arm64/boot/dts/renesas/salvator-common.dtsi	2020-03-18 16:18:44.234040458 +0900
@@ -166,6 +166,20 @@
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led4 {
+			gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
+		};
+		led5 {
+			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+		};
+		led6 {
+			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
