Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3297A4A72E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 15:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344862AbiBBOWA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 09:22:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbiBBOWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 09:22:00 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5EDC061714
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 06:22:00 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d15:63c8:19b3:7e76])
        by xavier.telenet-ops.be with bizsmtp
        id qEMw2600S3fpYBQ01EMxke; Wed, 02 Feb 2022 15:21:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFGWC-00Cufs-M1; Wed, 02 Feb 2022 15:21:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFGWC-001wpJ-4X; Wed, 02 Feb 2022 15:21:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Insert "Rev" before printed revision on RZ/G2L
Date:   Wed,  2 Feb 2022 15:21:55 +0100
Message-Id: <e61a88ca90ffd513c7aa680bdffefeee444edd8f.1643811627.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

While just storing the RZ/G2L revision number into the
soc_device_attribute.revision field is fine, printing only the number
during boot-up looks a bit silly.

Make the output more visually-pleasing by re-inserting "Rev" on RZ/G2L.

Impact:

    -Detected Renesas RZ/G2L r9a07g044 1
    +Detected Renesas RZ/G2L r9a07g044 Rev 1

Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Fixes: 92dfff382af0ce65 ("soc: renesas: Add support for reading product revision for RZ/G2L family")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be folded into the original commit.

Compared to my earlier proposal, this does not impact the output on
non-RZ/G2L SoCs.
---
 drivers/soc/renesas/renesas-soc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 1ca83c4c0fd8c9e5..a5377d9c299f6c48 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -408,6 +408,7 @@ static int __init renesas_soc_init(void)
 	const struct renesas_soc *soc;
 	const struct renesas_id *id;
 	void __iomem *chipid = NULL;
+	const char *rev_prefix = "";
 	struct soc_device *soc_dev;
 	struct device_node *np;
 	const char *soc_id;
@@ -463,6 +464,7 @@ static int __init renesas_soc_init(void)
 			eshi =  ((product >> 28) & 0x0f);
 			soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%u",
 							   eshi);
+			rev_prefix = "Rev ";
 		}
 
 		if (soc->id &&
@@ -472,8 +474,8 @@ static int __init renesas_soc_init(void)
 		}
 	}
 
-	pr_info("Detected Renesas %s %s %s\n", soc_dev_attr->family,
-		soc_dev_attr->soc_id, soc_dev_attr->revision ?: "");
+	pr_info("Detected Renesas %s %s %s%s\n", soc_dev_attr->family,
+		soc_dev_attr->soc_id, rev_prefix, soc_dev_attr->revision ?: "");
 
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
-- 
2.25.1

