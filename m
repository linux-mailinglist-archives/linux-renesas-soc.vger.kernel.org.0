Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10931310BC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Feb 2021 14:28:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhBENZr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Feb 2021 08:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhBENWf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Feb 2021 08:22:35 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F86C061797
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Feb 2021 05:21:47 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id RRMj240174C55Sk01RMjYR; Fri, 05 Feb 2021 14:21:47 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l813P-003Nie-Fk; Fri, 05 Feb 2021 14:21:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l813O-0083Wi-Si; Fri, 05 Feb 2021 14:21:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: rmobile-sysc: Remove unneeded platform includes
Date:   Fri,  5 Feb 2021 14:21:41 +0100
Message-Id: <20210205132141.1920137-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As of commit b587288001f05c0e ("ARM: shmobile: R-Mobile: Remove legacy
PM Domain code"), the R-Mobile System Controller driver no longer
handles the adding of platform devices to PM Domains, but delegates that
to the PM Domain core code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.13.

 drivers/soc/renesas/rmobile-sysc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
index 9046b8c933cbe031..bf64d052f9245db5 100644
--- a/drivers/soc/renesas/rmobile-sysc.c
+++ b/drivers/soc/renesas/rmobile-sysc.c
@@ -14,8 +14,6 @@
 #include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_platform.h>
-#include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
-- 
2.25.1

