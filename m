Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3B41F3AEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 14:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729713AbgFIMqv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 08:46:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54342 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729677AbgFIMqt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 08:46:49 -0400
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53E021314;
        Tue,  9 Jun 2020 14:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591706802;
        bh=CpRiQTE2lIismJfuBQ5WqUaiIIEx99AB2Y4O/B2po2k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bHLsu12r8z7Pw1CguTwIs8CoGLJT4iFazSD4ud/5H0MzH1qXNKTkuFBiV/K+zjn30
         OzMkVXvVwRFUKeYNlGBn0/djl/eMe2GBfhRJ2Nv7cGP4+4WISz28cPaTaR4cXfapDJ
         FdXSVzV4Ssi/IyeC5tVeTMgri7OdGVxai+FH9UA4=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        linux-kernel@vger.kernel.org (open list:VOLTAGE AND CURRENT REGULATOR
        FRAMEWORK)
Subject: [PATCH 16/17] regulator: gpio: Fix trivial spelling
Date:   Tue,  9 Jun 2020 13:46:09 +0100
Message-Id: <20200609124610.3445662-17-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

decriptor -> descriptor.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/regulator/gpio-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/gpio-regulator.c b/drivers/regulator/gpio-regulator.c
index 110ee6fe76c4..181451f922f1 100644
--- a/drivers/regulator/gpio-regulator.c
+++ b/drivers/regulator/gpio-regulator.c
@@ -311,7 +311,7 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 
 	/*
 	 * The signal will be inverted by the GPIO core if flagged so in the
-	 * decriptor.
+	 * descriptor.
 	 */
 	if (config->enabled_at_boot)
 		gflags = GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE;
-- 
2.25.1

