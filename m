Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB39B332BB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Mar 2021 17:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhCIQPF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Mar 2021 11:15:05 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:58624 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbhCIQOr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Mar 2021 11:14:47 -0500
X-Halon-ID: 8fb5b941-80f2-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 8fb5b941-80f2-11eb-b73f-0050569116f7;
        Tue, 09 Mar 2021 17:14:45 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] clk: renesas: r8a779a0: Add CL16M clock
Date:   Tue,  9 Mar 2021 17:14:14 +0100
Message-Id: <20210309161415.2592105-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309161415.2592105-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210309161415.2592105-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Implement support for the CL16M clock on V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       | 2 ++
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index f23fe9d5e5e1c7a3..52452eff1fbed169 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -147,6 +147,8 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 
 	DEF_SD("sd0",		R8A779A0_CLK_SD0,	CLK_SDSRC,	0x870),
 
+	DEF_FIXED("cl16m",	R8A779A0_CLK_CL16M,	CLK_PLL1_DIV2,	64, 1),
+
 	DEF_DIV6P1("mso",	R8A779A0_CLK_MSO,	CLK_PLL5_DIV4,	0x87c),
 	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
 	DEF_DIV6P1("csi0",	R8A779A0_CLK_CSI0,	CLK_PLL5_DIV4,	0x880),
diff --git a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
index f1d737ca7ca1a7ca..2974dc6035f7b936 100644
--- a/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a779a0-cpg-mssr.h
@@ -51,5 +51,6 @@
 #define R8A779A0_CLK_CBFUSA		40
 #define R8A779A0_CLK_R			41
 #define R8A779A0_CLK_OSC		42
+#define R8A779A0_CLK_CL16M		43
 
 #endif /* __DT_BINDINGS_CLOCK_R8A779A0_CPG_MSSR_H__ */
-- 
2.30.1

