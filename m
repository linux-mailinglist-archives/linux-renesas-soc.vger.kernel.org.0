Return-Path: <linux-renesas-soc+bounces-33453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pfs8B6w0H2rnigAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:53:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A435631907
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:53:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JRzVkt8V;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF0CA304DC94
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 19:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6EDE399D0B;
	Tue,  2 Jun 2026 19:50:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8308B376BDE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:50:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780429834; cv=none; b=skS8mNqFIFB51VII9g8dPrWIEmFmcobMtbPgPiFXQy9pwD76POBCS7UDUzZStsMcjy0tS5fyAkVqiLfDTWMR7dlfwbjrQjXwbP9Mu+7yC3fYHM5HRALQp6euNTuxvkWCdMVwm7qyJw8UqTYVQJwnJ8OsZyV1AuxT7QbSPt/inIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780429834; c=relaxed/simple;
	bh=EpaoxJ8zwFB0WCZejBbladr+DJQfg1uJ09DD6TE9TVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omQxh9KcJXNib7LV/NCIY/VflyWDIAZsktzmZsktZr2VhuEp4UcvGRqgyJ/s9vh/bz8qAAcQwwd1AxonN7HMyjcfCD8SVBXhJKE6YDux5GtgDKR3Fwv4gDNGjc75PT0krn7uEJ9xoQb1GfaE3O8fYM3US/QzgsUDZQXVWxQd7YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRzVkt8V; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso107265565e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780429830; x=1781034630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhiL05NURzUxz795FaolHtbabjNjkflQuVTqD7pgMHM=;
        b=JRzVkt8VbkdFdkxXXumyk4xcF40SgtxWl/zkZ/l8Nj1BeP3mHoiyVyHSA1CM/oytcU
         wsfvt/J8jnpcthDtuj3n9/0mMHUbjZrC7it1roKntfvUSUNlc27/q+C4VDwrcefQJoqZ
         WNXFO3B2j91mXEoBofxazvxyxgSjBNO0iojd2biYf8awje1SnbHS7gVlz/nCwe7pBIKh
         K70IGyTVKHQOJPR4/qzH/t2YswYBCF2/zQkb6RkxNpLVuKOhUs9bujZdenu4UawlQ3dv
         V9+r83N151j7Bpwj+HZIoOnKY6ItV60h4H6GtiM8q3oypkbGGMazMryw478J4Ltjh1wA
         vt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780429830; x=1781034630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uhiL05NURzUxz795FaolHtbabjNjkflQuVTqD7pgMHM=;
        b=hqOoq/LXH3tCABVJSdQMUI7hc/HjUyZM5E2RGxaaoKrVbB/xqbW0k1xtnoGnlHFCb0
         z1KA8zkeNf0x5dMNta8YKbgiDMLWMKPyTIrexVyfQfZ4GHZDi/ymYqWsKZ7qUJtOt1Vy
         +LBuIesqJ+PPEBnuUItHndZM7VJ3uA83AbTuFoZpM4uxHgrRZWPNklbx4hAEvVjVda56
         YgbvGQrNp9Ej1NdfRV8IUFxei4xIEse51IEbt4lsHJoqWVlb6CNx/hvLrVnetDVb8JPk
         9hT6idKOmbQUbDmNq6M1mrYdU+zRJ4I4tqLuVnC8117EHUEeR20H4kKbAbl0U7b7DAmo
         JX0g==
X-Gm-Message-State: AOJu0Ywvim8VCj1+MdEm1Wm2x5ZC8FR92clpaaFtrCXds3tHb6xYoSmj
	/++z6XSqupeT8jLj9Hnq/wpgURRkOHauXbjwUGiTiWXeD1zUQWNjsJj9
