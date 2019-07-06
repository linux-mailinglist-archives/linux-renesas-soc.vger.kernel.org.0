Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 155466110D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Jul 2019 16:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfGFOH7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 6 Jul 2019 10:07:59 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:48599 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbfGFOG4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 6 Jul 2019 10:06:56 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 84F72C0004;
        Sat,  6 Jul 2019 14:06:52 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 05/19] clk: renesas: r8a7795: Add CMM clocks
Date:   Sat,  6 Jul 2019 16:07:32 +0200
Message-Id: <20190706140746.29132-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock definitions for CMM units on Renesas R-Car Gen3 H3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 9e9a6f2c31e8..d55b1d9c8f72 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -201,6 +201,10 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("ehci0",		 703,	R8A7795_CLK_S3D2),
 	DEF_MOD("hsusb",		 704,	R8A7795_CLK_S3D2),
 	DEF_MOD("hsusb3",		 705,	R8A7795_CLK_S3D2),
+	DEF_MOD("cmm3",			 708,	R8A7795_CLK_S2D1),
+	DEF_MOD("cmm2",			 709,	R8A7795_CLK_S2D1),
+	DEF_MOD("cmm1",			 710,	R8A7795_CLK_S2D1),
+	DEF_MOD("cmm0",			 711,	R8A7795_CLK_S2D1),
 	DEF_MOD("csi21",		 713,	R8A7795_CLK_CSI0), /* ES1.x */
 	DEF_MOD("csi20",		 714,	R8A7795_CLK_CSI0),
 	DEF_MOD("csi41",		 715,	R8A7795_CLK_CSI0),
-- 
2.21.0

