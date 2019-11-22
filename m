Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A271106389
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2019 07:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbfKVGLN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Nov 2019 01:11:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:34424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729185AbfKVF4f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Nov 2019 00:56:35 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23FA320659;
        Fri, 22 Nov 2019 05:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574402194;
        bh=v/ELUbqxZyXrZuAAY7IR8tKjXYRyU+EDsOX/Vedj/xw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PaguoG8l1ZXPf/Ugct8ZPydlSAlOQuufloeX6UH/Je2GSDWaEQklxD60VaFOS/LGW
         qN2scrjEotwPqS1Fyau8fpa/p366y14XRzaDkwYqu9KFBaQ3qwDB16KeXARWngMt2x
         BD4yjoGfSM1RpfdUnI6uYS6xMLOP0SHa2m3zpQWY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 044/127] pinctrl: sh-pfc: sh7734: Fix shifted values in IPSR10
Date:   Fri, 22 Nov 2019 00:54:22 -0500
Message-Id: <20191122055544.3299-43-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122055544.3299-1-sashal@kernel.org>
References: <20191122055544.3299-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

[ Upstream commit 054f2400f706327f96770219c3065b5131f8f154 ]

Some values in the Peripheral Function Select Register 10 descriptor are
shifted by one position, which may cause a peripheral function to be
programmed incorrectly.

Fixing this makes all HSCIF0 pins use Function 4 (value 3), like was
already the case for the HSCK0 pin in field IP10[5:3].

Fixes: ac1ebc2190f575fc ("sh-pfc: Add sh7734 pinmux support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/sh-pfc/pfc-sh7734.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7734.c b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
index 6502e676d3686..33232041ee86d 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7734.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7734.c
@@ -2213,22 +2213,22 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	    /* IP10_22 [1] */
 		FN_CAN_CLK_A, FN_RX4_D,
 	    /* IP10_21_19 [3] */
-		FN_AUDIO_CLKOUT, FN_TX1_E, FN_HRTS0_C, FN_FSE_B,
-		FN_LCD_M_DISP_B, 0, 0, 0,
+		FN_AUDIO_CLKOUT, FN_TX1_E, 0, FN_HRTS0_C, FN_FSE_B,
+		FN_LCD_M_DISP_B, 0, 0,
 	    /* IP10_18_16 [3] */
-		FN_AUDIO_CLKC, FN_SCK1_E, FN_HCTS0_C, FN_FRB_B,
-		FN_LCD_VEPWC_B, 0, 0, 0,
+		FN_AUDIO_CLKC, FN_SCK1_E, 0, FN_HCTS0_C, FN_FRB_B,
+		FN_LCD_VEPWC_B, 0, 0,
 	    /* IP10_15 [1] */
 		FN_AUDIO_CLKB_A, FN_LCD_CLK_B,
 	    /* IP10_14_12 [3] */
 		FN_AUDIO_CLKA_A, FN_VI1_CLK_B, FN_SCK1_D, FN_IECLK_B,
 		FN_LCD_FLM_B, 0, 0, 0,
 	    /* IP10_11_9 [3] */
-		FN_SSI_SDATA3, FN_VI1_7_B, FN_HTX0_C, FN_FWE_B,
-		FN_LCD_CL2_B, 0, 0, 0,
+		FN_SSI_SDATA3, FN_VI1_7_B, 0, FN_HTX0_C, FN_FWE_B,
+		FN_LCD_CL2_B, 0, 0,
 	    /* IP10_8_6 [3] */
-		FN_SSI_SDATA2, FN_VI1_6_B, FN_HRX0_C, FN_FRE_B,
-		FN_LCD_CL1_B, 0, 0, 0,
+		FN_SSI_SDATA2, FN_VI1_6_B, 0, FN_HRX0_C, FN_FRE_B,
+		FN_LCD_CL1_B, 0, 0,
 	    /* IP10_5_3 [3] */
 		FN_SSI_WS23, FN_VI1_5_B, FN_TX1_D, FN_HSCK0_C, FN_FALE_B,
 		FN_LCD_DON_B, 0, 0, 0,
-- 
2.20.1

