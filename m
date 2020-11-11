Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9712AEE61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 11:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgKKKCz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 05:02:55 -0500
Received: from www.zeus03.de ([194.117.254.33]:47564 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726725AbgKKKCy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 05:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=CH5wlrFhrfWWT+
        D2/lxdR/5dd3aKOAJJCEpHlYZhwoY=; b=z93UkeA6YCh+gziWPZb5aXaMDO5kaC
        EtdSrqB7fCf0hLVetdH8btrd+x3rOD0MKuNz1iUpEafDfgTRCnsYDfAc5n5HzVvF
        9JGExBPVRY2MaDdZunr/FVdzFXQ7rx6ZNtnIPzTV7LfveiZ7roPPTrH+W3Btpt75
        TyGgtFMpV58eo=
Received: (qmail 2440363 invoked from network); 11 Nov 2020 11:02:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2020 11:02:52 +0100
X-UD-Smtp-Session: l3s3148p1@VfoF5tGzWpMgAwDPXwjxAOzndPPvnXZD
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] mmc: renesas_sdhi: sort includes
Date:   Wed, 11 Nov 2020 11:02:44 +0100
Message-Id: <20201111100244.15823-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
References: <20201111100244.15823-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Better prevent double includes.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 55633826d38c..bb937411c2ec 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -18,22 +18,22 @@
  *
  */
 
-#include <linux/kernel.h>
 #include <linux/clk.h>
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-#include <linux/pm_domain.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tmio.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
-#include <linux/mfd/tmio.h>
-#include <linux/sh_dma.h>
-#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl-state.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
+#include <linux/sh_dma.h>
+#include <linux/slab.h>
 #include <linux/sys_soc.h>
 
 #include "renesas_sdhi.h"
-- 
2.28.0

