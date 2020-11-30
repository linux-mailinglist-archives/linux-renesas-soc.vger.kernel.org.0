Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4A22C8069
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 09:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgK3I6a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 03:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgK3I6a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 03:58:30 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6971CC0613D2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 00:57:50 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id yYxl2300R4C55Sk01YxloH; Mon, 30 Nov 2020 09:57:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kjf0D-006v1U-7H; Mon, 30 Nov 2020 09:57:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kjf0C-006wyu-PQ; Mon, 30 Nov 2020 09:57:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Cc:     Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] clk: renesas: r9a06g032: Drop __packed for portability
Date:   Mon, 30 Nov 2020 09:57:43 +0100
Message-Id: <20201130085743.1656317-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R9A06G032 clock driver uses an array of packed structures to reduce
kernel size.  However, this array contains pointers, which are no longer
aligned naturally, and cannot be relocated on PPC64.  Hence when
compile-testing this driver on PPC64 with CONFIG_RELOCATABLE=y (e.g.
PowerPC allyesconfig), the following warnings are produced:

    WARNING: 136 bad relocations
    c000000000616be3 R_PPC64_UADDR64   .rodata+0x00000000000cf338
    c000000000616bfe R_PPC64_UADDR64   .rodata+0x00000000000cf370
    ...

Fix this by dropping the __packed attribute from the r9a06g032_clkdesc
definition, trading a small size increase for portability.

This increases the 156-entry clock table by 1 byte per entry, but due to
the compiler generating more efficient code for unpacked accesses, the
net size increase is only 76 bytes (gcc 9.3.0 on arm32).

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 4c3d88526eba2143 ("clk: renesas: Renesas R9A06G032 clock driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Fix authorship.
---
 drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index d900f6bf53d0b944..892e91b92f2c80f5 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -55,7 +55,7 @@ struct r9a06g032_clkdesc {
 			u16 sel, g1, r1, g2, r2;
 		} dual;
 	};
-} __packed;
+};
 
 #define I_GATE(_clk, _rst, _rdy, _midle, _scon, _mirack, _mistat) \
 	{ .gate = _clk, .reset = _rst, \
-- 
2.25.1

