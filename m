Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113E112350F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 19:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbfLQSiq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 13:38:46 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:34176 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbfLQSiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 13:38:46 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id f6ei2100J5USYZQ016eiFX; Tue, 17 Dec 2019 19:38:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-0003aT-NN; Tue, 17 Dec 2019 19:38:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihHk2-000089-Ls; Tue, 17 Dec 2019 19:38:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] soc: renesas: Add ARCH_R8A7795[01] for existing R-Car H3
Date:   Tue, 17 Dec 2019 19:38:41 +0100
Message-Id: <20191217183841.432-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217183841.432-1-geert+renesas@glider.be>
References: <20191217183841.432-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Despite using the same compatible values ("r8a7795"-based) because of
historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
(R8A77951) are really different SoCs, with different part numbers.

Reflect this in the SoC configuration, by adding CONFIG_ARCH_R8A77950
and CONFIG_ARCH_R8A77951 as new config symbols.  These are intended to
replace CONFIG_ARCH_R8A7795, and will allow making support for early SoC
revisions optional.

Note that for now, CONFIG_ARCH_R8A7795 is retained, and just selects
CONFIG_ARCH_R8A77950 and CONFIG_ARCH_R8A77951.  This relaxes
dependencies of other subsystems on the SoC configuration symbol, and
provides a smooth transition path for config files through "make
oldconfig".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 2d10e34cdbe4d117..ba2b8b51d2d986f1 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -192,8 +192,16 @@ config ARCH_R8A774C0
 	help
 	  This enables support for the Renesas RZ/G2E SoC.
 
+config ARCH_R8A77950
+	bool
+
+config ARCH_R8A77951
+	bool
+
 config ARCH_R8A7795
 	bool "Renesas R-Car H3 SoC Platform"
+	select ARCH_R8A77950
+	select ARCH_R8A77951
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A7795
 	help
-- 
2.17.1

