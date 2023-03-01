Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57C796A767C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Mar 2023 22:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjCAV4P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Mar 2023 16:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCAV4O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Mar 2023 16:56:14 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E7F303F9
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Mar 2023 13:56:13 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id k17so760746iob.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Mar 2023 13:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677707773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zbhrfl0XFHsaPCWnllNF/3ngXJV3MSheXBmaeeDt+sk=;
        b=sdlMhZEmtEArBffvT/Usbk2P/mTIEZ8rK9TIWsPf7Z41WLQ1pRBWyKdP32TyNJSEFe
         5YuQqsEkgi8/P2+I39RLSM17w0/e/B1Cvqz25ghAxe12oRjQou+vIvCu7HBB9GqabP9J
         m56ZBCsleUIfBuzGCme/pxBypvjqGC9OVvSKa5T5StffaY/DA7xuGNisUv2Wmk8BpSAF
         YL+Nfe6Rm1EOyVmY9QzHqHBkX0er/H7foGKpAtKzUB+kjQ0ojBbzj1fMJ2uSyLnOusTF
         ywMZr3TMenjrypatncyAKubAIb8qv4IBX5Yc5VboGIgUg1KyoobBMUVpHXeWs0zajSBO
         kThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677707773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zbhrfl0XFHsaPCWnllNF/3ngXJV3MSheXBmaeeDt+sk=;
        b=AOnVE5tKvmfPKvcKYw8MDKbly+aWfu63+bqp9p6YWCNzqWUE9oWNskboDsctIJA5ti
         EdSQOy91TKPLRDuxxJzNvbFPziVegoL8D5LdItFm38iKn6k8yrbuJ5qef/y55dQPRoGr
         Xv9xERlNO0i7WYt1KmxPS46SfJwgWRMT5JJMdHJFy7y1ab+sEOMbgCccivtkMupZjFzV
         kATfgXUOaV2FBag1QQpdCq/9qmJATYuj1HXwV6oREXeso0fK8rY83Q7jxBZHMKOYHbx4
         5MKj+w2PhMEDf5kAcsOpZhdZ2nZopJoYnLlQkDf+6Yr6l5NZJxjSWvNdZ3nB47dr5pmn
         2xiA==
X-Gm-Message-State: AO0yUKX4Niis2LdJbO4aF/fRWeq7Vtr/U1H9aSg1u9AutlXZrVdlgS2X
        v/hHJzdofFHr30ESRqfjskdW5qpeX7A71oee
X-Google-Smtp-Source: AK7set+EUMj+vJ9jq/duQdOVk+++pW2PAdTXXPBzCw8MBuVuIb+6EymnYZ9sRQmLcu8VM7Yb1mz+yA==
X-Received: by 2002:a5e:db44:0:b0:74c:8c47:f997 with SMTP id r4-20020a5edb44000000b0074c8c47f997mr5729955iop.1.1677707772817;
        Wed, 01 Mar 2023 13:56:12 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a5ec10b000000b0074c9a4bb374sm4173479iol.11.2023.03.01.13.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 13:56:12 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH v2 2/4] clk: renesas: r9a06g032: drop unused fields
Date:   Wed,  1 Mar 2023 16:55:18 -0500
Message-Id: <20230301215520.828455-3-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230301215520.828455-1-ralph.siemsen@linaro.org>
References: <20230301215520.828455-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Drop three unused fields from the clock descriptor structure, and update
the macros for filling such structures accordingly.

The values for such fields are kept in the source code, now unused, in
case they are needed later.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
- added R-b tag

 drivers/clk/renesas/r9a06g032-clocks.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index cc479d95ef55..79b78e68c272 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -30,8 +30,9 @@
 #define R9A06G032_SYSCTRL_DMAMUX 0xA0
 
 struct r9a06g032_gate {
-	u16 gate, reset, ready, midle,
-		scon, mirack, mistat;
+	u16 gate, reset, ready, midle;
+	/* Unused fields omitted to save space */
+	/* u16 scon, mirack, mistat; */
 };
 
 enum gate_type {
@@ -69,14 +70,18 @@ struct r9a06g032_clkdesc {
 	};
 };
 
+/*
+ * The last three arguments are not currently used,
+ * but are kept in the r9a06g032_clocks table below.
+ */
 #define I_GATE(_clk, _rst, _rdy, _midle, _scon, _mirack, _mistat) { \
 	.gate = _clk, \
 	.reset = _rst, \
 	.ready = _rdy, \
 	.midle = _midle, \
-	.scon = _scon, \
-	.mirack = _mirack, \
-	.mistat = _mistat \
+	/* .scon = _scon, */ \
+	/* .mirack = _mirack, */ \
+	/* .mistat = _mistat */ \
 }
 #define D_GATE(_idx, _n, _src, ...) { \
 	.type = K_GATE, \
-- 
2.25.1

