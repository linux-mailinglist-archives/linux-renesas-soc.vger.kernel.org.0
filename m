Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289A12C5A90
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403903AbgKZR2G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:28:06 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:21252 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404169AbgKZR2G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411684;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=nvQNbue7AhD6cq+KqS/H2LTt6NJvgGEYUVfwXlp5yGo=;
        b=lrpvZKf1kHE9H6qoHNaTp51UB/xHcwQzlABnjl2iTtTAyCpK1k955CC20BZqqQTBx9
        r523c6C2XlZURCn08q/bPIY/Cmmkvo3xr6xzxvvXUm7+MF5c4TaVzX+a9zQWp6HMgNC7
        BWT7eeLA5cNGLfycBKFZUeCFJVOYzgWGqXBCYfjBsw7ZH4ZQDR1Jh+CBZWVE9CBLafUz
        0nIuNvhSYwgudn2uQoZH1pdVAwCjvzAkUygtIF7cuV7ndccr8/cJTWykVKY/4Qj0JdF6
        bFfUEpAhcrjf1dNZxOTsoddQOdP+B7urDFuFSwnA5bEnDoPRGp1MB+Pb07wnS5Z2UL5l
        ETPA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHM4Mpl
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:22:04 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 08/11] pinctrl: renesas: r8a779a0: Add PWM pins, groups and functions
Date:   Thu, 26 Nov 2020 18:21:51 +0100
Message-Id: <20201126172154.25625-9-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126172154.25625-1-uli+renesas@fpond.eu>
References: <20201126172154.25625-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds PWM0-4 pins, groups and functions to the R8A779A0 (V3U)
SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 77 ++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 403c6fca3282..a5ed01a50857 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -2306,6 +2306,51 @@ static const unsigned int msiof5_rxd_mux[] = {
 	MSIOF5_RXD_MARK,
 };
 
+/* - PWM0 ------------------------------------------------------------------- */
+static const unsigned int pwm0_pins[] = {
+	/* PWM0 */
+	RCAR_GP_PIN(3, 5),
+};
+static const unsigned int pwm0_mux[] = {
+	PWM0_MARK,
+};
+
+/* - PWM1 ------------------------------------------------------------------- */
+static const unsigned int pwm1_pins[] = {
+	/* PWM1 */
+	RCAR_GP_PIN(3, 6),
+};
+static const unsigned int pwm1_mux[] = {
+	PWM1_MARK,
+};
+
+/* - PWM2 ------------------------------------------------------------------- */
+static const unsigned int pwm2_pins[] = {
+	/* PWM2 */
+	RCAR_GP_PIN(3, 7),
+};
+static const unsigned int pwm2_mux[] = {
+	PWM2_MARK,
+};
+
+/* - PWM3 ------------------------------------------------------------------- */
+static const unsigned int pwm3_pins[] = {
+	/* PWM3 */
+	RCAR_GP_PIN(3, 8),
+};
+static const unsigned int pwm3_mux[] = {
+	PWM3_MARK,
+};
+
+/* - PWM4 ------------------------------------------------------------------- */
+static const unsigned int pwm4_pins[] = {
+	/* PWM4 */
+	RCAR_GP_PIN(3, 9),
+};
+static const unsigned int pwm4_mux[] = {
+	PWM4_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -2545,6 +2590,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(msiof3_txd),
 	SH_PFC_PIN_GROUP(msiof3_rxd),
 
+	SH_PFC_PIN_GROUP(pwm0),
+	SH_PFC_PIN_GROUP(pwm1),
+	SH_PFC_PIN_GROUP(pwm2),
+	SH_PFC_PIN_GROUP(pwm3),
+	SH_PFC_PIN_GROUP(pwm4),
+
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2784,6 +2835,26 @@ static const char * const msiof3_groups[] = {
 	"msiof3_rxd",
 };
 
+static const char * const pwm0_groups[] = {
+	"pwm0",
+};
+
+static const char * const pwm1_groups[] = {
+	"pwm1",
+};
+
+static const char * const pwm2_groups[] = {
+	"pwm2",
+};
+
+static const char * const pwm3_groups[] = {
+	"pwm3",
+};
+
+static const char * const pwm4_groups[] = {
+	"pwm4",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2854,6 +2925,12 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(msiof2),
 	SH_PFC_FUNCTION(msiof3),
 
+	SH_PFC_FUNCTION(pwm0),
+	SH_PFC_FUNCTION(pwm1),
+	SH_PFC_FUNCTION(pwm2),
+	SH_PFC_FUNCTION(pwm3),
+	SH_PFC_FUNCTION(pwm4),
+
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.20.1

