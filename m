Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A581B5B53
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2020 14:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgDWMYz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Apr 2020 08:24:55 -0400
Received: from sauhun.de ([88.99.104.3]:33842 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726117AbgDWMYz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Apr 2020 08:24:55 -0400
Received: from localhost (p5486CE55.dip0.t-ipconnect.de [84.134.206.85])
        by pokefinder.org (Postfix) with ESMTPSA id A71D22C2016;
        Thu, 23 Apr 2020 14:24:53 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/2] mmc: renesas_sdhi: handle M3-N ES1.2 and 1.3 revisions
Date:   Thu, 23 Apr 2020 14:24:47 +0200
Message-Id: <20200423122448.8099-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423122448.8099-1-wsa+renesas@sang-engineering.com>
References: <20200423122448.8099-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

For ES1.2, add a comment explaining the situation. For ES1.3 (and
later, although unlikely), add a new entry defining it as 4tap.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---

Change since V1:
* added tag from Shimoda-san

 drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 28b0830c4251..33b51105c788 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -711,11 +711,17 @@ static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
 	.hs400_disabled = true,
 };
 
+/*
+ * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
+ * So, we want to treat them equally and only have a match for ES1.2 to enforce
+ * this if there ever will be a way to distinguish ES1.2.
+ */
 static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
 	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_4tap },
 	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
 	{ /* Sentinel. */ },
 };
-- 
2.20.1

