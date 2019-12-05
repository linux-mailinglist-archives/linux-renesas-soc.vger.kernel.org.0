Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6711141D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 14:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729528AbfLENny (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 08:43:54 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:33642 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729426AbfLENny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 08:43:54 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id aDjs210065USYZQ01Djs1F; Thu, 05 Dec 2019 14:43:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrQ8-0002BI-09; Thu, 05 Dec 2019 14:43:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrQ7-0001gI-UO; Thu, 05 Dec 2019 14:43:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] mmc: renesas_sdhi_internal_dmac: Add r8a77961 support
Date:   Thu,  5 Dec 2019 14:43:49 +0100
Message-Id: <20191205134349.6410-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205134349.6410-1-geert+renesas@glider.be>
References: <20191205134349.6410-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the R-Car M3-W+ (R8A77961) SoC to the whitelist of supported
devices.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not needed if "[PATCH] mmc: renesas_sdhi: remove whitelist for internal
DMAC"[1] makes it in first.

[1] https://lore.kernel.org/linux-mmc/20191203194859.917-1-wsa@the-dreams.de/
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 18839a10594c6e23..d5a878eff9607c64 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -313,6 +313,7 @@ static const struct soc_device_attribute soc_whitelist[] = {
 	{ .soc_id = "r8a77470" },
 	{ .soc_id = "r8a7795" },
 	{ .soc_id = "r8a7796" },
+	{ .soc_id = "r8a77961" },
 	{ .soc_id = "r8a77965" },
 	{ .soc_id = "r8a77970" },
 	{ .soc_id = "r8a77980" },
-- 
2.17.1

