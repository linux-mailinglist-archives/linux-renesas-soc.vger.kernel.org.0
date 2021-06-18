Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB503ACA5F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 13:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234100AbhFRLsh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 07:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbhFRLsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 07:48:37 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF8FC06175F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Jun 2021 04:46:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:104a:f93d:b771:fc40])
        by baptiste.telenet-ops.be with bizsmtp
        id JbmQ2500i47PYg101bmQ7t; Fri, 18 Jun 2021 13:46:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1luCx6-000yzX-Cy; Fri, 18 Jun 2021 13:46:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1luCx5-007L69-NF; Fri, 18 Jun 2021 13:46:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rzg2: Rename i2c-dvfs to iic-pmic
Date:   Fri, 18 Jun 2021 13:46:21 +0200
Message-Id: <3e549b41989ff2797b998a1c749c9f607845f44a.1624016693.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As RZ/G2 SoCs do not support DVFS, the "iic-dvfs" module was renamed to
"iic-pmic" in the RZ/G Series, 2nd Generation User’s Manual: Hardware
Rev. 1.00.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v5.15.

 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a774c0-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a774e1-cpg-mssr.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index 4a43ebec7d5e297e..39b185d8e95745f4 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -210,7 +210,7 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
 	DEF_MOD("rpc-if",		 917,	R8A774A1_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774A1_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A774A1_CLK_S0D6),
-	DEF_MOD("i2c-dvfs",		 926,	R8A774A1_CLK_CP),
+	DEF_MOD("iic-pmic",		 926,	R8A774A1_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A774A1_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A774A1_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A774A1_CLK_S3D2),
diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
index 6f04c40fe237a255..af602d83c8ceeb91 100644
--- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
@@ -206,7 +206,7 @@ static const struct mssr_mod_clk r8a774b1_mod_clks[] __initconst = {
 	DEF_MOD("rpc-if",		 917,	R8A774B1_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774B1_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A774B1_CLK_S0D6),
-	DEF_MOD("i2c-dvfs",		 926,	R8A774B1_CLK_CP),
+	DEF_MOD("iic-pmic",		 926,	R8A774B1_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A774B1_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A774B1_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A774B1_CLK_S3D2),
diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
index ed3a2cf0e0bb26d2..5b938eb2df255afb 100644
--- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
@@ -210,7 +210,7 @@ static const struct mssr_mod_clk r8a774c0_mod_clks[] __initconst = {
 	DEF_MOD("rpc-if",		 917,	R8A774C0_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774C0_CLK_S3D2),
 	DEF_MOD("i2c5",			 919,	R8A774C0_CLK_S3D2),
-	DEF_MOD("i2c-dvfs",		 926,	R8A774C0_CLK_CP),
+	DEF_MOD("iic-pmic",		 926,	R8A774C0_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A774C0_CLK_S3D2),
 	DEF_MOD("i2c3",			 928,	R8A774C0_CLK_S3D2),
 	DEF_MOD("i2c2",			 929,	R8A774C0_CLK_S3D2),
diff --git a/drivers/clk/renesas/r8a774e1-cpg-mssr.c b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
index b96c486abb448003..40c71466df37bd96 100644
--- a/drivers/clk/renesas/r8a774e1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774e1-cpg-mssr.c
@@ -219,7 +219,7 @@ static const struct mssr_mod_clk r8a774e1_mod_clks[] __initconst = {
 	DEF_MOD("i2c6",			 918,	R8A774E1_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A774E1_CLK_S0D6),
 	DEF_MOD("adg",			 922,	R8A774E1_CLK_S0D1),
-	DEF_MOD("i2c-dvfs",		 926,	R8A774E1_CLK_CP),
+	DEF_MOD("iic-pmic",		 926,	R8A774E1_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A774E1_CLK_S0D6),
 	DEF_MOD("i2c3",			 928,	R8A774E1_CLK_S0D6),
 	DEF_MOD("i2c2",			 929,	R8A774E1_CLK_S3D2),
-- 
2.25.1

