Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8E7A75419E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jul 2023 19:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236503AbjGNRuL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jul 2023 13:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235605AbjGNRtx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jul 2023 13:49:53 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF303C33;
        Fri, 14 Jul 2023 10:49:15 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7869bcee569so86551939f.0;
        Fri, 14 Jul 2023 10:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356890; x=1691948890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEiwehMBCAZF25WQAidvI6nJEofNL4h++Xy3RvOZetY=;
        b=EHqaRchm8eKDXPV21qz0eNPfsLKHLFvjrt09ijVrPuJr9Qq8fgP4Ih1zSZ/rWcLOXf
         7QNaiSykKd8+RfHLLbi9TYFW062huQW+MpzE1Ne1iqws4ZX13yP2A2BtZN7BIs1JQK5a
         MX7JKRAt5UR0ycp1PubdjjjiPemTR/SfCsCvJVPjizl6VB8ZLEOfBXh+dfzH6vVz5jyc
         NW3NH/ZsNOFLR0PnQBR7p3WdJ5wcfNjtFi7mkqoJeRkfAJTp4NedqoHr78b8Fsccvtm5
         4a+ouOWsy8C2EQVs6z5SkiSj6byt9uQlGpRG63nAK2L/YPFm+59INdQOeFSQr84gmh20
         t6Qw==
X-Gm-Message-State: ABy/qLZeU9WqkJwY9oCU/GFYMSeiwJDoL+nzlJngaqomngoH6V754YJb
        /tLWKelN50uDmFgy+uj5dg==
X-Google-Smtp-Source: APBJJlFx5HZwcm9CuImhW98f/K+POh6l7VAn2OsStBIlwr2eSGLHagf0/h4F9QeokVeRWADp+1GOgA==
X-Received: by 2002:a05:6602:2186:b0:780:d338:5373 with SMTP id b6-20020a056602218600b00780d3385373mr5440097iob.15.1689356890382;
        Fri, 14 Jul 2023 10:48:10 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id dm26-20020a0566023b9a00b0077a1d1029fcsm2848606iob.28.2023.07.14.10.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:48:09 -0700 (PDT)
Received: (nullmailer pid 4060378 invoked by uid 1000);
        Fri, 14 Jul 2023 17:47:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Robert Richter <rric@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Haibo Chen <haibo.chen@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michal Simek <michal.simek@amd.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Ben Dooks <ben-linux@fluff.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-actions@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] mmc: Explicitly include correct DT includes
Date:   Fri, 14 Jul 2023 11:47:43 -0600
Message-Id: <20230714174745.4060260-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/mmc/host/atmel-mci.c                  | 1 -
 drivers/mmc/host/cavium-octeon.c              | 2 ++
 drivers/mmc/host/cavium-thunderx.c            | 1 +
 drivers/mmc/host/davinci_mmc.c                | 1 -
 drivers/mmc/host/meson-gx-mmc.c               | 2 +-
 drivers/mmc/host/mtk-sd.c                     | 4 +---
 drivers/mmc/host/mxcmmc.c                     | 1 -
 drivers/mmc/host/mxs-mmc.c                    | 1 -
 drivers/mmc/host/owl-mmc.c                    | 3 ++-
 drivers/mmc/host/pxamci.c                     | 1 -
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 3 ++-
 drivers/mmc/host/sdhci-bcm-kona.c             | 1 -
 drivers/mmc/host/sdhci-cadence.c              | 2 +-
 drivers/mmc/host/sdhci-esdhc-imx.c            | 2 +-
 drivers/mmc/host/sdhci-iproc.c                | 2 +-
 drivers/mmc/host/sdhci-msm.c                  | 2 +-
 drivers/mmc/host/sdhci-of-arasan.c            | 3 ++-
 drivers/mmc/host/sdhci-of-at91.c              | 2 +-
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 2 +-
 drivers/mmc/host/sdhci-of-sparx5.c            | 2 +-
 drivers/mmc/host/sdhci-omap.c                 | 1 -
 drivers/mmc/host/sdhci-pxav2.c                | 1 -
 drivers/mmc/host/sdhci-s3c.c                  | 1 -
 drivers/mmc/host/sdhci-sprd.c                 | 1 -
 drivers/mmc/host/sdhci-tegra.c                | 1 -
 drivers/mmc/host/sh_mmcif.c                   | 1 -
 drivers/mmc/host/uniphier-sd.c                | 1 -
 drivers/mmc/host/wmt-sdmmc.c                  | 1 -
 29 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index dd18440a90c5..2fdf352b3d86 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -18,7 +18,6 @@
 #include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/scatterlist.h>
diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
index 12dca91a8ef6..02429f7afb42 100644
--- a/drivers/mmc/host/cavium-octeon.c
+++ b/drivers/mmc/host/cavium-octeon.c
@@ -13,7 +13,9 @@
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <asm/octeon/octeon.h>
 #include "cavium.h"
 
diff --git a/drivers/mmc/host/cavium-thunderx.c b/drivers/mmc/host/cavium-thunderx.c
index 202b1d6da678..2e2ff984f0b3 100644
--- a/drivers/mmc/host/cavium-thunderx.c
+++ b/drivers/mmc/host/cavium-thunderx.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pci.h>
 #include "cavium.h"
 
diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index 7138dfa065bf..17a137f85cbe 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -21,7 +21,6 @@
 #include <linux/dma-mapping.h>
 #include <linux/mmc/mmc.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/interrupt.h>
 
diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index ee9a25b900ae..0669993108ec 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -11,7 +11,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/iopoll.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/ioport.h>
 #include <linux/dma-mapping.h>
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 02403ff99e0d..6c68c642ef61 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -12,9 +12,7 @@
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index 668f865f3efb..226a10202d25 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -31,7 +31,6 @@
 #include <linux/dmaengine.h>
 #include <linux/types.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/mmc/slot-gpio.h>
 
diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
index 8c3655d3be96..951c6c48b4f7 100644
--- a/drivers/mmc/host/mxs-mmc.c
+++ b/drivers/mmc/host/mxs-mmc.c
@@ -11,7 +11,6 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
index 1bf22b08b373..62d2993573d0 100644
--- a/drivers/mmc/host/owl-mmc.c
+++ b/drivers/mmc/host/owl-mmc.c
@@ -16,8 +16,9 @@
 #include <linux/interrupt.h>
 #include <linux/mmc/host.h>
 #include <linux/mmc/slot-gpio.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
index 2a988f942b6c..d274e4433fc1 100644
--- a/drivers/mmc/host/pxamci.c
+++ b/drivers/mmc/host/pxamci.c
@@ -30,7 +30,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gfp.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/soc/pxa/cpu.h>
 
 #include <linux/sizes.h>
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 9ab813903b2c..4cc5bcb3213a 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -15,7 +15,8 @@
 #include <linux/mmc/host.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pagemap.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index b559ad38b667..452982e670d2 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -15,7 +15,8 @@
 #include <linux/mmc/host.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pagemap.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
diff --git a/drivers/mmc/host/sdhci-bcm-kona.c b/drivers/mmc/host/sdhci-bcm-kona.c
index 6a93a54fe067..ef1fb383e1e7 100644
--- a/drivers/mmc/host/sdhci-bcm-kona.c
+++ b/drivers/mmc/host/sdhci-bcm-kona.c
@@ -11,7 +11,6 @@
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/mmc/slot-gpio.h>
 
 #include "sdhci-pltfm.h"
diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-cadence.c
index d2f625054689..25d9849ef0d1 100644
--- a/drivers/mmc/host/sdhci-cadence.c
+++ b/drivers/mmc/host/sdhci-cadence.c
@@ -11,7 +11,7 @@
 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 
 #include "sdhci-pltfm.h"
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index eebf94604a7f..e767fe058023 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -22,7 +22,7 @@
 #include <linux/mmc/sdio.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 #include "sdhci-cqhci.h"
