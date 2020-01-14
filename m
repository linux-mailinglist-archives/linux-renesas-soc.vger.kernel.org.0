Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3271813B554
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2020 23:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgANWa6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jan 2020 17:30:58 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:65204 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbgANWa6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jan 2020 17:30:58 -0500
X-Halon-ID: 8811a98b-371d-11ea-b6d8-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5d7b.dip0.t-ipconnect.de [84.172.93.123])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 8811a98b-371d-11ea-b6d8-005056917f90;
        Tue, 14 Jan 2020 23:30:56 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-pm@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] thermal: rcar_gen3_thermal: Remove temperature bound
Date:   Tue, 14 Jan 2020 23:29:45 +0100
Message-Id: <20200114222945.3128250-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114222945.3128250-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200114222945.3128250-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The hardware manual states that the operation of the sensor is not
guaranteed with temperatures above 125°C, not that the readings are
invalid. Remove the bound check and try to deliver temperature readings
even if we are outside the guaranteed operation range.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 1460cf9d9f1c397b..0f69ff676838a999 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -182,10 +182,6 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
 				tsc->coef.a2);
 	mcelsius = FIXPT_TO_MCELSIUS(val);
 
-	/* Make sure we are inside specifications */
-	if ((mcelsius < MCELSIUS(-40)) || (mcelsius > MCELSIUS(125)))
-		return -EIO;
-
 	/* Round value to device granularity setting */
 	*temp = rcar_gen3_thermal_round(mcelsius);
 
-- 
2.24.1

