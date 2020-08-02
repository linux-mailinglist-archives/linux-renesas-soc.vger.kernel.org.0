Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37761235980
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Aug 2020 19:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgHBRbQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 2 Aug 2020 13:31:16 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:13338 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726778AbgHBRbQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Aug 2020 13:31:16 -0400
X-Halon-ID: ef59342a-d4e5-11ea-8fb8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac52a8.dip0.t-ipconnect.de [84.172.82.168])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id ef59342a-d4e5-11ea-8fb8-005056917f90;
        Sun, 02 Aug 2020 19:31:14 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Remove redundant compatible values
Date:   Sun,  2 Aug 2020 19:30:59 +0200
Message-Id: <20200802173059.122595-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The compatible value 'renesas,rcar-gen2-vin' have always been mandatory
for all Gen2 platforms. Remove device redundant values.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 16 ----------------
 1 file changed, 16 deletions(-)
---
Hi,

After the recent bindings conversion to YAML which makes it abundantly 
clear that the generic 'renesas,rcar-gen2-vin' compatibility value are 
mandatory (which is always have been) remove values that are not needed 
to reduce size.

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 7440c8965d27e64f..aad8eef2ac9f641b 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -1228,22 +1228,6 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a7779",
 		.data = &rcar_info_h1,
 	},
-	{
-		.compatible = "renesas,vin-r8a7790",
-		.data = &rcar_info_gen2,
-	},
-	{
-		.compatible = "renesas,vin-r8a7791",
-		.data = &rcar_info_gen2,
-	},
-	{
-		.compatible = "renesas,vin-r8a7793",
-		.data = &rcar_info_gen2,
-	},
-	{
-		.compatible = "renesas,vin-r8a7794",
-		.data = &rcar_info_gen2,
-	},
 	{
 		.compatible = "renesas,rcar-gen2-vin",
 		.data = &rcar_info_gen2,
-- 
2.28.0

