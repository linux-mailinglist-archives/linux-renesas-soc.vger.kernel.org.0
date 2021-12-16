Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7295F477438
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Dec 2021 15:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237845AbhLPORl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Dec 2021 09:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234947AbhLPORk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 09:17:40 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7B5C06173E
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Dec 2021 06:17:40 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d13f:527c:5504:a743])
        by michel.telenet-ops.be with bizsmtp
        id X2He2600G250X30062HeX9; Thu, 16 Dec 2021 15:17:38 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxrZh-005QZh-VV; Thu, 16 Dec 2021 15:17:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mxrZh-009yny-JS; Thu, 16 Dec 2021 15:17:37 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] serial: sh-sci: Drop support for "sci_ick" clock
Date:   Thu, 16 Dec 2021 15:17:32 +0100
Message-Id: <b4103e44d6ac46b6c1c264e2aeac80b39941fe74.1639663832.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639663832.git.geert+renesas@glider.be>
References: <cover.1639663832.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since commit 1b463bd51042927e ("ARM: dts: r8a7794: Rename the serial
port clock to fck") in v4.6, all upstream DTS files call the SCIF
functional clock "fck".

Hence the time is ripe to drop backward-compatibility with old DTBs that
use the old "sci_ick" name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note that such old DTBs have stopped working anyway since commit
58256143cff7c2e0 ("clk: renesas: Remove R-Car Gen2 legacy DT clock
support") in v5.5.
---
 drivers/tty/serial/sh-sci.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 88005d2fc2a00b0b..686ca1777222b1d4 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -2784,17 +2784,6 @@ static int sci_init_clocks(struct sci_port *sci_port, struct device *dev)
 			return -EPROBE_DEFER;
 
 		if (IS_ERR(clk) && i == SCI_FCK) {
-			/*
-			 * "fck" used to be called "sci_ick", and we need to
-			 * maintain DT backward compatibility.
-			 */
-			clk = devm_clk_get(dev, "sci_ick");
-			if (PTR_ERR(clk) == -EPROBE_DEFER)
-				return -EPROBE_DEFER;
-
-			if (!IS_ERR(clk))
-				goto found;
-
 			/*
 			 * Not all SH platforms declare a clock lookup entry
 			 * for SCI devices, in which case we need to get the
-- 
2.25.1

