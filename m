Return-Path: <linux-renesas-soc+bounces-17843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1EACE0CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 16:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E1F118925AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 14:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91AE290DBE;
	Wed,  4 Jun 2025 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="rUpDn5NZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37CB290D97;
	Wed,  4 Jun 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048919; cv=none; b=tXkUyd0QU05k6X+UuZ2YUkT9Qr46nUeYEqIf1jtjgktgsWCgjODCmJ2/R+ZB5BiRduWJwVUWHC06trRub4gayoIlR6PkDP/Rggw36RWxMZJcAqHBBS9tqBcdmjhNLPK1+iZoB7Dav3eBkIKMqBBo7iaXDp1ZB38QIXj1od72Q1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048919; c=relaxed/simple;
	bh=NhGFUDv6D87MHMLVuL4MRgRlix6SihdCA88jAG2FKa0=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:MIME-Version:
	 Subject; b=dZ+tG9VmDac7+yjKhCua6dstBsQeGWF1stOR1de6D9YPiCUQ8oAfssf3r1AmyyD4JEc1xpA5wO96u4zMp9K9cZ1DgNYQdPG25q5DHQMGSpcehPhXon1jpN95g4rEPnsNBMrDrW7vSnP5S5RIdh07TKNYAFOPB9cbXIzuMrq5eGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=rUpDn5NZ; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=T1qxi96MR9mLatKjXCyyUyshX+pISOQXncDo6ySYJrc=; b=rUpDn5NZbJE+n9wg0QXC9OOhp+
	EWPIqGVaI32sunQMr/bI83/oPiYffbIL+63l1ejCPkEFj92hkMeg0zAe05Vsd0coSP3fXB/HWne4m
	Gv6bE55dqoOZZB10qyDC7fEokpQZI+gfF7VNgXblM99VSAdy1y6tLvabN47K8u8yE5sw=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:60436 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uMpWI-0000LY-Iv; Wed, 04 Jun 2025 10:55:11 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: biju.das.jz@bp.renesas.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hugo@hugovil.com,
	chris.brandt@renesas.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Wed,  4 Jun 2025 10:53:06 -0400
Message-Id: <20250604145306.1170676-2-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604145306.1170676-1-hugo@hugovil.com>
References: <20250604145306.1170676-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH v4 1/1] drm: renesas: rz-du: Implement MIPI DSI host transfers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add support for sending MIPI DSI command packets from the host to a
peripheral. This is required for panels that need configuration before
they accept video data.

Also for long reads to work properly, set DCS maximum return packet size
to the value of the DMA buffer size.

Based on Renesas Linux kernel v5.10 repos [1].

Link: https://github.com/renesas-rz/rz_linux-cip.git
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
 2 files changed, 240 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 91e1a9adad7d6..50ec109aa6ed3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -4,8 +4,11 @@
  *
  * Copyright (C) 2022 Renesas Electronics Corporation
  */
+
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -23,9 +26,12 @@
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <video/mipi_display.h>
 
 #include "rzg2l_mipi_dsi_regs.h"
 
