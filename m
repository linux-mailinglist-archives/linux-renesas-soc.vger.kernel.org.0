Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81C186A767A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Mar 2023 22:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjCAV4O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Mar 2023 16:56:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCAV4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Mar 2023 16:56:13 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0D52F7B0
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Mar 2023 13:56:12 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id m22so5591616ioy.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Mar 2023 13:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677707771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZO8O+I9LUWmNo8ATGaFy3Qaxy0gBTLvRjK5vCCgp1E=;
        b=f/QV57sDtGyZYkzde6+rJBMR1+tCuVDwgvWB252i6q5bxTasFn5eM+IggWCyB1zIv5
         G4ueGN1yCna9+NJIKWLKhBx6EY1dCyL1p+BDGzrQ2KJqOV32z+VIyWqbHk3o5JZeBOaE
         zBE5CReNyvmdya3Ky+DRgQad7k+/k4+mMn3P0h04XyQzEpal03ecq9rnUlmTlMW7zDli
         Ed+65feIiQtshA+WuwofIEKcDW/kh+/rW5msZl5g9+OFVeaiOKpwc4i2WTzbAcALKDNa
         BgZZTPAKUAJt7mFHj75sjI5xGf7V2VzFGtTB63BMFAC4x+G+pXRyM2msgMmW39EODi2b
         EfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677707771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZO8O+I9LUWmNo8ATGaFy3Qaxy0gBTLvRjK5vCCgp1E=;
        b=VCQdgYOConKpodL4UHUgJyWUq+RnwHZQlEeQV3YqvnCoNZ+h9b7SLdLvAdEDp1Yysw
         sP2CVq3YGk+X84fZojH/ZvL6EuXQ5xrO46kF+32HfX4q6owbm1kOwHwNbrhoiFdl4DwU
         drU1J+5vEpL5n0drscpIs0vklox8KqRK/bTyKUTX8PipR7NOOK+qxqub7IRxIaOXnLki
         YbD7oAkrDMtc//3BfGWn6r3ZIDkTNo7K6Z/Xay3EO2GpDF5/TsQ551SRelbpfWTy8eS8
         A8PrUFQbrByYQ27UZqv/PZ27FDaREWtn2LctaXyciAcIVknMjqgLUXEE2NrydMY9n2Eq
         idJQ==
X-Gm-Message-State: AO0yUKX7DjNAW+rQQj38VRLfUsBZ3gD8faks6N7aJv9K42tSZtEILGZi
        6fYJUiQMncL03R3E59VaMWHh0ybkMNK6Q0O3
X-Google-Smtp-Source: AK7set9J68dtvkpIAbdhQXiF9nYsFXTyqTzeyZ7dfen8N10j04WJz98Er46n5+vd0bfBVWbx8LSALg==
X-Received: by 2002:a5d:8441:0:b0:74c:fe71:5808 with SMTP id w1-20020a5d8441000000b0074cfe715808mr5184170ior.6.1677707771522;
        Wed, 01 Mar 2023 13:56:11 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id v11-20020a5ec10b000000b0074c9a4bb374sm4173479iol.11.2023.03.01.13.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 13:56:10 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH v2 1/4] clk: renesas: r9a06g032: improve readability
Date:   Wed,  1 Mar 2023 16:55:17 -0500
Message-Id: <20230301215520.828455-2-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230301215520.828455-1-ralph.siemsen@linaro.org>
References: <20230301215520.828455-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

(no changes since v1)

 drivers/clk/renesas/r9a06g032-clocks.c | 121 ++++++++++++++++---------
 1 file changed, 80 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 087146f2ee06..cc479d95ef55 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -34,64 +34,103 @@ struct r9a06g032_gate {
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

