Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6BF96A49FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Feb 2023 19:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjB0SkJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Feb 2023 13:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjB0SkI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 13:40:08 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083601C5A9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:04 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id u6so4487596ilk.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Feb 2023 10:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziZzM8jtkEEo1akn+LnJJNhlQlyyL2qBEmQf+bf51y0=;
        b=aDrv8jEOGVE2GJkPcHaedxg3gdjWieW7RQ/2M61LlO6caF8+Dv0U61/WNoCv5QrSck
         FU5kQszaDtF0rh38nMNosCNE5tVapCCxkdhWPJpRzcXU1N0J4ycArZvS5DAhy2jS8ZmX
         5yKBkfb5ocG3Sj8lI6t9Hslc3jwwPaNiXjs70D2Gc7j3ATQkNyUt9DpYdRspaIZnzD0H
         IHSHBTh0LpXQInFi1PX+7PrwrtAHWQJdkgsY3xfn1oHtn5GO3ThqjHGQeq8krmLiOFA+
         TOA5Jp0DCKMsULa897Mh33r1uj3hgugcHkGdO5EoVQcdPFEGSbaUY4PjWNFQydF+JvgM
         N7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziZzM8jtkEEo1akn+LnJJNhlQlyyL2qBEmQf+bf51y0=;
        b=KTwTD42UqExmhYHRZj/FP316kd8pE8JKagQppiVIPkrLFRwbdA9+ZrMxkMgcqUU9VJ
         rDlU90hSC37Gj1UlRac/zuJRQ7X4zg16Q7oszDQd5BTi4+yc9B2x9LbHFcPjx089RLeV
         uath2E9gbnbP8JYPdn4JeEAht08PIuzezf3CeWlN7TJM7ee+y/AMYruscem6P+DiVJgz
         q1pQSwoOd7WIK5ewl5mfDO3DSr5izSJNA3qpguI+1zE22NQ1PDKJFf1LwgD51j2ubvkm
         kCd/mqc2ww87erabtQTjP0g2s5lWG1ixSViQjHFXTZypFRY0livBBBHKii2dyEKS6eFE
         wo2A==
X-Gm-Message-State: AO0yUKXRXGX8dT2KXBhdEieEBTsyyuH0p0VOBNYOQgSzgrIQPia4yu2A
        BfSrC+xkJPx6C2wX5iOYhOdxdlUkkxNnXrH0
X-Google-Smtp-Source: AK7set/BxPGuCes04DpsIdvaHHcw5q8K3zgOO3AwUuqRbjb6Nrxm3gxgXReMqi6NUZJT9FqxG2x1KA==
X-Received: by 2002:a05:6e02:1a04:b0:313:b452:dee0 with SMTP id s4-20020a056e021a0400b00313b452dee0mr463481ild.10.1677523203413;
        Mon, 27 Feb 2023 10:40:03 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id t5-20020a02ab85000000b003ab21c8fa84sm2331202jan.121.2023.02.27.10.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:40:03 -0800 (PST)
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
To:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH 4/4] clk: renesas: r9a06g032: improve clock tables
Date:   Mon, 27 Feb 2023 13:39:36 -0500
Message-Id: <20230227183937.377612-5-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227183937.377612-1-ralph.siemsen@linaro.org>
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Each entry in the clock table specifies a number of individual bits in
registers, for contolling clock reset, gaiting, etc. These reg/bit were
packed into a u16 to save space. The combined value is difficult to
understand when reviewing the clock table entries.

Introduce a "struct regbit" which still occupies only 16 bits, but
allows the register and bit values to be specified explicitly. Convert
all previous uses of u16 for reg/bit into "struct regbit".

The bulk of this patch converts the clock table to use struct regbit,
making use of the RB() helper macro. The conversion was automated by
script, and as a further verification, the compiled binary of the table
was compared before/after the change (with objdump -D).

The clk_rdesc_set() function now checks for zero reg/bit internally.
This allows callers of that function to remove those checks.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---

 drivers/clk/renesas/r9a06g032-clocks.c | 564 ++++++++++++++++++-------
 1 file changed, 410 insertions(+), 154 deletions(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index 1b7801f14c8c..f5d12d8f1b22 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -27,6 +27,34 @@
 
 #define R9A06G032_SYSCTRL_DMAMUX 0xA0
 
+/**
+ * struct regbit - describe one bit in a register
+ * @reg: offset of register relative to base address,
+ *          expressed in units of 32-bit words (not bytes),
+ * @bit: which bit (0 to 31) in the register
+ *
+ * This structure is used to compactly encode the location
+ * of a single bit in a register. Five bits are needed to
+ * encode the bit number. With uint16_t data type, this
+ * leaves 11 bits to encode a register offset up to 2047.
+ *
+ * Since registers are aligned on 32-bit boundaries, the
+ * offset will be specified in 32-bit words rather than bytes.
+ * This allows encoding an offset up to 0x1FFC (8188) bytes.
+ *
+ * Helper macro RB() takes care of converting the register
+ * offset from bytes to 32-bit words.
+ */
+struct regbit {
+	u16 reg:11;
+	u16 bit:5;
+};
+
+#define RB(_reg, _bit) ((struct regbit) { \
+	.reg = (_reg) >> 2, \
+	.bit = (_bit) \
+})
+
 /**
  * struct r9a06g032_gate - clock gate control bits
  * @gate:   bit which enables/disables the clock
@@ -48,9 +76,9 @@
  * Similarly, the @midle bit is used to idle the master.
  */
 struct r9a06g032_gate {
-	u16 gate, reset, ready, midle;
+	struct regbit gate, reset, ready, midle;
 	/* Unused fields omitted to save space */
-	/* u16 scon, mirack, mistat; */
+	/* struct regbit scon, mirack, mistat */;
 };
 
 enum gate_type {
@@ -97,7 +125,7 @@ struct r9a06g032_clkdesc {
 		/* type = K_DUALGATE */
 		struct {
 			uint16_t group:1;
-			u16 sel, g1, r1, g2, r2;
+			struct regbit sel, g1, r1, g2, r2;
 		} dual;
 	};
 };
@@ -236,58 +264,160 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 	D_DIV(DIV_SDIO1, "div_sdio1", CLKOUT, 75, 20, 128),
 	D_DIV(DIV_SWITCH, "div_switch", CLKOUT, 37, 5, 40),
 	D_DIV(DIV_UART, "div_uart", CLKOUT, 79, 12, 128),
