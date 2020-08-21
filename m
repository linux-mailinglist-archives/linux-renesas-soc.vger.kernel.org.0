Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D44E24CE12
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Aug 2020 08:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgHUGfm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Aug 2020 02:35:42 -0400
Received: from www.zeus03.de ([194.117.254.33]:39170 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbgHUGfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Aug 2020 02:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=O/eswU65nQixGbR/xjeWQK4LQGL
        BqnfQNR4OeZ4bBVE=; b=jqiESqtMqSrpJan5Mn1OunMcx9CLLwvTX9ARBioPWtI
        cb2TqgaUcT3T1fgsSFgq7QJkL0NDF7Yx8zCA4BV6ZPKweVB6sRAohlwchLLFKLOm
        C6WuTsk/z5UDBz5T7mRqI0gQnkQe5MJPLcfzbT1iM4/fVlV24HiJgzNXVAZ2wViw
        =
Received: (qmail 762681 invoked from network); 21 Aug 2020 08:35:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Aug 2020 08:35:39 +0200
X-UD-Smtp-Session: l3s3148p1@cjb7cV2t1KcgAwDPXweWAG48P/WlTOIM
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: improve documentation of HW_RESET
Date:   Fri, 21 Aug 2020 08:35:33 +0200
Message-Id: <20200821063533.3771-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

HW_RESET means resetting the remote device, not the controller. Two
drivers got it wrong, so make it more clear.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I sent a series to fix the TMIO/SDHI driver. The other one is bcm2835,
but I want to get this patch approved, before I notify the maintainers.

 include/linux/mmc/host.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index c5b6e97cb21a..cf04793ab4ea 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -163,6 +163,7 @@ struct mmc_host_ops {
 	int	(*select_drive_strength)(struct mmc_card *card,
 					 unsigned int max_dtr, int host_drv,
 					 int card_drv, int *drv_type);
+	/* Reset remote device via RST_n */
 	void	(*hw_reset)(struct mmc_host *host);
 	void	(*card_event)(struct mmc_host *host);
 
@@ -346,7 +347,7 @@ struct mmc_host {
 #define MMC_CAP_CD_WAKE		(1 << 28)	/* Enable card detect wake */
 #define MMC_CAP_CMD_DURING_TFR	(1 << 29)	/* Commands during data transfer */
 #define MMC_CAP_CMD23		(1 << 30)	/* CMD23 supported. */
-#define MMC_CAP_HW_RESET	(1 << 31)	/* Hardware reset */
+#define MMC_CAP_HW_RESET	(1 << 31)	/* supports device reset via RST_n */
 
 	u32			caps2;		/* More host capabilities */
 
-- 
2.20.1

