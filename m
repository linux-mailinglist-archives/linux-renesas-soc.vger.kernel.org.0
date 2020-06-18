Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF8E1FED23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2020 10:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgFRIDb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Jun 2020 04:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728206AbgFRIDZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Jun 2020 04:03:25 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10581C061755
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2020 01:03:24 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:b57b:2191:a081:571d])
        by xavier.telenet-ops.be with bizsmtp
        id sY3N220101Jlgh201Y3NAQ; Thu, 18 Jun 2020 10:03:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlpW6-0001YP-Ro; Thu, 18 Jun 2020 10:03:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlpW6-0004Lj-Qn; Thu, 18 Jun 2020 10:03:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: sh_mmcif: Use "kHz" for kilohertz
Date:   Thu, 18 Jun 2020 10:03:21 +0200
Message-Id: <20200618080321.16678-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"K" stands for "kelvin".

While at it, make the spacing before units consistent.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mmc/host/sh_mmcif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 7e1fd557109c0476..9f53634aa41184c8 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -191,9 +191,9 @@
 				 STS2_AC12BSYTO | STS2_RSPBSYTO |	\
 				 STS2_AC12RSPTO | STS2_RSPTO)
 
-#define CLKDEV_EMMC_DATA	52000000 /* 52MHz */
-#define CLKDEV_MMC_DATA		20000000 /* 20MHz */
-#define CLKDEV_INIT		400000   /* 400 KHz */
+#define CLKDEV_EMMC_DATA	52000000 /* 52 MHz */
+#define CLKDEV_MMC_DATA		20000000 /* 20 MHz */
+#define CLKDEV_INIT		400000   /* 400 kHz */
 
 enum sh_mmcif_state {
 	STATE_IDLE,
-- 
2.17.1

