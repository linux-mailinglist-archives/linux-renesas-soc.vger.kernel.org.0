Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A5B44C860
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbhKJTIK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:08:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbhKJTIH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:08:07 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B78C04C330
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Nov 2021 11:00:57 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:c018:2195:47a6:f384])
        by laurent.telenet-ops.be with bizsmtp
        id Gj0v2600816Lvom01j0vpa; Wed, 10 Nov 2021 20:00:55 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mksq6-00BX6N-Vm; Wed, 10 Nov 2021 20:00:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mksq6-007h4a-05; Wed, 10 Nov 2021 20:00:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Consolidate product register handling
Date:   Wed, 10 Nov 2021 20:00:52 +0100
Message-Id: <057721f46c7499de4133135488f0f3da7fb39265.1636570669.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Currently renesas_soc_init() scans the whole device tree up to three
times, to find a device node describing a product register.
Furthermore, the product register handling for the different variants is
very similar, with the major difference being the location of the
product bitfield inside the product register.

Reduce scanning to a single pass using of_find_matching_node_and_match()
instead.  Switch to a common handling of product registers, by storing
the intrinsics of each product register type in the data field of the
corresponding match entry.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Unfortunately the simplication of the source code is not reflected in
the actual object code size, due to the sheer size of struct
of_device_id (196 or 200 bytes on 32 vs. 64-bit).

"[PATCH/RFC] of: Shrink struct of_device_id"
https://lore.kernel.org/all/ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be
---
 drivers/soc/renesas/renesas-soc.c | 115 +++++++++++++++---------------
 1 file changed, 56 insertions(+), 59 deletions(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 7961b0be1850922d..7da0ea3587c4eab8 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -328,16 +328,49 @@ static const struct of_device_id renesas_socs[] __initconst = {
 	{ /* sentinel */ }
 };
 
+struct renesas_id {
+	unsigned int offset;
+	u32 mask;
+};
+
+static const struct renesas_id id_bsid __initconst = {
+	.offset = 0,
+	.mask = 0xff0000,
+	/*
+	 * TODO: Upper 4 bits of BSID are for chip version, but the format is
+	 * not known at this time so we don't know how to specify eshi and eslo
+	 */
+};
+
+static const struct renesas_id id_rzg2l __initconst = {
+	.offset = 0xa04,
+	.mask = 0xfffffff,
+};
+
+static const struct renesas_id id_prr __initconst = {
+	.offset = 0,
+	.mask = 0xff00,
+};
+
+static const struct of_device_id renesas_ids[] __initconst = {
+	{ .compatible = "renesas,bsid",			.data = &id_bsid },
+	{ .compatible = "renesas,r9a07g044-sysc",	.data = &id_rzg2l },
+	{ .compatible = "renesas,prr",			.data = &id_prr },
+	{ /* sentinel */ }
+};
+
 static int __init renesas_soc_init(void)
 {
 	struct soc_device_attribute *soc_dev_attr;
+	unsigned int product, eshi = 0, eslo;
 	const struct renesas_family *family;
 	const struct of_device_id *match;
 	const struct renesas_soc *soc;
+	const struct renesas_id *id;
 	void __iomem *chipid = NULL;
 	struct soc_device *soc_dev;
 	struct device_node *np;
-	unsigned int product, eshi = 0, eslo;
+	const char *soc_id;
 
 	match = of_match_node(renesas_socs, of_root);
 	if (!match)
@@ -345,77 +378,42 @@ static int __init renesas_soc_init(void)
 
 	soc = match->data;
 	family = soc->family;
+	soc_id = strchr(match->compatible, ',') + 1;
 
-	np = of_find_compatible_node(NULL, NULL, "renesas,bsid");
+	np = of_find_matching_node_and_match(NULL, renesas_ids, &match);
 	if (np) {
+		id = match->data;
 		chipid = of_iomap(np, 0);
 		of_node_put(np);
-
-		if (chipid) {
-			product = readl(chipid);
-			iounmap(chipid);
-
-			if (soc->id && ((product >> 16) & 0xff) != soc->id) {
-				pr_warn("SoC mismatch (product = 0x%x)\n",
-					product);
-				return -ENODEV;
-			}
-		}
-
-		/*
-		 * TODO: Upper 4 bits of BSID are for chip version, but the
-		 * format is not known at this time so we don't know how to
-		 * specify eshi and eslo
-		 */
-
-		goto done;
+	} else if (soc->id && family->reg) {
+		/* Try hardcoded CCCR/PRR fallback */
+		id = &id_prr;
+		chipid = ioremap(family->reg, 4);
 	}
 
-	np = of_find_compatible_node(NULL, NULL, "renesas,r9a07g044-sysc");
-	if (np) {
-		chipid = of_iomap(np, 0);
-		of_node_put(np);
+	if (chipid) {
+		product = readl(chipid + id->offset);
+		iounmap(chipid);
 
-		if (chipid) {
-			product = readl(chipid + 0x0a04);
-			iounmap(chipid);
+		if (id == &id_prr) {
+			/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
+			if ((product & 0x7fff) == 0x5210)
+				product ^= 0x11;
+			/* R-Car M3-W ES1.3 incorrectly identifies as ES2.1 */
+			if ((product & 0x7fff) == 0x5211)
+				product ^= 0x12;
 
-			if (soc->id && (product & 0xfffffff) != soc->id) {
-				pr_warn("SoC mismatch (product = 0x%x)\n",
-					product);
-				return -ENODEV;
-			}
+			eshi = ((product >> 4) & 0x0f) + 1;
+			eslo = product & 0xf;
 		}
 
-		goto done;
-	}
-
-	/* Try PRR first, then hardcoded fallback */
-	np = of_find_compatible_node(NULL, NULL, "renesas,prr");
-	if (np) {
-		chipid = of_iomap(np, 0);
-		of_node_put(np);
-	} else if (soc->id && family->reg) {
-		chipid = ioremap(family->reg, 4);
-	}
-	if (chipid) {
-		product = readl(chipid);
-		iounmap(chipid);
-		/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
-		if ((product & 0x7fff) == 0x5210)
-			product ^= 0x11;
-		/* R-Car M3-W ES1.3 incorrectly identifies as ES2.1 */
-		if ((product & 0x7fff) == 0x5211)
-			product ^= 0x12;
-		if (soc->id && ((product >> 8) & 0xff) != soc->id) {
+		if (soc->id &&
+		    ((product & id->mask) >> __ffs(id->mask)) != soc->id) {
 			pr_warn("SoC mismatch (product = 0x%x)\n", product);
 			return -ENODEV;
 		}
-		eshi = ((product >> 4) & 0x0f) + 1;
-		eslo = product & 0xf;
 	}
 
-done:
 	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
 		return -ENOMEM;
@@ -425,8 +423,7 @@ static int __init renesas_soc_init(void)
 	of_node_put(np);
 
 	soc_dev_attr->family = kstrdup_const(family->name, GFP_KERNEL);
-	soc_dev_attr->soc_id = kstrdup_const(strchr(match->compatible, ',') + 1,
-					     GFP_KERNEL);
+	soc_dev_attr->soc_id = kstrdup_const(soc_id, GFP_KERNEL);
 	if (eshi)
 		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "ES%u.%u", eshi,
 						   eslo);
-- 
2.25.1

