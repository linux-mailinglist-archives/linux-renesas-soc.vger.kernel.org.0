Return-Path: <linux-renesas-soc+bounces-32735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ9EO9tgCmqC0gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:44:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A55648D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C776D30094F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 00:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE571EB5C2;
	Mon, 18 May 2026 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mGngdtKn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9E412E1DC;
	Mon, 18 May 2026 00:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779065043; cv=none; b=Cr5clasZTxWIM4mEeLx66excdFM33vaH17vBfDLffxKxyZ3J0/D1aibtLB0DOWcQV6BEFts2FdS1HkekM6sIhCOSUvHmb72fcBknfgtVGgixCsohv7Jz+0E4NiSKLtRQPDs6W/IKQcfJ8hQ3CwfNFv0Ukwrr3+ne7vXF5eanOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779065043; c=relaxed/simple;
	bh=lQyn9D4U5WvqWBnatkUYn5Y2YqHoCSLoRXPaXquEoJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RErG2TseNd6zLRPYPQFe5WOqQod5kpBMDShzYvx8LaaDw6Ar5a981dtGXWHxjI1vNmJlViJgwGsh8Il78IvFOY6gGt2h5ts/jKXnJDDJAmdHrabGpVpUWabNyzxUiqXtfvCuQNBM+AqzdFVZU9FoHwwOOVq/5JGhGH0S18px/+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mGngdtKn; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3F
	13ZakzR2RSsT1F2D7I1CFIuqoD/ehoB7Hh/Xe6CP8=; b=mGngdtKnqDAYiq0K16
	nFCreG2iac289umqPMc5xdw6O9eQ8A/tTy9F4jh86kP+Ikp3Xo+8CE0OfEKZVOTG
	ZZglwnzSL6RnCAxofrkWYE0Vi0cPFG3EOLsXmYVJgfAr51gFf8BsiTfxi143X3Dq
	XC+T8FU0ZMky3J9m8qrHhO+/M=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnj6SIYApq2fikCA--.4779S4;
	Mon, 18 May 2026 08:42:53 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	ryder.lee@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v4 2/7] PCI: cadence: Add post-link delay for LGA and j721e glue driver
Date: Mon, 18 May 2026 08:42:41 +0800
Message-ID: <20260518004246.1384532-3-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518004246.1384532-1-18255117159@163.com>
References: <20260518004246.1384532-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnj6SIYApq2fikCA--.4779S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWUWFyktFy3trW5Ar4fXwb_yoWrCF4fpa
	yUGFyfG3WIqrWY9a1kZ3WUXryaqFn8A3srJ3929w1xWF17Cr98JF42gF1fJFZxKrZrAr17
	ZF1DtF9rGr1ayFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRwjjkUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7A5Y+2oKYI65OgAA3M
X-Rspamd-Queue-Id: AE2A55648D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-32735-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,vger.kernel.org,lists.infradead.org,tuxon.dev,163.com];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The Cadence LGA (Legacy Architecture IP) PCIe host controller currently
lacks the mandatory 100 ms delay after link training completes for speeds
> 5.0 GT/s, as required by PCIe r6.0 sec 6.6.1.

Add a 'max_link_speed' field to struct cdns_pcie. In the common host
layer function cdns_pcie_host_start_link(), after the link has been
successfully established, call pci_host_common_link_train_delay() to
insert the required delay.

For the j721e glue driver, set cdns_pcie.max_link_speed from the existing
link speed logic. For other LGA-based glue drivers (sky1, sg2042), the
common LGA host setup (pcie-cadence-host.c) provides a fallback reading
of the device tree property "max-link-speed" when available. This ensures
that the delay is not missed on those platforms once they enable the
property.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/cadence/pci-j721e.c                | 1 +
 drivers/pci/controller/cadence/pcie-cadence-host-common.c | 4 ++++
 drivers/pci/controller/cadence/pcie-cadence-host.c        | 4 ++++
 drivers/pci/controller/cadence/pcie-cadence.h             | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index bfdfe98d5aba..ae916e7b1927 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -206,6 +206,7 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
 	    (pcie_get_link_speed(link_speed) == PCI_SPEED_UNKNOWN))
 		link_speed = 2;
 
+	pcie->cdns_pcie->max_link_speed = link_speed;
 	val = link_speed - 1;
 	ret = regmap_update_bits(syscon, offset, GENERATION_SEL_MASK, val);
 	if (ret)
diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-common.c b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
index 2b0211870f02..18e4b6c760b5 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
@@ -14,6 +14,7 @@
 
 #include "pcie-cadence.h"
 #include "pcie-cadence-host-common.h"
+#include "../pci-host-common.h"
 
 #define LINK_RETRAIN_TIMEOUT HZ
 
@@ -115,6 +116,9 @@ int cdns_pcie_host_start_link(struct cdns_pcie_rc *rc,
 	if (!ret && rc->quirk_retrain_flag)
 		ret = cdns_pcie_retrain(pcie, pcie_link_up);
 
+	if (!ret)
+		pci_host_common_link_train_delay(pcie->max_link_speed);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 0bc9e6e90e0e..058e4e619654 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -13,6 +13,7 @@
 
 #include "pcie-cadence.h"
 #include "pcie-cadence-host-common.h"
+#include "../../pci.h"
 
 static u8 bar_aperture_mask[] = {
 	[RP_BAR0] = 0x1F,
@@ -397,6 +398,9 @@ int cdns_pcie_host_setup(struct cdns_pcie_rc *rc)
 	rc->device_id = 0xffff;
 	of_property_read_u32(np, "device-id", &rc->device_id);
 
+	if (pcie->max_link_speed < 1)
+		pcie->max_link_speed = of_pci_get_max_link_speed(np);
+
 	pcie->reg_base = devm_platform_ioremap_resource_byname(pdev, "reg");
 	if (IS_ERR(pcie->reg_base)) {
 		dev_err(dev, "missing \"reg\"\n");
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 574e9cf4d003..042a4c49bb9a 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -86,6 +86,7 @@ struct cdns_plat_pcie_of_data {
  * @ops: Platform-specific ops to control various inputs from Cadence PCIe
  *       wrapper
  * @cdns_pcie_reg_offsets: Register bank offsets for different SoC
+ * @max_link_speed: Maximum supported link speed
  */
 struct cdns_pcie {
 	void __iomem		             *reg_base;
@@ -98,6 +99,7 @@ struct cdns_pcie {
 	struct device_link	             **link;
 	const  struct cdns_pcie_ops          *ops;
 	const  struct cdns_plat_pcie_of_data *cdns_pcie_reg_offsets;
+	int				     max_link_speed;
 };
 
 /**
-- 
2.43.0


