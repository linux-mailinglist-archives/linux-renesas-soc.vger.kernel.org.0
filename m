Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E773D6B7528
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Mar 2023 12:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjCMLE2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Mar 2023 07:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjCMLE1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2023 07:04:27 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3A3EC67
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2023 04:04:24 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:7ed1:e2c6:b94:264a])
        by baptiste.telenet-ops.be with bizsmtp
        id Xn4N2900N01Vtj801n4NDn; Mon, 13 Mar 2023 12:04:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pbfxx-00C3Jo-4B;
        Mon, 13 Mar 2023 12:04:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pbfyY-008cgW-HI;
        Mon, 13 Mar 2023 12:04:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Update CAN-FD to R-Car Gen4 compatible value
Date:   Mon, 13 Mar 2023 12:04:21 +0100
Message-Id: <9823058fa57156e88a084a4a99fc8525af1686ff.1678705389.git.geert+renesas@glider.be>
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

Despite the name, R-Car V3U is the first member of the R-Car Gen4
family.  Hence update the compatible property in the CAN-FD device node
to include the family-specific compatible value for R-Car Gen4.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel-for-v6.4.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index f04792baef809b9f..7925341a69c8361c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -606,7 +606,8 @@ hscif3: serial@e66a0000 {
 		};
 
 		canfd: can@e6660000 {
-			compatible = "renesas,r8a779a0-canfd";
+			compatible = "renesas,r8a779a0-canfd",
+				     "renesas,rcar-gen4-canfd";
 			reg = <0 0xe6660000 0 0x8000>;
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

