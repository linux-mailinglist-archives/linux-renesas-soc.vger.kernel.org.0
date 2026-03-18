Return-Path: <linux-renesas-soc+bounces-29770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDdwJISeumngZgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:45:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A5E2BBC39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1930930027E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A669B3D8109;
	Wed, 18 Mar 2026 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lqmas3KB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C773D75B9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837922; cv=none; b=mKJ6IEVU8bBBDkXqvlaqHYNw7ImiJA0GjPP/7/4kQqCJDrsToGaBl8ydRhjCls6W0WPB1WNERolSI8BFwe9XwMSChWWz2Biamx7lC8KaZZYKYqKi9G4zqZ3xgB2BdYeJpogbkdQtSDvDLqc5AVPrJ614QoUDSti1RUOU/xTC2IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837922; c=relaxed/simple;
	bh=RjHl7j/Lg5vZPB4YXi7xN2rOYCqftOPO41V9TjL/Piw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPeXlbgWFSdpqbtiBVcLqU8N+9lYkxrybwTE4pBiM09uzygkgctmWmrM1UXizcHNICY68nGXTpQLJpgBqqyJqQ617whVNBgrt0dthT8upe/CecS+kh5zscPhPS7f3JLWn6xPeCbHUMJMA33HTaFemgSkAITF9zVTgpOvj3mIqnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lqmas3KB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439c56e822eso7087871f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773837913; x=1774442713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2beXNldnnMW0fC5Mifqd0YZdlJwrApukwctaOe5qsiI=;
        b=Lqmas3KBg/R7DZ50IkY6cNDr0fR+hTLq+KlfGmy0CfwFM08gZVoS2REHTMuZcylBAC
         wYq21G5yCkZQuiQl0WAO0FHBztcVExohLhT7RIeDGR93rSyqbrCaSBtYLqZJR99zwvo8
         YPWsjBk8ze27yBeSiMKHeyjl3jWGQaGurz9pyfuANf8/MO6+jZiuy4996MyLAGD5+1pv
         4GllsZ5VgoES7ZBcqpoafNtAvt22TjGFnL39jwakj+iXYSpvJMw5rR7e9E/4GgtuhuQz
         hfgPiVBiC9YOIT/ZYww0Dayxc/M1DsaLmbbQuU80vWutE+GETbi4vrXyaZpWQHl/k3NH
         Nk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837913; x=1774442713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2beXNldnnMW0fC5Mifqd0YZdlJwrApukwctaOe5qsiI=;
        b=W/1Qfbl8JbyGxnDexiRFJYak7JP7SSr87ccNTFmy40VebZ3lurtBGhWQyczaSKd8e/
         jB62l4l9A+NdyjK5+iDxup/4Ia8LdwwssB/0I2GbNcZ4REghtuR0FFHB+Rf0WTtWH0mW
         untvaJv9Sqw4lnyfmoh1WPFCimYL41bQjXhupAXhgN91jLt30WXKjJ+MzkVx8s9j4Do0
         sW2ntfnxlco+hUf2y0u6MOryBCsEtG+qeDCiZGYgMOc999Nm5lCq85CnYGniAPNJEVIT
         fBcbg4wZhGG6WgjO73xDpZnypPLYmKEU/Cui8PGlCsqoaz+OmwwQe41QVmrjW3gglFWH
         wF6g==
X-Forwarded-Encrypted: i=1; AJvYcCWHlzX6evVuYM7UNcXf8hgU7l9HAdAf2sp+Sg+BxwbFiM4Q4ijUJASuu1PnTAHaRsFjVoi5GMd/msmCD6XOdY4AXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdQ4VWjo39QhY/sScyfL8XSPngW3k9aZVoe7GrDLS7q15mMXV2
	3G1pwdGbVMhldNKDH57pEZ8lKqrciFnzBy0T7AYRKmrRp4XiH4HWFZpo
