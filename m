Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 102BC15A5BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2020 11:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729120AbgBLKIq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Feb 2020 05:08:46 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:55148 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgBLKIq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Feb 2020 05:08:46 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id 1m8Y2200i5USYZQ06m8Zgc; Wed, 12 Feb 2020 11:08:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1owa-0001Ei-RW; Wed, 12 Feb 2020 11:08:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j1owa-0000N3-Pg; Wed, 12 Feb 2020 11:08:32 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Heiko Stuebner <heiko@sntech.de>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/7] ARM: zynq: Replace <linux/clk-provider.h> by <linux/of_clk.h>
Date:   Wed, 12 Feb 2020 11:08:30 +0100
Message-Id: <20200212100830.446-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212100830.446-1-geert+renesas@glider.be>
References: <20200212100830.446-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Zynq platform code is not a clock provider, and just needs to call
of_clk_init().

Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-zynq/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-zynq/common.c b/arch/arm/mach-zynq/common.c
index 3a4248fd796281c3..a9dd2f71cd19d2a9 100644
--- a/arch/arm/mach-zynq/common.c
+++ b/arch/arm/mach-zynq/common.c
@@ -12,10 +12,10 @@
 #include <linux/cpumask.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
-#include <linux/clk-provider.h>
 #include <linux/clk/zynq.h>
 #include <linux/clocksource.h>
 #include <linux/of_address.h>
+#include <linux/of_clk.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/of.h>
-- 
2.17.1

