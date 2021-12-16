Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80F7547743F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 15:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234976AbhLPORm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 09:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237834AbhLPORl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 09:17:41 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C5EC061747
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 06:17:40 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by michel.telenet-ops.be with bizsmtp
        id X2He2600j250X30062HeXH; Thu, 16 Dec 2021 15:17:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxrZi-005QZi-9M; Thu, 16 Dec 2021 15:17:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxrZh-009yo4-K7; Thu, 16 Dec 2021 15:17:37 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] serial: sh-sci: Use dev_err_probe()
Date:   Thu, 16 Dec 2021 15:17:33 +0100
Message-Id: <5c4dd8df1f8d0d14786f26ee80b77f3eb8e06cd5.1639663832.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639663832.git.geert+renesas@glider.be>
References: <cover.1639663832.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the dev_err_probe() helper to streamline error handling.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 686ca1777222b1d4..5f6d85b8e3dd4173 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2790,15 +2790,12 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 			 * global "peripheral_clk" clock.
 			 */
 			clk = devm_clk_get(dev, "peripheral_clk");
-			if (!IS_ERR(clk))
-				goto found;
-
-			dev_err(dev, "failed to get %s (%ld)\n", clk_names[i],
-				PTR_ERR(clk));
-			return PTR_ERR(clk);
+			if (IS_ERR(clk))
+				return dev_err_probe(dev, PTR_ERR(clk),
+						     "failed to get %s\n",
+						     clk_names[i]);
 		}
 
-found:
 		if (IS_ERR(clk))
 			dev_dbg(dev, "failed to get %s (%ld)\n", clk_names[i],
 				PTR_ERR(clk));
-- 
2.25.1