X-Gm-Gg: ATEYQzyOnzmKODlINzvMEKEbcY7NoarEzmMhPw1RrCr9Nx8kqyK8Tfhr0ZFlxWdE1v8
	2ge9MseC0VBctzohFqLBBAALZtiyORZl4AMOrEFiZac3f01+ViJ2PkF+UQMxFwi9WWEpD3aNtas
	M1HvkL36Oi3c/dKXr5pMteKSi9fq3IoyxH22lTdhDFiInXCnPep4+/o5yASa9BiWI1UaeCf0uvL
	y3OzuTPUiocFjNgEk0L1Ebsr4F61+L24rDiK6XoPa6ESw4a0bmdKsndjuSfVysEG4XX2N0r+yqo
	riR4uil+g6DaBdzcQUI3q35U2RnjLicxfTxZDsvSo4Q7ZCJ9mcULcc0MBpz/HpzdFVtyn/LdZpm
	/Pg+V5cbP57Z9xAgViw368mae+TEyFmLa3uGfQnBUEmJujvfFwcta/XyBs+47fU09ZUJy+CpKLu
	oG6S4Qw2jLrVrTmrTeKXFGBZdLmC2034BEVXL5X52LDm/vdS3th7L8AOsGXWRNcwStp2OQOGLmP
	uX87MaM6Zsd/1WiV9Y2C3dFeSZ6ErxmpUJEwGmmVHXHURA=
X-Received: by 2002:a05:6000:26cc:b0:43b:4921:8745 with SMTP id ffacd0b85a97d-43b527aa3f5mr5799725f8f.21.1773837912986;
        Wed, 18 Mar 2026 05:45:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5f14:a98b:b4be:efbd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b518985f6sm7888162f8f.25.2026.03.18.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:45:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
Date: Wed, 18 Mar 2026 12:44:50 +0000
Message-ID: <20260318124450.163471-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260318124450.163471-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29770-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,google.com,kernel.org,pengutronix.de,glider.be,gmail.com,sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 47A5E2BBC39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RZ/V2H(P) SoC PCIe controller to the rzg3s-host
driver.

The RZ/V2H(P) SoC features two independent PCIe channels that share
physical lanes. The hardware supports two configuration modes: single
x4 mode where one controller uses all four lanes, or dual x2 mode
where both controllers use two lanes each.

Introduce configure_lanes() function pointer to configure the PCIe
lanes based on the number of channels enabled. Implement
rzv2h_pcie_configure_lanes() to detect the active PCIe channels at
boot time and program the lane mode via the system controller using
the new RZG3S_SYSC_FUNC_ID_LINK_MASTER function ID.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 142 +++++++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index a629e861bbd0..d1bf1e750d9b 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -179,6 +179,16 @@
 /* Timeouts experimentally determined */
 #define RZG3S_REQ_ISSUE_TIMEOUT_US		2500
 
+/**
+ * enum rzg3s_sysc_link_mode - PCIe link configuration modes
+ * @RZG3S_SYSC_LINK_MODE_SINGLE_X4: Single port with x4 lanes
+ * @RZG3S_SYSC_LINK_MODE_DUAL_X2: Dual ports with x2 lanes each
+ */
+enum rzg3s_sysc_link_mode {
+	RZG3S_SYSC_LINK_MODE_SINGLE_X4 = 1,
+	RZG3S_SYSC_LINK_MODE_DUAL_X2 = 3,
+};
+
 /**
  * struct rzg3s_sysc_function - System Controller function descriptor
  * @offset: Register offset from the System Controller base address
@@ -194,12 +204,14 @@ struct rzg3s_sysc_function {
  * @RZG3S_SYSC_FUNC_ID_RST_RSM_B: RST_RSM_B SYSC function ID
  * @RZG3S_SYSC_FUNC_ID_L1_ALLOW: L1 allow SYSC function ID
  * @RZG3S_SYSC_FUNC_ID_MODE: Mode SYSC function ID
+ * @RZG3S_SYSC_FUNC_ID_LINK_MASTER: Link master SYSC function ID
  * @RZG3S_SYSC_FUNC_ID_MAX: Max SYSC function ID
  */
 enum rzg3s_sysc_func_id {
 	RZG3S_SYSC_FUNC_ID_RST_RSM_B,
 	RZG3S_SYSC_FUNC_ID_L1_ALLOW,
 	RZG3S_SYSC_FUNC_ID_MODE,
+	RZG3S_SYSC_FUNC_ID_LINK_MASTER,
 	RZG3S_SYSC_FUNC_ID_MAX,
 };
 
@@ -261,6 +273,7 @@ struct rzg3s_pcie_host;
  * @config_pre_init: Optional callback for SoC-specific pre-configuration
  * @config_post_init: Callback for SoC-specific post-configuration
  * @config_deinit: Callback for SoC-specific de-initialization
