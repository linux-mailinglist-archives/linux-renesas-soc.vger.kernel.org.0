Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91949416C16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 08:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244198AbhIXGwE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 02:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244182AbhIXGwD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 02:52:03 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5830C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Sep 2021 23:50:30 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:5dd8:9bc4:3752:5710])
        by andre.telenet-ops.be with bizsmtp
        id xiqS2500C2gynNa01iqS61; Fri, 24 Sep 2021 08:50:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mTf2Q-008VH7-3j; Fri, 24 Sep 2021 08:50:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mTf2P-007KxW-Cm; Fri, 24 Sep 2021 08:50:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>, Adam Ford <aford173@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: beacon: Fix Ethernet PHY mode
Date:   Fri, 24 Sep 2021 08:50:23 +0200
Message-Id: <2a4c15b2df23bb63f15abf9dfb88860477f4f523.1632465965.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While networking works fine in RGMII mode when using the Linux generic
PHY driver, it fails when using the Atheros PHY driver.
Fix this by correcting the Ethernet PHY mode to RGMII-RXID, which works
fine with both drivers.

Fixes: a5200e63af57d05e ("arm64: dts: renesas: rzg2: Convert EtherAVB to explicit delay handling")
Reported-by: Adam Ford <aford173@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.16.

 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 9a1560d41ccf4d2d..a28d5ee007152a79 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -50,6 +50,7 @@ wlan_pwrseq: wlan_pwrseq {
 &avb {
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
+	phy-mode = "rgmii-rxid";
 	phy-handle = <&phy0>;
 	rx-internal-delay-ps = <1800>;
 	tx-internal-delay-ps = <2000>;
-- 
2.25.1

