Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55FA67D67F1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Oct 2023 12:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbjJYKKa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Oct 2023 06:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343591AbjJYKKP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Oct 2023 06:10:15 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BAD1727
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Oct 2023 03:09:49 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7faa:e55:54a:cff])
        by albert.telenet-ops.be with bizsmtp
        id 2A9l2B00E5Uc89d06A9l4f; Wed, 25 Oct 2023 12:09:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qvapW-007TBE-Kb;
        Wed, 25 Oct 2023 12:09:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qvapd-00BwGd-GL;
        Wed, 25 Oct 2023 12:09:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: renesas: iwg22d-sodimm: Fix stmpe node names
Date:   Wed, 25 Oct 2023 12:09:31 +0200
Message-Id: <40536ce7ca01e5acc9ed1d595f0e3a720eeb78d7.1698228434.git.geert+renesas@glider.be>
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

make dtbs_check:

    arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dtb: stmpe811@44: 'stmpe_touchscreen' does not match any of the regexes: 'pinctrl-[0-9]+'
	    from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
    arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dtb: stmpe811@44: 'stmpe_touchscreen' does not match any of the regexes: 'pinctrl-[0-9]+'
	    from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#

Fix this by using recommended node names for the STMicroelectronics Port
Expander (STMPE) device node and its subnode.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.8.

 arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
index c105932f642ea517..24411044ef6c4f0b 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
@@ -182,7 +182,7 @@ sgtl5000: codec@a {
 		VDDIO-supply = <&reg_3p3v>;
 	};
 
-	stmpe811@44 {
+	port-expander@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
 		interrupt-parent = <&gpio4>;
@@ -197,7 +197,7 @@ stmpe811@44 {
 		/* internal ADC reference */
 		st,ref-sel = <0>;
 
-		stmpe_touchscreen {
+		touchscreen {
 			compatible = "st,stmpe-ts";
 			/* 8 sample average control */
 			st,ave-ctrl = <3>;
-- 
2.34.1

