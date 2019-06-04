Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC6234BC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 17:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfFDPPl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 11:15:41 -0400
Received: from sauhun.de ([88.99.104.3]:47248 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727945AbfFDPPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 11:15:41 -0400
Received: from localhost (p5486CF7A.dip0.t-ipconnect.de [84.134.207.122])
        by pokefinder.org (Postfix) with ESMTPSA id BC34C3E474D;
        Tue,  4 Jun 2019 17:15:39 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] mmc: sdhi: improve quirk descriptions
Date:   Tue,  4 Jun 2019 17:15:29 +0200
Message-Id: <20190604151530.7023-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190604151530.7023-1-wsa+renesas@sang-engineering.com>
References: <20190604151530.7023-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quirks show up in new SoCs as well, so the naming should be generic.
Describe them by what they do.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e98ba6cf6c13..1cdf5920e861 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -610,12 +610,12 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
 }
 
-static const struct renesas_sdhi_quirks sdhi_quirks_h3_m3w_es1 = {
+static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
 	.hs400_disabled = true,
 	.hs400_4taps = true,
 };
 
-static const struct renesas_sdhi_quirks sdhi_quirks_h3_es2 = {
+static const struct renesas_sdhi_quirks sdhi_quirks_4tap = {
 	.hs400_disabled = false,
 	.hs400_4taps = true,
 };
@@ -625,11 +625,11 @@ static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
 };
 
 static const struct soc_device_attribute sdhi_quirks_match[]  = {
-	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w_es1 },
-	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_es2 },
-	{ .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_h3_m3w_es1 },
-	{ .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_h3_m3w_es1 },
-	{ .soc_id = "r8a7796", .revision = "ES1.2", .data = &sdhi_quirks_h3_m3w_es1 },
+	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
+	{ .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7796", .revision = "ES1.2", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
 	{ /* Sentinel. */ },
 };
-- 
2.11.0

