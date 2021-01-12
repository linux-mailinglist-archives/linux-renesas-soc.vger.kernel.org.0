Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391D72F367E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391650AbhALRCz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:55 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:17248 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391724AbhALRCz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470790;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=iL7/obDhvyfG+3EJSz6xGmQUcQswUtW3xzqrbWoKTIE=;
        b=gscJSY6dDguTSb2/GbgVI1QBkwCk1xVe+rwgq15OnFeFwdvFDVp5enJK9QGwOa0nbt
        HoSu2fokbzAdoTnkMkHABEBn5tdfI4cnYVLTY03/+Rt2hPyUAxnvDOb+7m6QWF/olC1E
        gDezmWsV0+PJoQfH76E0ZTnlNhsa26KfV/c7z4WLiNFloke0Tkb2Wu/nLdM/K9XdkeWZ
        CPZvSTq6Wff6ZN0I3gQqVkuVpR5eVkD/ohlDLhal7dl8w/zZBMGwqRnr1f7Lklk51Ikd
        3q8AWqHqVqqdB1ZzxQ5TUSRlNbgMxO8IjQJIHgHsZZV0HfDBowNfpHmFIjW8Gh2YmPln
        jTOQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxiNUa
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:44 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 08/12] pinctrl: renesas: r8a779a0: Add MSIOF pins, groups and functions
Date:   Tue, 12 Jan 2021 17:59:25 +0100
Message-Id: <20210112165929.31002-9-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165929.31002-1-uli+renesas@fpond.eu>
References: <20210112165929.31002-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds MSIOF0-5 pins, groups and functions to R8A779A0 (V3U)
SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 362 +++++++++++++++++++++++++
 1 file changed, 362 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index e73d9ad70aa4..8257d6e395a6 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -2068,6 +2068,270 @@ static const unsigned int mmc_ds_mux[] = {
 	MMC_DS_MARK,
 };
 
