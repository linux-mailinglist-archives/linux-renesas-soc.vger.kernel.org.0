Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A809F3B1093
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 01:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhFVX3f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 19:29:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhFVX3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 19:29:34 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95FBFBB0;
        Wed, 23 Jun 2021 01:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624404436;
        bh=F96kJcXg5MDZNRxtRyxTyBx7NhtVXXdOczgtpqetwGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N49aWNSAjVYB1qsftkUQCZDTgY+jhmYBXNti9aKhSmVkPA6kZZex5rClvomGnJPTB
         npylel3EzopVQszQn++aqc/AJDkkqDX31S6/FJYP61zO85fzqAQKwSbFC0mtJ5d6Wu
         V/bqceEy52c/QqWjH4MhhRSUGnNfZ18N8ERUJcok=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] clk: renesas: r8a779a0: Add the DSI clocks
Date:   Wed, 23 Jun 2021 00:27:11 +0100
Message-Id: <20210622232711.3219697-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622232711.3219697-1-kieran.bingham@ideasonboard.com>
References: <20210622232711.3219697-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DSI clock is incorrectly defined as a fixed clock. This
demonstrates itself as the dsi-encoders failing to correctly enable and
start their PPI and HS clocks internally, and causes failures.

Move the DSI parent clock to match the updates in the BSP, which
resolves the initialisation procedures.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index a1bd158defb5..f16d125ca009 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -135,7 +135,6 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_FIXED("zt",		R8A779A0_CLK_ZT,	CLK_PLL1_DIV2,	2, 1),
 	DEF_FIXED("ztr",	R8A779A0_CLK_ZTR,	CLK_PLL1_DIV2,	2, 1),
 	DEF_FIXED("zr",		R8A779A0_CLK_ZR,	CLK_PLL1_DIV2,	1, 1),
-	DEF_FIXED("dsi",	R8A779A0_CLK_DSI,	CLK_PLL5_DIV4,	1, 1),
 	DEF_FIXED("cnndsp",	R8A779A0_CLK_CNNDSP,	CLK_PLL5_DIV4,	1, 1),
 	DEF_FIXED("vip",	R8A779A0_CLK_VIP,	CLK_PLL5,	5, 1),
 	DEF_FIXED("adgh",	R8A779A0_CLK_ADGH,	CLK_PLL5_DIV4,	1, 1),
@@ -151,6 +150,7 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_DIV6P1("mso",	R8A779A0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
 	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
 	DEF_DIV6P1("csi0",	R8A779A0_CLK_CSI0,	CLK_PLL5_DIV4,	0x880),
+	DEF_DIV6P1("dsi",	R8A779A0_CLK_DSI,	CLK_PLL5_DIV4,	0x884),
 
 	DEF_OSC("osc",		R8A779A0_CLK_OSC,	CLK_EXTAL,	8),
 	DEF_MDSEL("r",		R8A779A0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
@@ -168,6 +168,8 @@ static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
 	DEF_MOD("csi42",	401,	R8A779A0_CLK_CSI0),
 	DEF_MOD("csi43",	402,	R8A779A0_CLK_CSI0),
 	DEF_MOD("du",		411,	R8A779A0_CLK_S3D1),
+	DEF_MOD("dsi0",		415,	R8A779A0_CLK_DSI),
+	DEF_MOD("dsi1",		416,	R8A779A0_CLK_DSI),
 	DEF_MOD("fcpvd0",	508,	R8A779A0_CLK_S3D1),
 	DEF_MOD("fcpvd1",	509,	R8A779A0_CLK_S3D1),
 	DEF_MOD("hscif0",	514,	R8A779A0_CLK_S1D2),
-- 
2.30.2

