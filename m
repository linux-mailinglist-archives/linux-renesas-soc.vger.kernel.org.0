Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E98B6A49FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 19:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjB0SkE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 13:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjB0SkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 13:40:03 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C288F23C67
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:02 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id u6so4487543ilk.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvRZcEOjpe84dNHKtipeodTpG65ip8Z5+VIUJM53Jnk=;
        b=x5aTwF4R4NrRQJ3i1d3pJwKl3bgA+x4MqL8jbeJf/LZNER2Y8xoZbjAmJaw7ThIB6O
         RyAzzhqAXLvzvftBpzsw4MoNdmY7v/OXZgYwSNnPCgzOqAcWWNDyinjGlI1RwfQfDyr9
         0A0gJ1IbJJpIqjMgMGI9/Nr4BMk84M9F944RU4yakoPKRBjR8rzHv9a6LmQxmi9TKJMq
         JgaSCLN2NO8pAsjMy5CRZgNn9MZtoPo3+NGAHG8bckZsmjesdUJC/UyMdhDaOjHeBpmC
         2bsNev/QGzal8DMnuGzS6tfUgEroIlBH6dpM/slZC20IOU4+56/juVtz6k+80AigObsi
         8gaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvRZcEOjpe84dNHKtipeodTpG65ip8Z5+VIUJM53Jnk=;
        b=mhmf8YSyRpuzc6H0Wma8XzEIIql3YOvM+i7T/4oXSfm8Cglv/639Au1AMPgEvPDVnv
         p7154YBqdMZOMHIiXl7+A+t0Ajxdr3aBnWM9o0ajAdC4ChaAd4JkpDH6TD1t3jY5hbaR
         DfX2/mNR5cYfxwfSTiiCOlEct+cqlR7UQTLmIUgS/pt1YPrEr+Q6sw1ZJl8mX96pu5Q8
         NFiUZUYmQKKKiMHSVtTkP5d+Lat2dy7RVSvQOMnMb8OaKWekCpucBUa3x9hwHG2fNoO7
         MSmGT9prlVsv1+iRseAoKECaSSWoc7TMC03eIIhyvVYYgR7Dfmqk0BW1lIuhxXTErYyp
         pUEQ==
X-Gm-Message-State: AO0yUKVWxEw0Uo7ipIzT3E1o27jVJ64qYYtcXyq5HE8Wo/jKeLfNqtvn
        0XXLOfDtRk+8iutwLzIgqt/76Lx5zW0AVPOa
X-Google-Smtp-Source: AK7set8Uji/FBNwHP7Vis5mB5oTajfS7wig9uiZpdZN8vphuCCqnSZCL1nYkHS5NuwRS6m90ld3kzw==
X-Received: by 2002:a05:6e02:17c9:b0:315:2b7c:3bcd with SMTP id z9-20020a056e0217c900b003152b7c3bcdmr393139ilu.23.1677523202503;
        Mon, 27 Feb 2023 10:40:02 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id t5-20020a02ab85000000b003ab21c8fa84sm2331202jan.121.2023.02.27.10.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:40:02 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 3/4] clk: renesas: r9a06g032: document structs
Date:   Mon, 27 Feb 2023 13:39:35 -0500
Message-Id: <20230227183937.377612-4-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227183937.377612-1-ralph.siemsen@linaro.org>
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
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

Add some kerneldoc comments for the structures.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---

 drivers/clk/renesas/r9a06g032-clocks.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 8a1ab9da19ae..1b7801f14c8c 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -27,6 +27,26 @@
 
 #define R9A06G032_SYSCTRL_DMAMUX 0xA0
 
+/**
+ * struct r9a06g032_gate - clock gate control bits
+ * @gate:   bit which enables/disables the clock
+ * @reset:  bit which controls module reset (active low)
+ * @ready:  bit which indicates device is ready for access
+ * @midle:  bit which requests to idle the NoC interconnect
+ *
+ * Each of these fields describes a single bit in a register,
+ * which controls some aspect of clock gating. The @gate field
+ * is mandatory, this one enables/disables the clock. The
+ * other fields are optional, with zero indicating "not used".
+ *
+ * In most cases there is a @reset bit which needs to be
+ * de-asserted to bring the module out of reset.
+ *
+ * Modules may also need to signal when the are @ready to
+ * handle requests (read/writes) from the NoC interconnect.
+ *
+ * Similarly, the @midle bit is used to idle the master.
+ */
 struct r9a06g032_gate {
 	u16 gate, reset, ready, midle;
 	/* Unused fields omitted to save space */
@@ -41,7 +61,21 @@ enum gate_type {
 	K_DUALGATE	/* special for UARTs */
 };
 
-/* This is used to describe a clock for instantiation */
+/**
+ * struct r9a06g032_clkdesc - describe a single clock
+ * @name:    string describing this clock
+ * @managed: boolan indicating if this clock should be
+ *           start/stop as part of power management
+ * @type:   see enum gate_type
+ * @index:  the ID of this clock element
+ * @source: the ID+1 of the parent clock element.
+ *          Root clock uses ID of ~0 (PARENT_ID);
+ * @gate:   describes the bits which control clock gate
+ *
+ * Describes a single element in the clock tree hierarchy.
+ * As there are quite a large number of clock elements, this
+ * structure is packed tightly to conserve space.
+ */
 struct r9a06g032_clkdesc {
 	const char *name;
 	uint32_t managed:1;
-- 
2.25.1

