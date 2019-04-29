Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E43ADF93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 11:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727757AbfD2Jgx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 05:36:53 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:36622 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbfD2Jgm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:36:42 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id 69cd200063XaVaC019cdzc; Mon, 29 Apr 2019 11:36:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL2iD-0000wk-4u; Mon, 29 Apr 2019 11:36:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL2iD-0002p8-3i; Mon, 29 Apr 2019 11:36:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] soc: renesas: Enable RZ/A1 IRQC on RZ/A1H
Date:   Mon, 29 Apr 2019 11:36:29 +0200
Message-Id: <20190429093631.10799-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429093631.10799-1-geert+renesas@glider.be>
References: <20190429093631.10799-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Auto-enable the RZ/A1 Interrupt Controller when configuring a kernel
with support for RZ/A1H SoCs.

This is similar to how interrupt controllers for other Renesas SoCs are
enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 68bfca6f20ddf8a7..1448b6dbcdb20bae 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -57,6 +57,7 @@ config ARCH_R7S72100
 	bool "RZ/A1H (R7S72100)"
 	select PM
 	select PM_GENERIC_DOMAINS
+	select RENESAS_RZA1_IRQC
 	select SYS_SUPPORTS_SH_MTU2
 	select RENESAS_OSTM
 
-- 
2.17.1

