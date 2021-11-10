Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1D944C8BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbhKJTTP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:15 -0500
Received: from www.zeus03.de ([194.117.254.33]:55044 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232815AbhKJTTK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=AXGVIpUc08yi8/
        jW6OixQziE9rF2msDo/V93xBc1ykA=; b=zHy4dBjc09rx1zKr2Kvl4PWrB3tbIz
        JYdfw+s8I3bA/HDlphPd3h3F9AShRjcvEM7Mrj71kqlMefJVFnqDbZMaoai5BWqI
        jCahIrwekvRjB/JLp628A+ikTMg3yQ/nfjfzLyACucX6sFwcQkyUeo+a58zj/9A0
        nAc5LKTMH6OOw=
Received: (qmail 722492 invoked from network); 10 Nov 2021 20:16:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:21 +0100
X-UD-Smtp-Session: l3s3148p1@FZmoD3TQ2pogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 06/21] clk: renesas: rcar-gen3: remove outdated SD_SKIP_FIRST
Date:   Wed, 10 Nov 2021 20:15:55 +0100
Message-Id: <20211110191610.5664-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We handle it differently meanwhile.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since RFC v1:
* fixed subject prefix
* added tag from Geert

 drivers/clk/renesas/rcar-gen3-cpg.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index aa0797b98e89..c4b36c90e159 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -397,29 +397,20 @@ static u32 cpg_quirks __initdata;
 
 #define PLL_ERRATA	BIT(0)		/* Missing PLL0/2/4 post-divider */
 #define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
-#define SD_SKIP_FIRST	BIT(2)		/* Skip first clock in SD table */
 
 
 static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
 	{
 		.soc_id = "r8a7795", .revision = "ES1.0",
-		.data = (void *)(PLL_ERRATA | RCKCR_CKSEL | SD_SKIP_FIRST),
+		.data = (void *)(PLL_ERRATA | RCKCR_CKSEL),
 	},
 	{
 		.soc_id = "r8a7795", .revision = "ES1.*",
-		.data = (void *)(RCKCR_CKSEL | SD_SKIP_FIRST),
-	},
-	{
-		.soc_id = "r8a7795", .revision = "ES2.0",
-		.data = (void *)SD_SKIP_FIRST,
+		.data = (void *)(RCKCR_CKSEL),
 	},
 	{
 		.soc_id = "r8a7796", .revision = "ES1.0",
-		.data = (void *)(RCKCR_CKSEL | SD_SKIP_FIRST),
-	},
-	{
-		.soc_id = "r8a7796", .revision = "ES1.1",
-		.data = (void *)SD_SKIP_FIRST,
+		.data = (void *)(RCKCR_CKSEL),
 	},
 	{ /* sentinel */ }
 };
-- 
2.30.2

