Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1329411A88F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 11:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbfLKKFN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 05:05:13 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:43944 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbfLKKFN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 05:05:13 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id ca5B2100H5USYZQ01a5Bfp; Wed, 11 Dec 2019 11:05:11 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieyrn-0007Pv-LF; Wed, 11 Dec 2019 11:05:11 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ieyrn-0001sZ-Jl; Wed, 11 Dec 2019 11:05:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Remove ARCH_R8A7796
Date:   Wed, 11 Dec 2019 11:05:10 +0100
Message-Id: <20191211100510.7182-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All users of CONFIG_ARCH_R8A7796 have been updated to use
CONFIG_ARCH_R8A77960, so the former can be removed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.6.

 drivers/soc/renesas/Kconfig | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index f93492b72c04e237..2d10e34cdbe4d117 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -200,13 +200,9 @@ config ARCH_R8A7795
 	  This enables support for the Renesas R-Car H3 SoC.
 
 config ARCH_R8A77960
-	bool
+	bool "Renesas R-Car M3-W SoC Platform"
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77960
-
-config ARCH_R8A7796
-	bool "Renesas R-Car M3-W SoC Platform"
-	select ARCH_R8A77960
 	help
 	  This enables support for the Renesas R-Car M3-W SoC.
 
-- 
2.17.1

