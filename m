Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DAE1A1E38
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2020 11:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgDHJqw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 05:46:52 -0400
Received: from sauhun.de ([88.99.104.3]:39648 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727079AbgDHJqw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 05:46:52 -0400
Received: from localhost (p54B334FE.dip0.t-ipconnect.de [84.179.52.254])
        by pokefinder.org (Postfix) with ESMTPSA id CE18B2C1FDC;
        Wed,  8 Apr 2020 11:46:50 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/3] mmc: renesas_sdhi: clarify handling of selecting TAPs
Date:   Wed,  8 Apr 2020 11:46:37 +0200
Message-Id: <20200408094638.10375-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408094638.10375-1-wsa+renesas@sang-engineering.com>
References: <20200408094638.10375-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The comment and the define about how TAPs are selected were confusing to
me because the good TAP was only valid if it was bigger than a *_MAX_*
value. Rename the define and adapt the comment to what really happens.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f5d174d86117..0dbee47eafa1 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -422,7 +422,7 @@ static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_io
 	return 0;
 }
 
-#define SH_MOBILE_SDHI_MAX_TAP 3
+#define SH_MOBILE_SDHI_MIN_TAP_ROW 3
 
 static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 {
@@ -446,9 +446,9 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	}
 
 	/*
-	 * Find the longest consecutive run of successful probes.  If that
-	 * is more than SH_MOBILE_SDHI_MAX_TAP probes long then use the
-	 * center index as the tap.
+	 * Find the longest consecutive run of successful probes. If that
+	 * is at least SH_MOBILE_SDHI_MIN_TAP_ROW probes long then use the
+	 * center index as the tap, otherwise bail out.
 	 */
 	bitmap_for_each_set_region(priv->taps, rs, re, 0, taps_size) {
 		if (re - rs > tap_cnt) {
@@ -458,7 +458,7 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 		}
 	}
 
-	if (tap_cnt >= SH_MOBILE_SDHI_MAX_TAP)
+	if (tap_cnt >= SH_MOBILE_SDHI_MIN_TAP_ROW)
 		priv->tap_set = (tap_start + tap_end) / 2 % priv->tap_num;
 	else
 		return -EIO;
-- 
2.20.1

