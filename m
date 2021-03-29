Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F5D34DBF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Mar 2021 00:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhC2WeY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 18:34:24 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:34785 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233659AbhC2WdG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 18:33:06 -0400
X-Halon-ID: b57213cf-90de-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id b57213cf-90de-11eb-a542-005056917a89;
        Tue, 30 Mar 2021 00:33:02 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clk: renesas: r8a779a0: Add ISPCS clocks
Date:   Tue, 30 Mar 2021 00:32:20 +0200
Message-Id: <20210329223220.1139211-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the ISPCS clocks on V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 867c565cb58ff5b5..acaf5a93f1d3ed45 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -180,6 +180,10 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("i2c4",		522,	R8A779A0_CLK_S1D4),
 	DEF_MOD("i2c5",		523,	R8A779A0_CLK_S1D4),
 	DEF_MOD("i2c6",		524,	R8A779A0_CLK_S1D4),
+	DEF_MOD("ispcs0",	612,	R8A779A0_CLK_S1D1),
+	DEF_MOD("ispcs1",	613,	R8A779A0_CLK_S1D1),
+	DEF_MOD("ispcs2",	614,	R8A779A0_CLK_S1D1),
+	DEF_MOD("ispcs3",	615,	R8A779A0_CLK_S1D1),
 	DEF_MOD("msi0",		618,	R8A779A0_CLK_MSO),
 	DEF_MOD("msi1",		619,	R8A779A0_CLK_MSO),
 	DEF_MOD("msi2",		620,	R8A779A0_CLK_MSO),
-- 
2.31.1