X-Gm-Gg: Acq92OFSM5s0M/o3Kty1VfAg9IXS9H10mAK0aNJSIgeX55SiJ4YJ/OAxzbaQel/F33I
	a7/7JYiNJfEFvJ3XReCJ1FmHDgsDIiN4gCp/kZc1wZ5dEI10EZnwVqgZgeiV8pqo4568ZayCgSE
	qYP+EI0v+6xBc83XTqD+hU1yt7YCwit52AZTwP2kJwI3JJ+qUFcH1Ad+o3pPxwzq/CtS9JfbJiX
	LB5sU27UQ2yCDXhQ9r4dLRDY/X8VO+PS7Ki7CpCG+ZKtlQ1Ms8kyYHq8Ahe4QHEfbJooFe4mt72
	ZtACjp+GfEBfIPrCzJCFQF/LvdLXrrHZW0fGgWGe7FT49bdVtXJR/6+C/PJXaXChLDz8rwHyZ+P
	xDrfNeuDlznLIeHGSY43RMzCWA34tgjFKfe2ygUfy0UGvQrN7ysYixjn9Ay6TzsoYalsUffsHWw
	jjCRP/svy5ClqaDcedK9skfKYe01VgRKNZSeQxBjM4FO3NiTqHjQYRZCzx8ABchGHoiOd0BdsMh
	O4rIk71HIzieFWp0jb6HUU9owegaHTKHsFqRe1GS7s3BUmL0pceF8FN
X-Received: by 2002:a05:600c:3150:b0:490:6889:202 with SMTP id 5b1f17b1804b1-490b5fe693fmr3522405e9.29.1780429826806;
        Tue, 02 Jun 2026 12:50:26 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e13eefsm87353395e9.2.2026.06.02.12.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:50:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 4/4] PCI: rzg3s-host: Add support for RZ/V2H(P) SoC
Date: Tue,  2 Jun 2026 20:50:19 +0100
Message-ID: <20260602195019.1798126-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602195019.1798126-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33453-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,google.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea.uj@bp.renesas.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,sysc_args.np:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A435631907

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RZ/V2H(P) SoC PCIe controllers to the rzg3s-host
driver.

The RZ/V2H(P) SoC features two independent PCIe controllers that share
four physical lanes. The hardware supports two configuration modes:
single x4 mode where the first controller uses all four lanes, or dual
x2 mode where both controllers use two lanes each.

Introduce a setup_lanes() function pointer to configure the PCIe lanes
based on the hardware instance. Implement rzv2h_pcie_setup_lanes() to
detect the configuration at boot time and program the lane mode via the
system controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v3->v4:
- In rzv2h_pcie_setup_lanes() returned early in case of error
- Added RB/TB tags

v2->v3:
- Parsed controller-id from the "renesas,sysc" property instead of
  using linux,pci-domain.

v1->v2:
- Updated commit message.
- Added locks to protect shared lane configuration state and
  prevent concurrent access issues during probe.
- Added cleanup action to release lanes on driver removal.
- Reconfigured RZG3S_SYSC_FUNC_ID_LINK_MASTER in resume path.
- Renamed num_channels to num_pcie_controllers for clarity.
---
 drivers/pci/controller/pcie-rzg3s-host.c | 181 +++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index edb49af7429a..8187a822a0f8 100644
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
  * @sysc_info: System Controller info for each controller
  * @num_power_resets: number of power resets
  * @num_cfg_resets: number of configuration resets
