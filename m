Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4DC11FD41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 03:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfEPBqf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 21:46:35 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:30864 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726790AbfEPAfx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 20:35:53 -0400
X-Halon-ID: 863493b3-7772-11e9-8601-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 863493b3-7772-11e9-8601-0050569116f7;
        Thu, 16 May 2019 02:35:47 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] rcar-csi2: Fix coccinelle warning for PTR_ERR_OR_ZERO()
Date:   Thu, 16 May 2019 02:35:38 +0200
Message-Id: <20190516003538.32172-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use the PTR_ERR_OR_ZERO() macro instead of construct:

    if (IS_ERR(foo))
        return PTR_ERR(foo);

    return 0;

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 3ae854cafd76 ("rcar-csi2: Use standby mode instead of resetting")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 8f097e514900307f..c14af1b929dffd34 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -1019,10 +1019,8 @@ static int rcsi2_probe_resources(struct rcar_csi2 *priv,
 		return ret;
 
 	priv->rstc = devm_reset_control_get(&pdev->dev, NULL);
-	if (IS_ERR(priv->rstc))
-		return PTR_ERR(priv->rstc);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(priv->rstc);
 }
 
 static const struct rcar_csi2_info rcar_csi2_info_r8a7795 = {
-- 
2.21.0