diff --git a/drivers/mmc/host/sdhci-iproc.c b/drivers/mmc/host/sdhci-iproc.c
index 86eb0045515e..6a93b1ee0b30 100644
--- a/drivers/mmc/host/sdhci-iproc.c
+++ b/drivers/mmc/host/sdhci-iproc.c
@@ -10,7 +10,7 @@
 #include <linux/module.h>
 #include <linux/mmc/host.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include "sdhci-pltfm.h"
 
 struct sdhci_iproc_data {
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 1c935b5bafe1..c0ce187e740a 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/delay.h>
 #include <linux/mmc/mmc.h>
 #include <linux/pm_runtime.h>
@@ -15,6 +14,7 @@
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
 #include <linux/interconnect.h>
+#include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/reset.h>
 
diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 294dd605fd2b..abc3e49fbda5 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -18,7 +18,8 @@
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/phy/phy.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index cd0134580a90..808307a211f2 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -17,7 +17,7 @@
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 
diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index e68cd87998c8..55e1e2d0494d 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -14,7 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/sizes.h>
 
diff --git a/drivers/mmc/host/sdhci-of-sparx5.c b/drivers/mmc/host/sdhci-of-sparx5.c
index 28e4ee69e100..2e983cf49bc6 100644
--- a/drivers/mmc/host/sdhci-of-sparx5.c
+++ b/drivers/mmc/host/sdhci-of-sparx5.c
@@ -13,9 +13,9 @@
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/of_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/dma-mapping.h>
+#include <linux/of.h>
 
 #include "sdhci-pltfm.h"
 
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 8ed9256b83da..2593e3fbd0d9 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -11,7 +11,6 @@
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/mmc/host/sdhci-pxav2.c b/drivers/mmc/host/sdhci-pxav2.c
index 91aca8f8d6ef..86b60b0447b3 100644
--- a/drivers/mmc/host/sdhci-pxav2.c
+++ b/drivers/mmc/host/sdhci-pxav2.c
@@ -19,7 +19,6 @@
 #include <linux/platform_data/pxa_sdhci.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/mmc/sdio.h>
 #include <linux/mmc/mmc.h>
 #include <linux/pinctrl/consumer.h>
diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
index 504015e84308..6245fb4584fe 100644
--- a/drivers/mmc/host/sdhci-s3c.c
+++ b/drivers/mmc/host/sdhci-s3c.c
@@ -20,7 +20,6 @@
 #include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
index 7f4ee2e12735..a21d6524d7ca 100644
--- a/drivers/mmc/host/sdhci-sprd.c
+++ b/drivers/mmc/host/sdhci-sprd.c
@@ -11,7 +11,6 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index bff084f178c9..1e1eac953691 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -19,7 +19,6 @@
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
index 5cf53348372a..838dab179724 100644
--- a/drivers/mmc/host/sh_mmcif.c
+++ b/drivers/mmc/host/sh_mmcif.c
@@ -46,7 +46,6 @@
 #include <linux/mmc/slot-gpio.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
 #include <linux/pagemap.h>
 #include <linux/platform_data/sh_mmcif.h>
 #include <linux/platform_device.h>
diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-sd.c
index 61acd69fac0e..c1400d616fff 100644
--- a/drivers/mmc/host/uniphier-sd.c
+++ b/drivers/mmc/host/uniphier-sd.c
@@ -13,7 +13,6 @@
 #include <linux/mmc/host.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/mmc/host/wmt-sdmmc.c b/drivers/mmc/host/wmt-sdmmc.c
index 68525d900046..f860f363be56 100644
--- a/drivers/mmc/host/wmt-sdmmc.c
+++ b/drivers/mmc/host/wmt-sdmmc.c
@@ -21,7 +21,6 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_device.h>
 
 #include <linux/mmc/host.h>
 #include <linux/mmc/mmc.h>
-- 
2.40.1

