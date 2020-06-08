Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2691F160B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 11:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729330AbgFHJ7r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 05:59:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728745AbgFHJ7q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 05:59:46 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5643EC008744
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2020 02:59:44 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:c85f:a5bf:b1bd:702b])
        by michel.telenet-ops.be with bizsmtp
        id oZzi2200E0R8aca06Zziop; Mon, 08 Jun 2020 11:59:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jiEZC-0007PE-FS; Mon, 08 Jun 2020 11:59:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jiEZC-0007xI-Dt; Mon, 08 Jun 2020 11:59:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/8] spi: rspi: Increase bit rate range for RSPI on SH
Date:   Mon,  8 Jun 2020 11:59:37 +0200
Message-Id: <20200608095940.30516-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608095940.30516-1-geert+renesas@glider.be>
References: <20200608095940.30516-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Increase bit rate range for RSPI on legacy SH by making use of the Bit
Rate Frequency Division Setting field in Command Registers, just like is
already done on RZ/A.  This decreases the lower limit by a factor of 8.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware, but the formulas in the datasheets for
SH7753, RZ/A1H, and RZ/A2M are the same.
---
 drivers/spi/spi-rspi.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index ad4ac867170b101a..ea3f2680d3c13e02 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -248,19 +248,32 @@ struct spi_ops {
 	u8 num_hw_ss;
 };
 
+static void rspi_set_rate(struct rspi_data *rspi)
+{
+	unsigned long clksrc;
+	int brdv = 0, spbr;
+
+	clksrc = clk_get_rate(rspi->clk);
+	spbr = DIV_ROUND_UP(clksrc, 2 * rspi->speed_hz) - 1;
+	while (spbr > 255 && brdv < 3) {
+		brdv++;
+		spbr = DIV_ROUND_UP(spbr + 1, 2) - 1;
+	}
+
+	rspi_write8(rspi, clamp(spbr, 0, 255), RSPI_SPBR);
+	rspi->spcmd |= SPCMD_BRDV(brdv);
+}
+
 /*
  * functions for RSPI on legacy SH
  */
 static int rspi_set_config_register(struct rspi_data *rspi, int access_size)
 {
-	int spbr;
-
 	/* Sets output mode, MOSI signal, and (optionally) loopback */
 	rspi_write8(rspi, rspi->sppcr, RSPI_SPPCR);
 
 	/* Sets transfer bit rate */
-	spbr = DIV_ROUND_UP(clk_get_rate(rspi->clk), 2 * rspi->speed_hz) - 1;
-	rspi_write8(rspi, clamp(spbr, 0, 255), RSPI_SPBR);
+	rspi_set_rate(rspi);
 
 	/* Disable dummy transmission, set 16-bit word access, 1 frame */
 	rspi_write8(rspi, 0, RSPI_SPDCR);
@@ -290,23 +303,11 @@ static int rspi_set_config_register(struct rspi_data *rspi, int access_size)
  */
 static int rspi_rz_set_config_register(struct rspi_data *rspi, int access_size)
 {
-	int spbr;
-	int brdv = 0;
-	unsigned long clksrc;
-
 	/* Sets output mode, MOSI signal, and (optionally) loopback */
 	rspi_write8(rspi, rspi->sppcr, RSPI_SPPCR);
 
-	clksrc = clk_get_rate(rspi->clk);
-	spbr = DIV_ROUND_UP(clksrc, 2 * rspi->speed_hz) - 1;
-	while (spbr > 255 && brdv < 3) {
-		brdv++;
-		spbr = DIV_ROUND_UP(spbr + 1, 2) - 1;
-	}
-
 	/* Sets transfer bit rate */
-	rspi_write8(rspi, clamp(spbr, 0, 255), RSPI_SPBR);
-	rspi->spcmd |= SPCMD_BRDV(brdv);
+	rspi_set_rate(rspi);
 
 	/* Disable dummy transmission, set byte access */
 	rspi_write8(rspi, SPDCR_SPLBYTE, RSPI_SPDCR);
-- 
2.17.1

