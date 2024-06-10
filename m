Return-Path: <linux-renesas-soc+bounces-6008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B24190235F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 16:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 492391F27673
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 14:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506A212F38B;
	Mon, 10 Jun 2024 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kR9ZOc2R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V5s7man5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCBB84E1F;
	Mon, 10 Jun 2024 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718028045; cv=none; b=Sm4bZyx3ZPkRyFtoAt54Y2Jw2sl0MhZ1fIHfBHPdZlX9gQekzmTUi/cw99QSKl6TFYT4HrJ58X/VK0PKnejGPquAidUlsxpfyphpyhlBZ3LOCHUdKtxtLdBqguPfTKJfyUQRbshnxXdPM6WmO2wq2hGkoRkI2S6jjedObY8QXUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718028045; c=relaxed/simple;
	bh=pRvYbGPbEzFhFNnTdtg/8C1/yXoiB42rs+MBnbi//ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dgSTQMQ7j7sPblRQGw+goxZ/9Ys/aenVDplBUDc9z+0fWz/SKItXSaWd8QV9QapkqlV7hA7n8hnUJLbU078hiq6kezqsAYkBYzfDDocW0CBTlJbbPkqxmUy+MnXrY2CEbc/PTAbGUW9pSTDOONj60jz1zuYbvhsVgtmN40lu2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kR9ZOc2R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=V5s7man5; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id 6D56D180011C;
	Mon, 10 Jun 2024 10:00:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 10 Jun 2024 10:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1718028038; x=1718114438; bh=uI
	9lHg1fAJ4BjxueOBiwmVvPN/zE8AaRjGa9743FXaA=; b=kR9ZOc2R6WJwr/yP1E
	liUnQeDU1GCBOEwHP8JELCftIeb2Aw1SEkJaXvR/qb3dP63ySsg0nrPQAklG4sD4
	c1AnoGQYtqsH7+rqy5USNdFWQYXUQqPzzwQZAf9yZY21uUDjhvH3JFB32hjqOU/P
	bsqAnfZVb5qUmM3+X1kjPyigf+sIN7k4PJOEnIqgdFlLwAnLM1OgjbTcLVpHsPdM
	UtCjzcbnYhotcLjFfT2RAQvDwzIRcVhUwavpeWplHWACvlAX0onPcqS1ARfxRq8g
	KlQChwnBmF/AuNq05mCVD5CNvDDrKNX/QHczeviK+fBFsDp5ftizSwuBZunZ/mIL
	tsYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1718028038; x=1718114438; bh=uI9lHg1fAJ4Bj
	xueOBiwmVvPN/zE8AaRjGa9743FXaA=; b=V5s7man5FG2Cy9IMgbkQ7z6fAorsO
	u3ZaLF2iDYtAL4XSC9EBu1ZU0Zoqt58rUiQRXjuAwyQn9l4DdzabY6ES4umJ84AB
	7yRsiRTC/BP6xvFwZ4UoPLCO3Od4MQLQkgbFFpHel7I27EK3N6XGIowLjkpgg6Mb
	I4XET4tT+sSLoejjQFcDYNkR/U+ehvuhHOXqahdfczOxo8ZTS5Rnr0ypVLngMAwU
	jBoALdtoYPhYaZqJXLLB17V2mSRMOljkq/4i6XkdYsdNcknSRi0+kvEvVW0spKER
	N+9mxp0YcwoyBQOMbk9FlRryuiPQNDydDcV75mp8GZbrdE/cehnN10wuQ==
X-ME-Sender: <xms:BQdnZqVLEdh_C5m-NMklZ2T4_92RJrWWGTBKni2-g2jBFZbdDlsu3g>
    <xme:BQdnZmmPZaMXxSf_270MOrdVbAdkOxVP-O6mv5C3jSHrRUWfcTmfpbRzMvyzQEdun
    Ctb7EQJyHUROVv-Mdo>
X-ME-Received: <xmr:BQdnZua9QguosvKRumiunW4_0DIqnd0tz55wgt3Y0tvlvrSxN1JABLkGhyw-AHwVz2tLlsyMHAF74GJhlejSxG4F9CxcFgtDu3Tq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:BQdnZhXr8opG4oN60N9CQn4PZW-wvLUW0UMIoTeaZrvU0vbyD3u48g>
    <xmx:BQdnZkm6QpI0orV4HNiaQ4Y7kfZSWkpmlg4w1Q3j7CSkpdoL5h7HKA>
    <xmx:BQdnZmeD-cMGzoHxT2oMv4cyq2pHn_1bwRW0GfPw7YQoEzen93oaTg>
    <xmx:BQdnZmEO3YSeB6aNg1WCcDhoMc9LrN5s8TXHDlykwlYXrTTufGG-XQ>
    <xmx:BgdnZhj7HLCKhiyTorOr0MFIF99iIG_mmE-9Z-r28gP6sPO5u4wIo1Mv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 10:00:35 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v6] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
Date: Mon, 10 Jun 2024 15:59:35 +0200
Message-ID: <20240610135935.2519155-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add initial support for Renesas Ethernet-TSN End-station device of R-Car
V4H. The Ethernet End-station can connect to an Ethernet network using a
10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
Depending on the connected PHY.

The driver supports Rx checksum and offload and hardware timestamps.

While full power management and suspend/resume is not yet supported the
driver enables runtime PM in order to enable the module clock. While
explicit clock management using clk_enable() would suffice for the
supported SoC, the module could be reused on SoCs where the module is
part of a power domain.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v5
- Removed delays depending on phy-mode logic. This is only needed on
  some SoCs (V4H multiple boards), and currently we can't test on them.
  As this have been a hot topic in review drop it for now so we can
  support V4H single boards which we can test and lets work on the delay
  on-top when we can test it.

* Changes since v4
- Enable GPOUT_RDM and GPOUT_TDM delays depending on phy-mode.

* Changes since v3
- Add description to commit message why PM operations are used instead
  of explicit management of the clock.

* Changes since v2
- Drop extra call to ether_setup(), already called by
  alloc_etherdev_mqs().
- Remove dependency on MII.
- Improve error paths when requestion IRQs.
- Correct the interpretation of which  phy-mode to apply delays for, and
  mask the phy-mode passed to the PHY if MAC adds delays.

* Changes since v1
- Remove C45 read/write functions, the phy-core can do that for us.
- Rework the driver to register the MDIO bus at probe time instead of at
  ndo_open().
- Rework rtsn_rx() to take advantages of the improved design proposed
  and upstreamed for R-Car RAVB driver Rx code-path.
- Use napi_complete_done() instead of napi_complete().
- Update commit message to list that the driver supports Rx CSUM
  offload.
- Drop unneeded __iowmb() left from development as well as a stray ;.
- Consider all RGMII modes.
- Move the phy_stop() call to mirror where phy_start() is called.
- Forward IOCTLS from rtsn_do_ioctl() to PHY using ndo_eth_ioctl()
- Align variable names to match core for IOCTLS functions.
- Make sure DMA mask and PTP is registered before registering the ndev.
- Document why the RTSN driver needs to be able to apply delays
- Add checks for which phy-modes the MAC driver can apply delays
- Use snprintf() instead of sprintf()

* Changes since RFC
- Fix issues in MDIO communication.
- Use a dedicated OF node for the MDIO bus.
---
 MAINTAINERS                           |    8 +
 drivers/net/ethernet/renesas/Kconfig  |   10 +
 drivers/net/ethernet/renesas/Makefile |    2 +
 drivers/net/ethernet/renesas/rtsn.c   | 1382 +++++++++++++++++++++++++
 drivers/net/ethernet/renesas/rtsn.h   |  464 +++++++++
 5 files changed, 1866 insertions(+)
 create mode 100644 drivers/net/ethernet/renesas/rtsn.c
 create mode 100644 drivers/net/ethernet/renesas/rtsn.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cd3277a98cfe..063b5684d7c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19031,6 +19031,14 @@ F:	drivers/net/ethernet/renesas/Makefile
 F:	drivers/net/ethernet/renesas/rcar_gen4*
 F:	drivers/net/ethernet/renesas/rswitch*
 
+RENESAS ETHERNET TSN DRIVER
+M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/renesas,ethertsn.yaml
+F:	drivers/net/ethernet/renesas/rtsn.*
+
 RENESAS IDT821034 ASoC CODEC
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
index b03fae7a0f72..1cb2379b1b94 100644
--- a/drivers/net/ethernet/renesas/Kconfig
+++ b/drivers/net/ethernet/renesas/Kconfig
@@ -58,4 +58,14 @@ config RENESAS_GEN4_PTP
 	help
 	  Renesas R-Car Gen4 gPTP device driver.
 
+config RTSN
+	tristate "Renesas Ethernet-TSN support"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on PTP_1588_CLOCK
+	select CRC32
+	select PHYLIB
+	select RENESAS_GEN4_PTP
+	help
+	  Renesas Ethernet-TSN device driver.
+
 endif # NET_VENDOR_RENESAS
diff --git a/drivers/net/ethernet/renesas/Makefile b/drivers/net/ethernet/renesas/Makefile
index 9070acfd6aaf..f65fc76f8b4d 100644
--- a/drivers/net/ethernet/renesas/Makefile
+++ b/drivers/net/ethernet/renesas/Makefile
@@ -11,3 +11,5 @@ obj-$(CONFIG_RAVB) += ravb.o
 obj-$(CONFIG_RENESAS_ETHER_SWITCH) += rswitch.o
 
 obj-$(CONFIG_RENESAS_GEN4_PTP) += rcar_gen4_ptp.o
