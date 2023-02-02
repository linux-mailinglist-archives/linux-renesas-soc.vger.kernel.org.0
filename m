Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A94687ADD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Feb 2023 11:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbjBBKwC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Feb 2023 05:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232695AbjBBKvz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Feb 2023 05:51:55 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627A1885DC
        for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Feb 2023 02:51:26 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:f3de:d156:24ca:e691])
        by baptiste.telenet-ops.be with bizsmtp
        id GArG2900d1R5m7k01ArGXL; Thu, 02 Feb 2023 11:51:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pNXBF-0082po-RT;
        Thu, 02 Feb 2023 11:51:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pNXBU-001oaT-Lw;
        Thu, 02 Feb 2023 11:51:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Nam Nguyen <nam.nguyen.yh@renesas.com>,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: v3hsk: Add clock-skew for GEther's Micrel PHY
Date:   Thu,  2 Feb 2023 11:51:12 +0100
Message-Id: <39ab4e92d2242e1d7e83db92f91fc6e0e7e76c47.1675334998.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Nam Nguyen <nam.nguyen.yh@renesas.com>

Add the missing clock-skew property for the GEther's Micrel KSZ9031 PHY.

Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware, but it matches similar boards like
Condor and V3MSK.

To be queued in renesas-devel for v6.4.
---
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
index d168b0e7747d3494..77d22df25fffac6d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
@@ -122,6 +122,7 @@ &gether {
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0022.1622",
 			     "ethernet-phy-ieee802.3-c22";
+		rxc-skew-ps = <1500>;
 		reg = <0>;
 		interrupt-parent = <&gpio4>;
 		interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
-- 
2.34.1

