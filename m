Return-Path: <linux-renesas-soc+bounces-32132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMlHBsRe+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:31:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC82B4DD3E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEE5F30A60C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC0D48B374;
	Wed,  6 May 2026 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H1c5bR0l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23883F0A83;
	Wed,  6 May 2026 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081120; cv=none; b=k1eLSM/R167wC8u0eIzdMTd4l3BAMTEygYnF+De0iU5QyGabFPNkPwyc96GbhRMjMNuTILlFJkJxVdkhgFob3FP/46IfhK3bdAROydHAO9wzj2uakwmCLfqXX8/0QdKPCXspqf2+/R2OV9DPmam/pdZpzAlzNikiGB/mvwib6v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081120; c=relaxed/simple;
	bh=I9g65+AQEZ45KkU593/uHo6NiuQueGuXtUKkyxb2w+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U7O8DTDNJeLC2QH0PvkGOkKhOcw231f5kA7ne9feG9CyhmmXPqC+jArugNPXcsG9tyA6+mAEPpuX58dChSQO+2WB7RwhMXHOS/7K5hlta5jrnB5oAwehaeHLAsdrTrmsjZRYoXqIfL2OfLZmqhtI8sXYvYZI3mLgkzG291eIzHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H1c5bR0l; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=fW
	cSjK7EV2ez99Q2HCbUPG3YXPdtccdv6DKjz8LT2Wk=; b=H1c5bR0lY6woK98BBu
	KS1lpJyYa+aqcVLHMqhvEee3O5SrDi8RoKrITFon2F0a3pmd/80Fg8StTNo9v/+/
	Ml9B6c9lyIb8uaTqsDOkImVrTmRqoSRu+9XEq8gcMjUrUgD1na/NeLoph0Imcc2d
	jaxf8+gpSe1cgQtuh5qHHqdYs=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCHAqsXXftpv5CgDg--.43926S2;
	Wed, 06 May 2026 23:24:08 +0800 (CST)
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
	jianjun.wang@mediatek.com,
	claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com
Cc: robh@kernel.org,
	s-vadapalli@ti.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v2 0/8] PCI: Add common helper for 100 ms delay after link training
Date: Wed,  6 May 2026 23:23:38 +0800
Message-Id: <20260506152346.166056-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHAqsXXftpv5CgDg--.43926S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF48ArWDZFyxXr13tr17Awb_yoW5trykpF
	WrGrWSkFn7JrWYv3Z5A3W7ury5W3Z5G3y7Jws7K34xXry3C3W3Jr1IqFs5tF9rGrWkZr12
	vw1Ut3WDCa90yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziDPEfUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xm2Wmn7XRnXsQAA3u
X-Rspamd-Queue-Id: EC82B4DD3E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-32132-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,vger.kernel.org,lists.infradead.org,163.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

PCIe r6.0, sec 6.6.1 (Conventional Reset) states:

- For a Downstream Port that supports Link speeds greater than 5.0 GT/s,
  software must wait a minimum of 100 ms **after Link training completes**
  before sending a Configuration Request to the device immediately below
  that Port.

Several PCIe host controller drivers currently omit this 100 ms delay
when the negotiated link speed is Gen3 (8 GT/s) or higher. Only the DWC
driver already implements it. The missing delay can lead to violations
of the PCIe specification.

To fix this consistently and avoid code duplication, this series:

  1. Adds a static inline helper `pcie_wait_after_link_train()` in
     drivers/pci/pci.h. The helper checks the given max_link_speed
     (or negotiated speed) and calls msleep(100) if the speed is > 5 GT/s.

  2. Converts the DWC driver to use this helper.

  3. Adds the missing 100 ms delay to the Cadence PCIe controller
     (both LGA - Legacy Architecture IP - and HPA - High Performance
     Architecture IP) after introducing a `max_link_speed` field in
     struct cdns_pcie.

  4. Adds the delay to the Aardvark, MediaTek Gen3, and Renesas RZ/G3S
     host drivers, reusing their existing link speed fields.

All changes are placed exactly where the driver has just finished
waiting for the link to come up, i.e., immediately after link training
completes and before any Configuration Request would be issued.

---
Our company's product is based on the HPA IP from Cadence. When connecting
to different devices, we encountered issues with the enumeration failure
when connecting to the NVIDIA RTX5070 GPU and the NVMe SSD with PCIe 5.0
interface. Our code is based on: 80dc18a0cba8d ("PCI: dwc: Ensure that
dw_pcie_wait_for_link() waits 100 ms after link up").
---
Changes since v2:
- Add pcie_wait_after_link_train() helper
- Reduce repetitive code comments and have each Root Port driver use the
  helper function instead.
- Increase the delay to 100ms after enabling the link-up that distinguishes
  between Cadence LGA and HPA IPs.
- Add the Aardvark, MediaTek Gen3, and Renesas RZ/G3S Root Port driver. When
  the speed is greater than GEN2, a delay of 100ms should be applied.

v1:
https://patchwork.kernel.org/project/linux-pci/patch/20260501153553.66382-1-18255117159@163.com/
---
Hans Zhang (8):
  PCI: Add pcie_wait_after_link_train() helper
  PCI: cadence: LGA: Add max_link_speed field and 100 ms delay after
    link training
  PCI: cadence: HPA: Add 100 ms delay after link training
  PCI: j721e: Set max_link_speed to enable 100 ms delay after link up
  PCI: dwc: Use common pcie_wait_after_link_train() helper
  PCI: aardvark: Add 100 ms delay after link training
  PCI: mediatek-gen3: Add 100 ms delay after link training
  PCI: rzg3s-host: Add 100 ms delay after link training

 drivers/pci/controller/cadence/pci-j721e.c          |  1 +
 .../controller/cadence/pcie-cadence-host-common.c   |  4 ++++
 .../pci/controller/cadence/pcie-cadence-host-hpa.c  |  3 +++
 drivers/pci/controller/cadence/pcie-cadence.h       |  2 ++
 drivers/pci/controller/dwc/pcie-designware.c        |  8 +-------
 drivers/pci/controller/pci-aardvark.c               |  4 +++-
 drivers/pci/controller/pcie-mediatek-gen3.c         |  2 ++
 drivers/pci/controller/pcie-rzg3s-host.c            |  2 ++
 drivers/pci/pci.h                                   | 13 +++++++++++++
 9 files changed, 31 insertions(+), 8 deletions(-)


base-commit: a293ec25d59dd96309058c70df5a4dd0f889a1e4
-- 
2.34.1