+ * @setup_lanes: Callback for setting up the number of lanes
  * @power_resets: array with the resets that need to be de-asserted after
  *                power-on
  * @cfg_resets: array with the resets that need to be de-asserted after
@@ -268,17 +281,20 @@ struct rzg3s_pcie_host;
  * @sysc_info: System Controller info for each PCIe channel
  * @num_power_resets: number of power resets
  * @num_cfg_resets: number of configuration resets
+ * @num_channels: number of PCIe channels
  */
 struct rzg3s_pcie_soc_data {
 	int (*init_phy)(struct rzg3s_pcie_host *host);
 	void (*config_pre_init)(struct rzg3s_pcie_host *host);
 	int (*config_post_init)(struct rzg3s_pcie_host *host);
 	int (*config_deinit)(struct rzg3s_pcie_host *host);
+	int (*setup_lanes)(struct rzg3s_pcie_host *host);
 	const char * const *power_resets;
 	const char * const *cfg_resets;
 	struct rzg3s_sysc_info sysc_info[RZG3S_PCIE_CHANNEL_ID_MAX];
 	u8 num_power_resets;
 	u8 num_cfg_resets;
+	u8 num_channels;
 };
 
 /**
@@ -309,6 +325,7 @@ struct rzg3s_pcie_port {
  * @intx_irqs: INTx interrupts
  * @max_link_speed: maximum supported link speed
  * @channel_id: PCIe channel identifier, used for System Controller access
+ * @num_lanes: The number of lanes
  */
 struct rzg3s_pcie_host {
 	void __iomem *axi;
@@ -325,6 +342,7 @@ struct rzg3s_pcie_host {
 	int intx_irqs[PCI_NUM_INTX];
 	int max_link_speed;
 	enum rzg3s_pcie_channel_id channel_id;
+	u8 num_lanes;
 };
 
 #define rzg3s_msi_to_host(_msi)	container_of(_msi, struct rzg3s_pcie_host, msi)
@@ -1155,6 +1173,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
 	rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
 			       field_prep(mask, PCI_CLASS_BRIDGE_PCI_NORMAL));
 
+	if (host->num_lanes) {
+		rzg3s_pcie_update_bits(host->pcie + RZG3S_PCI_CFG_PCIEC,
+				       PCI_EXP_LNKCAP, PCI_EXP_LNKCAP_MLW,
+				       FIELD_PREP(PCI_EXP_LNKCAP_MLW,
+						  host->num_lanes));
+	}
+
 	/* Disable access control to the CFGU */
 	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
 
@@ -1687,6 +1712,63 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
 	return ret;
 }
 
