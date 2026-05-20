Return-Path: <linux-renesas-soc+bounces-32884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCZkDPjzDWoF5AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 19:48:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C082B594A17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 19:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 697C73524897
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 16:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273F53D47D3;
	Wed, 20 May 2026 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfqOhvwa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA17D3630AF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 16:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295757; cv=none; b=VcKI+dfiH+NXjQEorZc7FSlxV8KifvjYyQXxyw7A5w+ovzaa78Fkm4cfKcB/seTDW4SFoXMvIXu6+6g5RkkELaey2UTZkOgziZfMEct8gy3ga1jeC3ZganJyk0Xvb/i085N6xCadPO94v0R88gzh1vP+BNjW4aIsAi4p4h4rOAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295757; c=relaxed/simple;
	bh=IffwwzS6mxt9E+MupQMia2lUc0CzJ/JnFkty4R2zCW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuGiSmgKyZT3626A9t+JkeRlQtULgrYcq2IhDFv0/cO2jmrKpNOHlFpCktG/zpD+htmyCIZ/Vj08LwZydwh3iJhS48j1yIRICx4aMmMHm7pYvsZCkve8VnIx1kCZsudBVxIXTTJ7TzbMoY77Fl/jjADW9FIvcnfp/PsXTbSkkYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfqOhvwa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d146705b4so56833175e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779295754; x=1779900554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiT4GoPWpBPCpjw1giXUMYXIVEB55hR/7Bfzyfrs5eA=;
        b=VfqOhvwaYZ5nbTtqH9+QVNvTMfOCcRSRbtBVcBCStB/h1ef9Rf/7gjbtTQkkWzYhpu
         kbgvzobzgzM7LIC/mRLatc+lsnBqTLsSrsFZ7ShQ9mImOL1wYhvL9Ce5oSxFdR048e5T
         gkvjyJKwy4jvlFXdiT1I52VpuPq2a4x3ANZRgqQlM0qTiIY3YKZEW+lE/hhZhpogOXvU
         EPCXX1UzDhTIToCgwf4/eXkS1Ew0HHmke7uNDrclRAaVaHtavjmxNO4LIbZzhYP70ia+
         mFIkxl0C+ydNBfenUW5g3GAV/Rb9gEBD4L7KsE7NEHdw0zBPWsKE4q73lPeoSkbWh18k
         CMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779295754; x=1779900554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GiT4GoPWpBPCpjw1giXUMYXIVEB55hR/7Bfzyfrs5eA=;
        b=VIZZhi9hwU/7Ld6hi+CJiwye9Rja+k4glhBVcFFyu/Q8QlvnUH4Lgt67+lgDHBSEHq
         rUnwswGB1vwiD6pnm2Jka6txX+4n+Qhe6VSx+AaGfRjKJaHyyaRJE9s9vHO0iWxdP46j
         kzOCnJYXYHy+mtNwwVhpa0sQCA9B5EiELHBTWzO/7+WyklZNigan5EWkXiYRHpXzvggk
         o7wqYtdAEG0ivMOPbHsYBetMvm8sKCTd2fiJs/lhnPWuBOncz7kiTZRo+5PsrWFXPdSk
         3IC6h2QZhxsU7aY0LsK2geRT1/PNQ2V82Ja0SaK9JlK/K777x9LzNg6AOnNAqLpmclLK
         Up4w==
X-Forwarded-Encrypted: i=1; AFNElJ/JyhycbYKGK+LtAZVHVAZ6TMwVMtKJR5h3C2wn/mhvrZRAki985TN/o22F+IKH1lY/f57rhZaKzjOyeRKZ4Xai6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2V4womLGfv0KUq4BUIXB2hi7b8u2WTJGkrH7EviEho1cSll+I
	UQnWLD3rJ5rFVIi6UBTq9AqUvVt2wm6mZ7L+egzkU9L/cmKtCBVoEMqs
X-Gm-Gg: Acq92OEPzW5CvkttAF+rSRJoWQTFZ/LoUdTnoXLaPlMcrTWCzdbJtt+31v5R2+JRpZm
	0H5IaAb/2BM3PCu9BsKs2j77Oe7DwP/vmowHeBP5nliamCO+5VSbOFB+7mtvJ6BckXbZpy8T2/E
	IAiLE0iBdhiVqq+NdBiekX14vUD7gQ9RG5DqcH+FkY1oh/xl5mspDqKaodvhYa/LdPLpsfOJrRK
	GlYNV/CllrblpAi0+EiITOiQlZr7jHq1SydDPugAYgLUuhHXNunQlWRthyl+7hflgrjEWbkfhRz
	VpHNyktxrkCqpULHcjfJvq7LcCri1YUg6rTINGc+/yhVKzAOrALmoGfu26KIb8e+1Ba7oPOe4yb
	KorBa2eg4xRuftr+j44M2Z0mjuTuSQdUYEbUOvlCOydDPjHtTb7jy92T3FK0rPuCKvVeeXCY1B+
	7JNt97TNcZW4S3AhFNjRVsZquEdZczhtfoEFGvc21D0RPG+2wbu8yFVP9O0J8AdqdBiW+IkO68+
	MNI4s55DXRsbg9FglWBKVWFbWNizAp00p9Lq6Eeu2tsYoptgoQ3BBX2RQ==
