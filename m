Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF32B59EFA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2019 17:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfF1Pez (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jun 2019 11:34:55 -0400
Received: from sauhun.de ([88.99.104.3]:51890 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726796AbfF1Pez (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jun 2019 11:34:55 -0400
Received: from localhost (p54B332FA.dip0.t-ipconnect.de [84.179.50.250])
        by pokefinder.org (Postfix) with ESMTPSA id D03D03E60A2;
        Fri, 28 Jun 2019 17:34:52 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 1/4] mmc: renesas_sdhi: keep sorting
Date:   Fri, 28 Jun 2019 17:34:45 +0200
Message-Id: <20190628153448.4167-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628153448.4167-1-wsa+renesas@sang-engineering.com>
References: <20190628153448.4167-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The two devices next to each other are super similar, but still, let's
keep the alphanumeric sorting for easier additions later.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 64d3b5fb7fe5..7e07c34b9db1 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -624,10 +624,10 @@ static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
 };
 
 static const struct soc_device_attribute sdhi_quirks_match[]  = {
+	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
 	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
-	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
 	{ /* Sentinel. */ },
 };
-- 
2.20.1

