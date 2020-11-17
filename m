Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7572B5B7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 10:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgKQJDh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 04:03:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgKQJDf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 04:03:35 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995C9C061A47
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 01:03:34 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id tM3X230014C55Sk01M3Xra; Tue, 17 Nov 2020 10:03:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kewte-003A6O-PC
        for linux-renesas-soc@vger.kernel.org; Tue, 17 Nov 2020 10:03:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kewte-008vq6-0q
        for linux-renesas-soc@vger.kernel.org; Tue, 17 Nov 2020 10:03:30 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 2/4] clk: renesas: r8a779a0: Add MSIOF clocks
Date:   Tue, 17 Nov 2020 10:03:27 +0100
Message-Id: <20201117090329.2128904-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117090329.2128904-1-geert+renesas@glider.be>
References: <20201117090329.2128904-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the module clocks used by the Clock-Synchronized Serial Interface
with FIFO (MSIOF) instances on the Renesas R-Car V3U (r8a779a0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index efecb87065adeff2..c4aa561bb01152df 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -152,6 +152,12 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("csi41",	400,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi43",	402,	R8A779A0_CLK_CSI0),
+	DEF_MOD("msi0",		618,	R8A779A0_CLK_MSO),
+	DEF_MOD("msi1",		619,	R8A779A0_CLK_MSO),
+	DEF_MOD("msi2",		620,	R8A779A0_CLK_MSO),
+	DEF_MOD("msi3",		621,	R8A779A0_CLK_MSO),
+	DEF_MOD("msi4",		622,	R8A779A0_CLK_MSO),
+	DEF_MOD("msi5",		623,	R8A779A0_CLK_MSO),
 	DEF_MOD("scif0",	702,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif1",	703,	R8A779A0_CLK_S1D8),
 	DEF_MOD("scif3",	704,	R8A779A0_CLK_S1D8),
-- 
2.25.1

