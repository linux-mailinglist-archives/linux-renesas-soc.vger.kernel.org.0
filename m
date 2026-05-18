Return-Path: <linux-renesas-soc+bounces-32736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FWoCd5gCmqC0gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:44:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B45648DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85BF93014C74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 00:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97427207A20;
	Mon, 18 May 2026 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="FvbFaNgD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F45149C7B;
	Mon, 18 May 2026 00:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779065043; cv=none; b=f4clHoCqd1Y3oF+bxogVVrfs66hvUa0ZPNDV5+NiTU0gcRyycooFEcVM54phyVOnUoDkd4r564xKlgAP0l7jgkCyo/GkjJ4Y9+7BudQChU+cC2ic9a32JF/oagbVPnqhr01JwaKpQ2jUzwXFVGpAjkPSWUbpvv5adOUOxGYRAm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779065043; c=relaxed/simple;
	bh=GJNaBQaEMPvQGX0a97naAfEf2qj5t32K8fCapzvmzPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N8hnb9i4aqy9SwhzgxN2onUPXS+rYIISkBlB3S53wpOiJcVFzYyBE5RN2Be00gMztDcTB9LdoEXcMtYTDt+8eZk1+e4wAiFyY+J2LQGLX6FXVlpUhr5fw8vldhPz5ZSoVGZCIn6hxtyD+BEsjHPIeypEWxs2B91+HCygY4py89Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FvbFaNgD; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=71
	TiXWZeiNEnZ9aHbMl8KHb/RAdwEUbQt5Z1vVI0djc=; b=FvbFaNgDlCc4BH7ZQ1
	bkLp4gMSaI26ucPewKKL6mBMwC5aiuJWuc3zL+9jmS/rBKTF5U+8iFn73uCG2k5g
	NZGjlktM7zIP8E4e47SFrWY9AJ0ANDzELqXQc0ByfzH4mkM3OPnq9UN2VDXf+rmf
	aTVUPpmOEnUdcRQWNYOch+W0U=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnj6SIYApq2fikCA--.4779S2;
	Mon, 18 May 2026 08:42:50 +0800 (CST)
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
Subject: [PATCH v4 0/7] PCI: Add common helper for 100 ms delay after link training
Date: Mon, 18 May 2026 08:42:39 +0800
Message-ID: <20260518004246.1384532-1-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnj6SIYApq2fikCA--.4779S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr15WF1xZFWfGw17WF4DArb_yoWrKr1xpF
	WrGrWSk3Z7XFWYvws7A3W7u34Yg3Z3G34Ut3ykK34xZrnrAFyYvrWI9FWvvFy7GrWkXrnF
	y3WUK3ZrCw12yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUkucUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAxY+2oKYIwFAAAA3i
X-Rspamd-Queue-Id: C30B45648DF
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
	TAGGED_FROM(0.00)[bounces-32736-lists,linux-renesas-soc=lfdr.de];
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

PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
Port supporting Link speeds greater than 5.0 GT/s, software must wait a
minimum of 100 ms after Link training completes before sending any
Configuration Request.

Several PCIe host controller drivers currently omit this 100 ms delay
when the negotiated link speed is Gen3 (8 GT/s) or higher. Only the DWC
driver already implements it. The missing delay can lead to violations
of the PCIe specification and cause enumeration failures with high-speed
devices (e.g., NVIDIA RTX5070 GPU, PCIe 5.0 NVMe SSDs).

To fix this consistently and avoid code duplication, this series:

  1. Adds a static inline helper `pci_host_common_link_train_delay()`
     in `drivers/pci/controller/pci-host-common.h`. The helper checks
     the given max_link_speed and calls msleep(100) if speed > 5 GT/s.

  2. Converts the DWC driver to use this helper.

  3. Adds the missing 100 ms delay to the Cadence PCIe controller
     (both LGA and HPA IPs). A `max_link_speed` field is introduced
     in `struct cdns_pcie`. The j721e glue driver sets this field;
     other LGA glue drivers fall back to reading DT property
     "max-link-speed". HPA also reads the DT property.

  4. Adds the delay to the Aardvark and MediaTek Gen3 host drivers,
     and replaces the existing unconditional delay in the Renesas
     RZ/G3S driver with the conditional helper (per spec).

