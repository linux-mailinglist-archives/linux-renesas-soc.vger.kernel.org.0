Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB814CA2E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Mar 2022 12:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbiCBLJA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Mar 2022 06:09:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiCBLI5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Mar 2022 06:08:57 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31AD26AF5
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Mar 2022 03:08:10 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8cac:a75c:6aef:8a67])
        by michel.telenet-ops.be with bizsmtp
        id 1P822701C36NB4j06P82Ze; Wed, 02 Mar 2022 12:08:08 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPMiA-002RkT-Vm; Wed, 02 Mar 2022 12:00:02 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nPKNb-007MlU-37; Wed, 02 Mar 2022 09:30:39 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ata: Drop commas after OF match table sentinels
Date:   Wed,  2 Mar 2022 09:30:34 +0100
Message-Id: <15d4b8e1108c902c4e80c87edfc702a7786de4ba.1646209667.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

It does not make sense to have a comma after a sentinel, as any new
elements must be added before the sentinel.

Add comments to clarify the purpose of the empty elements.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/ata/ahci_brcm.c        | 2 +-
 drivers/ata/ahci_ceva.c        | 2 +-
 drivers/ata/ahci_da850.c       | 2 +-
 drivers/ata/ahci_dm816.c       | 2 +-
 drivers/ata/ahci_imx.c         | 2 +-
 drivers/ata/ahci_mtk.c         | 2 +-
 drivers/ata/ahci_mvebu.c       | 2 +-
 drivers/ata/ahci_octeon.c      | 2 +-
 drivers/ata/ahci_platform.c    | 2 +-
 drivers/ata/ahci_qoriq.c       | 2 +-
 drivers/ata/ahci_st.c          | 2 +-
 drivers/ata/ahci_sunxi.c       | 2 +-
 drivers/ata/ahci_xgene.c       | 2 +-
 drivers/ata/pata_ftide010.c    | 2 +-
 drivers/ata/pata_ixp4xx_cf.c   | 2 +-
 drivers/ata/pata_macio.c       | 2 +-
 drivers/ata/pata_mpc52xx.c     | 2 +-
 drivers/ata/pata_octeon_cf.c   | 2 +-
 drivers/ata/pata_of_platform.c | 2 +-
 drivers/ata/sata_fsl.c         | 2 +-
 drivers/ata/sata_gemini.c      | 2 +-
 drivers/ata/sata_highbank.c    | 2 +-
 drivers/ata/sata_mv.c          | 2 +-
 drivers/ata/sata_rcar.c        | 2 +-
 24 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 64dd8aa397d5276b..ab8552b1ff2a14ad 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -427,7 +427,7 @@ static const struct of_device_id ahci_of_match[] = {
 	{.compatible = "brcm,bcm63138-ahci", .data = (void *)BRCM_SATA_BCM7445},
 	{.compatible = "brcm,bcm-nsp-ahci", .data = (void *)BRCM_SATA_NSP},
 	{.compatible = "brcm,bcm7216-ahci", .data = (void *)BRCM_SATA_BCM7216},
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ahci_of_match);
 
diff --git a/drivers/ata/ahci_ceva.c b/drivers/ata/ahci_ceva.c
index acf59f51b3569d71..cb24ecf36fafe040 100644
--- a/drivers/ata/ahci_ceva.c
+++ b/drivers/ata/ahci_ceva.c
@@ -363,7 +363,7 @@ static SIMPLE_DEV_PM_OPS(ahci_ceva_pm_ops, ceva_ahci_suspend, ceva_ahci_resume);
 
 static const struct of_device_id ceva_ahci_of_match[] = {
 	{ .compatible = "ceva,ahci-1v84" },
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ceva_ahci_of_match);
 