X-Received: by 2002:a05:600c:4692:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48fe632579dmr384304235e9.20.1779295753642;
        Wed, 20 May 2026 09:49:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e71dsm3110285e9.9.2026.05.20.09.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:49:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/4] PCI: rzg3s-host: Prepare System Controller handling for multiple controllers
Date: Wed, 20 May 2026 17:48:22 +0100
Message-ID: <20260520164823.436992-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32884-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,google.com,pengutronix.de,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C082B594A17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver to handle multiple PCIe controllers with distinct
System Controller (SYSC) register sets, as required by RZ/V2H(P). The
current design stores a single sysc_info structure per SoC, which is
insufficient for multi-controller configurations.

Introduce controller identifiers and extend struct rzg3s_pcie_soc_data
to hold a sysc_info array indexed per PCIe controller. Add a
controller_id field to struct rzg3s_pcie_host and select the appropriate
System Controller information during probe based on the hardware
instance.

Keep existing single-controller SoCs functionally unchanged while
preparing the driver for RZ/V2H(P) multi-controller support.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change.

v1->v2:
- Renamed RZG3S_PCIE_CHANNEL_ID* to RZG3S_PCIE_CONTROLLER_ID* for clarity.
- Updated commit message.
---
 drivers/pci/controller/pcie-rzg3s-host.c | 48 ++++++++++++++++--------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index a5192e4b58df..edb49af7429a 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -241,6 +241,18 @@ struct rzg3s_pcie_msi {
 	int irq;
 };
 
+/**
+ * enum rzg3s_pcie_controller_id - RZ/G3S PCIe controller IDs
+ * @RZG3S_PCIE_CONTROLLER_ID_0: PCIe controller 0
+ * @RZG3S_PCIE_CONTROLLER_ID_1: PCIe controller 1
+ * @RZG3S_PCIE_CONTROLLER_ID_MAX: Max PCIe controllers
+ */
+enum rzg3s_pcie_controller_id {
+	RZG3S_PCIE_CONTROLLER_ID_0,
+	RZG3S_PCIE_CONTROLLER_ID_1,
+	RZG3S_PCIE_CONTROLLER_ID_MAX,
+};
+
 struct rzg3s_pcie_host;
 
 /**
@@ -253,7 +265,7 @@ struct rzg3s_pcie_host;
  *                power-on
  * @cfg_resets: array with the resets that need to be de-asserted after
  *              configuration
- * @sysc_info: SYSC info
+ * @sysc_info: System Controller info for each controller
  * @num_power_resets: number of power resets
  * @num_cfg_resets: number of configuration resets
  */
@@ -264,7 +276,7 @@ struct rzg3s_pcie_soc_data {
 	int (*config_deinit)(struct rzg3s_pcie_host *host);
 	const char * const *power_resets;
 	const char * const *cfg_resets;
-	struct rzg3s_sysc_info sysc_info;
+	struct rzg3s_sysc_info sysc_info[RZG3S_PCIE_CONTROLLER_ID_MAX];
 	u8 num_power_resets;
 	u8 num_cfg_resets;
 };
@@ -296,6 +308,7 @@ struct rzg3s_pcie_port {
  * @hw_lock: lock for access to the HW resources
  * @intx_irqs: INTx interrupts
  * @max_link_speed: maximum supported link speed
+ * @controller_id: PCIe controller identifier, used for System Controller access
  */
 struct rzg3s_pcie_host {
 	void __iomem *axi;
@@ -311,6 +324,7 @@ struct rzg3s_pcie_host {
 	raw_spinlock_t hw_lock;
 	int intx_irqs[PCI_NUM_INTX];
 	int max_link_speed;
+	enum rzg3s_pcie_controller_id controller_id;
 };
 
 #define rzg3s_msi_to_host(_msi)	container_of(_msi, struct rzg3s_pcie_host, msi)
@@ -1698,7 +1712,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sysc = host->sysc;
-	sysc->info = &host->data->sysc_info;
+	sysc->info = &host->data->sysc_info[host->controller_id];
 
 	host->axi = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->axi))
@@ -1891,10 +1905,12 @@ static const struct rzg3s_pcie_soc_data rzg3s_soc_data = {
 	.config_deinit = rzg3s_pcie_config_deinit,
 	.init_phy = rzg3s_soc_pcie_init_phy,
 	.sysc_info = {
-		.functions = {
-			[RZG3S_SYSC_FUNC_ID_RST_RSM_B] = {
-				.offset = 0xd74,
-				.mask = BIT(0),
+		[RZG3S_PCIE_CONTROLLER_ID_0] = {
+			.functions = {
+				[RZG3S_SYSC_FUNC_ID_RST_RSM_B] = {
+					.offset = 0xd74,
+					.mask = BIT(0),
+				},
 			},
 		},
 	},
@@ -1909,14 +1925,16 @@ static const struct rzg3s_pcie_soc_data rzg3e_soc_data = {
 	.config_post_init = rzg3e_pcie_config_post_init,
 	.config_deinit = rzg3e_pcie_config_deinit,
 	.sysc_info = {
-		.functions = {
-			[RZG3S_SYSC_FUNC_ID_L1_ALLOW] = {
-				.offset = 0x1020,
-				.mask = BIT(0),
-			},
-			[RZG3S_SYSC_FUNC_ID_MODE] = {
-				.offset = 0x1024,
-				.mask = BIT(0),
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
 			},
 		},
 	},
-- 
2.54.0


