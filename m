Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB5B47743C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 15:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234938AbhLPORm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 09:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237835AbhLPORl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 09:17:41 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E11C061748
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 06:17:40 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by laurent.telenet-ops.be with bizsmtp
        id X2He2600V250X30012Hez5; Thu, 16 Dec 2021 15:17:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxrZi-005QZj-Ao; Thu, 16 Dec 2021 15:17:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxrZh-009yoC-Ku; Thu, 16 Dec 2021 15:17:37 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] serial: sh-sci: Use devm_clk_get_optional()
Date:   Thu, 16 Dec 2021 15:17:34 +0100
Message-Id: <bce27288cb570952dd96b441e1af8768ad8b4870.1639663832.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639663832.git.geert+renesas@glider.be>
References: <cover.1639663832.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The sh-sci driver supports up to four input clocks, of which only the
first one is mandatory.

Replace devm_clk_get() and custom error checking by
devm_clk_get_optional(), to simplify the code and to catch all real
errors.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 5f6d85b8e3dd4173..bb3adf0a109324ca 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2779,11 +2779,11 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 		clk_names[SCI_SCK] = "hsck";
 
 	for (i = 0; i < SCI_NUM_CLKS; i++) {
-		clk = devm_clk_get(dev, clk_names[i]);
-		if (PTR_ERR(clk) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
+		clk = devm_clk_get_optional(dev, clk_names[i]);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
 
-		if (IS_ERR(clk) && i == SCI_FCK) {
+		if (!clk && i == SCI_FCK) {
 			/*
 			 * Not all SH platforms declare a clock lookup entry
 			 * for SCI devices, in which case we need to get the
@@ -2796,13 +2796,12 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 						     clk_names[i]);
 		}
 
-		if (IS_ERR(clk))
-			dev_dbg(dev, "failed to get %s (%ld)\n", clk_names[i],
-				PTR_ERR(clk));
+		if (!clk)
+			dev_dbg(dev, "failed to get %s\n", clk_names[i]);
 		else
 			dev_dbg(dev, "clk %s is %pC rate %lu\n", clk_names[i],
 				clk, clk_get_rate(clk));
-		sci_port->clks[i] = IS_ERR(clk) ? NULL : clk;
+		sci_port->clks[i] = clk;
 	}
 	return 0;
 }
-- 
2.25.1

