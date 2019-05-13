Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C04E21B526
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 13:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbfEMLkD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 07:40:03 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56606 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbfEMLkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 07:40:03 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BD03A25AD63;
        Mon, 13 May 2019 21:39:58 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id A3119E2232E; Mon, 13 May 2019 13:39:56 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2] dmaengine: sudmac: remove unused driver
Date:   Mon, 13 May 2019 13:39:51 +0200
Message-Id: <20190513113951.14817-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SUDMAC driver was introduced in v3.10 but was never integrated for use
by any platform. As it is unused remove it.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2
* Update changelog
* Add Shimoda-san's Ack
---
 drivers/dma/sh/Kconfig  |   6 -
 drivers/dma/sh/Makefile |   1 -
 drivers/dma/sh/sudmac.c | 414 ------------------------------------------------
 include/linux/sudmac.h  |  52 ------
 4 files changed, 473 deletions(-)
 delete mode 100644 drivers/dma/sh/sudmac.c
 delete mode 100644 include/linux/sudmac.h

diff --git a/drivers/dma/sh/Kconfig b/drivers/dma/sh/Kconfig
index 4d6b02b3b1f1..54d5d0369d3c 100644
--- a/drivers/dma/sh/Kconfig
+++ b/drivers/dma/sh/Kconfig
@@ -47,9 +47,3 @@ config RENESAS_USB_DMAC
 	help
 	  This driver supports the USB-DMA controller found in the Renesas
 	  SoCs.
-
-config SUDMAC
-	tristate "Renesas SUDMAC support"
-	depends on SH_DMAE_BASE
-	help
-	  Enable support for the Renesas SUDMAC controllers.
diff --git a/drivers/dma/sh/Makefile b/drivers/dma/sh/Makefile
index 42110dd57a56..112fbd22bb3f 100644
--- a/drivers/dma/sh/Makefile
+++ b/drivers/dma/sh/Makefile
@@ -15,4 +15,3 @@ obj-$(CONFIG_SH_DMAE) += shdma.o
 
 obj-$(CONFIG_RCAR_DMAC) += rcar-dmac.o
 obj-$(CONFIG_RENESAS_USB_DMAC) += usb-dmac.o
