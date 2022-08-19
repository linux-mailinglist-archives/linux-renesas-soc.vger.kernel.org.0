Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2515997AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Aug 2022 10:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343696AbiHSIiO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Aug 2022 04:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346630AbiHSIhi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2022 04:37:38 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEAE2F3A7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Aug 2022 01:37:14 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id 9Ld92800S4C55Sk01Ld9av; Fri, 19 Aug 2022 10:37:11 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oOxV6-001hqP-Fs; Fri, 19 Aug 2022 10:37:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oOxUN-00460i-HQ; Fri, 19 Aug 2022 10:36:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] MAINTAINERS: Merge ARM/Renesas ARM64 and ARM/SH-Mobile ARM architectures
Date:   Fri, 19 Aug 2022 10:36:22 +0200
Message-Id: <a869b8afdc47aa637ebeefcc1ca7bc61244f34b9.1660898008.git.geert+renesas@glider.be>
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

There is not much point in having separate entries for the ARM/Renesas
ARM64 and ARM/SH-Mobile ARM architectures, as they have the same
maintainers, use the same development collaboration infrastructure, and
share many files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 MAINTAINERS | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5012ba6ff98ac6..62403f303bbd86ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2650,7 +2650,7 @@ F:	arch/arm/boot/dts/rtd*
 F:	arch/arm/mach-realtek/
 F:	arch/arm64/boot/dts/realtek/
 
-ARM/RENESAS ARM64 ARCHITECTURE
+ARM/RENESAS ARCHITECTURE
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 M:	Magnus Damm <magnus.damm@gmail.com>
 L:	linux-renesas-soc@vger.kernel.org
@@ -2661,6 +2661,16 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git nex
 F:	Documentation/devicetree/bindings/arm/renesas.yaml
 F:	Documentation/devicetree/bindings/hwinfo/renesas,prr.yaml
 F:	Documentation/devicetree/bindings/soc/renesas/
+F:	arch/arm/boot/dts/emev2*
+F:	arch/arm/boot/dts/gr-peach*
+F:	arch/arm/boot/dts/iwg20d-q7*
+F:	arch/arm/boot/dts/r7s*
+F:	arch/arm/boot/dts/r8a*
+F:	arch/arm/boot/dts/r9a*
+F:	arch/arm/boot/dts/sh*
+F:	arch/arm/configs/shmobile_defconfig
+F:	arch/arm/include/debug/renesas-scif.S
+F:	arch/arm/mach-shmobile/
 F:	arch/arm64/boot/dts/renesas/
 F:	drivers/soc/renesas/
 F:	include/linux/soc/renesas/
@@ -2772,29 +2782,6 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/media/platform/samsung/s5p-mfc/
 
-ARM/SHMOBILE ARM ARCHITECTURE
-M:	Geert Uytterhoeven <geert+renesas@glider.be>
-M:	Magnus Damm <magnus.damm@gmail.com>
-L:	linux-renesas-soc@vger.kernel.org
-S:	Supported
-Q:	http://patchwork.kernel.org/project/linux-renesas-soc/list/
-C:	irc://irc.libera.chat/renesas-soc
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
-F:	Documentation/devicetree/bindings/arm/renesas.yaml
-F:	Documentation/devicetree/bindings/soc/renesas/
-F:	arch/arm/boot/dts/emev2*
-F:	arch/arm/boot/dts/gr-peach*
-F:	arch/arm/boot/dts/iwg20d-q7*
-F:	arch/arm/boot/dts/r7s*
-F:	arch/arm/boot/dts/r8a*
-F:	arch/arm/boot/dts/r9a*
-F:	arch/arm/boot/dts/sh*
-F:	arch/arm/configs/shmobile_defconfig
-F:	arch/arm/include/debug/renesas-scif.S
-F:	arch/arm/mach-shmobile/
-F:	drivers/soc/renesas/
-F:	include/linux/soc/renesas/
-
 ARM/SOCFPGA ARCHITECTURE
 M:	Dinh Nguyen <dinguyen@kernel.org>
 S:	Maintained
-- 
2.25.1