+#define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
+
 struct rzg2l_mipi_dsi {
 	struct device *dev;
 	void __iomem *mmio;
@@ -44,6 +50,10 @@ struct rzg2l_mipi_dsi {
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+
+	/* DCS buffer pointers when using external memory. */
+	dma_addr_t dcs_buf_phys;
+	u8 *dcs_buf_virt;
 };
 
 static inline struct rzg2l_mipi_dsi *
@@ -267,6 +277,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	u32 clkbfht;
 	u32 clkstpt;
 	u32 golpbkt;
+	u32 dsisetr;
 	int ret;
 
 	/*
@@ -328,6 +339,15 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	lptrnstsetr = LPTRNSTSETR_GOLPBKT(golpbkt);
 	rzg2l_mipi_dsi_link_write(dsi, LPTRNSTSETR, lptrnstsetr);
 
+	/*
+	 * Increase MRPSZ as the default value of 1 will result in long read
+	 * commands payload not being saved to memory.
+	 */
+	dsisetr = rzg2l_mipi_dsi_link_read(dsi, DSISETR);
+	dsisetr &= ~DSISETR_MRPSZ;
+	dsisetr |= FIELD_PREP(DSISETR_MRPSZ, RZG2L_DCS_BUF_SIZE);
+	rzg2l_mipi_dsi_link_write(dsi, DSISETR, dsisetr);
+
 	return 0;
 
 err_phy:
@@ -659,9 +679,168 @@ static int rzg2l_mipi_dsi_host_detach(struct mipi_dsi_host *host,
 	return 0;
 }
 
+static ssize_t rzg2l_mipi_dsi_read_response(struct rzg2l_mipi_dsi *dsi,
+					    const struct mipi_dsi_msg *msg)
+{
+	u8 *msg_rx = msg->rx_buf;
+	u8 datatype;
+	u32 result;
+	u16 size;
+
+	result = rzg2l_mipi_dsi_link_read(dsi, RXRSS0R);
+	if (result & RXRSS0R_RXPKTDFAIL) {
+		dev_err(dsi->dev, "packet rx data did not save correctly\n");
+		return -EPROTO;
+	}
+
+	if (result & RXRSS0R_RXFAIL) {
+		dev_err(dsi->dev, "packet rx failure\n");
+		return -EPROTO;
+	}
+
+	if (!(result & RXRSS0R_RXSUC))
+		return -EPROTO;
+
+	datatype = FIELD_GET(RXRSS0R_DT, result);
+
+	switch (datatype) {
+	case 0:
+		dev_dbg(dsi->dev, "ACK\n");
+		return 0;
+	case MIPI_DSI_RX_END_OF_TRANSMISSION:
+		dev_dbg(dsi->dev, "EoTp\n");
+		return 0;
+	case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
+		dev_dbg(dsi->dev, "Acknowledge and error report: $%02x%02x\n",
+			(u8)FIELD_GET(RXRSS0R_DATA1, result),
+			(u8)FIELD_GET(RXRSS0R_DATA0, result));
+		return 0;
+	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_1BYTE:
+	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_1BYTE:
+		msg_rx[0] = FIELD_GET(RXRSS0R_DATA0, result);
+		return 1;
+	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_2BYTE:
+	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
+		msg_rx[0] = FIELD_GET(RXRSS0R_DATA0, result);
+		msg_rx[1] = FIELD_GET(RXRSS0R_DATA1, result);
+		return 2;
+	case MIPI_DSI_RX_GENERIC_LONG_READ_RESPONSE:
+	case MIPI_DSI_RX_DCS_LONG_READ_RESPONSE:
+		size = FIELD_GET(RXRSS0R_WC, result);
+
+		if (size > msg->rx_len) {
+			dev_err(dsi->dev, "rx buffer too small");
+			return -ENOSPC;
+		}
+
+		memcpy(msg_rx, dsi->dcs_buf_virt, size);
+		return size;
+	default:
+		dev_err(dsi->dev, "unhandled response type: %02x\n", datatype);
+		return -EPROTO;
+	}
+}
+
+static ssize_t rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
+					    const struct mipi_dsi_msg *msg)
+{
+	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
+	struct mipi_dsi_packet packet;
+	bool need_bta;
+	u32 value;
+	int ret;
+
+	ret = mipi_dsi_create_packet(&packet, msg);
+	if (ret < 0)
+		return ret;
+
+	/* Terminate operation after this descriptor is finished */
+	value = SQCH0DSC0AR_NXACT_TERM;
+
+	if (msg->flags & MIPI_DSI_MSG_REQ_ACK) {
+		need_bta = true; /* Message with explicitly requested ACK */
+		value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NON_READ);
+	} else if (msg->rx_buf && msg->rx_len > 0) {
+		need_bta = true; /* Read request */
+		value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_READ);
+	} else {
+		need_bta = false;
+		value |= FIELD_PREP(SQCH0DSC0AR_BTA, SQCH0DSC0AR_BTA_NONE);
+	}
+
+	/* Set transmission speed */
+	if (msg->flags & MIPI_DSI_MSG_USE_LPM)
+		value |= SQCH0DSC0AR_SPD_LOW;
+	else
+		value |= SQCH0DSC0AR_SPD_HIGH;
+
+	/* Write TX packet header */
+	value |= FIELD_PREP(SQCH0DSC0AR_DT, packet.header[0]) |
+		FIELD_PREP(SQCH0DSC0AR_DATA0, packet.header[1]) |
+		FIELD_PREP(SQCH0DSC0AR_DATA1, packet.header[2]);
+
+	if (mipi_dsi_packet_format_is_long(msg->type)) {
+		value |= SQCH0DSC0AR_FMT_LONG;
+
+		if (packet.payload_length > RZG2L_DCS_BUF_SIZE) {
+			dev_err(dsi->dev, "Packet Tx payload size (%d) too large",
+				(unsigned int)packet.payload_length);
+			return -ENOSPC;
+		}
+
+		/* Copy TX packet payload data to memory space */
+		memcpy(dsi->dcs_buf_virt, packet.payload, packet.payload_length);
+	} else {
+		value |= SQCH0DSC0AR_FMT_SHORT;
+	}
+
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);
+
+	/*
+	 * Write: specify payload data source location, only used for
+	 *        long packet.
+	 * Read:  specify payload data storage location of response
+	 *        packet. Note: a read packet is always a short packet.
+	 *        If the response packet is a short packet or a long packet
+	 *        with WC = 0 (no payload), DTSEL is meaningless.
+	 */
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0BR, SQCH0DSC0BR_DTSEL_MEM_SPACE);
+
+	/*
+	 * Set SQCHxSR.AACTFIN bit when descriptor actions are finished.
+	 * Read: set Rx result save slot number to 0 (ACTCODE).
+	 */
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0CR, SQCH0DSC0CR_FINACT);
+
+	/* Set rx/tx payload data address, only relevant for long packet. */
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0DR, (u32)dsi->dcs_buf_phys);
+
+	/* Start sequence 0 operation */
+	value = rzg2l_mipi_dsi_link_read(dsi, SQCH0SET0R);
+	value |= SQCH0SET0R_START;
+	rzg2l_mipi_dsi_link_write(dsi, SQCH0SET0R, value);
+
+	/* Wait for operation to finish */
+	ret = read_poll_timeout(rzg2l_mipi_dsi_link_read,
+				value, value & SQCH0SR_ADESFIN,
+				2000, 20000, false, dsi, SQCH0SR);
+	if (ret == 0) {
+		/* Success: clear status bit */
+		rzg2l_mipi_dsi_link_write(dsi, SQCH0SCR, SQCH0SCR_ADESFIN);
+
+		if (need_bta)
+			ret = rzg2l_mipi_dsi_read_response(dsi, msg);
+		else
+			ret = packet.payload_length;
+	}
+
+	return ret;
+}
+
 static const struct mipi_dsi_host_ops rzg2l_mipi_dsi_host_ops = {
 	.attach = rzg2l_mipi_dsi_host_attach,
 	.detach = rzg2l_mipi_dsi_host_detach,
+	.transfer = rzg2l_mipi_dsi_host_transfer,
 };
 
 /* -----------------------------------------------------------------------------
@@ -779,6 +958,11 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_pm_disable;
 
+	dsi->dcs_buf_virt = dma_alloc_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE,
+					       &dsi->dcs_buf_phys, GFP_KERNEL);
+	if (!dsi->dcs_buf_virt)
+		return -ENOMEM;
+
 	return 0;
 
 err_phy:
@@ -793,6 +977,8 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 {
 	struct rzg2l_mipi_dsi *dsi = platform_get_drvdata(pdev);
 
+	dma_free_coherent(dsi->host.dev, RZG2L_DCS_BUF_SIZE, dsi->dcs_buf_virt,
+			  dsi->dcs_buf_phys);
 	mipi_dsi_host_unregister(&dsi->host);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 1dbc16ec64a4b..26d8a37ee6351 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -81,6 +81,20 @@
 #define RSTSR_SWRSTLP			(1 << 1)
 #define RSTSR_SWRSTHS			(1 << 0)
 
+/* DSI Set Register */
+#define DSISETR				0x120
+#define DSISETR_MRPSZ			GENMASK(15, 0)
+
+/* Rx Result Save Slot 0 Register */
+#define RXRSS0R				0x240
+#define RXRSS0R_RXPKTDFAIL		BIT(28)
+#define RXRSS0R_RXFAIL			BIT(27)
+#define RXRSS0R_RXSUC			BIT(25)
+#define RXRSS0R_DT			GENMASK(21, 16)
+#define RXRSS0R_DATA1			GENMASK(15, 8)
+#define RXRSS0R_DATA0			GENMASK(7, 0)
+#define RXRSS0R_WC			GENMASK(15, 0) /* Word count for long packet. */
+
 /* Clock Lane Stop Time Set Register */
 #define CLSTPTSETR			0x314
 #define CLSTPTSETR_CLKKPT(x)		((x) << 24)
