Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD288979CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 14:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbfHUMqI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 08:46:08 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:40716 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbfHUMqH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 08:46:07 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id rom32000L05gfCL06om3Dn; Wed, 21 Aug 2019 14:46:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i0Q03-0003dz-LK; Wed, 21 Aug 2019 14:46:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i0Q03-0007df-KC; Wed, 21 Aug 2019 14:46:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] soc: renesas: Enable ARM_ERRATA_814220 for affected Cortex-A7
Date:   Wed, 21 Aug 2019 14:46:00 +0200
Message-Id: <20190821124602.29317-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821124602.29317-1-geert+renesas@glider.be>
References: <20190821124602.29317-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

ARM Erratum 814220 affects Cortex-A7 revisions r0p2-r0p5.

Enable automatically support to mitigate the erratum when compiling a
kernel for any of the affected Renesas SoCs:
  - R-Mobile APE6: r0p2,
  - RZ/G1E: r0p5,
  - RZ/G1C: r0p5,
  - R-Car H2: r0p3,
  - R-Car E2: r0p5,
  - RZ/N1: r0p5.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 2bbf49e5d441808b..a72d014ea37cc788 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -72,6 +72,7 @@ config ARCH_R8A73A4
 	bool "R-Mobile APE6 (R8A73A40)"
 	select ARCH_RMOBILE
 	select ARM_ERRATA_798181 if SMP
+	select ARM_ERRATA_814220
 	select HAVE_ARM_ARCH_TIMER
 	select RENESAS_IRQC
 
@@ -95,11 +96,13 @@ config ARCH_R8A7744
 config ARCH_R8A7745
 	bool "RZ/G1E (R8A77450)"
 	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_814220
 	select SYSC_R8A7745
 
 config ARCH_R8A77470
 	bool "RZ/G1C (R8A77470)"
 	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_814220
 	select SYSC_R8A77470
 
 config ARCH_R8A7778
@@ -117,6 +120,7 @@ config ARCH_R8A7790
 	bool "R-Car H2 (R8A77900)"
 	select ARCH_RCAR_GEN2
 	select ARM_ERRATA_798181 if SMP
+	select ARM_ERRATA_814220
 	select I2C
 	select SYSC_R8A7790
 
@@ -143,11 +147,13 @@ config ARCH_R8A7793
 config ARCH_R8A7794
 	bool "R-Car E2 (R8A77940)"
 	select ARCH_RCAR_GEN2
+	select ARM_ERRATA_814220
 	select SYSC_R8A7794
 
 config ARCH_R9A06G032
 	bool "RZ/N1D (R9A06G032)"
 	select ARCH_RZN1
+	select ARM_ERRATA_814220
 
 config ARCH_SH73A0
 	bool "SH-Mobile AG5 (R8A73A00)"
-- 
2.17.1