-obj-$(CONFIG_SUDMAC) += sudmac.o
diff --git a/drivers/dma/sh/sudmac.c b/drivers/dma/sh/sudmac.c
deleted file mode 100644
index 30cc3553cb8b..000000000000
--- a/drivers/dma/sh/sudmac.c
+++ /dev/null
@@ -1,414 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Renesas SUDMAC support
- *
- * Copyright (C) 2013 Renesas Solutions Corp.
- *
- * based on drivers/dma/sh/shdma.c:
- * Copyright (C) 2011-2012 Guennadi Liakhovetski <g.liakhovetski@gmx.de>
- * Copyright (C) 2009 Nobuhiro Iwamatsu <iwamatsu.nobuhiro@renesas.com>
- * Copyright (C) 2009 Renesas Solutions, Inc. All rights reserved.
- * Copyright (C) 2007 Freescale Semiconductor, Inc. All rights reserved.
- */
-
-#include <linux/dmaengine.h>
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/sudmac.h>
-
-struct sudmac_chan {
-	struct shdma_chan shdma_chan;
-	void __iomem *base;
-	char dev_id[16];	/* unique name per DMAC of channel */
-
-	u32 offset;		/* for CFG, BA, BBC, CA, CBC, DEN */
-	u32 cfg;
-	u32 dint_end_bit;
-};
-
-struct sudmac_device {
-	struct shdma_dev shdma_dev;
-	struct sudmac_pdata *pdata;
-	void __iomem *chan_reg;
-};
-
-struct sudmac_regs {
-	u32 base_addr;
-	u32 base_byte_count;
-};
-
-struct sudmac_desc {
-	struct sudmac_regs hw;
-	struct shdma_desc shdma_desc;
-};
-
-#define to_chan(schan) container_of(schan, struct sudmac_chan, shdma_chan)
-#define to_desc(sdesc) container_of(sdesc, struct sudmac_desc, shdma_desc)
-#define to_sdev(sc) container_of(sc->shdma_chan.dma_chan.device, \
-				 struct sudmac_device, shdma_dev.dma_dev)
-
-/* SUDMAC register */
-#define SUDMAC_CH0CFG		0x00
-#define SUDMAC_CH0BA		0x10
-#define SUDMAC_CH0BBC		0x18
-#define SUDMAC_CH0CA		0x20
-#define SUDMAC_CH0CBC		0x28
-#define SUDMAC_CH0DEN		0x30
-#define SUDMAC_DSTSCLR		0x38
-#define SUDMAC_DBUFCTRL		0x3C
-#define SUDMAC_DINTCTRL		0x40
-#define SUDMAC_DINTSTS		0x44
-#define SUDMAC_DINTSTSCLR	0x48
-#define SUDMAC_CH0SHCTRL	0x50
-
-/* Definitions for the sudmac_channel.config */
-#define SUDMAC_SENDBUFM	0x1000 /* b12: Transmit Buffer Mode */
-#define SUDMAC_RCVENDM	0x0100 /* b8: Receive Data Transfer End Mode */
-#define SUDMAC_LBA_WAIT	0x0030 /* b5-4: Local Bus Access Wait */
-
-/* Definitions for the sudmac_channel.dint_end_bit */
-#define SUDMAC_CH1ENDE	0x0002 /* b1: Ch1 DMA Transfer End Int Enable */
-#define SUDMAC_CH0ENDE	0x0001 /* b0: Ch0 DMA Transfer End Int Enable */
-
-#define SUDMAC_DRV_NAME "sudmac"
-
-static void sudmac_writel(struct sudmac_chan *sc, u32 data, u32 reg)
-{
-	iowrite32(data, sc->base + reg);
-}
-
-static u32 sudmac_readl(struct sudmac_chan *sc, u32 reg)
-{
-	return ioread32(sc->base + reg);
-}
-
-static bool sudmac_is_busy(struct sudmac_chan *sc)
-{
-	u32 den = sudmac_readl(sc, SUDMAC_CH0DEN + sc->offset);
-
-	if (den)
-		return true; /* working */
-
-	return false; /* waiting */
-}
-
-static void sudmac_set_reg(struct sudmac_chan *sc, struct sudmac_regs *hw,
-			   struct shdma_desc *sdesc)
-{
-	sudmac_writel(sc, sc->cfg, SUDMAC_CH0CFG + sc->offset);
-	sudmac_writel(sc, hw->base_addr, SUDMAC_CH0BA + sc->offset);
-	sudmac_writel(sc, hw->base_byte_count, SUDMAC_CH0BBC + sc->offset);
-}
-
-static void sudmac_start(struct sudmac_chan *sc)
-{
-	u32 dintctrl = sudmac_readl(sc, SUDMAC_DINTCTRL);
-
-	sudmac_writel(sc, dintctrl | sc->dint_end_bit, SUDMAC_DINTCTRL);
-	sudmac_writel(sc, 1, SUDMAC_CH0DEN + sc->offset);
-}
-
-static void sudmac_start_xfer(struct shdma_chan *schan,
-			      struct shdma_desc *sdesc)
-{
-	struct sudmac_chan *sc = to_chan(schan);
-	struct sudmac_desc *sd = to_desc(sdesc);
-
-	sudmac_set_reg(sc, &sd->hw, sdesc);
-	sudmac_start(sc);
-}
-
-static bool sudmac_channel_busy(struct shdma_chan *schan)
-{
-	struct sudmac_chan *sc = to_chan(schan);
-
-	return sudmac_is_busy(sc);
-}
-
-static void sudmac_setup_xfer(struct shdma_chan *schan, int slave_id)
-{
-}
-
-static const struct sudmac_slave_config *sudmac_find_slave(
-	struct sudmac_chan *sc, int slave_id)
-{
-	struct sudmac_device *sdev = to_sdev(sc);
-	struct sudmac_pdata *pdata = sdev->pdata;
-	const struct sudmac_slave_config *cfg;
-	int i;
-
-	for (i = 0, cfg = pdata->slave; i < pdata->slave_num; i++, cfg++)
-		if (cfg->slave_id == slave_id)
-			return cfg;
-
-	return NULL;
-}
-
-static int sudmac_set_slave(struct shdma_chan *schan, int slave_id,
-			    dma_addr_t slave_addr, bool try)
-{
-	struct sudmac_chan *sc = to_chan(schan);
-	const struct sudmac_slave_config *cfg = sudmac_find_slave(sc, slave_id);
-
-	if (!cfg)
-		return -ENODEV;
-
-	return 0;
-}
-
-static inline void sudmac_dma_halt(struct sudmac_chan *sc)
-{
-	u32 dintctrl = sudmac_readl(sc, SUDMAC_DINTCTRL);
-
-	sudmac_writel(sc, 0, SUDMAC_CH0DEN + sc->offset);
-	sudmac_writel(sc, dintctrl & ~sc->dint_end_bit, SUDMAC_DINTCTRL);
-	sudmac_writel(sc, sc->dint_end_bit, SUDMAC_DINTSTSCLR);
-}
-
-static int sudmac_desc_setup(struct shdma_chan *schan,
-			     struct shdma_desc *sdesc,
-			     dma_addr_t src, dma_addr_t dst, size_t *len)
-{
-	struct sudmac_chan *sc = to_chan(schan);
-	struct sudmac_desc *sd = to_desc(sdesc);
-
-	dev_dbg(sc->shdma_chan.dev, "%s: src=%pad, dst=%pad, len=%zu\n",
-		__func__, &src, &dst, *len);
-
-	if (*len > schan->max_xfer_len)
-		*len = schan->max_xfer_len;
-
-	if (dst)
-		sd->hw.base_addr = dst;
-	else if (src)
-		sd->hw.base_addr = src;
-	sd->hw.base_byte_count = *len;
-
-	return 0;
-}
-
-static void sudmac_halt(struct shdma_chan *schan)
-{
-	struct sudmac_chan *sc = to_chan(schan);
-
-	sudmac_dma_halt(sc);
-}
-
-static bool sudmac_chan_irq(struct shdma_chan *schan, int irq)
-{
-	struct sudmac_chan *sc = to_chan(schan);
-	u32 dintsts = sudmac_readl(sc, SUDMAC_DINTSTS);
-
-	if (!(dintsts & sc->dint_end_bit))
-		return false;
-
-	/* DMA stop */
-	sudmac_dma_halt(sc);
-
-	return true;
-}
-
-static size_t sudmac_get_partial(struct shdma_chan *schan,
-				 struct shdma_desc *sdesc)
-{
-	struct sudmac_chan *sc = to_chan(schan);
-	struct sudmac_desc *sd = to_desc(sdesc);
-	u32 current_byte_count = sudmac_readl(sc, SUDMAC_CH0CBC + sc->offset);
-
-	return sd->hw.base_byte_count - current_byte_count;
-}
-
-static bool sudmac_desc_completed(struct shdma_chan *schan,
-				  struct shdma_desc *sdesc)
-{
-	struct sudmac_chan *sc = to_chan(schan);
-	struct sudmac_desc *sd = to_desc(sdesc);
-	u32 current_addr = sudmac_readl(sc, SUDMAC_CH0CA + sc->offset);
-
-	return sd->hw.base_addr + sd->hw.base_byte_count == current_addr;
-}
-
-static int sudmac_chan_probe(struct sudmac_device *su_dev, int id, int irq,
-			     unsigned long flags)
-{
-	struct shdma_dev *sdev = &su_dev->shdma_dev;
-	struct platform_device *pdev = to_platform_device(sdev->dma_dev.dev);
-	struct sudmac_chan *sc;
-	struct shdma_chan *schan;
-	int err;
-
-	sc = devm_kzalloc(&pdev->dev, sizeof(struct sudmac_chan), GFP_KERNEL);
-	if (!sc)
-		return -ENOMEM;
-
-	schan = &sc->shdma_chan;
-	schan->max_xfer_len = 64 * 1024 * 1024 - 1;
-
-	shdma_chan_probe(sdev, schan, id);
-
-	sc->base = su_dev->chan_reg;
-
-	/* get platform_data */
-	sc->offset = su_dev->pdata->channel->offset;
-	if (su_dev->pdata->channel->config & SUDMAC_TX_BUFFER_MODE)
-		sc->cfg |= SUDMAC_SENDBUFM;
-	if (su_dev->pdata->channel->config & SUDMAC_RX_END_MODE)
-		sc->cfg |= SUDMAC_RCVENDM;
-	sc->cfg |= (su_dev->pdata->channel->wait << 4) & SUDMAC_LBA_WAIT;
-
-	if (su_dev->pdata->channel->dint_end_bit & SUDMAC_DMA_BIT_CH0)
-		sc->dint_end_bit |= SUDMAC_CH0ENDE;
-	if (su_dev->pdata->channel->dint_end_bit & SUDMAC_DMA_BIT_CH1)
-		sc->dint_end_bit |= SUDMAC_CH1ENDE;
-
-	/* set up channel irq */
-	if (pdev->id >= 0)
-		snprintf(sc->dev_id, sizeof(sc->dev_id), "sudmac%d.%d",
-			 pdev->id, id);
-	else
-		snprintf(sc->dev_id, sizeof(sc->dev_id), "sudmac%d", id);
-
-	err = shdma_request_irq(schan, irq, flags, sc->dev_id);
-	if (err) {
-		dev_err(sdev->dma_dev.dev,
-			"DMA channel %d request_irq failed %d\n", id, err);
-		goto err_no_irq;
-	}
-
-	return 0;
-
-err_no_irq:
-	/* remove from dmaengine device node */
-	shdma_chan_remove(schan);
-	return err;
-}
-
-static void sudmac_chan_remove(struct sudmac_device *su_dev)
-{
-	struct shdma_chan *schan;
-	int i;
-
-	shdma_for_each_chan(schan, &su_dev->shdma_dev, i) {
-		BUG_ON(!schan);
-
-		shdma_chan_remove(schan);
-	}
-}
-
-static dma_addr_t sudmac_slave_addr(struct shdma_chan *schan)
-{
-	/* SUDMAC doesn't need the address */
-	return 0;
-}
-
-static struct shdma_desc *sudmac_embedded_desc(void *buf, int i)
-{
-	return &((struct sudmac_desc *)buf)[i].shdma_desc;
-}
-
-static const struct shdma_ops sudmac_shdma_ops = {
-	.desc_completed = sudmac_desc_completed,
-	.halt_channel = sudmac_halt,
-	.channel_busy = sudmac_channel_busy,
-	.slave_addr = sudmac_slave_addr,
-	.desc_setup = sudmac_desc_setup,
-	.set_slave = sudmac_set_slave,
-	.setup_xfer = sudmac_setup_xfer,
-	.start_xfer = sudmac_start_xfer,
-	.embedded_desc = sudmac_embedded_desc,
-	.chan_irq = sudmac_chan_irq,
-	.get_partial = sudmac_get_partial,
-};
-
-static int sudmac_probe(struct platform_device *pdev)
-{
-	struct sudmac_pdata *pdata = dev_get_platdata(&pdev->dev);
-	int err, i;
-	struct sudmac_device *su_dev;
-	struct dma_device *dma_dev;
-	struct resource *chan, *irq_res;
-
-	/* get platform data */
-	if (!pdata)
-		return -ENODEV;
-
-	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!irq_res)
-		return -ENODEV;
-
-	err = -ENOMEM;
-	su_dev = devm_kzalloc(&pdev->dev, sizeof(struct sudmac_device),
-			      GFP_KERNEL);
-	if (!su_dev)
-		return err;
-
-	dma_dev = &su_dev->shdma_dev.dma_dev;
-
-	chan = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	su_dev->chan_reg = devm_ioremap_resource(&pdev->dev, chan);
-	if (IS_ERR(su_dev->chan_reg))
-		return PTR_ERR(su_dev->chan_reg);
-
-	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
-
-	su_dev->shdma_dev.ops = &sudmac_shdma_ops;
-	su_dev->shdma_dev.desc_size = sizeof(struct sudmac_desc);
-	err = shdma_init(&pdev->dev, &su_dev->shdma_dev, pdata->channel_num);
-	if (err < 0)
-		return err;
-
-	/* platform data */
-	su_dev->pdata = dev_get_platdata(&pdev->dev);
-
-	platform_set_drvdata(pdev, su_dev);
-
-	/* Create DMA Channel */
-	for (i = 0; i < pdata->channel_num; i++) {
-		err = sudmac_chan_probe(su_dev, i, irq_res->start, IRQF_SHARED);
-		if (err)
-			goto chan_probe_err;
-	}
-
-	err = dma_async_device_register(&su_dev->shdma_dev.dma_dev);
-	if (err < 0)
-		goto chan_probe_err;
-
-	return err;
-
-chan_probe_err:
-	sudmac_chan_remove(su_dev);
-
-	shdma_cleanup(&su_dev->shdma_dev);
-
-	return err;
-}
-
-static int sudmac_remove(struct platform_device *pdev)
-{
-	struct sudmac_device *su_dev = platform_get_drvdata(pdev);
-	struct dma_device *dma_dev = &su_dev->shdma_dev.dma_dev;
-
-	dma_async_device_unregister(dma_dev);
-	sudmac_chan_remove(su_dev);
-	shdma_cleanup(&su_dev->shdma_dev);
-
-	return 0;
-}
-
-static struct platform_driver sudmac_driver = {
-	.driver		= {
-		.name	= SUDMAC_DRV_NAME,
-	},
-	.probe		= sudmac_probe,
-	.remove		= sudmac_remove,
-};
-module_platform_driver(sudmac_driver);
-
-MODULE_AUTHOR("Yoshihiro Shimoda");
-MODULE_DESCRIPTION("Renesas SUDMAC driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" SUDMAC_DRV_NAME);
diff --git a/include/linux/sudmac.h b/include/linux/sudmac.h
deleted file mode 100644
index 377b8a5788fa..000000000000
--- a/include/linux/sudmac.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/*
- * Header for the SUDMAC driver
- *
- * Copyright (C) 2013 Renesas Solutions Corp.
- *
- * This is free software; you can redistribute it and/or modify
- * it under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- */
-#ifndef SUDMAC_H
-#define SUDMAC_H
-
-#include <linux/dmaengine.h>
-#include <linux/shdma-base.h>
-#include <linux/types.h>
-
-/* Used by slave DMA clients to request DMA to/from a specific peripheral */
-struct sudmac_slave {
-	struct shdma_slave	shdma_slave;	/* Set by the platform */
-};
-
-/*
- * Supplied by platforms to specify, how a DMA channel has to be configured for
- * a certain peripheral
- */
-struct sudmac_slave_config {
-	int		slave_id;
-};
-
-struct sudmac_channel {
-	unsigned long	offset;
-	unsigned long	config;
-	unsigned long	wait;		/* The configuable range is 0 to 3 */
-	unsigned long	dint_end_bit;
-};
-
-struct sudmac_pdata {
-	const struct sudmac_slave_config *slave;
-	int slave_num;
-	const struct sudmac_channel *channel;
-	int channel_num;
-};
-
-/* Definitions for the sudmac_channel.config */
-#define SUDMAC_TX_BUFFER_MODE	BIT(0)
-#define SUDMAC_RX_END_MODE	BIT(1)
-
-/* Definitions for the sudmac_channel.dint_end_bit */
-#define SUDMAC_DMA_BIT_CH0	BIT(0)
-#define SUDMAC_DMA_BIT_CH1	BIT(1)
-
-#endif
-- 
2.11.0

