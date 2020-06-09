Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E6E1F3B06
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbgFIMqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:46:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54342 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729594AbgFIMqg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:46:36 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7EDA18F5;
        Tue,  9 Jun 2020 14:46:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591706794;
        bh=bJXiI1PY8sfOtq2Yflmn9ep268J3jqJ88sOgCJyR8uM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qyPP2O01AWYg3ib9TWCRF0+8KEwPBkz5WdcgL9AfV0LepEslOPWer8lRt+V7AVFet
         RLSXwAzec37f1YYasXfP0m9IUbYPNFs0kbcwZnvDSXdP7kJ1TOBd3jZku/KScLhrzP
         6n5h3NzfvG7OurPeQKSLieAk/bOhHiorHtZjb1/4=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        linux-kernel@vger.kernel.org (open list:VOLTAGE AND CURRENT REGULATOR
        FRAMEWORK)
Subject: [PATCH 09/17] drivers: regulator: Fix trivial spelling
Date:   Tue,  9 Jun 2020 13:46:02 +0100
Message-Id: <20200609124610.3445662-10-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The word 'descriptor' is misspelled throughout the tree.

Fix it up accordingly:
    decriptors -> descriptors

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/regulator/fixed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index bc0bbd99e98d..d54830e48b8d 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -210,7 +210,7 @@ static int reg_fixed_voltage_probe(struct platform_device *pdev)
 
 	/*
 	 * The signal will be inverted by the GPIO core if flagged so in the
-	 * decriptor.
+	 * descriptor.
 	 */
 	if (config->enabled_at_boot)
 		gflags = GPIOD_OUT_HIGH;
-- 
2.25.1

