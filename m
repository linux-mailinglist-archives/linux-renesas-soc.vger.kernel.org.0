Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE7637652
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 16:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfFFOVy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 10:21:54 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:55669 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728889AbfFFOVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 10:21:51 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 92C6D20011;
        Thu,  6 Jun 2019 14:21:47 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/20] clk: renesas: r8a77965: Add CMM clocks
Date:   Thu,  6 Jun 2019 16:22:06 +0200
Message-Id: <20190606142220.1392-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock definitions for CMM units on Renesas R-Car Gen3 M3-N.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index eb1cca58a1e1..58f75b03c8bb 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -178,6 +178,9 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("ehci1",		702,	R8A77965_CLK_S3D4),
 	DEF_MOD("ehci0",		703,	R8A77965_CLK_S3D4),
 	DEF_MOD("hsusb",		704,	R8A77965_CLK_S3D4),
+	DEF_MOD("cmm3",			708,	R8A77965_CLK_S2D1),
+	DEF_MOD("cmm1",			710,	R8A77965_CLK_S2D1),
+	DEF_MOD("cmm0",			711,	R8A77965_CLK_S2D1),
 	DEF_MOD("csi20",		714,	R8A77965_CLK_CSI0),
 	DEF_MOD("csi40",		716,	R8A77965_CLK_CSI0),
 	DEF_MOD("du3",			721,	R8A77965_CLK_S2D1),
-- 
2.21.0

