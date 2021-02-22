Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A38C32153B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Feb 2021 12:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhBVLkr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Feb 2021 06:40:47 -0500
Received: from www.zeus03.de ([194.117.254.33]:48286 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230171AbhBVLkq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Feb 2021 06:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=hKOcOukzq0DpKJ
        sSUNKkVBEiC3JIGvliRlA+tppvrsU=; b=jZ7hiKxtrQh9hj4dv0l78+2dVo2Tp0
        XtGOYhUiqDhUW6hP9bUlKUT8X5+SufjdVhPuPy4uBkcZvnz0z8rmKZ3kvkRA9UYP
        uO+zufNnNBcVGfa0S2EIcl3bM6LXrAye7DjGnPbYYO3o6D7J15RjvZFSjS77nLvl
        4zvAT8Zv6Nb58=
Received: (qmail 2216209 invoked from network); 22 Feb 2021 12:40:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Feb 2021 12:40:04 +0100
X-UD-Smtp-Session: l3s3148p1@g69RQ+u7RsAgARa4RXmUARZp+YIgYjUK
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 2/2] mmc: renesas_sdhi: do hard reset if possible
Date:   Mon, 22 Feb 2021 12:39:55 +0100
Message-Id: <20210222113955.7779-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222113955.7779-1-wsa+renesas@sang-engineering.com>
References: <20210222113955.7779-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some SDHI instances can be reset via the reset controller. If one is
found, use it instead of the custom reset.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index cb962c7883dc..53eded81a53e 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -70,6 +70,8 @@ struct renesas_sdhi {
 	DECLARE_BITMAP(smpcmp, BITS_PER_LONG);
 	unsigned int tap_num;
 	unsigned int tap_set;
+
+	struct reset_control *rstc;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 158c21e5a942..a1de5c431f07 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -20,6 +20,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
@@ -32,6 +33,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/sh_dma.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
@@ -561,9 +563,16 @@ static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_io
 static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	int ret;
 	u16 val;
 
-	if (priv->scc_ctl) {
+	if (!IS_ERR(priv->rstc)) {
+		reset_control_reset(priv->rstc);
+		/* Unknown why but without polling reset status, it will hang */
+		read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
+				  false, priv->rstc);
+		priv->needs_adjust_hs400 = false;
+	} else if (priv->scc_ctl) {
 		renesas_sdhi_disable_scc(host->mmc);
 		renesas_sdhi_reset_hs400_mode(host, priv);
 		priv->needs_adjust_hs400 = false;
@@ -1076,6 +1085,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		goto efree;
 
+	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+
 	ver = sd_ctrl_read16(host, CTL_VERSION);
 	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
 	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
-- 
2.30.0

