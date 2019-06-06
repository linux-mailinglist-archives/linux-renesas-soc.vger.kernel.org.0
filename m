Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C428B37307
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 13:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfFFLfv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 07:35:51 -0400
Received: from sauhun.de ([88.99.104.3]:33856 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727368AbfFFLfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 07:35:51 -0400
Received: from localhost (p5486CDEB.dip0.t-ipconnect.de [84.134.205.235])
        by pokefinder.org (Postfix) with ESMTPSA id 563453E43B5;
        Thu,  6 Jun 2019 13:35:49 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/3] mmc: sdhi: improve quirk descriptions
Date:   Thu,  6 Jun 2019 13:35:36 +0200
Message-Id: <20190606113537.8869-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
References: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quirks show up in new SoCs as well, so the naming should be generic.
Describe them by what they do.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 683c449a2f94..24857ced9f2e 100644
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
@@ -625,10 +625,10 @@ static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
 };
 
 static const struct soc_device_attribute sdhi_quirks_match[]  = {
-	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w_es1 },
-	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_es2 },
-	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_h3_m3w_es1 },
-	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_h3_m3w_es1 },
+	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
+	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
 	{ /* Sentinel. */ },
 };
-- 
2.11.0