+ * @num_pcie_controllers: number of PCIe controllers
  */
 struct rzg3s_pcie_soc_data {
 	int (*init_phy)(struct rzg3s_pcie_host *host);
 	void (*config_pre_init)(struct rzg3s_pcie_host *host);
 	int (*config_post_init)(struct rzg3s_pcie_host *host);
 	int (*config_deinit)(struct rzg3s_pcie_host *host);
+	int (*setup_lanes)(struct rzg3s_pcie_host *host);
 	const char * const *power_resets;
 	const char * const *cfg_resets;
 	struct rzg3s_sysc_info sysc_info[RZG3S_PCIE_CONTROLLER_ID_MAX];
 	u8 num_power_resets;
 	u8 num_cfg_resets;
+	u8 num_pcie_controllers;
 };
 
 /**
@@ -309,6 +325,7 @@ struct rzg3s_pcie_port {
  * @intx_irqs: INTx interrupts
  * @max_link_speed: maximum supported link speed
  * @controller_id: PCIe controller identifier, used for System Controller access
+ * @num_lanes: The number of lanes
  */
 struct rzg3s_pcie_host {
 	void __iomem *axi;
@@ -325,10 +342,23 @@ struct rzg3s_pcie_host {
 	int intx_irqs[PCI_NUM_INTX];
 	int max_link_speed;
 	enum rzg3s_pcie_controller_id controller_id;
+	u8 num_lanes;
 };
 
 #define rzg3s_msi_to_host(_msi)	container_of(_msi, struct rzg3s_pcie_host, msi)
 
+/*
+ * RZ/V2H(P) supports a total of 4 lanes shared across two controllers.
+ * rzv2h_lane_lock serialises both the counter update and the SYSC
+ * register write so that concurrent async probes cannot race on the
+ * shared LINK_MASTER register (offset 0x1060).
+ * rzv2h_num_total_lanes tracks global lane usage to prevent
+ * over-allocation or invalid bifurcation modes.
+ */
+#define RZV2H_PCIE_MAX_LANES		4
+static DEFINE_SPINLOCK(rzv2h_lane_lock);
+static u8 rzv2h_num_total_lanes;
+
 static int rzg3s_sysc_config_func(struct rzg3s_sysc *sysc,
 				  enum rzg3s_sysc_func_id fid, u32 val)
 {
@@ -1155,6 +1185,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
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
 
@@ -1687,6 +1724,76 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
 	return ret;
 }
 
+static int rzg3s_pcie_get_controller_id(struct rzg3s_pcie_host *host)
+{
+	struct device_node *np = host->dev->of_node;
+	struct of_phandle_args sysc_args;
+	int ret;
+
+	if (host->data->num_pcie_controllers == 1)
+		return 0;
+
+	ret = of_parse_phandle_with_fixed_args(np, "renesas,sysc", 1, 0, &sysc_args);
+	if (ret)
+		return ret;
+
+	of_node_put(sysc_args.np);
+
+	if (sysc_args.args[0] >= host->data->num_pcie_controllers ||
+	    sysc_args.args[0] >= RZG3S_PCIE_CONTROLLER_ID_MAX)
+		return -EINVAL;
+
+	host->controller_id = sysc_args.args[0];
+
+	return 0;
+}
+
+static int rzv2h_pcie_setup_lanes(struct rzg3s_pcie_host *host)
+{
+	struct device_node *np = host->dev->of_node;
+	u32 num_lanes;
+	int ret;
+
+	ret = of_property_read_u32(np, "num-lanes", &num_lanes);
+	if (ret)
+		return ret;
+
+	/*
+	 * RZ/V2H(P) supports up to 4 lanes, but only in single x4 mode
+	 * for the first controller. Dual x2 mode is supported with 2
+	 * lanes for both controllers.
+	 */
+	if (num_lanes != 4 && num_lanes != 2)
+		return -EINVAL;
+
+	if (host->controller_id == RZG3S_PCIE_CONTROLLER_ID_1 && num_lanes > 2)
+		return -EINVAL;
+
+	guard(spinlock)(&rzv2h_lane_lock);
+	if (rzv2h_num_total_lanes + num_lanes > RZV2H_PCIE_MAX_LANES)
+		return -EINVAL;
+
+	ret = rzg3s_sysc_config_func(host->sysc, RZG3S_SYSC_FUNC_ID_LINK_MASTER,
+				     num_lanes == 2 ?
+				     RZG3S_SYSC_LINK_MODE_DUAL_X2 :
+				     RZG3S_SYSC_LINK_MODE_SINGLE_X4);
+	if (ret)
+		return ret;
+
+	rzv2h_num_total_lanes += num_lanes;
+	host->num_lanes = num_lanes;
+
+	return 0;
+}
+
+static void rzv2h_pcie_release_lanes(void *data)
+{
+	struct rzg3s_pcie_host *host = data;
+
+	guard(spinlock)(&rzv2h_lane_lock);
+	rzv2h_num_total_lanes -= host->num_lanes;
+}
+
 static int rzg3s_pcie_probe(struct platform_device *pdev)
 {
 	struct pci_host_bridge *bridge;
@@ -1711,6 +1818,10 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	if (!host->sysc)
 		return -ENOMEM;
 
+	ret = rzg3s_pcie_get_controller_id(host);
+	if (ret)
+		return ret;
+
 	sysc = host->sysc;
 	sysc->info = &host->data->sysc_info[host->controller_id];
 
@@ -1740,6 +1851,16 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		goto port_refclk_put;
 
+	if (host->data->setup_lanes) {
+		ret = host->data->setup_lanes(host);
+		if (ret)
+			goto sysc_signal_restore;
+
+		ret = devm_add_action_or_reset(dev, rzv2h_pcie_release_lanes, host);
+		if (ret)
+			goto sysc_signal_restore;
+	}
+
 	ret = rzg3s_pcie_resets_prepare_and_get(host);
 	if (ret)
 		goto sysc_signal_restore;
@@ -1854,6 +1975,16 @@ static int rzg3s_pcie_resume_noirq(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (host->num_lanes) {
+		ret = rzg3s_sysc_config_func(host->sysc,
+					     RZG3S_SYSC_FUNC_ID_LINK_MASTER,
+					     host->num_lanes == 2  ?
+					     RZG3S_SYSC_LINK_MODE_DUAL_X2 :
+					     RZG3S_SYSC_LINK_MODE_SINGLE_X4);
+		if (ret)
+			goto assert_rst_rsm_b;
+	}
+
 	ret = rzg3s_pcie_power_resets_deassert(host);
 	if (ret)
 		goto assert_rst_rsm_b;
@@ -1901,6 +2032,7 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	.num_power_resets = ARRAY_SIZE(rzg3s_soc_power_resets),
 	.cfg_resets = rzg3s_soc_cfg_resets,
 	.num_cfg_resets = ARRAY_SIZE(rzg3s_soc_cfg_resets),
+	.num_pcie_controllers = 1,
 	.config_post_init = rzg3s_pcie_config_post_init,
 	.config_deinit = rzg3s_pcie_config_deinit,
 	.init_phy = rzg3s_soc_pcie_init_phy,
@@ -1921,6 +2053,7 @@ static const char * const rzg3e_soc_power_resets[] = { "aresetn" };
 static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
 	.power_resets = rzg3e_soc_power_resets,
 	.num_power_resets = ARRAY_SIZE(rzg3e_soc_power_resets),
+	.num_pcie_controllers = 1,
 	.config_pre_init = rzg3e_pcie_config_pre_init,
 	.config_post_init = rzg3e_pcie_config_post_init,
 	.config_deinit = rzg3e_pcie_config_deinit,
@@ -1940,6 +2073,50 @@ static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
 	},
 };
 
+static const struct rzg3s_pcie_soc_data rzv2h_soc_data = {
+	.power_resets = rzg3e_soc_power_resets,
+	.num_power_resets = ARRAY_SIZE(rzg3e_soc_power_resets),
+	.num_pcie_controllers = 2,
+	.config_pre_init = rzg3e_pcie_config_pre_init,
+	.config_post_init = rzg3e_pcie_config_post_init,
+	.config_deinit = rzg3e_pcie_config_deinit,
+	.setup_lanes = rzv2h_pcie_setup_lanes,
+	.sysc_info = {
+		[RZG3S_PCIE_CONTROLLER_ID_0] = {
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
+		[RZG3S_PCIE_CONTROLLER_ID_1] = {
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
@@ -1949,6 +2126,10 @@ static const struct of_device_id rzg3s_pcie_of_match[] = {
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
2.54.0