+
+obj-$(CONFIG_RTSN) += rtsn.o
diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
new file mode 100644
index 000000000000..e4df409c867c
--- /dev/null
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -0,0 +1,1382 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* Renesas Ethernet-TSN device driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ * Copyright (C) 2023 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/etherdevice.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/net_tstamp.h>
+#include <linux/of.h>
+#include <linux/of_mdio.h>
+#include <linux/of_net.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/spinlock.h>
+
+#include "rtsn.h"
+#include "rcar_gen4_ptp.h"
+
+struct rtsn_private {
+	struct net_device *ndev;
+	struct platform_device *pdev;
+	void __iomem *base;
+	struct rcar_gen4_ptp_private *ptp_priv;
+	struct clk *clk;
+	struct reset_control *reset;
+
+	u32 num_tx_ring;
+	u32 num_rx_ring;
+	u32 tx_desc_bat_size;
+	dma_addr_t tx_desc_bat_dma;
+	struct rtsn_desc *tx_desc_bat;
+	u32 rx_desc_bat_size;
+	dma_addr_t rx_desc_bat_dma;
+	struct rtsn_desc *rx_desc_bat;
+	dma_addr_t tx_desc_dma;
+	dma_addr_t rx_desc_dma;
+	struct rtsn_ext_desc *tx_ring;
+	struct rtsn_ext_ts_desc *rx_ring;
+	struct sk_buff **tx_skb;
+	struct sk_buff **rx_skb;
+	spinlock_t lock;	/* Register access lock */
+	u32 cur_tx;
+	u32 dirty_tx;
+	u32 cur_rx;
+	u32 dirty_rx;
+	u8 ts_tag;
+	struct napi_struct napi;
+
+	struct mii_bus *mii;
+	phy_interface_t iface;
+	int link;
+	int speed;
+
+	int tx_data_irq;
+	int rx_data_irq;
+};
+
+static u32 rtsn_read(struct rtsn_private *priv, enum rtsn_reg reg)
+{
+	return ioread32(priv->base + reg);
+}
+
+static void rtsn_write(struct rtsn_private *priv, enum rtsn_reg reg, u32 data)
+{
+	iowrite32(data, priv->base + reg);
+}
+
+static void rtsn_modify(struct rtsn_private *priv, enum rtsn_reg reg,
+			u32 clear, u32 set)
+{
+	rtsn_write(priv, reg, (rtsn_read(priv, reg) & ~clear) | set);
+}
+
+static int rtsn_reg_wait(struct rtsn_private *priv, enum rtsn_reg reg,
+			 u32 mask, u32 expected)
+{
+	u32 val;
+
+	return readl_poll_timeout(priv->base + reg, val,
+				  (val & mask) == expected,
+				  RTSN_INTERVAL_US, RTSN_TIMEOUT_US);
+}
+
+static void rtsn_ctrl_data_irq(struct rtsn_private *priv, bool enable)
+{
+	if (enable) {
+		rtsn_write(priv, TDIE0, TDIE_TDID_TDX(TX_CHAIN_IDX));
+		rtsn_write(priv, RDIE0, RDIE_RDID_RDX(RX_CHAIN_IDX));
+	} else {
+		rtsn_write(priv, TDID0, TDIE_TDID_TDX(TX_CHAIN_IDX));
+		rtsn_write(priv, RDID0, RDIE_RDID_RDX(RX_CHAIN_IDX));
+	}
+}
+
+static void rtsn_get_timestamp(struct rtsn_private *priv, struct timespec64 *ts)
+{
+	struct rcar_gen4_ptp_private *ptp_priv = priv->ptp_priv;
+
+	ptp_priv->info.gettime64(&ptp_priv->info, ts);
+}
+
+static int rtsn_tx_free(struct net_device *ndev, bool free_txed_only)
+{
+	struct rtsn_private *priv = netdev_priv(ndev);
+	struct rtsn_ext_desc *desc;
+	struct sk_buff *skb;
+	int free_num = 0;
+	int entry, size;
+
+	for (; priv->cur_tx - priv->dirty_tx > 0; priv->dirty_tx++) {
+		entry = priv->dirty_tx % priv->num_tx_ring;
+		desc = &priv->tx_ring[entry];
+		if (free_txed_only && (desc->die_dt & DT_MASK) != DT_FEMPTY)
+			break;
+
+		dma_rmb();
+		size = le16_to_cpu(desc->info_ds) & TX_DS;
+		skb = priv->tx_skb[entry];
+		if (skb) {
+			if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
+				struct skb_shared_hwtstamps shhwtstamps;
+				struct timespec64 ts;
+
+				rtsn_get_timestamp(priv, &ts);
+				memset(&shhwtstamps, 0, sizeof(shhwtstamps));
+				shhwtstamps.hwtstamp = timespec64_to_ktime(ts);
+				skb_tstamp_tx(skb, &shhwtstamps);
+			}
+			dma_unmap_single(ndev->dev.parent,
+					 le32_to_cpu(desc->dptr),
+					 size, DMA_TO_DEVICE);
+			dev_kfree_skb_any(priv->tx_skb[entry]);
+			free_num++;
+		}
+		desc->die_dt = DT_EEMPTY;
+		ndev->stats.tx_packets++;
+		ndev->stats.tx_bytes += size;
+	}
+
+	desc = &priv->tx_ring[priv->num_tx_ring];
+	desc->die_dt = DT_LINK;
+
+	return free_num;
+}
+
+static int rtsn_rx(struct net_device *ndev, int budget)
+{
+	struct rtsn_private *priv = netdev_priv(ndev);
+	unsigned int ndescriptors;
+	unsigned int rx_packets;
+	unsigned int i;
+	bool get_ts;
+
+	get_ts = priv->ptp_priv->tstamp_rx_ctrl &
+		RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
+
+	ndescriptors = priv->dirty_rx + priv->num_rx_ring - priv->cur_rx;
+	rx_packets = 0;
+	for (i = 0; i < ndescriptors; i++) {
+		const unsigned int entry = priv->cur_rx % priv->num_rx_ring;
+		struct rtsn_ext_ts_desc *desc = &priv->rx_ring[entry];
+		struct sk_buff *skb;
+		dma_addr_t dma_addr;
+		u16 pkt_len;
+
+		/* Stop processing descriptors on first empty. */
+		if ((desc->die_dt & DT_MASK) == DT_FEMPTY)
+			break;
+
+		dma_rmb();
+		pkt_len = le16_to_cpu(desc->info_ds) & RX_DS;
+
+		skb = priv->rx_skb[entry];
+		priv->rx_skb[entry] = NULL;
+		dma_addr = le32_to_cpu(desc->dptr);
+		dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ,
+				 DMA_FROM_DEVICE);
+
+		/* Get timestamp if enabled. */
+		if (get_ts) {
+			struct skb_shared_hwtstamps *shhwtstamps;
+			struct timespec64 ts;
+
+			shhwtstamps = skb_hwtstamps(skb);
+			memset(shhwtstamps, 0, sizeof(*shhwtstamps));
+
+			ts.tv_sec = (u64)le32_to_cpu(desc->ts_sec);
+			ts.tv_nsec = le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff));
+
+			shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
+		}
+
+		skb_put(skb, pkt_len);
+		skb->protocol = eth_type_trans(skb, ndev);
+		netif_receive_skb(skb);
+
+		/* Update statistics. */
+		ndev->stats.rx_packets++;
+		ndev->stats.rx_bytes += pkt_len;
+
+		/* Update counters. */
+		priv->cur_rx++;
+		rx_packets++;
+
+		/* Stop processing descriptors if budget is consumed. */
+		if (rx_packets >= budget)
+			break;
+	}
+
+	/* Refill the RX ring buffers */
+	for (; priv->cur_rx - priv->dirty_rx > 0; priv->dirty_rx++) {
+		const unsigned int entry = priv->dirty_rx % priv->num_rx_ring;
+		struct rtsn_ext_ts_desc *desc = &priv->rx_ring[entry];
+		struct sk_buff *skb;
+		dma_addr_t dma_addr;
+
+		desc->info_ds = cpu_to_le16(PKT_BUF_SZ);
+
+		if (!priv->rx_skb[entry]) {
+			skb = netdev_alloc_skb(ndev,
+					       PKT_BUF_SZ + RTSN_ALIGN - 1);
+			if (!skb)
+				break;
+			skb_reserve(skb, NET_IP_ALIGN);
+			dma_addr = dma_map_single(ndev->dev.parent, skb->data,
+						  le16_to_cpu(desc->info_ds),
+						  DMA_FROM_DEVICE);
+			if (dma_mapping_error(ndev->dev.parent, dma_addr))
+				desc->info_ds = cpu_to_le16(0);
+			desc->dptr = cpu_to_le32(dma_addr);
+			skb_checksum_none_assert(skb);
+			priv->rx_skb[entry] = skb;
+		}
+
+		dma_wmb();
+		desc->die_dt = DT_FEMPTY | D_DIE;
+	}
+
+	priv->rx_ring[priv->num_rx_ring].die_dt = DT_LINK;
+
+	return rx_packets;
+}
+
+static int rtsn_poll(struct napi_struct *napi, int budget)
+{
+	struct rtsn_private *priv;
+	struct net_device *ndev;
+	unsigned long flags;
+	int work_done;
+
+	ndev = napi->dev;
+	priv = netdev_priv(ndev);
+
+	/* Processing RX Descriptor Ring */
+	work_done = rtsn_rx(ndev, budget);
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	/* Processing TX Descriptor Ring */
+	rtsn_tx_free(ndev, true);
+	netif_wake_subqueue(ndev, 0);
+
+	/* Re-enable TX/RX interrupts */
+	if (work_done < budget && napi_complete_done(napi, work_done))
+		rtsn_ctrl_data_irq(priv, true);
+
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return work_done;
+}
+
+static int rtsn_desc_alloc(struct rtsn_private *priv)
+{
+	struct device *dev = &priv->pdev->dev;
+	unsigned int i;
+
+	priv->tx_desc_bat_size = sizeof(struct rtsn_desc) * TX_NUM_CHAINS;
+	priv->tx_desc_bat = dma_alloc_coherent(dev, priv->tx_desc_bat_size,
+					       &priv->tx_desc_bat_dma,
+					       GFP_KERNEL);
+
+	if (!priv->tx_desc_bat)
+		return -ENOMEM;
+
+	for (i = 0; i < TX_NUM_CHAINS; i++)
+		priv->tx_desc_bat[i].die_dt = DT_EOS;
+
+	priv->rx_desc_bat_size = sizeof(struct rtsn_desc) * RX_NUM_CHAINS;
+	priv->rx_desc_bat = dma_alloc_coherent(dev, priv->rx_desc_bat_size,
+					       &priv->rx_desc_bat_dma,
+					       GFP_KERNEL);
+
+	if (!priv->rx_desc_bat)
+		return -ENOMEM;
+
+	for (i = 0; i < RX_NUM_CHAINS; i++)
+		priv->rx_desc_bat[i].die_dt = DT_EOS;
+
+	return 0;
+}
+
+static void rtsn_desc_free(struct rtsn_private *priv)
+{
+	if (priv->tx_desc_bat)
+		dma_free_coherent(&priv->pdev->dev, priv->tx_desc_bat_size,
+				  priv->tx_desc_bat, priv->tx_desc_bat_dma);
+	priv->tx_desc_bat = NULL;
+
+	if (priv->rx_desc_bat)
+		dma_free_coherent(&priv->pdev->dev, priv->rx_desc_bat_size,
+				  priv->rx_desc_bat, priv->rx_desc_bat_dma);
+	priv->rx_desc_bat = NULL;
+}
+
+static void rtsn_chain_free(struct rtsn_private *priv)
+{
+	struct device *dev = &priv->pdev->dev;
+
+	dma_free_coherent(dev,
+			  sizeof(struct rtsn_ext_desc) * (priv->num_tx_ring + 1),
+			  priv->tx_ring, priv->tx_desc_dma);
+	priv->tx_ring = NULL;
+
+	dma_free_coherent(dev,
+			  sizeof(struct rtsn_ext_ts_desc) * (priv->num_rx_ring + 1),
+			  priv->rx_ring, priv->rx_desc_dma);
+	priv->rx_ring = NULL;
+
+	kfree(priv->tx_skb);
+	priv->tx_skb = NULL;
+
+	kfree(priv->rx_skb);
+	priv->rx_skb = NULL;
+}
+
+static int rtsn_chain_init(struct rtsn_private *priv, int tx_size, int rx_size)
+{
+	struct net_device *ndev = priv->ndev;
+	struct sk_buff *skb;
+	int i;
+
+	priv->num_tx_ring = tx_size;
+	priv->num_rx_ring = rx_size;
+
+	priv->tx_skb = kcalloc(tx_size, sizeof(*priv->tx_skb), GFP_KERNEL);
+	priv->rx_skb = kcalloc(rx_size, sizeof(*priv->rx_skb), GFP_KERNEL);
+
+	if (!priv->rx_skb || !priv->tx_skb)
+		goto error;
+
+	for (i = 0; i < rx_size; i++) {
+		skb = netdev_alloc_skb(ndev, PKT_BUF_SZ + RTSN_ALIGN - 1);
+		if (!skb)
+			goto error;
+		skb_reserve(skb, NET_IP_ALIGN);
+		priv->rx_skb[i] = skb;
+	}
+
+	/* Allocate TX, RX descriptors */
+	priv->tx_ring = dma_alloc_coherent(ndev->dev.parent,
+					   sizeof(struct rtsn_ext_desc) * (tx_size + 1),
+					   &priv->tx_desc_dma, GFP_KERNEL);
+	priv->rx_ring = dma_alloc_coherent(ndev->dev.parent,
+					   sizeof(struct rtsn_ext_ts_desc) * (rx_size + 1),
+					   &priv->rx_desc_dma, GFP_KERNEL);
+
+	if (!priv->tx_ring || !priv->rx_ring)
+		goto error;
+
+	return 0;
+error:
+	rtsn_chain_free(priv);
+
+	return -ENOMEM;
+}
+
+static void rtsn_chain_format(struct rtsn_private *priv)
+{
+	struct net_device *ndev = priv->ndev;
+	struct rtsn_ext_ts_desc *rx_desc;
+	struct rtsn_ext_desc *tx_desc;
+	struct rtsn_desc *bat_desc;
+	dma_addr_t dma_addr;
+	unsigned int i;
+
+	priv->cur_tx = 0;
+	priv->cur_rx = 0;
+	priv->dirty_rx = 0;
+	priv->dirty_tx = 0;
+
+	/* TX */
+	memset(priv->tx_ring, 0, sizeof(*tx_desc) * priv->num_tx_ring);
+	for (i = 0, tx_desc = priv->tx_ring; i < priv->num_tx_ring; i++, tx_desc++)
+		tx_desc->die_dt = DT_EEMPTY | D_DIE;
+
+	tx_desc->dptr = cpu_to_le32((u32)priv->tx_desc_dma);
+	tx_desc->die_dt = DT_LINK;
+
+	bat_desc = &priv->tx_desc_bat[TX_CHAIN_IDX];
+	bat_desc->die_dt = DT_LINK;
+	bat_desc->dptr = cpu_to_le32((u32)priv->tx_desc_dma);
+
+	/* RX */
+	memset(priv->rx_ring, 0, sizeof(*rx_desc) * priv->num_rx_ring);
+	for (i = 0, rx_desc = priv->rx_ring; i < priv->num_rx_ring; i++, rx_desc++) {
+		dma_addr = dma_map_single(ndev->dev.parent,
+					  priv->rx_skb[i]->data, PKT_BUF_SZ,
+					  DMA_FROM_DEVICE);
+		if (!dma_mapping_error(ndev->dev.parent, dma_addr))
+			rx_desc->info_ds = cpu_to_le16(PKT_BUF_SZ);
+		rx_desc->dptr = cpu_to_le32((u32)dma_addr);
+		rx_desc->die_dt = DT_FEMPTY | D_DIE;
+	}
+	rx_desc->dptr = cpu_to_le32((u32)priv->rx_desc_dma);
+	rx_desc->die_dt = DT_LINK;
+
+	bat_desc = &priv->rx_desc_bat[RX_CHAIN_IDX];
+	bat_desc->die_dt = DT_LINK;
+	bat_desc->dptr = cpu_to_le32((u32)priv->rx_desc_dma);
+}
+
+static int rtsn_dmac_init(struct rtsn_private *priv)
+{
+	int ret;
+
+	ret = rtsn_chain_init(priv, TX_CHAIN_SIZE, RX_CHAIN_SIZE);
+	if (ret)
+		return ret;
+
+	rtsn_chain_format(priv);
+
+	return 0;
+}
+
+static enum rtsn_mode rtsn_read_mode(struct rtsn_private *priv)
+{
+	return (rtsn_read(priv, OSR) & OSR_OPS) >> 1;
+}
+
+static int rtsn_wait_mode(struct rtsn_private *priv, enum rtsn_mode mode)
+{
+	unsigned int i;
+
+	/* Need to busy loop as mode changes can happen in atomic context. */
+	for (i = 0; i < RTSN_TIMEOUT_US / RTSN_INTERVAL_US; i++) {
+		if (rtsn_read_mode(priv) == mode)
+			return 0;
+
+		udelay(RTSN_INTERVAL_US);
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int rtsn_change_mode(struct rtsn_private *priv, enum rtsn_mode mode)
+{
+	int ret;
+
+	rtsn_write(priv, OCR, mode);
+	ret = rtsn_wait_mode(priv, mode);
+	if (ret)
+		netdev_err(priv->ndev, "Failed to switch operation mode\n");
+	return ret;
+}
+
+static int rtsn_get_data_irq_status(struct rtsn_private *priv)
+{
+	u32 val;
+
+	val = rtsn_read(priv, TDIS0) | TDIS_TDS(TX_CHAIN_IDX);
+	val |= rtsn_read(priv, RDIS0) | RDIS_RDS(RX_CHAIN_IDX);
+
+	return val;
+}
+
+static irqreturn_t rtsn_irq(int irq, void *dev_id)
+{
+	struct rtsn_private *priv = dev_id;
+	int ret = IRQ_NONE;
+
+	spin_lock(&priv->lock);
+
+	if (rtsn_get_data_irq_status(priv)) {
+		/* Clear TX/RX irq status */
+		rtsn_write(priv, TDIS0, TDIS_TDS(TX_CHAIN_IDX));
+		rtsn_write(priv, RDIS0, RDIS_RDS(RX_CHAIN_IDX));
+
+		if (napi_schedule_prep(&priv->napi)) {
+			/* Disable TX/RX interrupts */
+			rtsn_ctrl_data_irq(priv, false);
+
+			__napi_schedule(&priv->napi);
+		}
+
+		ret = IRQ_HANDLED;
+	}
+
+	spin_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int rtsn_request_irq(unsigned int irq, irq_handler_t handler,
+			    unsigned long flags, struct rtsn_private *priv,
+			    const char *ch)
+{
+	char *name;
+	int ret;
+
+	name = devm_kasprintf(&priv->pdev->dev, GFP_KERNEL, "%s:%s",
+			      priv->ndev->name, ch);
+	if (!name)
+		return -ENOMEM;
+
+	ret = request_irq(irq, handler, flags, name, priv);
+	if (ret)
+		netdev_err(priv->ndev, "Cannot request IRQ %s\n", name);
+
+	return ret;
+}
+
+static void rtsn_free_irqs(struct rtsn_private *priv)
+{
+	free_irq(priv->tx_data_irq, priv);
+	free_irq(priv->rx_data_irq, priv);
+}
+
+static int rtsn_request_irqs(struct rtsn_private *priv)
+{
+	int ret;
+
+	priv->rx_data_irq = platform_get_irq_byname(priv->pdev, "rx");
+	if (priv->rx_data_irq < 0)
+		return priv->rx_data_irq;
+
+	priv->tx_data_irq = platform_get_irq_byname(priv->pdev, "tx");
+	if (priv->tx_data_irq < 0)
+		return priv->tx_data_irq;
+
+	ret = rtsn_request_irq(priv->tx_data_irq, rtsn_irq, 0, priv, "tx");
+	if (ret)
+		return ret;
+
+	ret = rtsn_request_irq(priv->rx_data_irq, rtsn_irq, 0, priv, "rx");
+	if (ret) {
+		free_irq(priv->tx_data_irq, priv);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int rtsn_reset(struct rtsn_private *priv)
+{
+	reset_control_reset(priv->reset);
+	mdelay(1);
+
+	return rtsn_wait_mode(priv, OCR_OPC_DISABLE);
+}
+
+static int rtsn_axibmi_init(struct rtsn_private *priv)
+{
+	int ret;
+
+	ret = rtsn_reg_wait(priv, RR, RR_RST, RR_RST_COMPLETE);
+	if (ret)
+		return ret;
+
+	/* Set AXIWC */
+	rtsn_write(priv, AXIWC, AXIWC_DEFAULT);
+
+	/* Set AXIRC */
+	rtsn_write(priv, AXIRC, AXIRC_DEFAULT);
+
+	/* TX Descriptor chain setting */
+	rtsn_write(priv, TATLS0, TATLS0_TEDE | TATLS0_TATEN(TX_CHAIN_IDX));
+	rtsn_write(priv, TATLS1, priv->tx_desc_bat_dma + TX_CHAIN_ADDR_OFFSET);
+	rtsn_write(priv, TATLR, TATLR_TATL);
+
+	ret = rtsn_reg_wait(priv, TATLR, TATLR_TATL, 0);
+	if (ret)
+		return ret;
+
+	/* RX Descriptor chain setting */
+	rtsn_write(priv, RATLS0,
+		   RATLS0_RETS | RATLS0_REDE | RATLS0_RATEN(RX_CHAIN_IDX));
+	rtsn_write(priv, RATLS1, priv->rx_desc_bat_dma + RX_CHAIN_ADDR_OFFSET);
+	rtsn_write(priv, RATLR, RATLR_RATL);
+
+	ret = rtsn_reg_wait(priv, RATLR, RATLR_RATL, 0);
+	if (ret)
+		return ret;
+
+	/* Enable TX/RX interrupts */
+	rtsn_ctrl_data_irq(priv, true);
+
+	return 0;
+}
+
+static void rtsn_mhd_init(struct rtsn_private *priv)
+{
+	/* TX General setting */
+	rtsn_write(priv, TGC1, TGC1_STTV_DEFAULT | TGC1_TQTM_SFM);
+	rtsn_write(priv, TMS0, TMS_MFS_MAX);
+
+	/* RX Filter IP */
+	rtsn_write(priv, CFCR0, CFCR_SDID(RX_CHAIN_IDX));
+	rtsn_write(priv, FMSCR, FMSCR_FMSIE(RX_CHAIN_IDX));
+}
+
+static int rtsn_get_phy_params(struct rtsn_private *priv)
+{
+	int ret;
+
+	ret = of_get_phy_mode(priv->pdev->dev.of_node, &priv->iface);
+	if (ret)
+		return ret;
+
+	switch (priv->iface) {
+	case PHY_INTERFACE_MODE_MII:
+		priv->speed = 100;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		priv->speed = 1000;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static void rtsn_set_phy_interface(struct rtsn_private *priv)
+{
+	u32 val;
+
+	switch (priv->iface) {
+	case PHY_INTERFACE_MODE_MII:
+		val = MPIC_PIS_MII;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		val = MPIC_PIS_GMII;
+		break;
+	default:
+		return;
+	}
+
+	rtsn_modify(priv, MPIC, MPIC_PIS_MASK, val);
+}
+
+static void rtsn_set_rate(struct rtsn_private *priv)
+{
+	u32 val;
+
+	switch (priv->speed) {
+	case 10:
+		val = MPIC_LSC_10M;
+		break;
+	case 100:
+		val = MPIC_LSC_100M;
+		break;
+	case 1000:
+		val = MPIC_LSC_1G;
+		break;
+	default:
+		return;
+	}
+
+	rtsn_modify(priv, MPIC, MPIC_LSC_MASK, val);
+}
+
+static int rtsn_rmac_init(struct rtsn_private *priv)
+{
+	const u8 *mac_addr = priv->ndev->dev_addr;
+	int ret;
+
+	/* Set MAC address */
+	rtsn_write(priv, MRMAC0, (mac_addr[0] << 8) | mac_addr[1]);
+	rtsn_write(priv, MRMAC1, (mac_addr[2] << 24) | (mac_addr[3] << 16) |
+		   (mac_addr[4] << 8) | mac_addr[5]);
+
+	/* Set xMII type */
+	rtsn_set_phy_interface(priv);
+	rtsn_set_rate(priv);
+
+	/* Enable MII */
+	rtsn_modify(priv, MPIC, MPIC_PSMCS_MASK | MPIC_PSMHT_MASK,
+		    MPIC_PSMCS_DEFAULT | MPIC_PSMHT_DEFAULT);
+
+	/* Link verification */
+	rtsn_modify(priv, MLVC, MLVC_PLV, MLVC_PLV);
+	ret = rtsn_reg_wait(priv, MLVC, MLVC_PLV, 0);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int rtsn_hw_init(struct rtsn_private *priv)
+{
+	int ret;
+
+	ret = rtsn_reset(priv);
+	if (ret)
+		return ret;
+
+	/* Change to CONFIG mode */
+	ret = rtsn_change_mode(priv, OCR_OPC_CONFIG);
+	if (ret)
+		return ret;
+
+	ret = rtsn_axibmi_init(priv);
+	if (ret)
+		return ret;
+
+	rtsn_mhd_init(priv);
+
+	ret = rtsn_rmac_init(priv);
+	if (ret)
+		return ret;
+
+	ret = rtsn_change_mode(priv, OCR_OPC_DISABLE);
+	if (ret)
+		return ret;
+
+	/* Change to OPERATION mode */
+	ret = rtsn_change_mode(priv, OCR_OPC_OPERATION);
+
+	return ret;
+}
+
+static int rtsn_mii_access(struct mii_bus *bus, bool read, int phyad,
+			   int regad, u16 data)
+{
+	struct rtsn_private *priv = bus->priv;
+	u32 val;
+	int ret;
+
+	val = MPSM_PDA(phyad) | MPSM_PRA(regad) | MPSM_PSME;
+
+	if (!read)
+		val |= MPSM_PSMAD | MPSM_PRD_SET(data);
+
+	rtsn_write(priv, MPSM, val);
+
+	ret = rtsn_reg_wait(priv, MPSM, MPSM_PSME, 0);
+	if (ret)
+		return ret;
+
+	if (read)
+		ret = MPSM_PRD_GET(rtsn_read(priv, MPSM));
+
+	return ret;
+}
+
+static int rtsn_mii_read(struct mii_bus *bus, int addr, int regnum)
+{
+	return rtsn_mii_access(bus, true, addr, regnum, 0);
+}
+
+static int rtsn_mii_write(struct mii_bus *bus, int addr, int regnum, u16 val)
+{
+	return rtsn_mii_access(bus, false, addr, regnum, val);
+}
+
+static int rtsn_mdio_alloc(struct rtsn_private *priv)
+{
+	struct platform_device *pdev = priv->pdev;
+	struct device *dev = &pdev->dev;
+	struct device_node *mdio_node;
+	struct mii_bus *mii;
+	int ret;
+
+	mii = mdiobus_alloc();
+	if (!mii)
+		return -ENOMEM;
+
+	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
+	if (!mdio_node) {
+		ret = -ENODEV;
+		goto out_free_bus;
+	}
+
+	/* Enter config mode before registering the MDIO bus */
+	ret = rtsn_reset(priv);
+	if (ret)
+		goto out_free_bus;
+
+	ret = rtsn_change_mode(priv, OCR_OPC_CONFIG);
+	if (ret)
+		goto out_free_bus;
+
+	rtsn_modify(priv, MPIC, MPIC_PSMCS_MASK | MPIC_PSMHT_MASK,
+		    MPIC_PSMCS_DEFAULT | MPIC_PSMHT_DEFAULT);
+
+	/* Register the MDIO bus */
+	mii->name = "rtsn_mii";
+	snprintf(mii->id, MII_BUS_ID_SIZE, "%s-%x",
+		 pdev->name, pdev->id);
+	mii->priv = priv;
+	mii->read = rtsn_mii_read;
+	mii->write = rtsn_mii_write;
+	mii->parent = dev;
+
+	ret = of_mdiobus_register(mii, mdio_node);
+	of_node_put(mdio_node);
+	if (ret)
+		goto out_free_bus;
+
+	priv->mii = mii;
+
+	return 0;
+
+out_free_bus:
+	mdiobus_free(mii);
+	return ret;
+}
+
+static void rtsn_mdio_free(struct rtsn_private *priv)
+{
+	mdiobus_unregister(priv->mii);
+	mdiobus_free(priv->mii);
+	priv->mii = NULL;
+}
+
+static void rtsn_adjust_link(struct net_device *ndev)
+{
+	struct rtsn_private *priv = netdev_priv(ndev);
+	struct phy_device *phydev = ndev->phydev;
+	bool new_state = false;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	if (phydev->link) {
+		if (phydev->speed != priv->speed) {
+			new_state = true;
+			priv->speed = phydev->speed;
+		}
+
+		if (!priv->link) {
+			new_state = true;
+			priv->link = phydev->link;
+		}
+	} else if (priv->link) {
+		new_state = true;
+		priv->link = 0;
+		priv->speed = 0;
+	}
+
+	if (new_state) {
+		/* Need to transition to CONFIG mode before reconfiguring and
+		 * then back to the original mode. Any state change to/from
+		 * CONFIG or OPERATION must go over DISABLED to stop Rx/Tx.
+		 */
+		enum rtsn_mode orgmode = rtsn_read_mode(priv);
+
+		/* Transit to CONFIG */
+		if (orgmode != OCR_OPC_CONFIG) {
+			if (orgmode != OCR_OPC_DISABLE &&
+			    rtsn_change_mode(priv, OCR_OPC_DISABLE))
+				goto out;
+			if (rtsn_change_mode(priv, OCR_OPC_CONFIG))
+				goto out;
+		}
+
+		rtsn_set_rate(priv);
+
+		/* Transition to original mode */
+		if (orgmode != OCR_OPC_CONFIG) {
+			if (rtsn_change_mode(priv, OCR_OPC_DISABLE))
+				goto out;
+			if (orgmode != OCR_OPC_DISABLE &&
+			    rtsn_change_mode(priv, orgmode))
+				goto out;
+		}
+	}
+out:
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	if (new_state)
+		phy_print_status(phydev);
+}
+
+static int rtsn_phy_init(struct rtsn_private *priv)
+{
+	struct device_node *np = priv->ndev->dev.parent->of_node;
+	struct phy_device *phydev;
+	struct device_node *phy;
+	phy_interface_t iface;
+
+	priv->link = 0;
+
+	phy = of_parse_phandle(np, "phy-handle", 0);
+	if (!phy)
+		return -ENOENT;
+
+	phydev = of_phy_connect(priv->ndev, phy, rtsn_adjust_link, 0,
+				iface);
+	of_node_put(phy);
+	if (!phydev)
+		return -ENOENT;
+
+	/* Only support full-duplex mode */
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
+	phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
+
+	phy_attached_info(phydev);
+
+	return 0;
+}
+
+static void rtsn_phy_deinit(struct rtsn_private *priv)
+{
+	phy_disconnect(priv->ndev->phydev);
+	priv->ndev->phydev = NULL;
+}
+
+static int rtsn_init(struct rtsn_private *priv)
+{
+	int ret;
+
+	ret = rtsn_desc_alloc(priv);
+	if (ret)
+		return ret;
+
+	ret = rtsn_dmac_init(priv);
+	if (ret)
+		goto error_free_desc;
+
+	ret = rtsn_hw_init(priv);
+	if (ret)
+		goto error_free_chain;
+
+	ret = rtsn_phy_init(priv);
+	if (ret)
+		goto error_free_chain;
+
+	ret = rtsn_request_irqs(priv);
+	if (ret)
+		goto error_free_phy;
+
+	return 0;
+error_free_phy:
+	rtsn_phy_deinit(priv);
+error_free_chain:
+	rtsn_chain_free(priv);
+error_free_desc:
+	rtsn_desc_free(priv);
+	return ret;
+}
+
+static void rtsn_deinit(struct rtsn_private *priv)
+{
+	rtsn_free_irqs(priv);
+	rtsn_phy_deinit(priv);
+	rtsn_chain_free(priv);
+	rtsn_desc_free(priv);
+}
+
+static void rtsn_parse_mac_address(struct device_node *np,
+				   struct net_device *ndev)
+{
+	struct rtsn_private *priv = netdev_priv(ndev);
+	u8 addr[ETH_ALEN];
+	u32 mrmac0;
+	u32 mrmac1;
+
+	/* Try to read address from Device Tree. */
+	if (!of_get_mac_address(np, addr)) {
+		eth_hw_addr_set(ndev, addr);
+		return;
+	}
+
+	/* Try to read address from device. */
+	mrmac0 = rtsn_read(priv, MRMAC0);
+	mrmac1 = rtsn_read(priv, MRMAC1);
+
+	addr[0] = (mrmac0 >>  8) & 0xff;
+	addr[1] = (mrmac0 >>  0) & 0xff;
+	addr[2] = (mrmac1 >> 24) & 0xff;
+	addr[3] = (mrmac1 >> 16) & 0xff;
+	addr[4] = (mrmac1 >>  8) & 0xff;
+	addr[5] = (mrmac1 >>  0) & 0xff;
+
+	if (is_valid_ether_addr(addr)) {
+		eth_hw_addr_set(ndev, addr);
+		return;
+	}
+
+	/* Fallback to a random address */
+	eth_hw_addr_random(ndev);
+}
+
+static int rtsn_open(struct net_device *ndev)
+{
+	struct rtsn_private *priv = netdev_priv(ndev);
+	int ret;
+
+	napi_enable(&priv->napi);
+
+	ret = rtsn_init(priv);
+	if (ret) {
+		napi_disable(&priv->napi);
+		return ret;
+	}
+
+	phy_start(ndev->phydev);
+
+	netif_start_queue(ndev);
+
+	return 0;
+}
+
+static int rtsn_stop(struct net_device *ndev)
+{
+	struct rtsn_private *priv = netdev_priv(ndev);
+
+	phy_stop(priv->ndev->phydev);
+	napi_disable(&priv->napi);
+	rtsn_change_mode(priv, OCR_OPC_DISABLE);
+	rtsn_deinit(priv);
+
+	return 0;
+}
+
+static netdev_tx_t rtsn_start_xmit(struct sk_buff *skb, struct net_device *ndev)
+{
+	struct rtsn_private *priv = netdev_priv(ndev);
+	struct rtsn_ext_desc *desc;
+	int ret = NETDEV_TX_OK;
+	unsigned long flags;
+	dma_addr_t dma_addr;
+	int entry;
+
+	spin_lock_irqsave(&priv->lock, flags);
+
+	if (priv->cur_tx - priv->dirty_tx > priv->num_tx_ring) {
+		netif_stop_subqueue(ndev, 0);
+		ret = NETDEV_TX_BUSY;
+		goto out;
+	}
+
+	if (skb_put_padto(skb, ETH_ZLEN))
+		goto out;
+
+	dma_addr = dma_map_single(ndev->dev.parent, skb->data, skb->len,
+				  DMA_TO_DEVICE);
+	if (dma_mapping_error(ndev->dev.parent, dma_addr)) {
+		dev_kfree_skb_any(skb);
+		goto out;
+	}
+
+	entry = priv->cur_tx % priv->num_tx_ring;
+	priv->tx_skb[entry] = skb;
+	desc = &priv->tx_ring[entry];
+	desc->dptr = cpu_to_le32(dma_addr);
+	desc->info_ds = cpu_to_le16(skb->len);
+	desc->info1 = cpu_to_le64(skb->len);
+
+	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
+		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
+		priv->ts_tag++;
+		desc->info_ds |= cpu_to_le16(TXC);
+		desc->info = priv->ts_tag;
+	}
+
+	skb_tx_timestamp(skb);
+	dma_wmb();
+
+	desc->die_dt = DT_FSINGLE | D_DIE;
+	priv->cur_tx++;
+
+	/* Start xmit */
+	rtsn_write(priv, TRCR0, BIT(TX_CHAIN_IDX));
+out:
+	spin_unlock_irqrestore(&priv->lock, flags);
+	return ret;
+}
+
+static struct net_device_stats *rtsn_get_stats(struct net_device *ndev)
+{
+	return &ndev->stats;
+}
+
+static int rtsn_hwstamp_get(struct net_device *ndev, struct ifreq *ifr)
+{
+	struct rcar_gen4_ptp_private *ptp_priv;
+	struct hwtstamp_config config;
+	struct rtsn_private *priv;
+
+	priv = netdev_priv(ndev);
+	ptp_priv = priv->ptp_priv;
+
+	config.flags = 0;
+
+	config.tx_type =
+		ptp_priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
+
+	switch (ptp_priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE) {
+	case RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT:
+		config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+		break;
+	case RCAR_GEN4_RXTSTAMP_TYPE_ALL:
+		config.rx_filter = HWTSTAMP_FILTER_ALL;
+		break;
+	default:
+		config.rx_filter = HWTSTAMP_FILTER_NONE;
+	}
+
+	return copy_to_user(ifr->ifr_data, &config,
+			    sizeof(config)) ? -EFAULT : 0;
+}
+
+static int rtsn_hwstamp_set(struct net_device *ndev, struct ifreq *ifr)
+{
+	struct rcar_gen4_ptp_private *ptp_priv;
+	struct hwtstamp_config config;
+	struct rtsn_private *priv;
+	u32 tstamp_rx_ctrl;
+	u32 tstamp_tx_ctrl;
+
+	priv = netdev_priv(ndev);
+	ptp_priv = priv->ptp_priv;
+
+	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
+		return -EFAULT;
+
+	if (config.flags)
+		return -EINVAL;
+
+	switch (config.tx_type) {
+	case HWTSTAMP_TX_OFF:
+		tstamp_tx_ctrl = 0;
+		break;
+	case HWTSTAMP_TX_ON:
+		tstamp_tx_ctrl = RCAR_GEN4_TXTSTAMP_ENABLED;
+		break;
+	default:
+		return -ERANGE;
+	}
+
+	switch (config.rx_filter) {
+	case HWTSTAMP_FILTER_NONE:
+		tstamp_rx_ctrl = 0;
+		break;
+	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
+		tstamp_rx_ctrl = RCAR_GEN4_RXTSTAMP_ENABLED |
+			RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
+		break;
+	default:
+		config.rx_filter = HWTSTAMP_FILTER_ALL;
+		tstamp_rx_ctrl = RCAR_GEN4_RXTSTAMP_ENABLED |
+			RCAR_GEN4_RXTSTAMP_TYPE_ALL;
+	}
+
+	ptp_priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
+	ptp_priv->tstamp_rx_ctrl = tstamp_rx_ctrl;
+
+	return copy_to_user(ifr->ifr_data, &config,
+			    sizeof(config)) ? -EFAULT : 0;
+}
+
+static int rtsn_do_ioctl(struct net_device *ndev, struct ifreq *ifr, int cmd)
+{
+	if (!netif_running(ndev))
+		return -ENODEV;
+
+	switch (cmd) {
+	case SIOCGHWTSTAMP:
+		return rtsn_hwstamp_get(ndev, ifr);
+	case SIOCSHWTSTAMP:
+		return rtsn_hwstamp_set(ndev, ifr);
+	default:
+		break;
+	}
+
+	return phy_do_ioctl_running(ndev, ifr, cmd);
+}
+
+static const struct net_device_ops rtsn_netdev_ops = {
+	.ndo_open		= rtsn_open,
+	.ndo_stop		= rtsn_stop,
+	.ndo_start_xmit		= rtsn_start_xmit,
+	.ndo_get_stats		= rtsn_get_stats,
+	.ndo_eth_ioctl		= rtsn_do_ioctl,
+	.ndo_validate_addr	= eth_validate_addr,
+	.ndo_set_mac_address	= eth_mac_addr,
+};
+
+static int rtsn_get_ts_info(struct net_device *ndev,
+			    struct ethtool_ts_info *info)
+{
+	struct rtsn_private *priv = netdev_priv(ndev);
+
+	info->phc_index = ptp_clock_index(priv->ptp_priv->clock);
+	info->so_timestamping = SOF_TIMESTAMPING_TX_SOFTWARE |
+		SOF_TIMESTAMPING_RX_SOFTWARE |
+		SOF_TIMESTAMPING_SOFTWARE |
+		SOF_TIMESTAMPING_TX_HARDWARE |
+		SOF_TIMESTAMPING_RX_HARDWARE |
+		SOF_TIMESTAMPING_RAW_HARDWARE;
+	info->tx_types = BIT(HWTSTAMP_TX_OFF) | BIT(HWTSTAMP_TX_ON);
+	info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) | BIT(HWTSTAMP_FILTER_ALL);
+
+	return 0;
+}
+
+static const struct ethtool_ops rtsn_ethtool_ops = {
+	.nway_reset		= phy_ethtool_nway_reset,
+	.get_link		= ethtool_op_get_link,
+	.get_ts_info		= rtsn_get_ts_info,
+	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
+};
+
+static const struct of_device_id rtsn_match_table[] = {
+	{.compatible = "renesas,r8a779g0-ethertsn", },
+	{ /* Sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, rtsn_match_table);
+
+static int rtsn_probe(struct platform_device *pdev)
+{
+	struct rtsn_private *priv;
+	struct net_device *ndev;
+	struct resource *res;
+	int ret;
+
+	ndev = alloc_etherdev_mqs(sizeof(struct rtsn_private), TX_NUM_CHAINS,
+				  RX_NUM_CHAINS);
+	if (!ndev)
+		return -ENOMEM;
+
+	priv = netdev_priv(ndev);
+	priv->pdev = pdev;
+	priv->ndev = ndev;
+	priv->ptp_priv = rcar_gen4_ptp_alloc(pdev);
+
+	spin_lock_init(&priv->lock);
+	platform_set_drvdata(pdev, priv);
+
+	priv->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		ret = -PTR_ERR(priv->clk);
+		goto error_alloc;
+	}
+
+	priv->reset = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->reset)) {
+		ret = -PTR_ERR(priv->reset);
+		goto error_alloc;
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsnes");
+	if (!res) {
+		dev_err(&pdev->dev, "Can't find tsnes resource\n");
+		ret = -EINVAL;
+		goto error_alloc;
+	}
+
+	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(priv->base)) {
+		ret = PTR_ERR(priv->base);
+		goto error_alloc;
+	}
+
+	SET_NETDEV_DEV(ndev, &pdev->dev);
+
+	ndev->features = NETIF_F_RXCSUM;
+	ndev->hw_features = NETIF_F_RXCSUM;
+	ndev->base_addr = res->start;
+	ndev->netdev_ops = &rtsn_netdev_ops;
+	ndev->ethtool_ops = &rtsn_ethtool_ops;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
+	if (!res) {
+		dev_err(&pdev->dev, "Can't find gptp resource\n");
+		ret = -EINVAL;
+		goto error_alloc;
+	}
+
+	priv->ptp_priv->addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(priv->ptp_priv->addr)) {
+		ret = -PTR_ERR(priv->ptp_priv->addr);
+		goto error_alloc;
+	}
+
+	ret = rtsn_get_phy_params(priv);
+	if (ret)
+		goto error_alloc;
+
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
+
+	netif_napi_add(ndev, &priv->napi, rtsn_poll);
+
+	rtsn_parse_mac_address(pdev->dev.of_node, ndev);
+
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+
+	device_set_wakeup_capable(&pdev->dev, 1);
+
+	ret = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
+				     clk_get_rate(priv->clk));
+	if (ret)
+		goto error_pm;
+
+	ret = rtsn_mdio_alloc(priv);
+	if (ret)
+		goto error_ptp;
+
+	ret = register_netdev(ndev);
+	if (ret)
+		goto error_mdio;
+
+	netdev_info(ndev, "MAC address %pM\n", ndev->dev_addr);
+
+	return 0;
+
+error_mdio:
+	rtsn_mdio_free(priv);
+error_ptp:
+	rcar_gen4_ptp_unregister(priv->ptp_priv);
+error_pm:
+	netif_napi_del(&priv->napi);
+	rtsn_change_mode(priv, OCR_OPC_DISABLE);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+error_alloc:
+	free_netdev(ndev);
+
+	return ret;
+}
+
+static int rtsn_remove(struct platform_device *pdev)
+{
+	struct rtsn_private *priv = platform_get_drvdata(pdev);
+
+	unregister_netdev(priv->ndev);
+	rtsn_mdio_free(priv);
+	rcar_gen4_ptp_unregister(priv->ptp_priv);
+	rtsn_change_mode(priv, OCR_OPC_DISABLE);
+	netif_napi_del(&priv->napi);
+
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	free_netdev(priv->ndev);
+
+	return 0;
+}
+
+static struct platform_driver rtsn_driver = {
+	.probe		= rtsn_probe,
+	.remove		= rtsn_remove,
+	.driver	= {
+		.name	= "rtsn",
+		.of_match_table	= rtsn_match_table,
+	}
+};
+module_platform_driver(rtsn_driver);
+
+MODULE_AUTHOR("Phong Hoang, Niklas Söderlund");
+MODULE_DESCRIPTION("Renesas Ethernet-TSN device driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/ethernet/renesas/rtsn.h b/drivers/net/ethernet/renesas/rtsn.h
new file mode 100644
index 000000000000..3183e80d7e6b
--- /dev/null
+++ b/drivers/net/ethernet/renesas/rtsn.h
@@ -0,0 +1,464 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Renesas Ethernet-TSN device driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ * Copyright (C) 2023 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+#ifndef __RTSN_H__
+#define __RTSN_H__
+
+#include <linux/types.h>
+
+#define AXIBMI	0x0000
+#define TSNMHD	0x1000
+#define RMSO	0x2000
+#define RMRO	0x3800
+
+enum rtsn_reg {
+	AXIWC		= AXIBMI + 0x0000,
+	AXIRC		= AXIBMI + 0x0004,
+	TDPC0		= AXIBMI + 0x0010,
+	TFT		= AXIBMI + 0x0090,
+	TATLS0		= AXIBMI + 0x00a0,
+	TATLS1		= AXIBMI + 0x00a4,
+	TATLR		= AXIBMI + 0x00a8,
+	RATLS0		= AXIBMI + 0x00b0,
+	RATLS1		= AXIBMI + 0x00b4,
+	RATLR		= AXIBMI + 0x00b8,
+	TSA0		= AXIBMI + 0x00c0,
+	TSS0		= AXIBMI + 0x00c4,
+	TRCR0		= AXIBMI + 0x0140,
+	RIDAUAS0	= AXIBMI + 0x0180,
+	RR		= AXIBMI + 0x0200,
+	TATS		= AXIBMI + 0x0210,
+	TATSR0		= AXIBMI + 0x0214,
+	TATSR1		= AXIBMI + 0x0218,
+	TATSR2		= AXIBMI + 0x021c,
+	RATS		= AXIBMI + 0x0220,
+	RATSR0		= AXIBMI + 0x0224,
+	RATSR1		= AXIBMI + 0x0228,
+	RATSR2		= AXIBMI + 0x022c,
+	RIDASM0		= AXIBMI + 0x0240,
+	RIDASAM0	= AXIBMI + 0x0244,
+	RIDACAM0	= AXIBMI + 0x0248,
+	EIS0		= AXIBMI + 0x0300,
+	EIE0		= AXIBMI + 0x0304,
+	EID0		= AXIBMI + 0x0308,
+	EIS1		= AXIBMI + 0x0310,
+	EIE1		= AXIBMI + 0x0314,
+	EID1		= AXIBMI + 0x0318,
+	TCEIS0		= AXIBMI + 0x0340,
+	TCEIE0		= AXIBMI + 0x0344,
+	TCEID0		= AXIBMI + 0x0348,
+	RFSEIS0		= AXIBMI + 0x04c0,
+	RFSEIE0		= AXIBMI + 0x04c4,
+	RFSEID0		= AXIBMI + 0x04c8,
+	RFEIS0		= AXIBMI + 0x0540,
+	RFEIE0		= AXIBMI + 0x0544,
+	RFEID0		= AXIBMI + 0x0548,
+	RCEIS0		= AXIBMI + 0x05c0,
+	RCEIE0		= AXIBMI + 0x05c4,
+	RCEID0		= AXIBMI + 0x05c8,
+	RIDAOIS		= AXIBMI + 0x0640,
+	RIDAOIE		= AXIBMI + 0x0644,
+	RIDAOID		= AXIBMI + 0x0648,
+	TSFEIS		= AXIBMI + 0x06c0,
+	TSFEIE		= AXIBMI + 0x06c4,
+	TSFEID		= AXIBMI + 0x06c8,
+	TSCEIS		= AXIBMI + 0x06d0,
+	TSCEIE		= AXIBMI + 0x06d4,
+	TSCEID		= AXIBMI + 0x06d8,
+	DIS		= AXIBMI + 0x0b00,
+	DIE		= AXIBMI + 0x0b04,
+	DID		= AXIBMI + 0x0b08,
+	TDIS0		= AXIBMI + 0x0b10,
+	TDIE0		= AXIBMI + 0x0b14,
+	TDID0		= AXIBMI + 0x0b18,
+	RDIS0		= AXIBMI + 0x0b90,
+	RDIE0		= AXIBMI + 0x0b94,
+	RDID0		= AXIBMI + 0x0b98,
+	TSDIS		= AXIBMI + 0x0c10,
+	TSDIE		= AXIBMI + 0x0c14,
+	TSDID		= AXIBMI + 0x0c18,
+	GPOUT		= AXIBMI + 0x6000,
+
+	OCR		= TSNMHD + 0x0000,
+	OSR		= TSNMHD + 0x0004,
+	SWR		= TSNMHD + 0x0008,
+	SIS		= TSNMHD + 0x000c,
+	GIS		= TSNMHD + 0x0010,
+	GIE		= TSNMHD + 0x0014,
+	GID		= TSNMHD + 0x0018,
+	TIS1		= TSNMHD + 0x0020,
+	TIE1		= TSNMHD + 0x0024,
+	TID1		= TSNMHD + 0x0028,
+	TIS2		= TSNMHD + 0x0030,
+	TIE2		= TSNMHD + 0x0034,
+	TID2		= TSNMHD + 0x0038,
+	RIS		= TSNMHD + 0x0040,
+	RIE		= TSNMHD + 0x0044,
+	RID		= TSNMHD + 0x0048,
+	TGC1		= TSNMHD + 0x0050,
+	TGC2		= TSNMHD + 0x0054,
+	TFS0		= TSNMHD + 0x0060,
+	TCF0		= TSNMHD + 0x0070,
+	TCR1		= TSNMHD + 0x0080,
+	TCR2		= TSNMHD + 0x0084,
+	TCR3		= TSNMHD + 0x0088,
+	TCR4		= TSNMHD + 0x008c,
+	TMS0		= TSNMHD + 0x0090,
+	TSR1		= TSNMHD + 0x00b0,
+	TSR2		= TSNMHD + 0x00b4,
+	TSR3		= TSNMHD + 0x00b8,
+	TSR4		= TSNMHD + 0x00bc,
+	TSR5		= TSNMHD + 0x00c0,
+	RGC		= TSNMHD + 0x00d0,
+	RDFCR		= TSNMHD + 0x00d4,
+	RCFCR		= TSNMHD + 0x00d8,
+	REFCNCR		= TSNMHD + 0x00dc,
+	RSR1		= TSNMHD + 0x00e0,
+	RSR2		= TSNMHD + 0x00e4,
+	RSR3		= TSNMHD + 0x00e8,
+	TCIS		= TSNMHD + 0x01e0,
+	TCIE		= TSNMHD + 0x01e4,
+	TCID		= TSNMHD + 0x01e8,
+	TPTPC		= TSNMHD + 0x01f0,
+	TTML		= TSNMHD + 0x01f4,
+	TTJ		= TSNMHD + 0x01f8,
+	TCC		= TSNMHD + 0x0200,
+	TCS		= TSNMHD + 0x0204,
+	TGS		= TSNMHD + 0x020c,
+	TACST0		= TSNMHD + 0x0210,
+	TACST1		= TSNMHD + 0x0214,
+	TACST2		= TSNMHD + 0x0218,
+	TALIT0		= TSNMHD + 0x0220,
+	TALIT1		= TSNMHD + 0x0224,
+	TALIT2		= TSNMHD + 0x0228,
+	TAEN0		= TSNMHD + 0x0230,
+	TAEN1		= TSNMHD + 0x0234,
+	TASFE		= TSNMHD + 0x0240,
+	TACLL0		= TSNMHD + 0x0250,
+	TACLL1		= TSNMHD + 0x0254,
+	TACLL2		= TSNMHD + 0x0258,
+	CACC		= TSNMHD + 0x0260,
+	CCS		= TSNMHD + 0x0264,
+	CAIV0		= TSNMHD + 0x0270,
+	CAUL0		= TSNMHD + 0x0290,
+	TOCST0		= TSNMHD + 0x0300,
+	TOCST1		= TSNMHD + 0x0304,
+	TOCST2		= TSNMHD + 0x0308,
+	TOLIT0		= TSNMHD + 0x0310,
+	TOLIT1		= TSNMHD + 0x0314,
+	TOLIT2		= TSNMHD + 0x0318,
+	TOEN0		= TSNMHD + 0x0320,
+	TOEN1		= TSNMHD + 0x0324,
+	TOSFE		= TSNMHD + 0x0330,
+	TCLR0		= TSNMHD + 0x0340,
+	TCLR1		= TSNMHD + 0x0344,
+	TCLR2		= TSNMHD + 0x0348,
+	TSMS		= TSNMHD + 0x0350,
+	COCC		= TSNMHD + 0x0360,
+	COIV0		= TSNMHD + 0x03b0,
+	COUL0		= TSNMHD + 0x03d0,
+	QSTMACU0	= TSNMHD + 0x0400,
+	QSTMACD0	= TSNMHD + 0x0404,
+	QSTMAMU0	= TSNMHD + 0x0408,
+	QSTMAMD0	= TSNMHD + 0x040c,
+	QSFTVL0		= TSNMHD + 0x0410,
+	QSFTVLM0	= TSNMHD + 0x0414,
+	QSFTMSD0	= TSNMHD + 0x0418,
+	QSFTGMI0	= TSNMHD + 0x041c,
+	QSFTLS		= TSNMHD + 0x0600,
+	QSFTLIS		= TSNMHD + 0x0604,
+	QSFTLIE		= TSNMHD + 0x0608,
+	QSFTLID		= TSNMHD + 0x060c,
+	QSMSMC		= TSNMHD + 0x0610,
+	QSGTMC		= TSNMHD + 0x0614,
+	QSEIS		= TSNMHD + 0x0618,
+	QSEIE		= TSNMHD + 0x061c,
+	QSEID		= TSNMHD + 0x0620,
+	QGACST0		= TSNMHD + 0x0630,
+	QGACST1		= TSNMHD + 0x0634,
+	QGACST2		= TSNMHD + 0x0638,
+	QGALIT1		= TSNMHD + 0x0640,
+	QGALIT2		= TSNMHD + 0x0644,
+	QGAEN0		= TSNMHD + 0x0648,
+	QGAEN1		= TSNMHD + 0x074c,
+	QGIGS		= TSNMHD + 0x0650,
+	QGGC		= TSNMHD + 0x0654,
+	QGATL0		= TSNMHD + 0x0664,
+	QGATL1		= TSNMHD + 0x0668,
+	QGATL2		= TSNMHD + 0x066c,
+	QGOCST0		= TSNMHD + 0x0670,
+	QGOCST1		= TSNMHD + 0x0674,
+	QGOCST2		= TSNMHD + 0x0678,
+	QGOLIT0		= TSNMHD + 0x067c,
+	QGOLIT1		= TSNMHD + 0x0680,
+	QGOLIT2		= TSNMHD + 0x0684,
+	QGOEN0		= TSNMHD + 0x0688,
+	QGOEN1		= TSNMHD + 0x068c,
+	QGTRO		= TSNMHD + 0x0690,
+	QGTR1		= TSNMHD + 0x0694,
+	QGTR2		= TSNMHD + 0x0698,
+	QGFSMS		= TSNMHD + 0x069c,
+	QTMIS		= TSNMHD + 0x06e0,
+	QTMIE		= TSNMHD + 0x06e4,
+	QTMID		= TSNMHD + 0x06e8,
+	QMEC		= TSNMHD + 0x0700,
+	QMMC		= TSNMHD + 0x0704,
+	QRFDC		= TSNMHD + 0x0708,
+	QYFDC		= TSNMHD + 0x070c,
+	QVTCMC0		= TSNMHD + 0x0710,
+	QMCBSC0		= TSNMHD + 0x0750,
+	QMCIRC0		= TSNMHD + 0x0790,
+	QMEBSC0		= TSNMHD + 0x07d0,
+	QMEIRC0		= TSNMHD + 0x0710,
+	QMCFC		= TSNMHD + 0x0850,
+	QMEIS		= TSNMHD + 0x0860,
+	QMEIE		= TSNMHD + 0x0864,
+	QMEID		= TSNMHD + 0x086c,
+	QSMFC0		= TSNMHD + 0x0870,
+	QMSPPC0		= TSNMHD + 0x08b0,
+	QMSRPC0		= TSNMHD + 0x08f0,
+	QGPPC0		= TSNMHD + 0x0930,
+	QGRPC0		= TSNMHD + 0x0950,
+	QMDPC0		= TSNMHD + 0x0970,
+	QMGPC0		= TSNMHD + 0x09b0,
+	QMYPC0		= TSNMHD + 0x09f0,
+	QMRPC0		= TSNMHD + 0x0a30,
+	MQSTMACU	= TSNMHD + 0x0a70,
+	MQSTMACD	= TSNMHD + 0x0a74,
+	MQSTMAMU	= TSNMHD + 0x0a78,
+	MQSTMAMD	= TSNMHD + 0x0a7c,
+	MQSFTVL		= TSNMHD + 0x0a80,
+	MQSFTVLM	= TSNMHD + 0x0a84,
+	MQSFTMSD	= TSNMHD + 0x0a88,
+	MQSFTGMI	= TSNMHD + 0x0a8c,
+
+	CFCR0		= RMSO + 0x0800,
+	FMSCR		= RMSO + 0x0c10,
+
+	MMC		= RMRO + 0x0000,
+	MPSM		= RMRO + 0x0010,
+	MPIC		= RMRO + 0x0014,
+	MTFFC		= RMRO + 0x0020,
+	MTPFC		= RMRO + 0x0024,
+	MTATC0		= RMRO + 0x0040,
+	MRGC		= RMRO + 0x0080,
+	MRMAC0		= RMRO + 0x0084,
+	MRMAC1		= RMRO + 0x0088,
+	MRAFC		= RMRO + 0x008c,
+	MRSCE		= RMRO + 0x0090,
+	MRSCP		= RMRO + 0x0094,
+	MRSCC		= RMRO + 0x0098,
+	MRFSCE		= RMRO + 0x009c,
+	MRFSCP		= RMRO + 0x00a0,
+	MTRC		= RMRO + 0x00a4,
+	MPFC		= RMRO + 0x0100,
+	MLVC		= RMRO + 0x0340,
+	MEEEC		= RMRO + 0x0350,
+	MLBC		= RMRO + 0x0360,
+	MGMR		= RMRO + 0x0400,
+	MMPFTCT		= RMRO + 0x0410,
+	MAPFTCT		= RMRO + 0x0414,
+	MPFRCT		= RMRO + 0x0418,
+	MFCICT		= RMRO + 0x041c,
+	MEEECT		= RMRO + 0x0420,
+	MEIS		= RMRO + 0x0500,
+	MEIE		= RMRO + 0x0504,
+	MEID		= RMRO + 0x0508,
+	MMIS0		= RMRO + 0x0510,
+	MMIE0		= RMRO + 0x0514,
+	MMID0		= RMRO + 0x0518,
+	MMIS1		= RMRO + 0x0520,
+	MMIE1		= RMRO + 0x0524,
+	MMID1		= RMRO + 0x0528,
+	MMIS2		= RMRO + 0x0530,
+	MMIE2		= RMRO + 0x0534,
+	MMID2		= RMRO + 0x0538,
+	MXMS		= RMRO + 0x0600,
+
+};
+
+/* AXIBMI */
+#define RR_RATRR		BIT(0)
+#define RR_TATRR		BIT(1)
+#define RR_RST			(RR_RATRR | RR_TATRR)
+#define RR_RST_COMPLETE		0x03
+
+#define AXIWC_DEFAULT		0xffff
+#define AXIRC_DEFAULT		0xffff
+
+#define TATLS0_TEDE		BIT(1)
+#define TATLS0_TATEN_SHIFT	24
+#define TATLS0_TATEN(n)		((n) << TATLS0_TATEN_SHIFT)
+#define TATLR_TATL		BIT(31)
+
+#define RATLS0_RETS		BIT(2)
+#define RATLS0_REDE		BIT(3)
+#define RATLS0_RATEN_SHIFT	24
+#define RATLS0_RATEN(n)		((n) << RATLS0_RATEN_SHIFT)
+#define RATLR_RATL		BIT(31)
+
+#define DIE_DID_TDICX(n)	BIT((n))
+#define DIE_DID_RDICX(n)	BIT((n) + 8)
+#define TDIE_TDID_TDX(n)	BIT(n)
+#define RDIE_RDID_RDX(n)	BIT(n)
+#define TDIS_TDS(n)		BIT(n)
+#define RDIS_RDS(n)		BIT(n)
+
+/* MHD */
+#define OSR_OPS			0x07
+#define SWR_SWR			BIT(0)
+
+#define TGC1_TQTM_SFM		0xff00
+#define TGC1_STTV_DEFAULT	0x03
+
+#define TMS_MFS_MAX		0x2800
+
+/* RMAC System */
+#define CFCR_SDID(n)		((n) << 16)
+#define FMSCR_FMSIE(n)		((n) << 0)
+
+/* RMAC */
+#define MPIC_PIS_MASK		GENMASK(1, 0)
+#define MPIC_PIS_MII		0
+#define MPIC_PIS_RMII		0x01
+#define MPIC_PIS_GMII		0x02
+#define MPIC_PIS_RGMII		0x03
+#define MPIC_LSC_SHIFT		2
+#define MPIC_LSC_MASK		GENMASK(3, MPIC_LSC_SHIFT)
+#define MPIC_LSC_10M		(0 << MPIC_LSC_SHIFT)
+#define MPIC_LSC_100M		(0x01 << MPIC_LSC_SHIFT)
+#define MPIC_LSC_1G		(0x02 << MPIC_LSC_SHIFT)
+#define MPIC_PSMCS_SHIFT	16
+#define MPIC_PSMCS_MASK		GENMASK(21, MPIC_PSMCS_SHIFT)
+#define MPIC_PSMCS_DEFAULT	(0x0a << MPIC_PSMCS_SHIFT)
+#define MPIC_PSMHT_SHIFT	24
+#define MPIC_PSMHT_MASK		GENMASK(26, MPIC_PSMHT_SHIFT)
+#define MPIC_PSMHT_DEFAULT	(0x07 << MPIC_PSMHT_SHIFT)
+
+#define MLVC_PASE		BIT(8)
+#define MLVC_PSE		BIT(16)
+#define MLVC_PLV		BIT(17)
+
+#define MPSM_PSME		BIT(0)
+#define MPSM_PSMAD		BIT(1)
+#define MPSM_PDA_SHIFT		3
+#define MPSM_PDA_MASK		GENMASK(7, 3)
+#define MPSM_PDA(n)		(((n) << MPSM_PDA_SHIFT) & MPSM_PDA_MASK)
+#define MPSM_PRA_SHIFT		8
+#define MPSM_PRA_MASK		GENMASK(12, 8)
+#define MPSM_PRA(n)		(((n) << MPSM_PRA_SHIFT) & MPSM_PRA_MASK)
+#define MPSM_PRD_SHIFT		16
+#define MPSM_PRD_SET(n)		((n) << MPSM_PRD_SHIFT)
+#define MPSM_PRD_GET(n)		((n) >> MPSM_PRD_SHIFT)
+
+#define GPOUT_RDM		BIT(13)
+#define GPOUT_TDM		BIT(14)
+
+/* RTSN */
+#define RTSN_INTERVAL_US	1000
+#define RTSN_TIMEOUT_US		1000000
+
+#define TX_NUM_CHAINS		1
+#define RX_NUM_CHAINS		1
+
+#define TX_CHAIN_SIZE		1024
+#define RX_CHAIN_SIZE		1024
+
+#define TX_CHAIN_IDX		0
+#define RX_CHAIN_IDX		0
+
+#define TX_CHAIN_ADDR_OFFSET	(sizeof(struct rtsn_desc) * TX_CHAIN_IDX)
+#define RX_CHAIN_ADDR_OFFSET	(sizeof(struct rtsn_desc) * RX_CHAIN_IDX)
+
+#define PKT_BUF_SZ		1584
+#define RTSN_ALIGN		128
+
+enum rtsn_mode {
+	OCR_OPC_DISABLE,
+	OCR_OPC_CONFIG,
+	OCR_OPC_OPERATION,
+};
+
+/* Descriptors */
+enum RX_DS_CC_BIT {
+	RX_DS	= 0x0fff, /* Data size */
+	RX_TR	= 0x1000, /* Truncation indication */
+	RX_EI	= 0x2000, /* Error indication */
+	RX_PS	= 0xc000, /* Padding selection */
+};
+
+enum TX_FS_TAGL_BIT {
+	TX_DS	= 0x0fff, /* Data size */
+	TX_TAGL	= 0xf000, /* Frame tag LSBs */
+};
+
+enum DIE_DT {
+	/* HW/SW arbitration */
+	DT_FEMPTY_IS	= 0x10,
+	DT_FEMPTY_IC	= 0x20,
+	DT_FEMPTY_ND	= 0x30,
+	DT_FEMPTY	= 0x40,
+	DT_FEMPTY_START	= 0x50,
+	DT_FEMPTY_MID	= 0x60,
+	DT_FEMPTY_END	= 0x70,
+
+	/* Frame data */
+	DT_FSINGLE	= 0x80,
+	DT_FSTART	= 0x90,
+	DT_FMID		= 0xa0,
+	DT_FEND		= 0xb0,
+
+	/* Chain control */
+	DT_LEMPTY	= 0xc0,
+	DT_EEMPTY	= 0xd0,
+	DT_LINK		= 0xe0,
+	DT_EOS		= 0xf0,
+
+	DT_MASK		= 0xf0,
+	D_DIE		= 0x08,
+};
+
+struct rtsn_desc {
+	__le16 info_ds;
+	__u8 info;
+	u8 die_dt;
+	__le32 dptr;
+} __packed;
+
+struct rtsn_ts_desc {
+	__le16 info_ds;
+	__u8 info;
+	u8 die_dt;
+	__le32 dptr;
+	__le32 ts_nsec;
+	__le32 ts_sec;
+} __packed;
+
+struct rtsn_ext_desc {
+	__le16 info_ds;
+	__u8 info;
+	u8 die_dt;
+	__le32 dptr;
+	__le64 info1;
+} __packed;
+
+struct rtsn_ext_ts_desc {
+	__le16 info_ds;
+	__u8 info;
+	u8 die_dt;
+	__le32 dptr;
+	__le64 info1;
+	__le32 ts_nsec;
+	__le32 ts_sec;
+} __packed;
+
+enum EXT_INFO_DS_BIT {
+	TXC = 0x4000,
+};
+
+#endif
-- 
2.45.2


