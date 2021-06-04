Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2AA39B94E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 15:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhFDNBr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 09:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhFDNBr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 09:01:47 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6BAC061761
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jun 2021 06:00:00 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:f130:bbcb:eb08:8a92])
        by michel.telenet-ops.be with bizsmtp
        id D0zr2500K2NEgeT060zrLR; Fri, 04 Jun 2021 14:59:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lp9QV-00Cebz-6V; Fri, 04 Jun 2021 14:59:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lp9QU-001tMr-Ga; Fri, 04 Jun 2021 14:59:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: renesas_sdhi: Fix HS400 on R-Car M3-W+
Date:   Fri,  4 Jun 2021 14:59:43 +0200
Message-Id: <ee8af5d631f5331139ffea714539030d97352e93.1622811525.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car M3-W ES3.0 is marketed as R-Car M3-W+ (R8A77961), and has its own
compatible value "renesas,r8a77961".

Hence using soc_device_match() with soc_id = "r8a7796" and revision =
"ES3.*" does not actually match running on an R-Car M3-W+ SoC.

Fix this by matching with soc_id = "r8a77961" instead.

Fixes: a38c078fea0b1393 ("mmc: renesas_sdhi: Avoid bad TAP in HS400")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Boot-tested on Salvator-XS with R-Car M3-W+ ES3.0.
No difference seen in eMMC/SHHC detection:

    mmc0: new HS400 MMC card at address 0001
    mmcblk0: mmc0:0001 BGSD4R 29.1 GiB
    mmcblk0boot0: mmc0:0001 BGSD4R 31.9 MiB
    mmcblk0boot1: mmc0:0001 BGSD4R 31.9 MiB
    mmcblk0rpmb: mmc0:0001 BGSD4R 4.00 MiB, chardev (247:0)
     mmcblk0: p1
    mmc1: new ultra high speed SDR104 SDHC card at address aaaa
    mmcblk1: mmc1:aaaa SL16G 14.8 GiB
     mmcblk1: p1
    mmc2: new ultra high speed SDR104 SDHC card at address aaaa
    mmcblk2: mmc2:aaaa SL32G 29.7 GiB
     mmcblk2: p1
---
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 635bf31a67359f10..b719eda6b8619453 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -939,7 +939,7 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a7795", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps2367 },
 	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
-	{ .soc_id = "r8a7796", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps1357 },
+	{ .soc_id = "r8a77961", .data = &sdhi_quirks_bad_taps1357 },
 	{ .soc_id = "r8a77965", .data = &sdhi_quirks_r8a77965 },
 	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
 	{ .soc_id = "r8a77990", .data = &sdhi_quirks_r8a77990 },
-- 
2.25.1