diff --git a/drivers/ata/ahci_da850.c b/drivers/ata/ahci_da850.c
index 0e82766007128e72..052c28e250aa8d96 100644
--- a/drivers/ata/ahci_da850.c
+++ b/drivers/ata/ahci_da850.c
@@ -241,7 +241,7 @@ static SIMPLE_DEV_PM_OPS(ahci_da850_pm_ops, ahci_platform_suspend,
 
 static const struct of_device_id ahci_da850_of_match[] = {
 	{ .compatible = "ti,da850-ahci", },
-	{ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ahci_da850_of_match);
 
diff --git a/drivers/ata/ahci_dm816.c b/drivers/ata/ahci_dm816.c
index 8bec4104167142c5..8a92112dcd59080a 100644
--- a/drivers/ata/ahci_dm816.c
+++ b/drivers/ata/ahci_dm816.c
@@ -176,7 +176,7 @@ static SIMPLE_DEV_PM_OPS(ahci_dm816_pm_ops,
 
 static const struct of_device_id ahci_dm816_of_match[] = {
 	{ .compatible = "ti,dm816-ahci", },
-	{ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ahci_dm816_of_match);
 
diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 388baf528fa81cab..79aa9f2853129f6e 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -811,7 +811,7 @@ static const struct of_device_id imx_ahci_of_match[] = {
 	{ .compatible = "fsl,imx6q-ahci", .data = (void *)AHCI_IMX6Q },
 	{ .compatible = "fsl,imx6qp-ahci", .data = (void *)AHCI_IMX6QP },
 	{ .compatible = "fsl,imx8qm-ahci", .data = (void *)AHCI_IMX8QM },
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_ahci_of_match);
 
diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
index d9b08ae7c3b22104..1f6c85fde9830ac1 100644
--- a/drivers/ata/ahci_mtk.c
+++ b/drivers/ata/ahci_mtk.c
@@ -169,7 +169,7 @@ static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
 
 static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "mediatek,mtk-ahci", },
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ahci_of_match);
 
diff --git a/drivers/ata/ahci_mvebu.c b/drivers/ata/ahci_mvebu.c
index 3ad46d26d9d51790..991413a272e608a2 100644
--- a/drivers/ata/ahci_mvebu.c
+++ b/drivers/ata/ahci_mvebu.c
@@ -239,7 +239,7 @@ static const struct of_device_id ahci_mvebu_of_match[] = {
 		.compatible = "marvell,armada-3700-ahci",
 		.data = &ahci_mvebu_armada_3700_plat_data,
 	},
-	{ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ahci_mvebu_of_match);
 
diff --git a/drivers/ata/ahci_octeon.c b/drivers/ata/ahci_octeon.c
index 5a44e089c6bb6ae2..b9460b91288f772d 100644
--- a/drivers/ata/ahci_octeon.c
+++ b/drivers/ata/ahci_octeon.c
@@ -80,7 +80,7 @@ static int ahci_octeon_remove(struct platform_device *pdev)
 
 static const struct of_device_id octeon_ahci_match[] = {
 	{ .compatible = "cavium,octeon-7130-sata-uctl", },
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, octeon_ahci_match);
 
diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index 3aab2e3d57f3373a..28a8de5b48b979c9 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -88,7 +88,7 @@ static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "snps,dwc-ahci", },
 	{ .compatible = "hisilicon,hisi-ahci", },
 	{ .compatible = "cavium,octeon-7130-ahci", },
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ahci_of_match);
 
diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
index bf5b388bd4e0db9b..dd612d7963159118 100644
--- a/drivers/ata/ahci_qoriq.c
+++ b/drivers/ata/ahci_qoriq.c
@@ -77,7 +77,7 @@ static const struct of_device_id ahci_qoriq_of_match[] = {
 	{ .compatible = "fsl,ls1088a-ahci", .data = (void *)AHCI_LS1088A},
 	{ .compatible = "fsl,ls2088a-ahci", .data = (void *)AHCI_LS2088A},
 	{ .compatible = "fsl,lx2160a-ahci", .data = (void *)AHCI_LX2160A},
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ahci_qoriq_of_match);
 
diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
index c268264c2129c52a..7526653c843b3226 100644
--- a/drivers/ata/ahci_st.c
+++ b/drivers/ata/ahci_st.c
@@ -232,7 +232,7 @@ static SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
 
 static const struct of_device_id st_ahci_match[] = {
 	{ .compatible = "st,ahci", },
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, st_ahci_match);
 
