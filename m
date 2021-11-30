Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225DD463070
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Nov 2021 11:01:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240569AbhK3KE1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Nov 2021 05:04:27 -0500
Received: from mail.iot.bzh ([51.75.236.24]:38082 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234861AbhK3KE1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 05:04:27 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id E126624868;
        Tue, 30 Nov 2021 11:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:date:from:from:in-reply-to:message-id
        :mime-version:references:reply-to:subject:subject:to:to; s=
        iot.bzh; bh=hHdfwfEqvvIffQzSqitCp+MSgcpbluGdE9AYNvqtqn0=; b=SFXY
        wSef2UnjWHGrVHqWsVX3sYV6/mKIuyocMu6Xw8nBs8ZeADnJL/sYU9EXaSBs41FY
        ycqge3SoguZVQvMLcK3yo1c/mhwAl2oMU+0YFd+qRJ/O5vuK9AnjizHTfefPlNyG
        FU3841klwMKZ/r4RHji34xZ4IdCP7HH9DPaNWWA9SH2A3q2kQ9wPY+3vArAuMEeA
        iIq3sk/PEWzYoXhAOVhVvMVUCeSu+tLydfNZct2h1IjNvustCzNMIZ19oiFtEGVM
        JlrDZtZF0QS8RvPQTYXqPc6RCYwAeAbwX5jqSumnOrCRvnNphrbnPSb1moZjLaZh
        7D+JJYtAjbF+WhHjOQ==
From:   Julien Massot <julien.massot@iot.bzh>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, geert+renesas@glider.be
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Julien Massot <julien.massot@iot.bzh>
Subject: [PATCH v2 2/2] remoteproc: Add Renesas rcar driver
Date:   Tue, 30 Nov 2021 11:00:49 +0100
Message-Id: <20211130100049.129418-3-julien.massot@iot.bzh>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130100049.129418-1-julien.massot@iot.bzh>
References: <20211130100049.129418-1-julien.massot@iot.bzh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas Gen3 platform includes a Cortex-r7 processor.

Both: the application cores (A5x) and the realtime core (CR7)
share access to the RAM and devices with the same address map,
so device addresses are equal to the Linux physical addresses.

In order to initialize this remote processor we need to:
- power on the realtime core
- put the firmware in a ram area
- set the boot address for this firmware (reset vector)
- Deassert the reset

This initial driver allows to start and stop the Cortex R7
processor.

Signed-off-by: Julien Massot <julien.massot@iot.bzh>
---
Change since v1:
- use "%zx" printf specifier for size_t
- drop depends on REMOTEPROC in Kconfig file

---
 drivers/remoteproc/Kconfig      |  11 ++
 drivers/remoteproc/Makefile     |   1 +
 drivers/remoteproc/rcar_rproc.c | 226 ++++++++++++++++++++++++++++++++
 3 files changed, 238 insertions(+)
 create mode 100644 drivers/remoteproc/rcar_rproc.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index f2e961f998ca..10cde1f9dbe0 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -283,6 +283,17 @@ config QCOM_WCNSS_PIL
 	  verified and booted with the help of the Peripheral Authentication
 	  System (PAS) in TrustZone.
 
+config RCAR_REMOTEPROC
+	tristate "Renesas R-CAR Gen3 remoteproc support"
+	depends on ARCH_RENESAS
+	help
+	  Say y here to support R-Car realtime processor via the
+	  remote processor framework. An elf firmware can be loaded
+	  thanks to sysfs remoteproc entries. The remote processor
+	  can be started and stopped.
+	  This can be either built-in or a loadable module.
+	  If compiled as module (M), the module name is rcar_rproc.
+
 config ST_REMOTEPROC
 	tristate "ST remoteproc support"
 	depends on ARCH_STI
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 0ac256b6c977..5478c7cb9e07 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
 qcom_wcnss_pil-y			+= qcom_wcnss.o
 qcom_wcnss_pil-y			+= qcom_wcnss_iris.o
+obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
 obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
 obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
 obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
new file mode 100644
index 000000000000..d01bbca41697
--- /dev/null
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) IoT.bzh 2021
+ */
+
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/pm_runtime.h>
+#include <linux/remoteproc.h>
+#include <linux/reset.h>
+#include <linux/soc/renesas/rcar-rst.h>
+
+#include "remoteproc_internal.h"
+
+struct rcar_rproc {
+	struct reset_control *rst;
+};
+
+static int rcar_rproc_mem_alloc(struct rproc *rproc,
+				 struct rproc_mem_entry *mem)
+{
+	struct device *dev = &rproc->dev;
+	void *va;
+
+	dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
+	va = ioremap_wc(mem->dma, mem->len);
+	if (IS_ERR_OR_NULL(va)) {
+		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	/* Update memory entry va */
+	mem->va = va;
+
+	return 0;
+}
+
+static int rcar_rproc_mem_release(struct rproc *rproc,
+				   struct rproc_mem_entry *mem)
+{
+	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
+	iounmap(mem->va);
+
+	return 0;
+}
+
+static int rcar_rproc_prepare(struct rproc *rproc)
+{
+	struct device *dev = rproc->dev.parent;
+	struct device_node *np = dev->of_node;
+	struct of_phandle_iterator it;
+	struct rproc_mem_entry *mem;
+	struct reserved_mem *rmem;
+	u64 da;
+
+	/* Register associated reserved memory regions */
+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
+	while (of_phandle_iterator_next(&it) == 0) {
+
+		rmem = of_reserved_mem_lookup(it.node);
+		if (!rmem) {
+			dev_err(&rproc->dev,
+				"unable to acquire memory-region\n");
+			return -EINVAL;
+		}
+
+		/* No need to translate pa to da, R-Car use same map */
+		da = rmem->base;
+
+		mem = rproc_mem_entry_init(dev, NULL,
+					   (dma_addr_t)rmem->base,
+					   rmem->size, da,
+					   rcar_rproc_mem_alloc,
+					   rcar_rproc_mem_release,
+					   it.node->name);
+
+		if (!mem)
+			return -ENOMEM;
+
+		rproc_add_carveout(rproc, mem);
+	}
+
+	return 0;
+}
+
+static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret)
+		dev_info(&rproc->dev, "No resource table in elf\n");
+
+	return 0;
+}
+
+static int rcar_rproc_start(struct rproc *rproc)
+{
+	struct rcar_rproc *priv = rproc->priv;
+	int err;
+
+	if (!rproc->bootaddr)
+		return -EINVAL;
+
+	err = rcar_rst_set_rproc_boot_addr(rproc->bootaddr);
+	if (err) {
+		dev_err(&rproc->dev, "failed to set rproc boot addr\n");
+		return err;
+	}
+
+	err = reset_control_deassert(priv->rst);
+	if (err)
+		dev_err(&rproc->dev, "failed to deassert reset\n");
+
+	return err;
+}
+
+static int rcar_rproc_stop(struct rproc *rproc)
+{
+	struct rcar_rproc *priv = rproc->priv;
+	int err;
+
+	err = reset_control_assert(priv->rst);
+	if (err)
+		dev_err(&rproc->dev, "failed to assert reset\n");
+
+	return err;
+}
+
+static struct rproc_ops rcar_rproc_ops = {
+	.prepare	= rcar_rproc_prepare,
+	.start		= rcar_rproc_start,
+	.stop		= rcar_rproc_stop,
+	.load		= rproc_elf_load_segments,
+	.parse_fw	= rcar_rproc_parse_fw,
+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.sanity_check	= rproc_elf_sanity_check,
+	.get_boot_addr	= rproc_elf_get_boot_addr,
+
+};
+
+static int rcar_rproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct rcar_rproc *priv;
+	struct rproc *rproc;
+	int ret;
+
+	rproc = rproc_alloc(dev, np->name, &rcar_rproc_ops,
+			    NULL, sizeof(*priv));
+	if (!rproc)
+		return -ENOMEM;
+
+	priv = rproc->priv;
+
+	priv->rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->rst)) {
+		ret = PTR_ERR(priv->rst);
+		dev_err(dev, "fail to acquire rproc reset\n");
+		goto free_rproc;
+	}
+
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret) {
+		dev_err(dev, "failed to power up\n");
+		goto free_rproc;
+	}
+
+	dev_set_drvdata(dev, rproc);
+
+	/* Manually start the rproc */
+	rproc->auto_boot = false;
+
+	ret = rproc_add(rproc);
+	if (ret) {
+		dev_err(dev, "rproc_add failed\n");
+		goto pm_disable;
+	}
+
+	return 0;
+
+pm_disable:
+	pm_runtime_disable(dev);
+free_rproc:
+	rproc_free(rproc);
+
+	return ret;
+}
+
+static int rcar_rproc_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rproc *rproc = platform_get_drvdata(pdev);
+
+	rproc_del(rproc);
+	pm_runtime_disable(dev);
+	rproc_free(rproc);
+
+	return 0;
+}
+
+static const struct of_device_id rcar_rproc_of_match[] = {
+	{ .compatible = "renesas,rcar-cr7" },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, rcar_rproc_of_match);
+
+static struct platform_driver rcar_rproc_driver = {
+	.probe = rcar_rproc_probe,
+	.remove = rcar_rproc_remove,
+	.driver = {
+		.name = "rcar-rproc",
+		.of_match_table = rcar_rproc_of_match,
+	},
+};
+
+module_platform_driver(rcar_rproc_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Renesas Gen3 R-Car remote processor control driver");
+MODULE_AUTHOR("Julien Massot <julien.massot@iot.bzh>");
-- 
2.33.1


