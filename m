Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E66C278589
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Sep 2020 13:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgIYLHR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Sep 2020 07:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgIYLHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Sep 2020 07:07:17 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BECC0613CE
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2020 04:07:16 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id YB7E2300T4C55Sk06B7EJx; Fri, 25 Sep 2020 13:07:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kLlZK-0001Hc-Dp; Fri, 25 Sep 2020 13:07:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kLlZK-0000hV-Bq; Fri, 25 Sep 2020 13:07:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Update git repo for Renesas clock drivers
Date:   Fri, 25 Sep 2020 13:07:13 +0200
Message-Id: <20200925110713.2652-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Align the clock branch name with other renesas-* branches pulled by
subsystem maintainers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v5.11.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0f796f1f00ad096..5fc2d6efc2d200d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14850,7 +14850,7 @@ RENESAS CLOCK DRIVERS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
 F:	Documentation/devicetree/bindings/clock/renesas,*
 F:	drivers/clk/renesas/
 
-- 
2.17.1

