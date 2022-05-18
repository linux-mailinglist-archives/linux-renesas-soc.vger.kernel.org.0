Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B8452C17F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 19:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241117AbiERR3R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 13:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241091AbiERR3Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 13:29:16 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7EC1A8137
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 10:29:15 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id 3so2004556ily.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2022 10:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rkbt5ZVirKns48qhAK32oNhTzBfAgzibIPoeemaAR3g=;
        b=nUK1oeTrUAfeqqk3C+bw0qeWUnjgBaBkRmxULrrBygyH+hB4XY3AhMJZNoxGD2smEH
         NKg4xRjMKpGoPcVkytsbluGsvzXwGZ/5XgrQbbhygb9c+w2O0nzk/PDBsDxBQUuh97km
         rChdta0ljTnT/XVwZMAItPyVL6DifqbBwxWehDVkxUVfnW9wzNIMVnK2WEplpdAswWjj
         m2XH56f+p7VgJAKA7K43C8vzuS1xEkbcShKT0hb9c2h2yVFm6snDFrslQ+ZCerxLO3kY
         UCTYgzLa6sIWWSm9DMVOG36M2v7es4GAc1CCg1ZbNHWkxt/pixBaRYUPJrDw+9VZ5bTy
         iPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rkbt5ZVirKns48qhAK32oNhTzBfAgzibIPoeemaAR3g=;
        b=IkheV8mMK0QhPbSppFiJkgR3+TUockjAk2qwaeZFG2dcBhY1lYru8dkoTmwk8DUSq9
         Tqc4zbmdi/SEyKXssRhCe0ebvMWj0Qn6lHYIY/zTtUDLdCrkibygWQW4SsDWdgG5Wn2v
         DEvG3vH1/lUXEInS4fJOqoLZ9/+EiXFg/Bdsf0ZSlU3w9+bQ1ORhaJHzRq1WT6CpHsfK
         K9SXkTpuLJXMbtzEGnaLAY/fNh7lgs5Z5l/b7mjvmvT0WEJcxxlAqNcUs3VKXuC6tI6j
         xEsGl7i6+uylfXGk5vNV1fbZ27++dMVraJKZDpCHP6JFeKeUjYUUWNMb+XgxoZLdscwl
         Q7vg==
X-Gm-Message-State: AOAM532uGNSPb8LLRfL5N4B4ARq2GD3JjKUsSDSGN5AmFqB0mPxj7U0W
        8ec9ekeYbpzM9t8/yz5vSr9EvYw0XvpNZg==
X-Google-Smtp-Source: ABdhPJybPTe3txnO3Cq6UgUh1aOBNY4CNC0u4kYHHq2OmtynBN31vFZgDyxhb5p3pYgqYC/L+Urj0g==
X-Received: by 2002:a05:6e02:1bea:b0:2cf:5e28:aa5b with SMTP id y10-20020a056e021bea00b002cf5e28aa5bmr419280ilv.183.1652894955436;
        Wed, 18 May 2022 10:29:15 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a05663812cb00b0032ba5cbae2esm12858jas.144.2022.05.18.10.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 10:29:15 -0700 (PDT)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org
Cc:     phil.edworthy@renesas.com,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/3] clk: renesas: r9a06g032: remove unused field
Date:   Wed, 18 May 2022 13:27:17 -0400
Message-Id: <20220518172808.1691450-3-ralph.siemsen@linaro.org>
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

As the D_UGATE macro no longer uses _gi, drop it from all declarations.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 9dbcf9620fa0..fe56560c54df 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -79,7 +79,7 @@ struct r9a06g032_clkdesc {
 		.source = 1 + R9A06G032_##_src, .name = _n, \
 		.reg = _reg, .div_min = _min, .div_max = _max, \
 		.div_table = { __VA_ARGS__ } }
-#define D_UGATE(_idx, _n, _src, _g, _gi, _g1, _r1, _g2, _r2) \
+#define D_UGATE(_idx, _n, _src, _g, _g1, _r1, _g2, _r2) \
 	{ .type = K_DUALGATE, .index = R9A06G032_##_idx, \
 		.source = 1 + R9A06G032_##_src, .name = _n, \
 		.dual = { .group = _g, \
@@ -297,14 +297,14 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.dual.sel = ((0xec / 4) << 5) | 24,
 		.dual.group = 1,
 	},
-	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0, 0x1b2, 0x1b3, 0x1b4, 0x1b5),
-	D_UGATE(CLK_UART1, "clk_uart1", UART_GROUP_012, 0, 1, 0x1b6, 0x1b7, 0x1b8, 0x1b9),
-	D_UGATE(CLK_UART2, "clk_uart2", UART_GROUP_012, 0, 2, 0x1ba, 0x1bb, 0x1bc, 0x1bd),
-	D_UGATE(CLK_UART3, "clk_uart3", UART_GROUP_34567, 1, 0, 0x760, 0x761, 0x762, 0x763),
-	D_UGATE(CLK_UART4, "clk_uart4", UART_GROUP_34567, 1, 1, 0x764, 0x765, 0x766, 0x767),
-	D_UGATE(CLK_UART5, "clk_uart5", UART_GROUP_34567, 1, 2, 0x768, 0x769, 0x76a, 0x76b),
-	D_UGATE(CLK_UART6, "clk_uart6", UART_GROUP_34567, 1, 3, 0x76c, 0x76d, 0x76e, 0x76f),
-	D_UGATE(CLK_UART7, "clk_uart7", UART_GROUP_34567, 1, 4, 0x770, 0x771, 0x772, 0x773),
+	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0x1b2, 0x1b3, 0x1b4, 0x1b5),
+	D_UGATE(CLK_UART1, "clk_uart1", UART_GROUP_012, 0, 0x1b6, 0x1b7, 0x1b8, 0x1b9),
+	D_UGATE(CLK_UART2, "clk_uart2", UART_GROUP_012, 0, 0x1ba, 0x1bb, 0x1bc, 0x1bd),
+	D_UGATE(CLK_UART3, "clk_uart3", UART_GROUP_34567, 1, 0x760, 0x761, 0x762, 0x763),
+	D_UGATE(CLK_UART4, "clk_uart4", UART_GROUP_34567, 1, 0x764, 0x765, 0x766, 0x767),
+	D_UGATE(CLK_UART5, "clk_uart5", UART_GROUP_34567, 1, 0x768, 0x769, 0x76a, 0x76b),
+	D_UGATE(CLK_UART6, "clk_uart6", UART_GROUP_34567, 1, 0x76c, 0x76d, 0x76e, 0x76f),
+	D_UGATE(CLK_UART7, "clk_uart7", UART_GROUP_34567, 1, 0x770, 0x771, 0x772, 0x773),
 };
 
 struct r9a06g032_priv {
-- 
2.25.1

