Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FEA537309
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 13:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbfFFLfv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 07:35:51 -0400
Received: from sauhun.de ([88.99.104.3]:33866 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727655AbfFFLfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 07:35:51 -0400
Received: from localhost (p5486CDEB.dip0.t-ipconnect.de [84.134.205.235])
        by pokefinder.org (Postfix) with ESMTPSA id B05453E43D1;
        Thu,  6 Jun 2019 13:35:49 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 3/3] mmc: sdhi: remove unneeded initialization
Date:   Thu,  6 Jun 2019 13:35:37 +0200
Message-Id: <20190606113537.8869-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
References: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Bools are initialized to 'false' by default.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 24857ced9f2e..64d3b5fb7fe5 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -616,7 +616,6 @@ static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
 };
 
 static const struct renesas_sdhi_quirks sdhi_quirks_4tap = {
-	.hs400_disabled = false,
 	.hs400_4taps = true,
 };
 
-- 
2.11.0

