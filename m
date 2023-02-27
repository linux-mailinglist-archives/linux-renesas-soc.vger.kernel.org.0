Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A636A49F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 19:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjB0SkD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 13:40:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjB0SkC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 13:40:02 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404AB1C5A9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:01 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id z5so4545190ilq.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1KoB75hAwN31KxldE+xbL71LyrZOkxsk+F2rx0MUAo=;
        b=ql0Mn1lyaGn835+b3proIg/1JBpPFT2vtpumqcByfG5nHjD+2PiRZXNUMsS/Y6cEkO
         RJdjSIYND61jYB+OOIdJuWeNYj1st/yly8ckL6h/S8M0RBYogBjBlTMLTZiG5l4aGX6w
         20OQyjMftuw7HmDdcXH7vOWLRpIW1258FAcCs4dRYjbXJrmqPfXpX+Hxxq6rv/FDoUZn
         2WVGZWasgaEcW/Dd0wznoYhzDaKbNceXf8y6RoV9XjurJVabjRL3Cj1BLgP0RdfsJtBP
         9mpJFobjNoxrEyaZmQlrU+iFmoBSn4OPwN63+tTk6EYLyZp+6AYNi+fSCvuy45DuyLD2
         821w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1KoB75hAwN31KxldE+xbL71LyrZOkxsk+F2rx0MUAo=;
        b=PzVOn+RRn/LgaVkcgVueXIga84Xjf9SOuKs0BxstAWl6ZN+qnASDD7n1lxJSuQg5HD
         NDrEH4fT9qTtRSP8yE9n6f0QMCP9t6r0gaclKhoxPPe5CWxv9ileIzhIhiYV4GblAaBw
         KF17/TN8O39PZkPrs4e3O9Ayh9fixj3LLGFsbb4yIqDKuZvGU9dS2KKFUvCXe+7tggBc
         1iiMGaRdQ5eUNCbWdBudohUvjT3DV5D9f4aB267yrPzK7VRDaRenbdxyV49EGr9NokXB
         PGrz4R/xZqZKRwE1g1Ro1lK5rjBh1wDr1Gyv2JNUmasd6E+Jzp/Ku+DZcwbuFkVsKvX7
         NbmA==
X-Gm-Message-State: AO0yUKXIBdmYpemfu9TSQD0dfbLcZEbfWujeAuDBEUJ09GK2d0Jm9E58
        4Ch8QhwGeqk34HKtXlcv+qs0IYcJxXUBVHP6
X-Google-Smtp-Source: AK7set8NImoC6e3e0H+02eSpBsqr936u0fj2IQoBnk4bYF18yMp/MY3ZD5CTGrRpOsSleN01MNyHyA==
X-Received: by 2002:a05:6e02:17c6:b0:315:4484:4273 with SMTP id z6-20020a056e0217c600b0031544844273mr8076574ilu.10.1677523200618;
        Mon, 27 Feb 2023 10:40:00 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id t5-20020a02ab85000000b003ab21c8fa84sm2331202jan.121.2023.02.27.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:40:00 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 1/4] clk: renesas: r9a06g032: improve readability
Date:   Mon, 27 Feb 2023 13:39:33 -0500
Message-Id: <20230227183937.377612-2-ralph.siemsen@linaro.org>
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

Several small readability improvements:
- Move enum gate_type definition up and add comments to each field.
- Use this enum instead of generic uint32_t type in clock desc struct.
- Tidy up bitfield syntax and comments in clock desc structure
- Reformat macros for building clock desc to have one assignment per line

There is no functional change.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---

 drivers/clk/renesas/r9a06g032-clocks.c | 121 ++++++++++++++++---------
 1 file changed, 80 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 983faa5707b9..75a095a15c03 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -32,64 +32,103 @@ struct r9a06g032_gate {
 		scon, mirack, mistat;
 };
 
+enum gate_type {
+	K_GATE = 0,	/* gate which enable/disable */
+	K_FFC,		/* fixed factor clock */
+	K_DIV,		/* divisor */
+	K_BITSEL,	/* special for UARTs */
+	K_DUALGATE	/* special for UARTs */
+};
+
 /* This is used to describe a clock for instantiation */
 struct r9a06g032_clkdesc {
 	const char *name;
-	uint32_t managed: 1;
-	uint32_t type: 3;
-	uint32_t index: 8;
-	uint32_t source : 8; /* source index + 1 (0 == none) */
-	/* these are used to populate the bitsel struct */
+	uint32_t managed:1;
+	enum gate_type type:3;
+	uint32_t index:8;
+	uint32_t source:8; /* source index + 1 (0 == none) */
 	union {
+		/* type = K_GATE */
 		struct r9a06g032_gate gate;
-		/* for dividers */
+		/* type = K_DIV  */
 		struct {
-			unsigned int div_min : 10, div_max : 10, reg: 10;
+			unsigned int div_min:10, div_max:10, reg:10;
 			u16 div_table[4];
 		};
-		/* For fixed-factor ones */
+		/* type = K_FFC */
 		struct {
 			u16 div, mul;
 		};
-		/* for dual gate */
+		/* type = K_DUALGATE */
 		struct {
-			uint16_t group : 1;
+			uint16_t group:1;
 			u16 sel, g1, r1, g2, r2;
 		} dual;
 	};
 };
 
