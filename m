Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453722DE2F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 13:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgLRMxj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 07:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgLRMxi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 07:53:38 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87582C061282
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Dec 2020 04:52:58 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id 5osu2400Y4C55Sk01osuC8; Fri, 18 Dec 2020 13:52:55 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kqFFe-00Bgl9-IK; Fri, 18 Dec 2020 13:52:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kqFFd-00G0f3-VQ; Fri, 18 Dec 2020 13:52:53 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: vc5: Use "idt,voltage-microvolt" instead of "idt,voltage-microvolts"
Date:   Fri, 18 Dec 2020 13:52:53 +0100
Message-Id: <20201218125253.3815567-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Commit 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to
yaml") accidentally changed "idt,voltage-microvolts" to
"idt,voltage-microvolt" in the DT bindings, while the driver still used
the former.

Update the driver to match the bindings, as
Documentation/devicetree/bindings/property-units.txt actually recommends
using "microvolt".

Fixes: 260249f929e81d3d ("clk: vc5: Enable addition output configurations of the Versaclock")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
There are no upstream users yet, but they are planned for v5.12, so I
think this should be in v5.11-rc1.

Thanks!
---
 drivers/clk/clk-versaclock5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index c90460e7ef2153fe..43db67337bc06824 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -739,8 +739,8 @@ static int vc5_update_power(struct device_node *np_output,
 {
 	u32 value;
 
-	if (!of_property_read_u32(np_output,
-				  "idt,voltage-microvolts", &value)) {
+	if (!of_property_read_u32(np_output, "idt,voltage-microvolt",
+				  &value)) {
 		clk_out->clk_output_cfg0_mask |= VC5_CLK_OUTPUT_CFG0_PWR_MASK;
 		switch (value) {
 		case 1800000:
-- 
2.25.1

