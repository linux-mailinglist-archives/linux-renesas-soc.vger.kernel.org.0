Return-Path: <linux-renesas-soc+bounces-32336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOukIKFwAWoSZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:01:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0C550852D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 287523001843
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 06:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8BB3783CB;
	Mon, 11 May 2026 06:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GjnjO+qd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EFD311963;
	Mon, 11 May 2026 06:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778479259; cv=none; b=Hxm+uTlQcf64IXqTFOhP17oQgB0q0SDmPOXHHYPDk6oNKuTitv1vZL4o7USHwnOzEDovZP6OKO5iImSWA9XYh6vlZoKvtwT3zKcoF+0cGdyyjsOx4hyFAtQkjEJ2Lq5WOTOlqllW0y7jsFh9FzqQJ4iO/wK4oIUOMeQnKzLLYOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778479259; c=relaxed/simple;
	bh=bWPr1BaDEzG5w1vtHLhYwtwdOwk28JQ/rEybQOKoLLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WeG4HZMJQXXSdyP/C76mzdvlcbdcnhIFC5rPyyt1DbvkhpUKvUcXVT3u8lvls/b/bHfBTZZ2EJ115M/HG7ZFNOgz1y5vzRm0v+4TwLXK5cvZ7RXKIvw1C84YsophLWsUESYHZ+kFOSxQeHbimF1pV8L0kMIpf2XanihAFReUdY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GjnjO+qd; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Vz
	mARtt+BvknoDpQvI+YBgcSlGj9WFW4WVOqaajQab0=; b=GjnjO+qdm9y6wd7AbI
	WkfORnAh9XnD4m5fZYJ86gLEIXWCH383ChhXICijEuklPnwvH6kBQ1CJlmxgjgOQ
	paWEZW55F5u8uh37K4XY96TDx1+ShKc4paCQT4/9zCSph0nVsMxarloUpmUlIruA
	PDNkN7YJ+WUu8Uhzehe3DrOJk=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn9yk8cAFqPHQVAw--.46705S2;
	Mon, 11 May 2026 13:59:25 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vigneshr@ti.com,
	jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com,
	pali@kernel.org,
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
Subject: [PATCH v3 0/7] PCI: Add common helper for 100 ms delay after link training
Date: Mon, 11 May 2026 13:59:16 +0800
Message-Id: <20260511055923.37117-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn9yk8cAFqPHQVAw--.46705S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr15WF1xZFWfGw17WF4DArb_yoWrWw43pF
	WrGrWSkFn7WFWYvan7A3W7u34Yg3Z5J34UK3ykK34xXFnrAFyYvr4I9FWFqFy7GrWkXrnF
	y3WUK3ZrCF12yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zio5dtUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6x8GqWoBcD-IgQAA32
X-Rspamd-Queue-Id: 8C0C550852D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-32336-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,vger.kernel.org,lists.infradead.org,tuxon.dev,163.com];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
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
Changes since v3:
- Renamed helper from pcie_wait_after_link_train() to
  pci_host_common_link_train_delay() and moved to pci-host-common.h. (Mani)
- Reorganized Cadence patches: LGA + j721e glue in one patch, HPA separate.
- Added missing DT property reading for HPA and LGA fallback.
- Replace the existing msleep(100) call with the common helper
  pci_host_common_link_train_delay(). (Claudiu)

Changes since v2:
- Add pcie_wait_after_link_train() helper
- Reduce repetitive code comments and have each Root Port driver use the
  helper function instead.
- Increase the delay to 100ms after enabling the link-up that distinguishes
  between Cadence LGA and HPA IPs.
- Add the Aardvark, MediaTek Gen3, and Renesas RZ/G3S Root Port driver. When
  the speed is greater than GEN2, a delay of 100ms should be applied.

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


base-commit: 70390501d1944d4e5b8f7352be180fceb3a44132
-- 
2.34.1


