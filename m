Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC03254F476
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 11:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233270AbiFQJhH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jun 2022 05:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380539AbiFQJhG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jun 2022 05:37:06 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E999F67D36
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jun 2022 02:37:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:100b:81f8:e79f:4643])
        by andre.telenet-ops.be with bizsmtp
        id k9d22700U2Lt3zn019d2PN; Fri, 17 Jun 2022 11:37:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o28PW-004P8s-4r; Fri, 17 Jun 2022 11:37:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o28PV-008vxA-5O; Fri, 17 Jun 2022 11:37:01 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779m8: Drop operating points above 1.5 GHz
Date:   Fri, 17 Jun 2022 11:36:58 +0200
Message-Id: <aeb4530f7fbac8329b334dcb169382c836a5f32d.1655458564.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The highest-performance mode for the Cortex-A57 CPU cores supported on
R-Car H3Ne (R8A779M8) is the Power Optimized (1.5 GHz) mode.  The Normal
(1.6 GHz) and High Performance (1.7 GHz) modes are not supported.

Hence drop the "turbo-mode" entries from the operating points table
inherited from r8a77951.dtsi.

Fixes: 6e87525d751fac57 ("arm64: dts: renesas: Add Renesas R8A779M8 SoC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The same is true for R-Car H3-N, but we do not have a separate .dtsi
for R-Car H3-N yet, as it uses the same part number (R8A77951) and
compatible values (r8a7795-based) as R-Car H3.

To be queued in renesas-devel for v5.20.
---
 arch/arm64/boot/dts/renesas/r8a779m8.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779m8.dtsi b/arch/arm64/boot/dts/renesas/r8a779m8.dtsi
index 752440b0c40f7c22..750bd8ccdb7f1947 100644
--- a/arch/arm64/boot/dts/renesas/r8a779m8.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779m8.dtsi
@@ -10,3 +10,8 @@
 / {
 	compatible = "renesas,r8a779m8", "renesas,r8a7795";
 };
+
+&cluster0_opp {
+	/delete-node/ opp-1600000000;
+	/delete-node/ opp-1700000000;
+};
-- 
2.25.1