All changes are placed immediately after link training completes and
before any Configuration Request would be issued.

---
Our company's product is based on the HPA IP from Cadence. When connecting
to different devices, we encountered issues with the enumeration failure
when connecting to the NVIDIA RTX5070 GPU and the NVMe SSD with PCIe 5.0
interface. Our code is based on: 80dc18a0cba8d ("PCI: dwc: Ensure that
dw_pcie_wait_for_link() waits 100 ms after link up").
---
Changes since v4:
- Resolve the pointer reference error in patch 0002. (sashiko)

Changes since v3:
- Renamed helper from pcie_wait_after_link_train() to
  pci_host_common_link_train_delay() and moved to pci-host-common.h. (Mani)
- Reorganized Cadence patches: LGA + j721e glue in one patch, HPA separate.
- Added missing DT property reading for HPA and LGA fallback.
- Replace the existing msleep(100) call with the common helper
  pci_host_common_link_train_delay(). (Claudiu)

Changes since v2:
- Renamed helper from pcie_wait_after_link_train() to
  pci_host_common_link_train_delay() and moved to pci-host-common.h. (Mani)
- Reorganized Cadence patches: LGA + j721e glue in one patch, HPA separate.
- Added missing DT property reading for HPA and LGA fallback.
- Replace the existing msleep(100) call with the common helper
  pci_host_common_link_train_delay(). (Claudiu)

Changes since v1:
- Add pcie_wait_after_link_train() helper
- Reduce repetitive code comments and have each Root Port driver use the
  helper function instead.
- Increase the delay to 100ms after enabling the link-up that distinguishes
  between Cadence LGA and HPA IPs.
- Add the Aardvark, MediaTek Gen3, and Renesas RZ/G3S Root Port driver. When
  the speed is greater than GEN2, a delay of 100ms should be applied.

v3:
https://patchwork.kernel.org/project/linux-pci/patch/20260511055923.37117-1-18255117159@163.com/

v2:
https://patchwork.kernel.org/project/linux-pci/cover/20260506152346.166056-1-18255117159@163.com/

v1:
https://patchwork.kernel.org/project/linux-pci/patch/20260501153553.66382-1-18255117159@163.com/
---

Hans Zhang (7):
  PCI: Add pci_host_common_link_train_delay() helper
  PCI: cadence: Add post-link delay for LGA and j721e glue driver
  PCI: cadence: HPA: Add post-link delay
  PCI: dwc: Use common pci_host_common_link_train_delay() helper
  PCI: aardvark: Add 100 ms delay after link training
  PCI: mediatek-gen3: Add 100 ms delay after link up
  PCI: rzg3s-host: Use common pci_host_common_link_train_delay() helper

 drivers/pci/controller/cadence/pci-j721e.c      |  1 +
 .../cadence/pcie-cadence-host-common.c          |  4 ++++
 .../controller/cadence/pcie-cadence-host-hpa.c  |  8 ++++++++
 .../pci/controller/cadence/pcie-cadence-host.c  |  4 ++++
 drivers/pci/controller/cadence/pcie-cadence.h   |  2 ++
 drivers/pci/controller/dwc/pcie-designware.c    |  9 ++-------
 drivers/pci/controller/pci-aardvark.c           |  5 ++++-
 drivers/pci/controller/pci-host-common.h        | 17 +++++++++++++++++
 drivers/pci/controller/pcie-mediatek-gen3.c     |  3 +++
 drivers/pci/controller/pcie-rzg3s-host.c        |  3 ++-
 10 files changed, 47 insertions(+), 9 deletions(-)


base-commit: 50897c955902c93ae71c38698abb910525ebdc89
-- 
2.43.0