+static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
+{
+	struct device_node *np = host->dev->of_node;
+	u32 domain;
+	int ret;
+
+	if (host->data->num_channels == 1)
+		return 0;
+
+	ret = of_property_read_u32(np, "linux,pci-domain", &domain);
+	if (ret)
+		return ret;
+
+	if (domain >= host->data->num_channels)
+		return -EINVAL;
+
+	host->channel_id = domain;
+
+	return 0;
+}
+
+static int rzv2h_pcie_setup_lanes(struct rzg3s_pcie_host *host)
+{
+	struct device_node *np = host->dev->of_node;
+	static u8 rzv2h_num_total_lanes;
+	u32 num_lanes;
+	int ret;
+
+	ret = of_property_read_u32(np, "num-lanes", &num_lanes);
+	if (ret)
+		return ret;
+
+	/*
+	 * RZ/V2H(P) supports up to 4 lanes, but only in single x4 mode.
+	 * Dual x2 mode is only supported with 2 total lanes. Validate
+	 * the configuration to avoid conflicts with other host, if any.
+	 */
+	if (num_lanes != 4 && num_lanes != 2)
+		return -EINVAL;
+
+	if (rzv2h_num_total_lanes == 2 && num_lanes != 2)
+		return -EINVAL;
+
+	if (rzv2h_num_total_lanes == 4)
+		return -EINVAL;
+
+	rzv2h_num_total_lanes += num_lanes;
+
+	host->num_lanes = num_lanes;
+
+	return rzg3s_sysc_config_func(host->sysc,
+				      RZG3S_SYSC_FUNC_ID_LINK_MASTER,
+				      num_lanes == 2 ?
+				      RZG3S_SYSC_LINK_MODE_DUAL_X2 :
+				      RZG3S_SYSC_LINK_MODE_SINGLE_X4);
+}
+
 static int rzg3s_pcie_probe(struct platform_device *pdev)
 {
 	struct pci_host_bridge *bridge;
@@ -1711,6 +1793,10 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	if (!host->sysc)
 		return -ENOMEM;
 
+	ret = rzg3s_pcie_get_controller_id(host);
+	if (ret)
+		return ret;
+
 	sysc = host->sysc;
 	sysc->info = &host->data->sysc_info[host->channel_id];
 
@@ -1740,6 +1826,12 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		goto port_refclk_put;
 
+	if (host->data->setup_lanes) {
+		ret = host->data->setup_lanes(host);
+		if (ret)
+			goto sysc_signal_restore;
+	}
+
 	ret = rzg3s_pcie_resets_prepare_and_get(host);
 	if (ret)
 		goto sysc_signal_restore;
@@ -1901,6 +1993,7 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	.num_power_resets = ARRAY_SIZE(rzg3s_soc_power_resets),
 	.cfg_resets = rzg3s_soc_cfg_resets,
 	.num_cfg_resets = ARRAY_SIZE(rzg3s_soc_cfg_resets),
+	.num_channels = 1,
 	.config_post_init = rzg3s_pcie_config_post_init,
 	.config_deinit = rzg3s_pcie_config_deinit,
 	.init_phy = rzg3s_soc_pcie_init_phy,
@@ -1921,6 +2014,7 @@ static const char * const rzg3e_soc_power_resets[] = { "aresetn" };
 static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
 	.power_resets = rzg3e_soc_power_resets,
 	.num_power_resets = ARRAY_SIZE(rzg3e_soc_power_resets),
+	.num_channels = 1,
 	.config_pre_init = rzg3e_pcie_config_pre_init,
 	.config_post_init = rzg3e_pcie_config_post_init,
 	.config_deinit = rzg3e_pcie_config_deinit,
@@ -1940,6 +2034,50 @@ static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
 	},
 };
 
+static const struct rzg3s_pcie_soc_data rzv2h_soc_data = {
+	.power_resets = rzg3e_soc_power_resets,
+	.num_power_resets = ARRAY_SIZE(rzg3e_soc_power_resets),
+	.num_channels = 2,
+	.config_pre_init = rzg3e_pcie_config_pre_init,
+	.config_post_init = rzg3e_pcie_config_post_init,
+	.config_deinit = rzg3e_pcie_config_deinit,
+	.setup_lanes = rzv2h_pcie_setup_lanes,
+	.sysc_info = {
+		[RZG3S_PCIE_CHANNEL_ID_0] = {
+			.functions = {
+				[RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
+					.offset = 0x1020,
+					.mask = BIT(0),
+				},
+				[RZG3S_SYSC_FUNC_ID_MODE] = {
+					.offset = 0x1024,
+					.mask = BIT(0),
+				},
+				[RZG3S_SYSC_FUNC_ID_LINK_MASTER] = {
+					.offset = 0x1060,
+					.mask = GENMASK(9, 8),
+				},
+			},
+		},
+		[RZG3S_PCIE_CHANNEL_ID_1] = {
+			.functions = {
+				[RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
+					.offset = 0x1050,
+					.mask = BIT(0),
+				},
+				[RZG3S_SYSC_FUNC_ID_MODE] = {
+					.offset = 0x1054,
+					.mask = BIT(0),
+				},
+				[RZG3S_SYSC_FUNC_ID_LINK_MASTER] = {
+					.offset = 0x1060,
+					.mask = GENMASK(9, 8),
+				},
+			},
+		},
+	},
+};
+
 static const struct of_device_id rzg3s_pcie_of_match[] = {
 	{
 		.compatible = "renesas,r9a08g045-pcie",
@@ -1949,6 +2087,10 @@ static const struct of_device_id rzg3s_pcie_of_match[] = {
 		.compatible = "renesas,r9a09g047-pcie",
 		.data = &rzg3e_soc_data,
 	},
+	{
+		.compatible = "renesas,r9a09g057-pcie",
+		.data = &rzv2h_soc_data,
+	},
 	{}
 };
 
-- 
2.53.0


