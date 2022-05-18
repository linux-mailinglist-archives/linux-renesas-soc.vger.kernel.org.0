Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F239052C226
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 20:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238519AbiERSZl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 14:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbiERSZk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 14:25:40 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231431CA347
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 11:25:39 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id v5so2133416qvs.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CVGtSDjxtUlLWvvetgGRiUZg3RmuWi7A88eHZqwiyZg=;
        b=lRGutispnHq6m+luptKyIFq685ZKFMADIpH5jZddkQznt0UdqhHyIicw28abv63fL+
         X36rzDVceNC2YnyXX12UHCqFjT5uvMEC5fFqPZKvxObixtH5u1lTnxLq8/f7NWXR+Cu9
         BES8iz6Hq7D0xkKjXhHVLV+aMqR45v9aHv9kkcoppxLXU2bChp9jyeu8FYKTI+sxFuzG
         g8zCo1lOZWv7fMv3gwf/qr0EhW2yVbpCLc3jD6eL8bp2v+eun33JqfrAoNGr4+an8e5T
         44xuhLxqbfXbzFOBtXbFj2H9P9r5297eYP9RUHvxUYtPeDztY6WLRiclqW/r3260kVVY
         WbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CVGtSDjxtUlLWvvetgGRiUZg3RmuWi7A88eHZqwiyZg=;
        b=d6DYIWGiwaJvEayKEgKLnjtNMWy+ggS1mloC6XD6lfn1jPPZXxbD8tk3FbVa84Sk8g
         al0DefJIO7BfxEZsKhtqdlhNkAlsvfQmdtH07CyI1Z2rW7blOLRWdufrT19wQUPMeo9i
         HJJelP/ob97zQ7TAj9lSNUPw7/R30C6nLEpYS24FgvCwzwdj1PjZpBTVCFwNpRku/hQl
         wZxF8yBu8zb2SzrTiiGwMt42Fw21hAVsPHqQTjj0e6qvD1oqgZFRqm6Jb5nmy/9Xf59I
         nEdAr78IzCDg7KJrYBRjbrN2Xq39Uv4TjvWMIqNaIcXRr7BXJTQMLDt8o9bRZWyhnaUL
         Ziew==
X-Gm-Message-State: AOAM5337mZ7Sk6jhFxv7XghtFBBNjAcqgAGJUIcfunzLpcR9UdBm9LEA
        e39KtkPRqNnwtrmRrFF2HumblQ==
X-Google-Smtp-Source: ABdhPJz8bZUpOLUyws4VEIBREZFYVwJBoIDnKP1B3V4SGYcehuOp3jsAxnXGo8uZo5tK59GkuTRzeQ==
X-Received: by 2002:a05:6214:c66:b0:45c:538f:21b2 with SMTP id t6-20020a0562140c6600b0045c538f21b2mr850277qvj.90.1652898338283;
        Wed, 18 May 2022 11:25:38 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id l19-20020a05622a175300b002f39b99f670sm1798361qtk.10.2022.05.18.11.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 11:25:37 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     ralph.siemsen@linaro.org
Cc:     geert+renesas@glider.be, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, phil.edworthy@renesas.com
Subject: [PATCH v2 1/3] clk: renesas: r9a06g032: Fix UART clkgrp bitsel
Date:   Wed, 18 May 2022 14:25:27 -0400
Message-Id: <20220518182527.1693156-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
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
v2 changes:
- reverse the comments as well

 drivers/clk/renesas/r9a06g032-clocks.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index c99942f0e4d4..abc0891fd96d 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -286,8 +286,8 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.name = "uart_group_012",
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_UART,
-		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
-		.dual.sel = ((0xec / 4) << 5) | 24,
+		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
+		.dual.sel = ((0x34 / 4) << 5) | 30,
 		.dual.group = 0,
 	},
 	{
@@ -295,8 +295,8 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.name = "uart_group_34567",
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_P2_PG,
-		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
-		.dual.sel = ((0x34 / 4) << 5) | 30,
+		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
+		.dual.sel = ((0xec / 4) << 5) | 24,
 		.dual.group = 1,
 	},
 	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0, 0x1b2, 0x1b3, 0x1b4, 0x1b5),
-- 
2.25.1

