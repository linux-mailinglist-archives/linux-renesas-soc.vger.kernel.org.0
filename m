Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C25E47E4A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Dec 2021 15:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348916AbhLWOmR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Dec 2021 09:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348865AbhLWOmP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Dec 2021 09:42:15 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6019AC061401
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Dec 2021 06:42:15 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by albert.telenet-ops.be with bizsmtp
        id ZqiD2600F1rdBcm06qiDqH; Thu, 23 Dec 2021 15:42:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-006a91-RD; Thu, 23 Dec 2021 15:42:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003rc7-OI; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 31/60] pinctrl: renesas: r8a77950: Share QSPI pin group data
Date:   Thu, 23 Dec 2021 15:41:41 +0100
Message-Id: <6d9de5b50bbad0c7b22f08d241a23c25e487c102.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Pin groups qspi[01]_data2 are subsets of qspi[01]_data4.

This reduces kernel size by 32 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a77950.c | 30 +++++++-------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a77950.c b/drivers/pinctrl/renesas/pfc-r8a77950.c
index ea10dfe8726ab4fe..b6646e74be60a502 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77950.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77950.c
@@ -3140,18 +3140,11 @@ static const unsigned int qspi0_ctrl_pins[] = {
 static const unsigned int qspi0_ctrl_mux[] = {
 	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
 };
-static const unsigned int qspi0_data2_pins[] = {
-	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1 */
-	PIN_QSPI0_MOSI_IO0, PIN_QSPI0_MISO_IO1,
-};
-static const unsigned int qspi0_data2_mux[] = {
-	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
-};
-static const unsigned int qspi0_data4_pins[] = {
+static const unsigned int qspi0_data_pins[] = {
 	/* QSPI0_MOSI_IO0, QSPI0_MISO_IO1, QSPI0_IO2, QSPI0_IO3 */
 	PIN_QSPI0_MOSI_IO0, PIN_QSPI0_MISO_IO1, PIN_QSPI0_IO2, PIN_QSPI0_IO3,
 };
-static const unsigned int qspi0_data4_mux[] = {
+static const unsigned int qspi0_data_mux[] = {
 	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
 	QSPI0_IO2_MARK, QSPI0_IO3_MARK,
 };
@@ -3163,18 +3156,11 @@ static const unsigned int qspi1_ctrl_pins[] = {
 static const unsigned int qspi1_ctrl_mux[] = {
 	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
 };
-static const unsigned int qspi1_data2_pins[] = {
-	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1 */
-	PIN_QSPI1_MOSI_IO0, PIN_QSPI1_MISO_IO1,
-};
-static const unsigned int qspi1_data2_mux[] = {
-	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
-};
-static const unsigned int qspi1_data4_pins[] = {
+static const unsigned int qspi1_data_pins[] = {
 	/* QSPI1_MOSI_IO0, QSPI1_MISO_IO1, QSPI1_IO2, QSPI1_IO3 */
 	PIN_QSPI1_MOSI_IO0, PIN_QSPI1_MISO_IO1, PIN_QSPI1_IO2, PIN_QSPI1_IO3,
 };
-static const unsigned int qspi1_data4_mux[] = {
+static const unsigned int qspi1_data_mux[] = {
 	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
 	QSPI1_IO2_MARK, QSPI1_IO3_MARK,
 };
@@ -4103,11 +4089,11 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(pwm6_a),
 	SH_PFC_PIN_GROUP(pwm6_b),
 	SH_PFC_PIN_GROUP(qspi0_ctrl),
-	SH_PFC_PIN_GROUP(qspi0_data2),
-	SH_PFC_PIN_GROUP(qspi0_data4),
+	BUS_DATA_PIN_GROUP(qspi0_data, 2),
+	BUS_DATA_PIN_GROUP(qspi0_data, 4),
 	SH_PFC_PIN_GROUP(qspi1_ctrl),
-	SH_PFC_PIN_GROUP(qspi1_data2),
-	SH_PFC_PIN_GROUP(qspi1_data4),
+	BUS_DATA_PIN_GROUP(qspi1_data, 2),
+	BUS_DATA_PIN_GROUP(qspi1_data, 4),
 	SH_PFC_PIN_GROUP(sata0_devslp_a),
 	SH_PFC_PIN_GROUP(sata0_devslp_b),
 	SH_PFC_PIN_GROUP(scif0_data),
-- 
2.25.1

