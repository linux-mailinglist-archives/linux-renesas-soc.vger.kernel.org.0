Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E06734BC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2019 17:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbfFDPPm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Jun 2019 11:15:42 -0400
Received: from sauhun.de ([88.99.104.3]:47260 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727866AbfFDPPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Jun 2019 11:15:41 -0400
Received: from localhost (p5486CF7A.dip0.t-ipconnect.de [84.134.207.122])
        by pokefinder.org (Postfix) with ESMTPSA id 2DA283E4758;
        Tue,  4 Jun 2019 17:15:40 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] mmc: sdhi: remove unneeded initialization
Date:   Tue,  4 Jun 2019 17:15:30 +0200
Message-Id: <20190604151530.7023-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190604151530.7023-1-wsa+renesas@sang-engineering.com>
References: <20190604151530.7023-1-wsa+renesas@sang-engineering.com>
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
index 1cdf5920e861..334fb3527685 100644
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