@@ -148,4 +162,44 @@
 #define VICH1HPSETR_HFP(x)		(((x) & 0x1fff) << 16)
 #define VICH1HPSETR_HBP(x)		(((x) & 0x1fff) << 0)
 
+/* Sequence Channel 0 Set 0 Register */
+#define SQCH0SET0R			0x5c0
+#define SQCH0SET0R_START		BIT(0)
+
+/* Sequence Channel 0 Status Register */
+#define SQCH0SR				0x5d0
+#define SQCH0SR_ADESFIN			BIT(8)
+
+/* Sequence Channel 0 Status Clear Register */
+#define SQCH0SCR			0x5d4
+#define SQCH0SCR_ADESFIN		BIT(8)
+
+/* Sequence Channel 0 Descriptor 0-A Register */
+#define SQCH0DSC0AR			0x780
+#define SQCH0DSC0AR_NXACT_TERM		0	/* Bit 28 */
+#define SQCH0DSC0AR_BTA			GENMASK(27, 26)
+#define SQCH0DSC0AR_BTA_NONE		0
+#define SQCH0DSC0AR_BTA_NON_READ	1
+#define SQCH0DSC0AR_BTA_READ		2
+#define SQCH0DSC0AR_BTA_ONLY		3
+#define SQCH0DSC0AR_SPD_HIGH		0
+#define SQCH0DSC0AR_SPD_LOW		BIT(25)
+#define SQCH0DSC0AR_FMT_SHORT		0
+#define SQCH0DSC0AR_FMT_LONG		BIT(24)
+#define SQCH0DSC0AR_DT			GENMASK(21, 16)
+#define SQCH0DSC0AR_DATA1		GENMASK(15, 8)
+#define SQCH0DSC0AR_DATA0		GENMASK(7, 0)
+
+/* Sequence Channel 0 Descriptor 0-B Register */
+#define SQCH0DSC0BR			0x784
+#define SQCH0DSC0BR_DTSEL_MEM_SPACE	BIT(24)	/* Use external memory */
+
+/* Sequence Channel 0 Descriptor 0-C Register */
+#define SQCH0DSC0CR			0x788
+#define SQCH0DSC0CR_FINACT		BIT(0)
+#define SQCH0DSC0CR_AUXOP		BIT(22)
+
+/* Sequence Channel 0 Descriptor 0-D Register */
+#define SQCH0DSC0DR			0x78c
+
 #endif /* __RZG2L_MIPI_DSI_REGS_H__ */
-- 
2.39.5


