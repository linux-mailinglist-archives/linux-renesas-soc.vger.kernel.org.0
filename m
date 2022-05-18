Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F04C552C144
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 19:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241022AbiERR2e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 13:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241075AbiERR2e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 13:28:34 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6A613FD77
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 10:28:33 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id m6so3059544iob.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 10:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCKolOlzzwnZ7+8eELQXskFMIvOTP7lX/YwA+iJBQY4=;
        b=L3XVYyOQzSOkyyakBykuHe2f+T35o9DcLyQB/B00jC1Odl2Xw7aHVgfeLKWkFyKj+T
         g9GMQ9yzg+0cMi1cMbb3EXUCeNCzhCAxFJXf+rZPwX6AQlToTO4c6uTfQXWOIAY9O2Bb
         zaOswkiC/CBKTtMyZ++GdrbUstx2GIOhu08EHG30VJKEdmne3FCnLd/aLEhIVj6bN+GH
         WhAj0gZqoVD/MGdJVbRp3JdsPbDpgOwCosqD/euUs4RUMtvwMuaARunbetUQ8sgalqZ2
         yjzuVU9jLUS6D51QgmrxUHROF0l/PdGcIcTuRoBBl4ptOpqU5riWnV2xj2iJdvsKqCvu
         IuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCKolOlzzwnZ7+8eELQXskFMIvOTP7lX/YwA+iJBQY4=;
        b=LxU3RhVlpu5NJa1/ezaikdxxOYT2N0QBOxCrXZYL5Ldd3Ed3cLg0vp9iOGDugG+vBE
         jPuExw5+xBn/U5HmR05N6pZptHQ1OoP3loeT+UOd9dkrA+tFU42oTo1tMGgLtsGh8Hab
         5qAQmjTdHazYmUr1Hf45KpJBxBqHqyejjF68yc1k+m96E1CrBiuDm4hTwsw4bkAQfzYI
         VdATScOYSoPUi5/eat76W+TvF0f3y5IWJ+krn8tXRTnY+osXY5HsabOqxjP6sfr8e8OJ
         z08I/+hndvzTNErMiga47dYUOA9mVokJJkqf6ck5heEx1iN5aBfUhkRber4+8WZfyANt
         GInw==
X-Gm-Message-State: AOAM530YRHk37I5cv172Qpfs7u2nJx7ZY4V6m9BT2X2OW2linCjX0TOL
        6mPffqdOxlMZf187dMxspicAXttP0nPjnw==
X-Google-Smtp-Source: ABdhPJySGBsjt6QuVeV1RImGuXtBAAbxw/OwHGbMLJ56AyjiA3bw9wf9Kv5xxhyqVjEQuxIgTJE8WA==
X-Received: by 2002:a05:6602:3290:b0:657:73af:c385 with SMTP id d16-20020a056602329000b0065773afc385mr365253ioz.58.1652894912494;
        Wed, 18 May 2022 10:28:32 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a05663812cb00b0032ba5cbae2esm12858jas.144.2022.05.18.10.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 10:28:31 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org
Cc:     phil.edworthy@renesas.com,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: [PATCH 1/3] clk: renesas: r9a06g032: Fix UART clkgrp bitsel
Date:   Wed, 18 May 2022 13:27:15 -0400
Message-Id: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There are two UART clock groups, each having a mux to select its
upstream clock source. The register/bit definitions for accessing these
two muxes appear to have been reversed since introduction. Correct them
so as to match the hardware manual.

Fixes: 4c3d88526eba ("clk: renesas: Renesas R9A06G032 clock driver")

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index c99942f0e4d4..0baa6a06ada8 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -287,7 +287,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_UART,
 		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
-		.dual.sel = ((0xec / 4) << 5) | 24,
+		.dual.sel = ((0x34 / 4) << 5) | 30,
 		.dual.group = 0,
 	},
 	{
@@ -296,7 +296,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_P2_PG,
 		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
-		.dual.sel = ((0x34 / 4) << 5) | 30,
+		.dual.sel = ((0xec / 4) << 5) | 24,
 		.dual.group = 1,
 	},
 	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0, 0x1b2, 0x1b3, 0x1b4, 0x1b5),
-- 
2.25.1

