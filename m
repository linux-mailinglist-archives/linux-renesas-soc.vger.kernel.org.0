Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD6BC125243
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 20:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbfLRTsU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 14:48:20 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56570 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfLRTsU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 14:48:20 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id fXoF2100N5USYZQ01XoFDL; Wed, 18 Dec 2019 20:48:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0007xq-GK; Wed, 18 Dec 2019 20:48:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ihfIt-0003KS-Ec; Wed, 18 Dec 2019 20:48:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/6] pinctrl: sh-pfc: sh7264: Fix CAN function GPIOs
Date:   Wed, 18 Dec 2019 20:48:09 +0100
Message-Id: <20191218194812.12741-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218194812.12741-1-geert+renesas@glider.be>
References: <20191218194812.12741-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pinmux_func_gpios[] contains a hole due to the missing function GPIO
definition for the "CTX0&CTX1" signal, which is the logical "AND" of the
two CAN outputs.

Fix this by:
  - Renaming CRX0_CRX1_MARK to CTX0_CTX1_MARK, as PJ2MD[2:0]=010
    configures the combined "CTX0&CTX1" output signal,
  - Renaming CRX0X1_MARK to CRX0_CRX1_MARK, as PJ3MD[1:0]=10 configures
    the shared "CRX0/CRX1" input signal, which is fed to both CAN
    inputs,
  - Adding the missing function GPIO definition for "CTX0&CTX1" to
    pinmux_func_gpios[],
  - Moving all CAN enums next to each other.

See SH7262 Group, SH7264 Group User's Manual: Hardware, Rev. 4.00:
  [1] Figure 1.2 (3) (Pin Assignment for the SH7264 Group (1-Mbyte
      Version),
  [2] Figure 1.2 (4) Pin Assignment for the SH7264 Group (640-Kbyte
      Version,
  [3] Table 1.4 List of Pins,
  [4] Figure 20.29 Connection Example when Using This Module as 1-Channel
      Module (64 Mailboxes x 1 Channel),
  [5] Table 32.10 Multiplexed Pins (Port J),
  [6] Section 32.2.30 (3) Port J Control Register 0 (PJCR0).

Note that the last 2 disagree about PJ2MD[2:0], which is probably the
root cause of this bug.  But considering [4], "CTx0&CTx1" in [5] must
be correct, and "CRx0&CRx1" in [6] must be wrong.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The runtime-check under development reports:

    sh7264_pfc: empty function gpio 23
---
 drivers/pinctrl/sh-pfc/pfc-sh7264.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7264.c b/drivers/pinctrl/sh-pfc/pfc-sh7264.c
index 4117bd8c0f413f99..908837ea487bdcb9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7264.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7264.c
@@ -497,17 +497,15 @@ enum {
 	SD_WP_MARK, SD_CLK_MARK, SD_CMD_MARK,
 	CRX0_MARK, CRX1_MARK,
 	CTX0_MARK, CTX1_MARK,
+	CRX0_CRX1_MARK, CTX0_CTX1_MARK,
 
 	PWM1A_MARK, PWM1B_MARK, PWM1C_MARK, PWM1D_MARK,
 	PWM1E_MARK, PWM1F_MARK, PWM1G_MARK, PWM1H_MARK,
 	PWM2A_MARK, PWM2B_MARK, PWM2C_MARK, PWM2D_MARK,
 	PWM2E_MARK, PWM2F_MARK, PWM2G_MARK, PWM2H_MARK,
 	IERXD_MARK, IETXD_MARK,
-	CRX0_CRX1_MARK,
 	WDTOVF_MARK,
 
-	CRX0X1_MARK,
-
 	/* DMAC */
 	TEND0_MARK, DACK0_MARK, DREQ0_MARK,
 	TEND1_MARK, DACK1_MARK, DREQ1_MARK,
@@ -995,12 +993,12 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_DATA(PJ3_DATA, PJ3MD_00),
 	PINMUX_DATA(CRX1_MARK, PJ3MD_01),
-	PINMUX_DATA(CRX0X1_MARK, PJ3MD_10),
+	PINMUX_DATA(CRX0_CRX1_MARK, PJ3MD_10),
 	PINMUX_DATA(IRQ1_PJ_MARK, PJ3MD_11),
 
 	PINMUX_DATA(PJ2_DATA, PJ2MD_000),
 	PINMUX_DATA(CTX1_MARK, PJ2MD_001),
-	PINMUX_DATA(CRX0_CRX1_MARK, PJ2MD_010),
+	PINMUX_DATA(CTX0_CTX1_MARK, PJ2MD_010),
 	PINMUX_DATA(CS2_MARK, PJ2MD_011),
 	PINMUX_DATA(SCK0_MARK, PJ2MD_100),
 	PINMUX_DATA(LCD_M_DISP_MARK, PJ2MD_101),
@@ -1245,6 +1243,7 @@ static const struct pinmux_func pinmux_func_gpios[] = {
 	GPIO_FN(CTX1),
 	GPIO_FN(CRX1),
 	GPIO_FN(CTX0),
+	GPIO_FN(CTX0_CTX1),
 	GPIO_FN(CRX0),
 	GPIO_FN(CRX0_CRX1),
 
-- 
2.17.1