-#define I_GATE(_clk, _rst, _rdy, _midle, _scon, _mirack, _mistat) \
-	{ .gate = _clk, .reset = _rst, \
-		.ready = _rdy, .midle = _midle, \
-		.scon = _scon, .mirack = _mirack, .mistat = _mistat }
-#define D_GATE(_idx, _n, _src, ...) \
-	{ .type = K_GATE, .index = R9A06G032_##_idx, \
-		.source = 1 + R9A06G032_##_src, .name = _n, \
-		.gate = I_GATE(__VA_ARGS__) }
-#define D_MODULE(_idx, _n, _src, ...) \
-	{ .type = K_GATE, .index = R9A06G032_##_idx, \
-		.source = 1 + R9A06G032_##_src, .name = _n, \
-		.managed = 1, .gate = I_GATE(__VA_ARGS__) }
-#define D_ROOT(_idx, _n, _mul, _div) \
-	{ .type = K_FFC, .index = R9A06G032_##_idx, .name = _n, \
-		.div = _div, .mul = _mul }
-#define D_FFC(_idx, _n, _src, _div) \
-	{ .type = K_FFC, .index = R9A06G032_##_idx, \
-		.source = 1 + R9A06G032_##_src, .name = _n, \
-		.div = _div, .mul = 1}
-#define D_DIV(_idx, _n, _src, _reg, _min, _max, ...) \
-	{ .type = K_DIV, .index = R9A06G032_##_idx, \
-		.source = 1 + R9A06G032_##_src, .name = _n, \
-		.reg = _reg, .div_min = _min, .div_max = _max, \
-		.div_table = { __VA_ARGS__ } }
-#define D_UGATE(_idx, _n, _src, _g, _g1, _r1, _g2, _r2) \
-	{ .type = K_DUALGATE, .index = R9A06G032_##_idx, \
-		.source = 1 + R9A06G032_##_src, .name = _n, \
-		.dual = { .group = _g, \
-			.g1 = _g1, .r1 = _r1, .g2 = _g2, .r2 = _r2 }, }
-
-enum { K_GATE = 0, K_FFC, K_DIV, K_BITSEL, K_DUALGATE };
+#define I_GATE(_clk, _rst, _rdy, _midle, _scon, _mirack, _mistat) { \
+	.gate = _clk, \
+	.reset = _rst, \
+	.ready = _rdy, \
+	.midle = _midle, \
+	.scon = _scon, \
+	.mirack = _mirack, \
+	.mistat = _mistat \
+}
+#define D_GATE(_idx, _n, _src, ...) { \
+	.type = K_GATE, \
+	.index = R9A06G032_##_idx, \
+	.source = 1 + R9A06G032_##_src, \
+	.name = _n, \
+	.gate = I_GATE(__VA_ARGS__) \
+}
+#define D_MODULE(_idx, _n, _src, ...) { \
+	.type = K_GATE, \
+	.index = R9A06G032_##_idx, \
+	.source = 1 + R9A06G032_##_src, \
+	.name = _n, \
+	.managed = 1, \
+	.gate = I_GATE(__VA_ARGS__) \
+}
+#define D_ROOT(_idx, _n, _mul, _div) { \
+	.type = K_FFC, \
+	.index = R9A06G032_##_idx, \
+	.name = _n, \
+	.div = _div, \
+	.mul = _mul \
+}
+#define D_FFC(_idx, _n, _src, _div) { \
+	.type = K_FFC, \
+	.index = R9A06G032_##_idx, \
+	.source = 1 + R9A06G032_##_src, \
+	.name = _n, \
+	.div = _div, \
+	.mul = 1 \
+}
+#define D_DIV(_idx, _n, _src, _reg, _min, _max, ...) { \
+	.type = K_DIV, \
+	.index = R9A06G032_##_idx, \
+	.source = 1 + R9A06G032_##_src, \
+	.name = _n, \
+	.reg = _reg, \
+	.div_min = _min, \
+	.div_max = _max, \
+	.div_table = { __VA_ARGS__ } \
+}
+#define D_UGATE(_idx, _n, _src, _g, _g1, _r1, _g2, _r2) { \
+	.type = K_DUALGATE, \
+	.index = R9A06G032_##_idx, \
+	.source = 1 + R9A06G032_##_src, \
+	.name = _n, \
+	.dual = { \
+		.group = _g, \
+		.g1 = _g1, \
+		.r1 = _r1, \
+		.g2 = _g2, \
+		.r2 = _r2 \
+	}, \
+}
 
 /* Internal clock IDs */
 #define R9A06G032_CLKOUT		0
-- 
2.25.1

