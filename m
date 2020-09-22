Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1182741B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Sep 2020 14:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgIVMAo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Sep 2020 08:00:44 -0400
Received: from www.zeus03.de ([194.117.254.33]:60654 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbgIVMAo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 08:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=pVIIA1FPAVeoonehKiIdJh48Aty
        H9quaTa2lPSi/Lu0=; b=38EgKSaMTTIrg38uDYp0AL65NKL6eCzvEsi6nmBvP00
        zD7jW9XqVDgtjPlbE90xkCcUarZlJZgc7o6m8dTNRXaLrzID7nFJ2BOKmZxcB99+
        xBCRghrVGwrSMAuhzPBqe+QITY32EjRv4xDeW3cHdkOXAh1yR/boc2tR3C8zte2o
        =
Received: (qmail 207324 invoked from network); 22 Sep 2020 14:00:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2020 14:00:42 +0200
X-UD-Smtp-Session: l3s3148p1@UMZnt+WvsOMgAwDPXw2nAFbEEsRzXAbg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] clk: renesas: rcar-gen3: remove stp_ck handling for SDHI
Date:   Tue, 22 Sep 2020 14:00:36 +0200
Message-Id: <20200922120036.10298-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no case (and none foreseen) where we would need to disable the
SDn clock. So, for simplicity, remove its handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Geert seems to favor simplicity, too. So, now this patch leaves RFC
status.

Change since RFC: * fixed typo in commit message

 drivers/clk/renesas/rcar-gen3-cpg.c | 51 ++++++++++++++---------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 488f8b3980c5..a7debddf7d09 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -224,10 +224,9 @@ static struct clk * __init cpg_z_clk_register(const char *name,
 #define CPG_SD_STP_MASK		(CPG_SD_STP_HCK | CPG_SD_STP_CK)
 #define CPG_SD_FC_MASK		(0x7 << 2 | 0x3 << 0)
 
-#define CPG_SD_DIV_TABLE_DATA(stp_hck, stp_ck, sd_srcfc, sd_fc, sd_div) \
+#define CPG_SD_DIV_TABLE_DATA(stp_hck, sd_srcfc, sd_fc, sd_div) \
 { \
 	.val = ((stp_hck) ? CPG_SD_STP_HCK : 0) | \
-	       ((stp_ck) ? CPG_SD_STP_CK : 0) | \
 	       ((sd_srcfc) << 2) | \
 	       ((sd_fc) << 0), \
 	.div = (sd_div), \
@@ -247,36 +246,36 @@ struct sd_clock {
 };
 
 /* SDn divider
- *                     sd_srcfc   sd_fc   div
- * stp_hck   stp_ck    (div)      (div)     = sd_srcfc x sd_fc
- *-------------------------------------------------------------------
- *  0         0         0 (1)      1 (4)      4 : SDR104 / HS200 / HS400 (8 TAP)
- *  0         0         1 (2)      1 (4)      8 : SDR50
- *  1         0         2 (4)      1 (4)     16 : HS / SDR25
- *  1         0         3 (8)      1 (4)     32 : NS / SDR12
- *  1         0         4 (16)     1 (4)     64
- *  0         0         0 (1)      0 (2)      2
- *  0         0         1 (2)      0 (2)      4 : SDR104 / HS200 / HS400 (4 TAP)
- *  1         0         2 (4)      0 (2)      8
- *  1         0         3 (8)      0 (2)     16
- *  1         0         4 (16)     0 (2)     32
+ *           sd_srcfc   sd_fc   div
+ * stp_hck   (div)      (div)     = sd_srcfc x sd_fc
+ *---------------------------------------------------------
+ *  0         0 (1)      1 (4)      4 : SDR104 / HS200 / HS400 (8 TAP)
+ *  0         1 (2)      1 (4)      8 : SDR50
+ *  1         2 (4)      1 (4)     16 : HS / SDR25
+ *  1         3 (8)      1 (4)     32 : NS / SDR12
+ *  1         4 (16)     1 (4)     64
+ *  0         0 (1)      0 (2)      2
+ *  0         1 (2)      0 (2)      4 : SDR104 / HS200 / HS400 (4 TAP)
+ *  1         2 (4)      0 (2)      8
+ *  1         3 (8)      0 (2)     16
+ *  1         4 (16)     0 (2)     32
  *
  *  NOTE: There is a quirk option to ignore the first row of the dividers
  *  table when searching for suitable settings. This is because HS400 on
  *  early ES versions of H3 and M3-W requires a specific setting to work.
  */
 static const struct sd_div_table cpg_sd_div_table[] = {
-/*	CPG_SD_DIV_TABLE_DATA(stp_hck,  stp_ck,   sd_srcfc,   sd_fc,  sd_div) */
-	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          1,        4),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          1,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          1,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          1,       32),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          1,       64),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          0,        2),
-	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          0,        4),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          0,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          0,       16),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          0,       32),
+/*	CPG_SD_DIV_TABLE_DATA(stp_hck,  sd_srcfc,   sd_fc,  sd_div) */
+	CPG_SD_DIV_TABLE_DATA(0,        0,          1,        4),
+	CPG_SD_DIV_TABLE_DATA(0,        1,          1,        8),
+	CPG_SD_DIV_TABLE_DATA(1,        2,          1,       16),
+	CPG_SD_DIV_TABLE_DATA(1,        3,          1,       32),
+	CPG_SD_DIV_TABLE_DATA(1,        4,          1,       64),
+	CPG_SD_DIV_TABLE_DATA(0,        0,          0,        2),
+	CPG_SD_DIV_TABLE_DATA(0,        1,          0,        4),
+	CPG_SD_DIV_TABLE_DATA(1,        2,          0,        8),
+	CPG_SD_DIV_TABLE_DATA(1,        3,          0,       16),
+	CPG_SD_DIV_TABLE_DATA(1,        4,          0,       32),
 };
 
 #define to_sd_clock(_hw) container_of(_hw, struct sd_clock, hw)
-- 
2.20.1