diff --git a/drivers/ata/ahci_sunxi.c b/drivers/ata/ahci_sunxi.c
index 56b695136977ab72..c7273c1cb0c73b9b 100644
--- a/drivers/ata/ahci_sunxi.c
+++ b/drivers/ata/ahci_sunxi.c
@@ -286,7 +286,7 @@ static SIMPLE_DEV_PM_OPS(ahci_sunxi_pm_ops, ahci_platform_suspend,
 static const struct of_device_id ahci_sunxi_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-ahci", },
 	{ .compatible = "allwinner,sun8i-r40-ahci", },
-	{ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ahci_sunxi_of_match);
 
diff --git a/drivers/ata/ahci_xgene.c b/drivers/ata/ahci_xgene.c
index 8e206379d699f080..d205896f66cfb228 100644
--- a/drivers/ata/ahci_xgene.c
+++ b/drivers/ata/ahci_xgene.c
@@ -726,7 +726,7 @@ MODULE_DEVICE_TABLE(acpi, xgene_ahci_acpi_match);
 static const struct of_device_id xgene_ahci_of_match[] = {
 	{.compatible = "apm,xgene-ahci", .data = (void *) XGENE_AHCI_V1},
 	{.compatible = "apm,xgene-ahci-v2", .data = (void *) XGENE_AHCI_V2},
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, xgene_ahci_of_match);
 
diff --git a/drivers/ata/pata_ftide010.c b/drivers/ata/pata_ftide010.c
index 34cb104f6b43e5cf..2a92797b5e11a9aa 100644
--- a/drivers/ata/pata_ftide010.c
+++ b/drivers/ata/pata_ftide010.c
@@ -557,7 +557,7 @@ static const struct of_device_id pata_ftide010_of_match[] = {
 	{
 		.compatible = "faraday,ftide010",
 	},
-	{},
+	{ /* sentinel */ }
 };
 
 static struct platform_driver pata_ftide010_driver = {
diff --git a/drivers/ata/pata_ixp4xx_cf.c b/drivers/ata/pata_ixp4xx_cf.c
index 17b557c91e1c78fc..e225913a619d8414 100644
--- a/drivers/ata/pata_ixp4xx_cf.c
+++ b/drivers/ata/pata_ixp4xx_cf.c
@@ -293,7 +293,7 @@ static int ixp4xx_pata_probe(struct platform_device *pdev)
 
 static const struct of_device_id ixp4xx_pata_of_match[] = {
 	{ .compatible = "intel,ixp4xx-compact-flash", },
-	{ },
+	{ /* sentinel */ }
 };
 
 static struct platform_driver ixp4xx_pata_platform_driver = {
diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index 16e8aa184a75793f..8cf778723fd6d049 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -1345,7 +1345,7 @@ static const struct of_device_id pata_macio_match[] =
 	{
 	.type		= "ata",
 	},
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, pata_macio_match);
 
diff --git a/drivers/ata/pata_mpc52xx.c b/drivers/ata/pata_mpc52xx.c
index f1d352d5f128537a..bc9d9df3b5aced64 100644
--- a/drivers/ata/pata_mpc52xx.c
+++ b/drivers/ata/pata_mpc52xx.c
@@ -849,7 +849,7 @@ mpc52xx_ata_resume(struct platform_device *op)
 static const struct of_device_id mpc52xx_ata_of_match[] = {
 	{ .compatible = "fsl,mpc5200-ata", },
 	{ .compatible = "mpc5200-ata", },
-	{},
+	{ /* sentinel */ }
 };
 
 
diff --git a/drivers/ata/pata_octeon_cf.c b/drivers/ata/pata_octeon_cf.c
index 05c2ab3757568c62..bdaec863171a14cf 100644
--- a/drivers/ata/pata_octeon_cf.c
+++ b/drivers/ata/pata_octeon_cf.c
@@ -1009,7 +1009,7 @@ static const struct of_device_id octeon_cf_match[] = {
 	{
 		.compatible = "cavium,ebt3000-compact-flash",
 	},
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, octeon_cf_match);
 
diff --git a/drivers/ata/pata_of_platform.c b/drivers/ata/pata_of_platform.c
index c3a40b717dcdcc2a..ac5a633c00a57ac1 100644
--- a/drivers/ata/pata_of_platform.c
+++ b/drivers/ata/pata_of_platform.c
@@ -79,7 +79,7 @@ static int pata_of_platform_probe(struct platform_device *ofdev)
 
 static const struct of_device_id pata_of_platform_match[] = {
 	{ .compatible = "ata-generic", },
-	{ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, pata_of_platform_match);
 
diff --git a/drivers/ata/sata_fsl.c b/drivers/ata/sata_fsl.c
index 556034a15430461f..11867a7eb4691771 100644
--- a/drivers/ata/sata_fsl.c
+++ b/drivers/ata/sata_fsl.c
@@ -1583,7 +1583,7 @@ static const struct of_device_id fsl_sata_match[] = {
 	{
 		.compatible = "fsl,pq-sata-v2",
 	},
-	{},
+	{ /* sentinel */ }
 };
 
 MODULE_DEVICE_TABLE(of, fsl_sata_match);
diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
index 440a63de20d01a07..c7e9efc0025f1a91 100644
--- a/drivers/ata/sata_gemini.c
+++ b/drivers/ata/sata_gemini.c
@@ -422,7 +422,7 @@ static const struct of_device_id gemini_sata_of_match[] = {
 	{
 		.compatible = "cortina,gemini-sata-bridge",
 	},
-	{},
+	{ /* sentinel */ }
 };
 
 static struct platform_driver gemini_sata_driver = {
diff --git a/drivers/ata/sata_highbank.c b/drivers/ata/sata_highbank.c
index b29d3f1d64b03317..cd375e4df9644e33 100644
--- a/drivers/ata/sata_highbank.c
+++ b/drivers/ata/sata_highbank.c
@@ -444,7 +444,7 @@ static struct scsi_host_template ahci_highbank_platform_sht = {
 
 static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "calxeda,hb-ahci" },
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ahci_of_match);
 
diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index 53446b997740d5fd..13d92b71e6659cda 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -4277,7 +4277,7 @@ static int mv_platform_resume(struct platform_device *pdev)
 static const struct of_device_id mv_sata_dt_ids[] = {
 	{ .compatible = "marvell,armada-370-sata", },
 	{ .compatible = "marvell,orion-sata", },
-	{},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mv_sata_dt_ids);
 #endif
diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 3d96b6faa3f0e1c6..1483d3efeb7e220e 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -857,7 +857,7 @@ static const struct of_device_id sata_rcar_match[] = {
 		.compatible = "renesas,rcar-gen3-sata",
 		.data = (void *)RCAR_GEN3_SATA
 	},
-	{ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sata_rcar_match);
 
-- 
2.25.1

