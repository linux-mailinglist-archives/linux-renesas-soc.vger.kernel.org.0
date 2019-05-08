Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D44E17F25
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 19:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbfEHRd4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 13:33:56 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51907 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729018AbfEHRdz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 13:33:55 -0400
X-Originating-IP: 93.56.79.2
Received: from uno.localdomain (unknown [93.56.79.2])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2ADF31BF20A;
        Wed,  8 May 2019 17:33:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [RFC 8/9] clk: renesas: r8a7796: Add CMM clocks
Date:   Wed,  8 May 2019 19:34:27 +0200
Message-Id: <20190508173428.22054-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
References: <20190508173428.22054-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock defintions for CMM units on Renesas R-Car Gen3 M3-W.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index 12c455859f2c..6044aeda0f83 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
 	DEF_MOD("ehci1",		 702,	R8A7796_CLK_S3D4),
 	DEF_MOD("ehci0",		 703,	R8A7796_CLK_S3D4),
 	DEF_MOD("hsusb",		 704,	R8A7796_CLK_S3D4),
+	DEF_MOD("cmm2",			 709,	R8A7796_CLK_S2D1),
+	DEF_MOD("cmm1",			 710,	R8A7796_CLK_S2D1),
+	DEF_MOD("cmm0",			 711,	R8A7796_CLK_S2D1),
 	DEF_MOD("csi20",		 714,	R8A7796_CLK_CSI0),
 	DEF_MOD("csi40",		 716,	R8A7796_CLK_CSI0),
 	DEF_MOD("du2",			 722,	R8A7796_CLK_S2D1),
-- 
2.21.0

