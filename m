Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889BC4FDDEC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349051AbiDLLoa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 07:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234303AbiDLLlc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 07:41:32 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8848506CD;
        Tue, 12 Apr 2022 03:22:09 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id E2967FF80D;
        Tue, 12 Apr 2022 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649758928;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zIaJzlhcitEDdJTHuh7eIv4TamuZ7pCdIgFe1rezCFs=;
        b=lmo588VWu8kuCbUAmbiayiMKdhqKMww2OqHar2dH2cpL7dSNICHQ7XK2G9y0pwcgc1w9LU
        yho8kwhpxqNMnhzUI8m27ZAnUI0VKXTvWf+3k2Qd0HNXFnJxKmmLNsopa7EOzHaa9ngID2
        Od92pD2cFj+5Zgrld5nvVVd5M9eBEE1NDLbQg3akeECyaWh9t3nR2Da0TEMOqRtUcf//X2
        VmuAIpxyh+ouxTmTo/PlGgdNk49M62UUVNJLnQdlXrerUuL0L8FCRUFJxq2aSDevQnpKwD
        yfZ9ZHwJwc6o1tF/rpeYH0Wr+qNO4nzgH1WdAST47LftKNzwTWEBsNeTdkpa3w==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v9 7/9] dmaengine: dw: Add RZN1 compatible
Date:   Tue, 12 Apr 2022 12:21:36 +0200
Message-Id: <20220412102138.45975-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412102138.45975-1-miquel.raynal@bootlin.com>
References: <20220412102138.45975-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas RZN1 DMA IP is very close to the original DW DMA IP, a DMA
router has been introduced to handle the wiring options that have been
added.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dw/platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index 246118955877..47f2292dba98 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -137,6 +137,7 @@ static void dw_shutdown(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id dw_dma_of_id_table[] = {
 	{ .compatible = "snps,dma-spear1340", .data = &dw_dma_chip_pdata },
+	{ .compatible = "renesas,rzn1-dma", .data = &dw_dma_chip_pdata },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
-- 
2.27.0