-	D_GATE(CLK_25_PG4, "clk_25_pg4", CLKOUT_D40, 0x749, 0x74a, 0x74b, 0, 0xae3, 0, 0),
-	D_GATE(CLK_25_PG5, "clk_25_pg5", CLKOUT_D40, 0x74c, 0x74d, 0x74e, 0, 0xae4, 0, 0),
-	D_GATE(CLK_25_PG6, "clk_25_pg6", CLKOUT_D40, 0x74f, 0x750, 0x751, 0, 0xae5, 0, 0),
-	D_GATE(CLK_25_PG7, "clk_25_pg7", CLKOUT_D40, 0x752, 0x753, 0x754, 0, 0xae6, 0, 0),
-	D_GATE(CLK_25_PG8, "clk_25_pg8", CLKOUT_D40, 0x755, 0x756, 0x757, 0, 0xae7, 0, 0),
-	D_GATE(CLK_ADC, "clk_adc", DIV_ADC, 0x1ea, 0x1eb, 0, 0, 0, 0, 0),
-	D_GATE(CLK_ECAT100, "clk_ecat100", CLKOUT_D10, 0x405, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_HSR100, "clk_hsr100", CLKOUT_D10, 0x483, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_I2C0, "clk_i2c0", DIV_I2C, 0x1e6, 0x1e7, 0, 0, 0, 0, 0),
-	D_GATE(CLK_I2C1, "clk_i2c1", DIV_I2C, 0x1e8, 0x1e9, 0, 0, 0, 0, 0),
-	D_GATE(CLK_MII_REF, "clk_mii_ref", CLKOUT_D40, 0x342, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_NAND, "clk_nand", DIV_NAND, 0x284, 0x285, 0, 0, 0, 0, 0),
-	D_GATE(CLK_NOUSBP2_PG6, "clk_nousbp2_pg6", DIV_P2_PG, 0x774, 0x775, 0, 0, 0, 0, 0),
-	D_GATE(CLK_P1_PG2, "clk_p1_pg2", DIV_P1_PG, 0x862, 0x863, 0, 0, 0, 0, 0),
-	D_GATE(CLK_P1_PG3, "clk_p1_pg3", DIV_P1_PG, 0x864, 0x865, 0, 0, 0, 0, 0),
-	D_GATE(CLK_P1_PG4, "clk_p1_pg4", DIV_P1_PG, 0x866, 0x867, 0, 0, 0, 0, 0),
-	D_GATE(CLK_P4_PG3, "clk_p4_pg3", DIV_P4_PG, 0x824, 0x825, 0, 0, 0, 0, 0),
-	D_GATE(CLK_P4_PG4, "clk_p4_pg4", DIV_P4_PG, 0x826, 0x827, 0, 0, 0, 0, 0),
-	D_GATE(CLK_P6_PG1, "clk_p6_pg1", DIV_P6_PG, 0x8a0, 0x8a1, 0x8a2, 0, 0xb60, 0, 0),
-	D_GATE(CLK_P6_PG2, "clk_p6_pg2", DIV_P6_PG, 0x8a3, 0x8a4, 0x8a5, 0, 0xb61, 0, 0),
-	D_GATE(CLK_P6_PG3, "clk_p6_pg3", DIV_P6_PG, 0x8a6, 0x8a7, 0x8a8, 0, 0xb62, 0, 0),
-	D_GATE(CLK_P6_PG4, "clk_p6_pg4", DIV_P6_PG, 0x8a9, 0x8aa, 0x8ab, 0, 0xb63, 0, 0),
-	D_MODULE(CLK_PCI_USB, "clk_pci_usb", CLKOUT_D40, 0xe6, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_QSPI0, "clk_qspi0", DIV_QSPI0, 0x2a4, 0x2a5, 0, 0, 0, 0, 0),
-	D_GATE(CLK_QSPI1, "clk_qspi1", DIV_QSPI1, 0x484, 0x485, 0, 0, 0, 0, 0),
-	D_GATE(CLK_RGMII_REF, "clk_rgmii_ref", CLKOUT_D8, 0x340, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_RMII_REF, "clk_rmii_ref", CLKOUT_D20, 0x341, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SDIO0, "clk_sdio0", DIV_SDIO0, 0x64, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SDIO1, "clk_sdio1", DIV_SDIO1, 0x644, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SERCOS100, "clk_sercos100", CLKOUT_D10, 0x425, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SLCD, "clk_slcd", DIV_P1_PG, 0x860, 0x861, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SPI0, "clk_spi0", DIV_P3_PG, 0x7e0, 0x7e1, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SPI1, "clk_spi1", DIV_P3_PG, 0x7e2, 0x7e3, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SPI2, "clk_spi2", DIV_P3_PG, 0x7e4, 0x7e5, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SPI3, "clk_spi3", DIV_P3_PG, 0x7e6, 0x7e7, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SPI4, "clk_spi4", DIV_P4_PG, 0x820, 0x821, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SPI5, "clk_spi5", DIV_P4_PG, 0x822, 0x823, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SWITCH, "clk_switch", DIV_SWITCH, 0x982, 0x983, 0, 0, 0, 0, 0),
+	D_GATE(CLK_25_PG4, "clk_25_pg4", CLKOUT_D40, RB(0xe8, 9),
+	       RB(0xe8, 10), RB(0xe8, 11), RB(0x00, 0),
+	       RB(0x15c, 3), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_25_PG5, "clk_25_pg5", CLKOUT_D40, RB(0xe8, 12),
+	       RB(0xe8, 13), RB(0xe8, 14), RB(0x00, 0),
+	       RB(0x15c, 4), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_25_PG6, "clk_25_pg6", CLKOUT_D40, RB(0xe8, 15),
+	       RB(0xe8, 16), RB(0xe8, 17), RB(0x00, 0),
+	       RB(0x15c, 5), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_25_PG7, "clk_25_pg7", CLKOUT_D40, RB(0xe8, 18),
+	       RB(0xe8, 19), RB(0xe8, 20), RB(0x00, 0),
+	       RB(0x15c, 6), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_25_PG8, "clk_25_pg8", CLKOUT_D40, RB(0xe8, 21),
+	       RB(0xe8, 22), RB(0xe8, 23), RB(0x00, 0),
+	       RB(0x15c, 7), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_ADC, "clk_adc", DIV_ADC, RB(0x3c, 10),
+	       RB(0x3c, 11), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_ECAT100, "clk_ecat100", CLKOUT_D10, RB(0x80, 5),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_HSR100, "clk_hsr100", CLKOUT_D10, RB(0x90, 3),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_I2C0, "clk_i2c0", DIV_I2C, RB(0x3c, 6),
+	       RB(0x3c, 7), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_I2C1, "clk_i2c1", DIV_I2C, RB(0x3c, 8),
+	       RB(0x3c, 9), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_MII_REF, "clk_mii_ref", CLKOUT_D40, RB(0x68, 2),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_NAND, "clk_nand", DIV_NAND, RB(0x50, 4),
+	       RB(0x50, 5), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_NOUSBP2_PG6, "clk_nousbp2_pg6", DIV_P2_PG, RB(0xec, 20),
+	       RB(0xec, 21), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_P1_PG2, "clk_p1_pg2", DIV_P1_PG, RB(0x10c, 2),
+	       RB(0x10c, 3), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_P1_PG3, "clk_p1_pg3", DIV_P1_PG, RB(0x10c, 4),
+	       RB(0x10c, 5), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_P1_PG4, "clk_p1_pg4", DIV_P1_PG, RB(0x10c, 6),
+	       RB(0x10c, 7), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_P4_PG3, "clk_p4_pg3", DIV_P4_PG, RB(0x104, 4),
+	       RB(0x104, 5), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_P4_PG4, "clk_p4_pg4", DIV_P4_PG, RB(0x104, 6),
+	       RB(0x104, 7), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_P6_PG1, "clk_p6_pg1", DIV_P6_PG, RB(0x114, 0),
+	       RB(0x114, 1), RB(0x114, 2), RB(0x00, 0),
+	       RB(0x16c, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_P6_PG2, "clk_p6_pg2", DIV_P6_PG, RB(0x114, 3),
+	       RB(0x114, 4), RB(0x114, 5), RB(0x00, 0),
+	       RB(0x16c, 1), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_P6_PG3, "clk_p6_pg3", DIV_P6_PG, RB(0x114, 6),
+	       RB(0x114, 7), RB(0x114, 8), RB(0x00, 0),
+	       RB(0x16c, 2), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_P6_PG4, "clk_p6_pg4", DIV_P6_PG, RB(0x114, 9),
+	       RB(0x114, 10), RB(0x114, 11), RB(0x00, 0),
+	       RB(0x16c, 3), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(CLK_PCI_USB, "clk_pci_usb", CLKOUT_D40, RB(0x1c, 6),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_QSPI0, "clk_qspi0", DIV_QSPI0, RB(0x54, 4),
+	       RB(0x54, 5), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_QSPI1, "clk_qspi1", DIV_QSPI1, RB(0x90, 4),
+	       RB(0x90, 5), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_RGMII_REF, "clk_rgmii_ref", CLKOUT_D8, RB(0x68, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_RMII_REF, "clk_rmii_ref", CLKOUT_D20, RB(0x68, 1),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SDIO0, "clk_sdio0", DIV_SDIO0, RB(0x0c, 4),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SDIO1, "clk_sdio1", DIV_SDIO1, RB(0xc8, 4),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SERCOS100, "clk_sercos100", CLKOUT_D10, RB(0x84, 5),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SLCD, "clk_slcd", DIV_P1_PG, RB(0x10c, 0),
+	       RB(0x10c, 1), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SPI0, "clk_spi0", DIV_P3_PG, RB(0xfc, 0),
+	       RB(0xfc, 1), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SPI1, "clk_spi1", DIV_P3_PG, RB(0xfc, 2),
+	       RB(0xfc, 3), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SPI2, "clk_spi2", DIV_P3_PG, RB(0xfc, 4),
+	       RB(0xfc, 5), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SPI3, "clk_spi3", DIV_P3_PG, RB(0xfc, 6),
+	       RB(0xfc, 7), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SPI4, "clk_spi4", DIV_P4_PG, RB(0x104, 0),
+	       RB(0x104, 1), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SPI5, "clk_spi5", DIV_P4_PG, RB(0x104, 2),
+	       RB(0x104, 3), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SWITCH, "clk_switch", DIV_SWITCH, RB(0x130, 2),
+	       RB(0x130, 3), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
 	D_DIV(DIV_MOTOR, "div_motor", CLKOUT_D5, 84, 2, 8),
-	D_MODULE(HCLK_ECAT125, "hclk_ecat125", CLKOUT_D8, 0x400, 0x401, 0, 0x402, 0, 0x440, 0x441),
-	D_MODULE(HCLK_PINCONFIG, "hclk_pinconfig", CLKOUT_D40, 0x740, 0x741, 0x742, 0, 0xae0, 0, 0),
-	D_MODULE(HCLK_SERCOS, "hclk_sercos", CLKOUT_D10, 0x420, 0x422, 0, 0x421, 0, 0x460, 0x461),
-	D_MODULE(HCLK_SGPIO2, "hclk_sgpio2", DIV_P5_PG, 0x8c3, 0x8c4, 0x8c5, 0, 0xb41, 0, 0),
-	D_MODULE(HCLK_SGPIO3, "hclk_sgpio3", DIV_P5_PG, 0x8c6, 0x8c7, 0x8c8, 0, 0xb42, 0, 0),
-	D_MODULE(HCLK_SGPIO4, "hclk_sgpio4", DIV_P5_PG, 0x8c9, 0x8ca, 0x8cb, 0, 0xb43, 0, 0),
-	D_MODULE(HCLK_TIMER0, "hclk_timer0", CLKOUT_D40, 0x743, 0x744, 0x745, 0, 0xae1, 0, 0),
-	D_MODULE(HCLK_TIMER1, "hclk_timer1", CLKOUT_D40, 0x746, 0x747, 0x748, 0, 0xae2, 0, 0),
-	D_MODULE(HCLK_USBF, "hclk_usbf", CLKOUT_D8, 0xe3, 0, 0, 0xe4, 0, 0x102, 0x103),
-	D_MODULE(HCLK_USBH, "hclk_usbh", CLKOUT_D8, 0xe0, 0xe1, 0, 0xe2, 0, 0x100, 0x101),
-	D_MODULE(HCLK_USBPM, "hclk_usbpm", CLKOUT_D8, 0xe5, 0, 0, 0, 0, 0, 0),
-	D_GATE(CLK_48_PG_F, "clk_48_pg_f", CLK_48, 0x78c, 0x78d, 0, 0x78e, 0, 0xb04, 0xb05),
-	D_GATE(CLK_48_PG4, "clk_48_pg4", CLK_48, 0x789, 0x78a, 0x78b, 0, 0xb03, 0, 0),
+	D_MODULE(HCLK_ECAT125, "hclk_ecat125", CLKOUT_D8, RB(0x80, 0),
+		 RB(0x80, 1), RB(0x00, 0), RB(0x80, 2),
+		 RB(0x00, 0), RB(0x88, 0), RB(0x88, 1)),
+	D_MODULE(HCLK_PINCONFIG, "hclk_pinconfig", CLKOUT_D40, RB(0xe8, 0),
+		 RB(0xe8, 1), RB(0xe8, 2), RB(0x00, 0),
+		 RB(0x15c, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SERCOS, "hclk_sercos", CLKOUT_D10, RB(0x84, 0),
+		 RB(0x84, 2), RB(0x00, 0), RB(0x84, 1),
+		 RB(0x00, 0), RB(0x8c, 0), RB(0x8c, 1)),
+	D_MODULE(HCLK_SGPIO2, "hclk_sgpio2", DIV_P5_PG, RB(0x118, 3),
+		 RB(0x118, 4), RB(0x118, 5), RB(0x00, 0),
+		 RB(0x168, 1), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SGPIO3, "hclk_sgpio3", DIV_P5_PG, RB(0x118, 6),
+		 RB(0x118, 7), RB(0x118, 8), RB(0x00, 0),
+		 RB(0x168, 2), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SGPIO4, "hclk_sgpio4", DIV_P5_PG, RB(0x118, 9),
+		 RB(0x118, 10), RB(0x118, 11), RB(0x00, 0),
+		 RB(0x168, 3), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_TIMER0, "hclk_timer0", CLKOUT_D40, RB(0xe8, 3),
+		 RB(0xe8, 4), RB(0xe8, 5), RB(0x00, 0),
+		 RB(0x15c, 1), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_TIMER1, "hclk_timer1", CLKOUT_D40, RB(0xe8, 6),
+		 RB(0xe8, 7), RB(0xe8, 8), RB(0x00, 0),
+		 RB(0x15c, 2), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_USBF, "hclk_usbf", CLKOUT_D8, RB(0x1c, 3),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x1c, 4),
+		 RB(0x00, 0), RB(0x20, 2), RB(0x20, 3)),
+	D_MODULE(HCLK_USBH, "hclk_usbh", CLKOUT_D8, RB(0x1c, 0),
+		 RB(0x1c, 1), RB(0x00, 0), RB(0x1c, 2),
+		 RB(0x00, 0), RB(0x20, 0), RB(0x20, 1)),
+	D_MODULE(HCLK_USBPM, "hclk_usbpm", CLKOUT_D8, RB(0x1c, 5),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_48_PG_F, "clk_48_pg_f", CLK_48, RB(0xf0, 12),
+	       RB(0xf0, 13), RB(0x00, 0), RB(0xf0, 14),
+	       RB(0x00, 0), RB(0x160, 4), RB(0x160, 5)),
+	D_GATE(CLK_48_PG4, "clk_48_pg4", CLK_48, RB(0xf0, 9),
+	       RB(0xf0, 10), RB(0xf0, 11), RB(0x00, 0),
+	       RB(0x160, 3), RB(0x00, 0), RB(0x00, 0)),
 	D_FFC(CLK_DDRPHY_PLLCLK_D4, "clk_ddrphy_pllclk_d4", CLK_DDRPHY_PLLCLK, 4),
 	D_FFC(CLK_ECAT100_D4, "clk_ecat100_d4", CLK_ECAT100, 4),
 	D_FFC(CLK_HSR100_D2, "clk_hsr100_d2", CLK_HSR100, 2),
@@ -295,67 +425,187 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 	D_FFC(CLK_REF_SYNC_D8, "clk_ref_sync_d8", CLK_REF_SYNC, 8),
 	D_FFC(CLK_SERCOS100_D2, "clk_sercos100_d2", CLK_SERCOS100, 2),
 	D_DIV(DIV_CA7, "div_ca7", CLK_REF_SYNC, 57, 1, 4, 1, 2, 4),
-	D_MODULE(HCLK_CAN0, "hclk_can0", CLK_48, 0x783, 0x784, 0x785, 0, 0xb01, 0, 0),
-	D_MODULE(HCLK_CAN1, "hclk_can1", CLK_48, 0x786, 0x787, 0x788, 0, 0xb02, 0, 0),
-	D_MODULE(HCLK_DELTASIGMA, "hclk_deltasigma", DIV_MOTOR, 0x1ef, 0x1f0, 0x1f1, 0, 0, 0, 0),
-	D_MODULE(HCLK_PWMPTO, "hclk_pwmpto", DIV_MOTOR, 0x1ec, 0x1ed, 0x1ee, 0, 0, 0, 0),
-	D_MODULE(HCLK_RSV, "hclk_rsv", CLK_48, 0x780, 0x781, 0x782, 0, 0xb00, 0, 0),
-	D_MODULE(HCLK_SGPIO0, "hclk_sgpio0", DIV_MOTOR, 0x1e0, 0x1e1, 0x1e2, 0, 0, 0, 0),
-	D_MODULE(HCLK_SGPIO1, "hclk_sgpio1", DIV_MOTOR, 0x1e3, 0x1e4, 0x1e5, 0, 0, 0, 0),
+	D_MODULE(HCLK_CAN0, "hclk_can0", CLK_48, RB(0xf0, 3),
+		 RB(0xf0, 4), RB(0xf0, 5), RB(0x00, 0),
+		 RB(0x160, 1), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_CAN1, "hclk_can1", CLK_48, RB(0xf0, 6),
+		 RB(0xf0, 7), RB(0xf0, 8), RB(0x00, 0),
+		 RB(0x160, 2), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_DELTASIGMA, "hclk_deltasigma", DIV_MOTOR, RB(0x3c, 15),
+		 RB(0x3c, 16), RB(0x3c, 17), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_PWMPTO, "hclk_pwmpto", DIV_MOTOR, RB(0x3c, 12),
+		 RB(0x3c, 13), RB(0x3c, 14), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_RSV, "hclk_rsv", CLK_48, RB(0xf0, 0),
+		 RB(0xf0, 1), RB(0xf0, 2), RB(0x00, 0),
+		 RB(0x160, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SGPIO0, "hclk_sgpio0", DIV_MOTOR, RB(0x3c, 0),
+		 RB(0x3c, 1), RB(0x3c, 2), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SGPIO1, "hclk_sgpio1", DIV_MOTOR, RB(0x3c, 3),
+		 RB(0x3c, 4), RB(0x3c, 5), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
 	D_DIV(RTOS_MDC, "rtos_mdc", CLK_REF_SYNC, 100, 80, 640, 80, 160, 320, 640),
-	D_GATE(CLK_CM3, "clk_cm3", CLK_REF_SYNC_D4, 0xba0, 0xba1, 0, 0xba2, 0, 0xbc0, 0xbc1),
-	D_GATE(CLK_DDRC, "clk_ddrc", CLK_DDRPHY_PLLCLK_D4, 0x323, 0x324, 0, 0, 0, 0, 0),
-	D_GATE(CLK_ECAT25, "clk_ecat25", CLK_ECAT100_D4, 0x403, 0x404, 0, 0, 0, 0, 0),
-	D_GATE(CLK_HSR50, "clk_hsr50", CLK_HSR100_D2, 0x484, 0x485, 0, 0, 0, 0, 0),
-	D_GATE(CLK_HW_RTOS, "clk_hw_rtos", CLK_REF_SYNC_D4, 0xc60, 0xc61, 0, 0, 0, 0, 0),
-	D_GATE(CLK_SERCOS50, "clk_sercos50", CLK_SERCOS100_D2, 0x424, 0x423, 0, 0, 0, 0, 0),
-	D_MODULE(HCLK_ADC, "hclk_adc", CLK_REF_SYNC_D8, 0x1af, 0x1b0, 0x1b1, 0, 0, 0, 0),
-	D_MODULE(HCLK_CM3, "hclk_cm3", CLK_REF_SYNC_D4, 0xc20, 0xc21, 0xc22, 0, 0, 0, 0),
-	D_MODULE(HCLK_CRYPTO_EIP150, "hclk_crypto_eip150", CLK_REF_SYNC_D4, 0x123, 0x124, 0x125, 0, 0x142, 0, 0),
-	D_MODULE(HCLK_CRYPTO_EIP93, "hclk_crypto_eip93", CLK_REF_SYNC_D4, 0x120, 0x121, 0, 0x122, 0, 0x140, 0x141),
-	D_MODULE(HCLK_DDRC, "hclk_ddrc", CLK_REF_SYNC_D4, 0x320, 0x322, 0, 0x321, 0, 0x3a0, 0x3a1),
-	D_MODULE(HCLK_DMA0, "hclk_dma0", CLK_REF_SYNC_D4, 0x260, 0x261, 0x262, 0x263, 0x2c0, 0x2c1, 0x2c2),
-	D_MODULE(HCLK_DMA1, "hclk_dma1", CLK_REF_SYNC_D4, 0x264, 0x265, 0x266, 0x267, 0x2c3, 0x2c4, 0x2c5),
-	D_MODULE(HCLK_GMAC0, "hclk_gmac0", CLK_REF_SYNC_D4, 0x360, 0x361, 0x362, 0x363, 0x3c0, 0x3c1, 0x3c2),
-	D_MODULE(HCLK_GMAC1, "hclk_gmac1", CLK_REF_SYNC_D4, 0x380, 0x381, 0x382, 0x383, 0x3e0, 0x3e1, 0x3e2),
-	D_MODULE(HCLK_GPIO0, "hclk_gpio0", CLK_REF_SYNC_D4, 0x212, 0x213, 0x214, 0, 0, 0, 0),
-	D_MODULE(HCLK_GPIO1, "hclk_gpio1", CLK_REF_SYNC_D4, 0x215, 0x216, 0x217, 0, 0, 0, 0),
-	D_MODULE(HCLK_GPIO2, "hclk_gpio2", CLK_REF_SYNC_D4, 0x229, 0x22a, 0x22b, 0, 0, 0, 0),
-	D_MODULE(HCLK_HSR, "hclk_hsr", CLK_HSR100_D2, 0x480, 0x482, 0, 0x481, 0, 0x4c0, 0x4c1),
-	D_MODULE(HCLK_I2C0, "hclk_i2c0", CLK_REF_SYNC_D8, 0x1a9, 0x1aa, 0x1ab, 0, 0, 0, 0),
-	D_MODULE(HCLK_I2C1, "hclk_i2c1", CLK_REF_SYNC_D8, 0x1ac, 0x1ad, 0x1ae, 0, 0, 0, 0),
-	D_MODULE(HCLK_LCD, "hclk_lcd", CLK_REF_SYNC_D4, 0x7a0, 0x7a1, 0x7a2, 0, 0xb20, 0, 0),
-	D_MODULE(HCLK_MSEBI_M, "hclk_msebi_m", CLK_REF_SYNC_D4, 0x164, 0x165, 0x166, 0, 0x183, 0, 0),
-	D_MODULE(HCLK_MSEBI_S, "hclk_msebi_s", CLK_REF_SYNC_D4, 0x160, 0x161, 0x162, 0x163, 0x180, 0x181, 0x182),
-	D_MODULE(HCLK_NAND, "hclk_nand", CLK_REF_SYNC_D4, 0x280, 0x281, 0x282, 0x283, 0x2e0, 0x2e1, 0x2e2),
-	D_MODULE(HCLK_PG_I, "hclk_pg_i", CLK_REF_SYNC_D4, 0x7ac, 0x7ad, 0, 0x7ae, 0, 0xb24, 0xb25),
-	D_MODULE(HCLK_PG19, "hclk_pg19", CLK_REF_SYNC_D4, 0x22c, 0x22d, 0x22e, 0, 0, 0, 0),
-	D_MODULE(HCLK_PG20, "hclk_pg20", CLK_REF_SYNC_D4, 0x22f, 0x230, 0x231, 0, 0, 0, 0),
-	D_MODULE(HCLK_PG3, "hclk_pg3", CLK_REF_SYNC_D4, 0x7a6, 0x7a7, 0x7a8, 0, 0xb22, 0, 0),
-	D_MODULE(HCLK_PG4, "hclk_pg4", CLK_REF_SYNC_D4, 0x7a9, 0x7aa, 0x7ab, 0, 0xb23, 0, 0),
-	D_MODULE(HCLK_QSPI0, "hclk_qspi0", CLK_REF_SYNC_D4, 0x2a0, 0x2a1, 0x2a2, 0x2a3, 0x300, 0x301, 0x302),
-	D_MODULE(HCLK_QSPI1, "hclk_qspi1", CLK_REF_SYNC_D4, 0x480, 0x481, 0x482, 0x483, 0x4c0, 0x4c1, 0x4c2),
-	D_MODULE(HCLK_ROM, "hclk_rom", CLK_REF_SYNC_D4, 0xaa0, 0xaa1, 0xaa2, 0, 0xb80, 0, 0),
-	D_MODULE(HCLK_RTC, "hclk_rtc", CLK_REF_SYNC_D8, 0xa00, 0xa03, 0, 0xa02, 0, 0, 0),
-	D_MODULE(HCLK_SDIO0, "hclk_sdio0", CLK_REF_SYNC_D4, 0x60, 0x61, 0x62, 0x63, 0x80, 0x81, 0x82),
-	D_MODULE(HCLK_SDIO1, "hclk_sdio1", CLK_REF_SYNC_D4, 0x640, 0x641, 0x642, 0x643, 0x660, 0x661, 0x662),
-	D_MODULE(HCLK_SEMAP, "hclk_semap", CLK_REF_SYNC_D4, 0x7a3, 0x7a4, 0x7a5, 0, 0xb21, 0, 0),
-	D_MODULE(HCLK_SPI0, "hclk_spi0", CLK_REF_SYNC_D4, 0x200, 0x201, 0x202, 0, 0, 0, 0),
-	D_MODULE(HCLK_SPI1, "hclk_spi1", CLK_REF_SYNC_D4, 0x203, 0x204, 0x205, 0, 0, 0, 0),
-	D_MODULE(HCLK_SPI2, "hclk_spi2", CLK_REF_SYNC_D4, 0x206, 0x207, 0x208, 0, 0, 0, 0),
-	D_MODULE(HCLK_SPI3, "hclk_spi3", CLK_REF_SYNC_D4, 0x209, 0x20a, 0x20b, 0, 0, 0, 0),
-	D_MODULE(HCLK_SPI4, "hclk_spi4", CLK_REF_SYNC_D4, 0x20c, 0x20d, 0x20e, 0, 0, 0, 0),
-	D_MODULE(HCLK_SPI5, "hclk_spi5", CLK_REF_SYNC_D4, 0x20f, 0x210, 0x211, 0, 0, 0, 0),
-	D_MODULE(HCLK_SWITCH, "hclk_switch", CLK_REF_SYNC_D4, 0x980, 0, 0x981, 0, 0, 0, 0),
-	D_MODULE(HCLK_SWITCH_RG, "hclk_switch_rg", CLK_REF_SYNC_D4, 0xc40, 0xc41, 0xc42, 0, 0, 0, 0),
-	D_MODULE(HCLK_UART0, "hclk_uart0", CLK_REF_SYNC_D8, 0x1a0, 0x1a1, 0x1a2, 0, 0, 0, 0),
-	D_MODULE(HCLK_UART1, "hclk_uart1", CLK_REF_SYNC_D8, 0x1a3, 0x1a4, 0x1a5, 0, 0, 0, 0),
-	D_MODULE(HCLK_UART2, "hclk_uart2", CLK_REF_SYNC_D8, 0x1a6, 0x1a7, 0x1a8, 0, 0, 0, 0),
-	D_MODULE(HCLK_UART3, "hclk_uart3", CLK_REF_SYNC_D4, 0x218, 0x219, 0x21a, 0, 0, 0, 0),
-	D_MODULE(HCLK_UART4, "hclk_uart4", CLK_REF_SYNC_D4, 0x21b, 0x21c, 0x21d, 0, 0, 0, 0),
-	D_MODULE(HCLK_UART5, "hclk_uart5", CLK_REF_SYNC_D4, 0x220, 0x221, 0x222, 0, 0, 0, 0),
-	D_MODULE(HCLK_UART6, "hclk_uart6", CLK_REF_SYNC_D4, 0x223, 0x224, 0x225, 0, 0, 0, 0),
-	D_MODULE(HCLK_UART7, "hclk_uart7", CLK_REF_SYNC_D4, 0x226, 0x227, 0x228, 0, 0, 0, 0),
+	D_GATE(CLK_CM3, "clk_cm3", CLK_REF_SYNC_D4, RB(0x174, 0),
+	       RB(0x174, 1), RB(0x00, 0), RB(0x174, 2),
+	       RB(0x00, 0), RB(0x178, 0), RB(0x178, 1)),
+	D_GATE(CLK_DDRC, "clk_ddrc", CLK_DDRPHY_PLLCLK_D4, RB(0x64, 3),
+	       RB(0x64, 4), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_ECAT25, "clk_ecat25", CLK_ECAT100_D4, RB(0x80, 3),
+	       RB(0x80, 4), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_HSR50, "clk_hsr50", CLK_HSR100_D2, RB(0x90, 4),
+	       RB(0x90, 5), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_HW_RTOS, "clk_hw_rtos", CLK_REF_SYNC_D4, RB(0x18c, 0),
+	       RB(0x18c, 1), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_GATE(CLK_SERCOS50, "clk_sercos50", CLK_SERCOS100_D2, RB(0x84, 4),
+	       RB(0x84, 3), RB(0x00, 0), RB(0x00, 0),
+	       RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_ADC, "hclk_adc", CLK_REF_SYNC_D8, RB(0x34, 15),
+		 RB(0x34, 16), RB(0x34, 17), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_CM3, "hclk_cm3", CLK_REF_SYNC_D4, RB(0x184, 0),
+		 RB(0x184, 1), RB(0x184, 2), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_CRYPTO_EIP150, "hclk_crypto_eip150", CLK_REF_SYNC_D4, RB(0x24, 3),
+		 RB(0x24, 4), RB(0x24, 5), RB(0x00, 0),
+		 RB(0x28, 2), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_CRYPTO_EIP93, "hclk_crypto_eip93", CLK_REF_SYNC_D4, RB(0x24, 0),
+		 RB(0x24, 1), RB(0x00, 0), RB(0x24, 2),
+		 RB(0x00, 0), RB(0x28, 0), RB(0x28, 1)),
+	D_MODULE(HCLK_DDRC, "hclk_ddrc", CLK_REF_SYNC_D4, RB(0x64, 0),
+		 RB(0x64, 2), RB(0x00, 0), RB(0x64, 1),
+		 RB(0x00, 0), RB(0x74, 0), RB(0x74, 1)),
+	D_MODULE(HCLK_DMA0, "hclk_dma0", CLK_REF_SYNC_D4, RB(0x4c, 0),
+		 RB(0x4c, 1), RB(0x4c, 2), RB(0x4c, 3),
+		 RB(0x58, 0), RB(0x58, 1), RB(0x58, 2)),
+	D_MODULE(HCLK_DMA1, "hclk_dma1", CLK_REF_SYNC_D4, RB(0x4c, 4),
+		 RB(0x4c, 5), RB(0x4c, 6), RB(0x4c, 7),
+		 RB(0x58, 3), RB(0x58, 4), RB(0x58, 5)),
+	D_MODULE(HCLK_GMAC0, "hclk_gmac0", CLK_REF_SYNC_D4, RB(0x6c, 0),
+		 RB(0x6c, 1), RB(0x6c, 2), RB(0x6c, 3),
+		 RB(0x78, 0), RB(0x78, 1), RB(0x78, 2)),
+	D_MODULE(HCLK_GMAC1, "hclk_gmac1", CLK_REF_SYNC_D4, RB(0x70, 0),
+		 RB(0x70, 1), RB(0x70, 2), RB(0x70, 3),
+		 RB(0x7c, 0), RB(0x7c, 1), RB(0x7c, 2)),
+	D_MODULE(HCLK_GPIO0, "hclk_gpio0", CLK_REF_SYNC_D4, RB(0x40, 18),
+		 RB(0x40, 19), RB(0x40, 20), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_GPIO1, "hclk_gpio1", CLK_REF_SYNC_D4, RB(0x40, 21),
+		 RB(0x40, 22), RB(0x40, 23), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_GPIO2, "hclk_gpio2", CLK_REF_SYNC_D4, RB(0x44, 9),
+		 RB(0x44, 10), RB(0x44, 11), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_HSR, "hclk_hsr", CLK_HSR100_D2, RB(0x90, 0),
+		 RB(0x90, 2), RB(0x00, 0), RB(0x90, 1),
+		 RB(0x00, 0), RB(0x98, 0), RB(0x98, 1)),
+	D_MODULE(HCLK_I2C0, "hclk_i2c0", CLK_REF_SYNC_D8, RB(0x34, 9),
+		 RB(0x34, 10), RB(0x34, 11), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_I2C1, "hclk_i2c1", CLK_REF_SYNC_D8, RB(0x34, 12),
+		 RB(0x34, 13), RB(0x34, 14), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_LCD, "hclk_lcd", CLK_REF_SYNC_D4, RB(0xf4, 0),
+		 RB(0xf4, 1), RB(0xf4, 2), RB(0x00, 0),
+		 RB(0x164, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_MSEBI_M, "hclk_msebi_m", CLK_REF_SYNC_D4, RB(0x2c, 4),
+		 RB(0x2c, 5), RB(0x2c, 6), RB(0x00, 0),
+		 RB(0x30, 3), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_MSEBI_S, "hclk_msebi_s", CLK_REF_SYNC_D4, RB(0x2c, 0),
+		 RB(0x2c, 1), RB(0x2c, 2), RB(0x2c, 3),
+		 RB(0x30, 0), RB(0x30, 1), RB(0x30, 2)),
+	D_MODULE(HCLK_NAND, "hclk_nand", CLK_REF_SYNC_D4, RB(0x50, 0),
+		 RB(0x50, 1), RB(0x50, 2), RB(0x50, 3),
+		 RB(0x5c, 0), RB(0x5c, 1), RB(0x5c, 2)),
+	D_MODULE(HCLK_PG_I, "hclk_pg_i", CLK_REF_SYNC_D4, RB(0xf4, 12),
+		 RB(0xf4, 13), RB(0x00, 0), RB(0xf4, 14),
+		 RB(0x00, 0), RB(0x164, 4), RB(0x164, 5)),
+	D_MODULE(HCLK_PG19, "hclk_pg19", CLK_REF_SYNC_D4, RB(0x44, 12),
+		 RB(0x44, 13), RB(0x44, 14), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_PG20, "hclk_pg20", CLK_REF_SYNC_D4, RB(0x44, 15),
+		 RB(0x44, 16), RB(0x44, 17), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_PG3, "hclk_pg3", CLK_REF_SYNC_D4, RB(0xf4, 6),
+		 RB(0xf4, 7), RB(0xf4, 8), RB(0x00, 0),
+		 RB(0x164, 2), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_PG4, "hclk_pg4", CLK_REF_SYNC_D4, RB(0xf4, 9),
+		 RB(0xf4, 10), RB(0xf4, 11), RB(0x00, 0),
+		 RB(0x164, 3), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_QSPI0, "hclk_qspi0", CLK_REF_SYNC_D4, RB(0x54, 0),
+		 RB(0x54, 1), RB(0x54, 2), RB(0x54, 3),
+		 RB(0x60, 0), RB(0x60, 1), RB(0x60, 2)),
+	D_MODULE(HCLK_QSPI1, "hclk_qspi1", CLK_REF_SYNC_D4, RB(0x90, 0),
+		 RB(0x90, 1), RB(0x90, 2), RB(0x90, 3),
+		 RB(0x98, 0), RB(0x98, 1), RB(0x98, 2)),
+	D_MODULE(HCLK_ROM, "hclk_rom", CLK_REF_SYNC_D4, RB(0x154, 0),
+		 RB(0x154, 1), RB(0x154, 2), RB(0x00, 0),
+		 RB(0x170, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_RTC, "hclk_rtc", CLK_REF_SYNC_D8, RB(0x140, 0),
+		 RB(0x140, 3), RB(0x00, 0), RB(0x140, 2),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SDIO0, "hclk_sdio0", CLK_REF_SYNC_D4, RB(0x0c, 0),
+		 RB(0x0c, 1), RB(0x0c, 2), RB(0x0c, 3),
+		 RB(0x10, 0), RB(0x10, 1), RB(0x10, 2)),
+	D_MODULE(HCLK_SDIO1, "hclk_sdio1", CLK_REF_SYNC_D4, RB(0xc8, 0),
+		 RB(0xc8, 1), RB(0xc8, 2), RB(0xc8, 3),
+		 RB(0xcc, 0), RB(0xcc, 1), RB(0xcc, 2)),
+	D_MODULE(HCLK_SEMAP, "hclk_semap", CLK_REF_SYNC_D4, RB(0xf4, 3),
+		 RB(0xf4, 4), RB(0xf4, 5), RB(0x00, 0),
+		 RB(0x164, 1), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SPI0, "hclk_spi0", CLK_REF_SYNC_D4, RB(0x40, 0),
+		 RB(0x40, 1), RB(0x40, 2), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SPI1, "hclk_spi1", CLK_REF_SYNC_D4, RB(0x40, 3),
+		 RB(0x40, 4), RB(0x40, 5), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SPI2, "hclk_spi2", CLK_REF_SYNC_D4, RB(0x40, 6),
+		 RB(0x40, 7), RB(0x40, 8), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SPI3, "hclk_spi3", CLK_REF_SYNC_D4, RB(0x40, 9),
+		 RB(0x40, 10), RB(0x40, 11), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SPI4, "hclk_spi4", CLK_REF_SYNC_D4, RB(0x40, 12),
+		 RB(0x40, 13), RB(0x40, 14), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SPI5, "hclk_spi5", CLK_REF_SYNC_D4, RB(0x40, 15),
+		 RB(0x40, 16), RB(0x40, 17), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SWITCH, "hclk_switch", CLK_REF_SYNC_D4, RB(0x130, 0),
+		 RB(0x00, 0), RB(0x130, 1), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_SWITCH_RG, "hclk_switch_rg", CLK_REF_SYNC_D4, RB(0x188, 0),
+		 RB(0x188, 1), RB(0x188, 2), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_UART0, "hclk_uart0", CLK_REF_SYNC_D8, RB(0x34, 0),
+		 RB(0x34, 1), RB(0x34, 2), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_UART1, "hclk_uart1", CLK_REF_SYNC_D8, RB(0x34, 3),
+		 RB(0x34, 4), RB(0x34, 5), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_UART2, "hclk_uart2", CLK_REF_SYNC_D8, RB(0x34, 6),
+		 RB(0x34, 7), RB(0x34, 8), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_UART3, "hclk_uart3", CLK_REF_SYNC_D4, RB(0x40, 24),
+		 RB(0x40, 25), RB(0x40, 26), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_UART4, "hclk_uart4", CLK_REF_SYNC_D4, RB(0x40, 27),
+		 RB(0x40, 28), RB(0x40, 29), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_UART5, "hclk_uart5", CLK_REF_SYNC_D4, RB(0x44, 0),
+		 RB(0x44, 1), RB(0x44, 2), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_UART6, "hclk_uart6", CLK_REF_SYNC_D4, RB(0x44, 3),
+		 RB(0x44, 4), RB(0x44, 5), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
+	D_MODULE(HCLK_UART7, "hclk_uart7", CLK_REF_SYNC_D4, RB(0x44, 6),
+		 RB(0x44, 7), RB(0x44, 8), RB(0x00, 0),
+		 RB(0x00, 0), RB(0x00, 0), RB(0x00, 0)),
 	/*
 	 * These are not hardware clocks, but are needed to handle the special
 	 * case where we have a 'selector bit' that doesn't just change the
@@ -367,7 +617,7 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_UART,
 		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
-		.dual.sel = ((0x34 / 4) << 5) | 30,
+		.dual.sel = RB(0x34, 30),
 		.dual.group = 0,
 	},
 	{
@@ -376,17 +626,25 @@ static const struct r9a06g032_clkdesc r9a06g032_clocks[] = {
 		.type = K_BITSEL,
 		.source = 1 + R9A06G032_DIV_P2_PG,
 		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
-		.dual.sel = ((0xec / 4) << 5) | 24,
+		.dual.sel = RB(0xec, 24),
 		.dual.group = 1,
 	},
-	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0x1b2, 0x1b3, 0x1b4, 0x1b5),
-	D_UGATE(CLK_UART1, "clk_uart1", UART_GROUP_012, 0, 0x1b6, 0x1b7, 0x1b8, 0x1b9),
-	D_UGATE(CLK_UART2, "clk_uart2", UART_GROUP_012, 0, 0x1ba, 0x1bb, 0x1bc, 0x1bd),
-	D_UGATE(CLK_UART3, "clk_uart3", UART_GROUP_34567, 1, 0x760, 0x761, 0x762, 0x763),
-	D_UGATE(CLK_UART4, "clk_uart4", UART_GROUP_34567, 1, 0x764, 0x765, 0x766, 0x767),
-	D_UGATE(CLK_UART5, "clk_uart5", UART_GROUP_34567, 1, 0x768, 0x769, 0x76a, 0x76b),
-	D_UGATE(CLK_UART6, "clk_uart6", UART_GROUP_34567, 1, 0x76c, 0x76d, 0x76e, 0x76f),
-	D_UGATE(CLK_UART7, "clk_uart7", UART_GROUP_34567, 1, 0x770, 0x771, 0x772, 0x773),
+	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0,
+		RB(0x34, 18), RB(0x34, 19), RB(0x34, 20), RB(0x34, 21)),
+	D_UGATE(CLK_UART1, "clk_uart1", UART_GROUP_012, 0,
+		RB(0x34, 22), RB(0x34, 23), RB(0x34, 24), RB(0x34, 25)),
+	D_UGATE(CLK_UART2, "clk_uart2", UART_GROUP_012, 0,
+		RB(0x34, 26), RB(0x34, 27), RB(0x34, 28), RB(0x34, 29)),
+	D_UGATE(CLK_UART3, "clk_uart3", UART_GROUP_34567, 1,
+		RB(0xec, 0), RB(0xec, 1), RB(0xec, 2), RB(0xec, 3)),
+	D_UGATE(CLK_UART4, "clk_uart4", UART_GROUP_34567, 1,
+		RB(0xec, 4), RB(0xec, 5), RB(0xec, 6), RB(0xec, 7)),
+	D_UGATE(CLK_UART5, "clk_uart5", UART_GROUP_34567, 1,
+		RB(0xec, 8), RB(0xec, 9), RB(0xec, 10), RB(0xec, 11)),
+	D_UGATE(CLK_UART6, "clk_uart6", UART_GROUP_34567, 1,
+		RB(0xec, 12), RB(0xec, 13), RB(0xec, 14), RB(0xec, 15)),
+	D_UGATE(CLK_UART7, "clk_uart7", UART_GROUP_34567, 1,
+		RB(0xec, 16), RB(0xec, 17), RB(0xec, 18), RB(0xec, 19)),
 };
 
 struct r9a06g032_priv {
@@ -419,26 +677,30 @@ int r9a06g032_sysctrl_set_dmamux(u32 mask, u32 val)
 }
 EXPORT_SYMBOL_GPL(r9a06g032_sysctrl_set_dmamux);
 
-/* register/bit pairs are encoded as an uint16_t */
-static void
-clk_rdesc_set(struct r9a06g032_priv *clocks,
-	      u16 one, unsigned int on)
+static void clk_rdesc_set(struct r9a06g032_priv *clocks,
+			  struct regbit rb, unsigned int on)
 {
-	u32 __iomem *reg = clocks->reg + (4 * (one >> 5));
-	u32 val = readl(reg);
+	u32 offset = rb.reg << 2;
+	u32 bit = rb.bit;
+	u32 __iomem *reg;
+	u32 val;
 
-	val = (val & ~(1U << (one & 0x1f))) | ((!!on) << (one & 0x1f));
+	if (!offset && !bit)
+		return;
+
+	reg = clocks->reg + offset;
+	val = readl(reg);
+
+	val = (val & ~BIT(bit)) | ((!!on) << bit);
 	writel(val, reg);
 }
 
-static int
-clk_rdesc_get(struct r9a06g032_priv *clocks,
-	      uint16_t one)
+static int clk_rdesc_get(struct r9a06g032_priv *clocks, struct regbit rb)
 {
-	u32 __iomem *reg = clocks->reg + (4 * (one >> 5));
+	u32 __iomem *reg = clocks->reg + (rb.reg << 2);
 	u32 val = readl(reg);
 
-	return !!(val & (1U << (one & 0x1f)));
+	return !!(val & BIT(rb.bit));
 }
 
 /*
@@ -540,13 +802,10 @@ r9a06g032_clk_gate_set(struct r9a06g032_priv *clocks,
 {
 	unsigned long flags;
 
-	WARN_ON(!g->gate);
-
 	spin_lock_irqsave(&clocks->lock, flags);
 	clk_rdesc_set(clocks, g->gate, on);
 	/* De-assert reset */
-	if (g->reset)
-		clk_rdesc_set(clocks, g->reset, 1);
+	clk_rdesc_set(clocks, g->reset, 1);
 	spin_unlock_irqrestore(&clocks->lock, flags);
 
 	/* Hardware manual recommends 5us delay after enabling clock & reset */
@@ -556,15 +815,12 @@ r9a06g032_clk_gate_set(struct r9a06g032_priv *clocks,
 	 * associated SLVRDY bit in the System Controller that needs to be set
 	 * so that the FlexWAY bus fabric passes on the read/write requests.
 	 */
-	if (g->ready || g->midle) {
-		spin_lock_irqsave(&clocks->lock, flags);
-		if (g->ready)
-			clk_rdesc_set(clocks, g->ready, on);
-		/* Clear 'Master Idle Request' bit */
-		if (g->midle)
-			clk_rdesc_set(clocks, g->midle, !on);
-		spin_unlock_irqrestore(&clocks->lock, flags);
-	}
+	spin_lock_irqsave(&clocks->lock, flags);
+	clk_rdesc_set(clocks, g->ready, on);
+	/* Clear 'Master Idle Request' bit */
+	clk_rdesc_set(clocks, g->midle, !on);
+	spin_unlock_irqrestore(&clocks->lock, flags);
+
 	/* Note: We don't wait for FlexWAY Socket Connection signal */
 }
 
@@ -588,7 +844,7 @@ static int r9a06g032_clk_gate_is_enabled(struct clk_hw *hw)
 	struct r9a06g032_clk_gate *g = to_r9a06g032_gate(hw);
 
 	/* if clock is in reset, the gate might be on, and still not 'be' on */
-	if (g->gate.reset && !clk_rdesc_get(g->clocks, g->gate.reset))
+	if (g->gate.reset.reg && !clk_rdesc_get(g->clocks, g->gate.reset))
 		return 0;
 
 	return clk_rdesc_get(g->clocks, g->gate.gate);
@@ -827,7 +1083,7 @@ struct r9a06g032_clk_bitsel {
 	struct clk_hw	hw;
 	struct r9a06g032_priv *clocks;
 	u16 index;
-	u16 selector;		/* selector register + bit */
+	struct regbit selector;		/* selector register + bit */
 };
 
 #define to_clk_bitselect(_hw) \
@@ -896,7 +1152,7 @@ struct r9a06g032_clk_dualgate {
 	struct clk_hw	hw;
 	struct r9a06g032_priv *clocks;
 	u16 index;
-	u16 selector;		/* selector register + bit */
+	struct regbit selector;		/* selector register + bit */
 	struct r9a06g032_gate gate[2];
 };
 
@@ -949,7 +1205,7 @@ static struct clk *
 r9a06g032_register_dualgate(struct r9a06g032_priv *clocks,
 			    const char *parent_name,
 			    const struct r9a06g032_clkdesc *desc,
-			    uint16_t sel)
+			    struct regbit sel)
 {
 	struct r9a06g032_clk_dualgate *g;
 	struct clk *clk;
@@ -1004,7 +1260,7 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 	struct clk **clks;
 	struct clk *mclk;
 	unsigned int i;
-	u16 uart_group_sel[2];
+	struct regbit uart_group_sel[2];
 	int error;
 
 	clocks = devm_kzalloc(dev, sizeof(*clocks), GFP_KERNEL);
-- 
2.25.1