+/* - MSIOF0 ----------------------------------------------------------------- */
+static const unsigned int msiof0_clk_pins[] = {
+	/* MSIOF0_SCK */
+	RCAR_GP_PIN(1, 8),
+};
+static const unsigned int msiof0_clk_mux[] = {
+	MSIOF0_SCK_MARK,
+};
+static const unsigned int msiof0_sync_pins[] = {
+	/* MSIOF0_SYNC */
+	RCAR_GP_PIN(1, 9),
+};
+static const unsigned int msiof0_sync_mux[] = {
+	MSIOF0_SYNC_MARK,
+};
+static const unsigned int msiof0_ss1_pins[] = {
+	/* MSIOF0_SS1 */
+	RCAR_GP_PIN(1, 10),
+};
+static const unsigned int msiof0_ss1_mux[] = {
+	MSIOF0_SS1_MARK,
+};
+static const unsigned int msiof0_ss2_pins[] = {
+	/* MSIOF0_SS2 */
+	RCAR_GP_PIN(1, 11),
+};
+static const unsigned int msiof0_ss2_mux[] = {
+	MSIOF0_SS2_MARK,
+};
+static const unsigned int msiof0_txd_pins[] = {
+	/* MSIOF0_TXD */
+	RCAR_GP_PIN(1, 7),
+};
+static const unsigned int msiof0_txd_mux[] = {
+	MSIOF0_TXD_MARK,
+};
+static const unsigned int msiof0_rxd_pins[] = {
+	/* MSIOF0_RXD */
+	RCAR_GP_PIN(1, 6),
+};
+static const unsigned int msiof0_rxd_mux[] = {
+	MSIOF0_RXD_MARK,
+};
+
+/* - MSIOF1 ----------------------------------------------------------------- */
+static const unsigned int msiof1_clk_pins[] = {
+	/* MSIOF1_SCK */
+	RCAR_GP_PIN(1, 14),
+};
+static const unsigned int msiof1_clk_mux[] = {
+	MSIOF1_SCK_MARK,
+};
+static const unsigned int msiof1_sync_pins[] = {
+	/* MSIOF1_SYNC */
+	RCAR_GP_PIN(1, 15),
+};
+static const unsigned int msiof1_sync_mux[] = {
+	MSIOF1_SYNC_MARK,
+};
+static const unsigned int msiof1_ss1_pins[] = {
+	/* MSIOF1_SS1 */
+	RCAR_GP_PIN(1, 16),
+};
+static const unsigned int msiof1_ss1_mux[] = {
+	MSIOF1_SS1_MARK,
+};
+static const unsigned int msiof1_ss2_pins[] = {
+	/* MSIOF1_SS2 */
+	RCAR_GP_PIN(1, 17),
+};
+static const unsigned int msiof1_ss2_mux[] = {
+	MSIOF1_SS2_MARK,
+};
+static const unsigned int msiof1_txd_pins[] = {
+	/* MSIOF1_TXD */
+	RCAR_GP_PIN(1, 13),
+};
+static const unsigned int msiof1_txd_mux[] = {
+	MSIOF1_TXD_MARK,
+};
+static const unsigned int msiof1_rxd_pins[] = {
+	/* MSIOF1_RXD */
+	RCAR_GP_PIN(1, 12),
+};
+static const unsigned int msiof1_rxd_mux[] = {
+	MSIOF1_RXD_MARK,
+};
+
+/* - MSIOF2 ----------------------------------------------------------------- */
+static const unsigned int msiof2_clk_pins[] = {
+	/* MSIOF2_SCK */
+	RCAR_GP_PIN(1, 20),
+};
+static const unsigned int msiof2_clk_mux[] = {
+	MSIOF2_SCK_MARK,
+};
+static const unsigned int msiof2_sync_pins[] = {
+	/* MSIOF2_SYNC */
+	RCAR_GP_PIN(1, 21),
+};
+static const unsigned int msiof2_sync_mux[] = {
+	MSIOF2_SYNC_MARK,
+};
+static const unsigned int msiof2_ss1_pins[] = {
+	/* MSIOF2_SS1 */
+	RCAR_GP_PIN(1, 22),
+};
+static const unsigned int msiof2_ss1_mux[] = {
+	MSIOF2_SS1_MARK,
+};
+static const unsigned int msiof2_ss2_pins[] = {
+	/* MSIOF2_SS2 */
+	RCAR_GP_PIN(1, 23),
+};
+static const unsigned int msiof2_ss2_mux[] = {
+	MSIOF2_SS2_MARK,
+};
+static const unsigned int msiof2_txd_pins[] = {
+	/* MSIOF2_TXD */
+	RCAR_GP_PIN(1, 19),
+};
+static const unsigned int msiof2_txd_mux[] = {
+	MSIOF2_TXD_MARK,
+};
+static const unsigned int msiof2_rxd_pins[] = {
+	/* MSIOF2_RXD */
+	RCAR_GP_PIN(1, 18),
+};
+static const unsigned int msiof2_rxd_mux[] = {
+	MSIOF2_RXD_MARK,
+};
+
+/* - MSIOF3 ----------------------------------------------------------------- */
+static const unsigned int msiof3_clk_pins[] = {
+	/* MSIOF3_SCK */
+	RCAR_GP_PIN(2, 20),
+};
+static const unsigned int msiof3_clk_mux[] = {
+	MSIOF3_SCK_MARK,
+};
+static const unsigned int msiof3_sync_pins[] = {
+	/* MSIOF3_SYNC */
+	RCAR_GP_PIN(2, 21),
+};
+static const unsigned int msiof3_sync_mux[] = {
+	MSIOF3_SYNC_MARK,
+};
+static const unsigned int msiof3_ss1_pins[] = {
+	/* MSIOF3_SS1 */
+	RCAR_GP_PIN(2, 16),
+};
+static const unsigned int msiof3_ss1_mux[] = {
+	MSIOF3_SS1_MARK,
+};
+static const unsigned int msiof3_ss2_pins[] = {
+	/* MSIOF3_SS2 */
+	RCAR_GP_PIN(2, 17),
+};
+static const unsigned int msiof3_ss2_mux[] = {
+	MSIOF3_SS2_MARK,
+};
+static const unsigned int msiof3_txd_pins[] = {
+	/* MSIOF3_TXD */
+	RCAR_GP_PIN(2, 19),
+};
+static const unsigned int msiof3_txd_mux[] = {
+	MSIOF3_TXD_MARK,
+};
+static const unsigned int msiof3_rxd_pins[] = {
+	/* MSIOF3_RXD */
+	RCAR_GP_PIN(2, 18),
+};
+static const unsigned int msiof3_rxd_mux[] = {
+	MSIOF3_RXD_MARK,
+};
+
+/* - MSIOF4 ----------------------------------------------------------------- */
+static const unsigned int msiof4_clk_pins[] = {
+	/* MSIOF4_SCK */
+	RCAR_GP_PIN(2, 6),
+};
+static const unsigned int msiof4_clk_mux[] = {
+	MSIOF4_SCK_MARK,
+};
+static const unsigned int msiof4_sync_pins[] = {
+	/* MSIOF4_SYNC */
+	RCAR_GP_PIN(2, 7),
+};
+static const unsigned int msiof4_sync_mux[] = {
+	MSIOF4_SYNC_MARK,
+};
+static const unsigned int msiof4_ss1_pins[] = {
+	/* MSIOF4_SS1 */
+	RCAR_GP_PIN(2, 8),
+};
+static const unsigned int msiof4_ss1_mux[] = {
+	MSIOF4_SS1_MARK,
+};
+static const unsigned int msiof4_ss2_pins[] = {
+	/* MSIOF4_SS2 */
+	RCAR_GP_PIN(2, 9),
+};
+static const unsigned int msiof4_ss2_mux[] = {
+	MSIOF4_SS2_MARK,
+};
+static const unsigned int msiof4_txd_pins[] = {
+	/* MSIOF4_TXD */
+	RCAR_GP_PIN(2, 5),
+};
+static const unsigned int msiof4_txd_mux[] = {
+	MSIOF4_TXD_MARK,
+};
+static const unsigned int msiof4_rxd_pins[] = {
+	/* MSIOF4_RXD */
+	RCAR_GP_PIN(2, 4),
+};
+static const unsigned int msiof4_rxd_mux[] = {
+	MSIOF4_RXD_MARK,
+};
+
+/* - MSIOF5 ----------------------------------------------------------------- */
+static const unsigned int msiof5_clk_pins[] = {
+	/* MSIOF5_SCK */
+	RCAR_GP_PIN(2, 12),
+};
+static const unsigned int msiof5_clk_mux[] = {
+	MSIOF5_SCK_MARK,
+};
+static const unsigned int msiof5_sync_pins[] = {
+	/* MSIOF5_SYNC */
+	RCAR_GP_PIN(2, 13),
+};
+static const unsigned int msiof5_sync_mux[] = {
+	MSIOF5_SYNC_MARK,
+};
+static const unsigned int msiof5_ss1_pins[] = {
+	/* MSIOF5_SS1 */
+	RCAR_GP_PIN(2, 14),
+};
+static const unsigned int msiof5_ss1_mux[] = {
+	MSIOF5_SS1_MARK,
+};
+static const unsigned int msiof5_ss2_pins[] = {
+	/* MSIOF5_SS2 */
+	RCAR_GP_PIN(2, 15),
+};
+static const unsigned int msiof5_ss2_mux[] = {
+	MSIOF5_SS2_MARK,
+};
+static const unsigned int msiof5_txd_pins[] = {
+	/* MSIOF5_TXD */
+	RCAR_GP_PIN(2, 11),
+};
+static const unsigned int msiof5_txd_mux[] = {
+	MSIOF5_TXD_MARK,
+};
+static const unsigned int msiof5_rxd_pins[] = {
+	/* MSIOF5_RXD */
+	RCAR_GP_PIN(2, 10),
+};
+static const unsigned int msiof5_rxd_mux[] = {
+	MSIOF5_RXD_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -2288,6 +2552,43 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(mmc_wp),
 	SH_PFC_PIN_GROUP(mmc_ds),
 
+	SH_PFC_PIN_GROUP(msiof0_clk),
+	SH_PFC_PIN_GROUP(msiof0_sync),
+	SH_PFC_PIN_GROUP(msiof0_ss1),
+	SH_PFC_PIN_GROUP(msiof0_ss2),
+	SH_PFC_PIN_GROUP(msiof0_txd),
+	SH_PFC_PIN_GROUP(msiof0_rxd),
+	SH_PFC_PIN_GROUP(msiof1_clk),
+	SH_PFC_PIN_GROUP(msiof1_sync),
+	SH_PFC_PIN_GROUP(msiof1_ss1),
+	SH_PFC_PIN_GROUP(msiof1_ss2),
+	SH_PFC_PIN_GROUP(msiof1_txd),
+	SH_PFC_PIN_GROUP(msiof1_rxd),
+	SH_PFC_PIN_GROUP(msiof2_clk),
+	SH_PFC_PIN_GROUP(msiof2_sync),
+	SH_PFC_PIN_GROUP(msiof2_ss1),
+	SH_PFC_PIN_GROUP(msiof2_ss2),
+	SH_PFC_PIN_GROUP(msiof2_txd),
+	SH_PFC_PIN_GROUP(msiof2_rxd),
+	SH_PFC_PIN_GROUP(msiof3_clk),
+	SH_PFC_PIN_GROUP(msiof3_sync),
+	SH_PFC_PIN_GROUP(msiof3_ss1),
+	SH_PFC_PIN_GROUP(msiof3_ss2),
+	SH_PFC_PIN_GROUP(msiof3_txd),
+	SH_PFC_PIN_GROUP(msiof3_rxd),
+	SH_PFC_PIN_GROUP(msiof4_clk),
+	SH_PFC_PIN_GROUP(msiof4_sync),
+	SH_PFC_PIN_GROUP(msiof4_ss1),
+	SH_PFC_PIN_GROUP(msiof4_ss2),
+	SH_PFC_PIN_GROUP(msiof4_txd),
+	SH_PFC_PIN_GROUP(msiof4_rxd),
+	SH_PFC_PIN_GROUP(msiof5_clk),
+	SH_PFC_PIN_GROUP(msiof5_sync),
+	SH_PFC_PIN_GROUP(msiof5_ss1),
+	SH_PFC_PIN_GROUP(msiof5_ss2),
+	SH_PFC_PIN_GROUP(msiof5_txd),
+	SH_PFC_PIN_GROUP(msiof5_rxd),
+
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2490,6 +2791,60 @@ static const char * const mmc_groups[] = {
 	"mmc_ds",
 };
 
+static const char * const msiof0_groups[] = {
+	"msiof0_clk",
+	"msiof0_sync",
+	"msiof0_ss1",
+	"msiof0_ss2",
+	"msiof0_txd",
+	"msiof0_rxd",
+};
+
+static const char * const msiof1_groups[] = {
+	"msiof1_clk",
+	"msiof1_sync",
+	"msiof1_ss1",
+	"msiof1_ss2",
+	"msiof1_txd",
+	"msiof1_rxd",
+};
+
+static const char * const msiof2_groups[] = {
+	"msiof2_clk",
+	"msiof2_sync",
+	"msiof2_ss1",
+	"msiof2_ss2",
+	"msiof2_txd",
+	"msiof2_rxd",
+};
+
+static const char * const msiof3_groups[] = {
+	"msiof3_clk",
+	"msiof3_sync",
+	"msiof3_ss1",
+	"msiof3_ss2",
+	"msiof3_txd",
+	"msiof3_rxd",
+};
+
+static const char * const msiof4_groups[] = {
+	"msiof4_clk",
+	"msiof4_sync",
+	"msiof4_ss1",
+	"msiof4_ss2",
+	"msiof4_txd",
+	"msiof4_rxd",
+};
+
+static const char * const msiof5_groups[] = {
+	"msiof5_clk",
+	"msiof5_sync",
+	"msiof5_ss1",
+	"msiof5_ss2",
+	"msiof5_txd",
+	"msiof5_rxd",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2556,6 +2911,13 @@ static const struct sh_pfc_function pinmux_functions[] = {
 
 	SH_PFC_FUNCTION(mmc),
 
+	SH_PFC_FUNCTION(msiof0),
+	SH_PFC_FUNCTION(msiof1),
+	SH_PFC_FUNCTION(msiof2),
+	SH_PFC_FUNCTION(msiof3),
+	SH_PFC_FUNCTION(msiof4),
+	SH_PFC_FUNCTION(msiof5),
+
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.20.1

