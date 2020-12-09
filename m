Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EC22D4B10
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Dec 2020 20:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387999AbgLITzA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Dec 2020 14:55:00 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:42895 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387865AbgLITzA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Dec 2020 14:55:00 -0500
X-Halon-ID: 52671fe0-3a58-11eb-a542-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 52671fe0-3a58-11eb-a542-005056917a89;
        Wed, 09 Dec 2020 20:54:18 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/5] clk: renesas: r8a77990: Add TMU clocks
Date:   Wed,  9 Dec 2020 20:53:42 +0100
Message-Id: <20201209195343.803120-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201209195343.803120-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds TMU{0,1,2,3,4} clocks.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a77990-cpg-mssr.c b/drivers/clk/renesas/r8a77990-cpg-mssr.c
index 2b97ab61d044ca07..2d172f80b34c277d 100644
--- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
@@ -124,6 +124,11 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a77990_mod_clks[] __initconst = {
+	DEF_MOD("tmu4",			 121,	R8A77990_CLK_S0D6C),
+	DEF_MOD("tmu3",			 122,	R8A77990_CLK_S3D2C),
+	DEF_MOD("tmu2",			 123,	R8A77990_CLK_S3D2C),
+	DEF_MOD("tmu1",			 124,	R8A77990_CLK_S3D2C),
+	DEF_MOD("tmu0",			 125,	R8A77990_CLK_CP),
 	DEF_MOD("scif5",		 202,	R8A77990_CLK_S3D4C),
 	DEF_MOD("scif4",		 203,	R8A77990_CLK_S3D4C),
 	DEF_MOD("scif3",		 204,	R8A77990_CLK_S3D4C),
-- 
2.29.2

