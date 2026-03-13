Return-Path: <linux-renesas-soc+bounces-29369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JneGoZEtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:08:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3034287D45
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1AE72332BD2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5133CB2CF;
	Fri, 13 Mar 2026 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ilnG01lu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B923C3CBE67;
	Fri, 13 Mar 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421010; cv=none; b=MIlgiPYZQnAllq6aSBskCpvz0Sj6CxMSxDULLKnmxzoEP2xF85fefiSWnquxI+yECRT06lAcCZ2B8NW+nuA/fq4gxxxwY56dLUfG117Cr0ZY/M1b5+pCU5qASWJBDy0pDVzkm5rVqdHYyujCsbRMFouJ/EndlJRTocrrmdH47go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421010; c=relaxed/simple;
	bh=D8t9qvxgpZ++Yo3oPbHQfrf9aK/b9K0vIff2MtOGlN0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p2SE3krEORjNq40AWVG0hQ/u60H+PlQOrG6NfV2fV1BiDNmVFThmUD8UXFsHCuWgQln/p2gzicpiBU6NslGZLWr4eCPl64naX4JVfYSlLnmri5VSODm535tAgUWPJAILD2mcFLjrLoekFUF1kdJlnfaRTByhopWB1fIQo4xhdPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ilnG01lu; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ok
	Jydil17J/bKKSpOmhf5pXuHazCRZk9UtAzqTsen3Q=; b=ilnG01luwp4pP7OtqS
	TeutnXAU6Ie9XpK9O0LxT8hJVpPwJeTyCsUp07tSOFcvHSSbbTrwFIMmG4J1wpqE
	bbPVjL2lOpuHzhAYmvO8SowPA/HrN3pCfsAcwjQ4cZkJ95DZfFr6jHHolzwk/W2q
	RSKrp86ldpZmjMP11D7JsY9RU=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAX2JV7QbRpTApJAw--.54345S2;
	Sat, 14 Mar 2026 00:55:24 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	florian.fainelli@broadcom.com,
	jim2101024@gmail.com
Cc: robh@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shawn.lin@rock-chips.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v9 0/5] PCI: of: Remove max-link-speed generation validation
Date: Sat, 14 Mar 2026 00:55:17 +0800
Message-Id: <20260313165522.123518-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX2JV7QbRpTApJAw--.54345S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw1kuw17CF4kAF4DCFyfZwb_yoWrtr1fpa
	y2qFWFyF1xtF4ava17J3WUuFyYg3ZxAFWjkryfWw17ZFnxCF13XFySgF4FvF9rKrZF9r12
	q3W2q3W7KFyjyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi2-esUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxB32mmm0QX3JqwAA32
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,broadcom.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-29369-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,broadcom.com,rock-chips.com,163.com];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F3034287D45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

This series moves the validation from the common OF function to the
individual PCIe controller drivers.  To protect against out-of-bounds
accesses to the pcie_link_speed[] array, we first introduce a helper
function pcie_get_link_speed() that safely returns the speed value
(or PCI_SPEED_UNKNOWN) for a given generation number.

Then all direct uses of pcie_link_speed[] as an array are converted to
use the new helper, ensuring that even if an invalid generation number
reaches those code paths, no out-of-bounds access occurs.

For several drivers that read the "max-link-speed" property
(pci-j721e, brcmstb, mediatek-gen3, rzg3s-host), we add an explicit
validation step: if the value is missing, out of range, or unsupported
by the hardware, a safe default is used (usually Gen2). Other drivers
(mainly DesignWare glue drivers) rely on the helper to safely handle
invalid values, but do not yet include fallback logic or warnings.

Finally, the range check is removed from of_pci_get_max_link_speed(),
so that future PCIe generations can be supported without modifying
drivers/pci/of.c.

---
Changes for v9:
- Modify the parameter passed to pcie_get_link_speed to unsigned int. If the DT
  configuration specifies max-link-speed = -1, the obtained max_link_speed will
  be 0xff. Therefore, it will be greater than the length of the array pcie_link_speed.
  Thus, the condition speed <= 0 is removed. (For patch 0001. Shawn)
- Modify the commit message for patch 0005. (Shawn)

Changes for v8:
https://patchwork.kernel.org/project/linux-pci/cover/20260312163652.113228-1-18255117159@163.com/

- Expand series from 2 to 5 patches to introduce pcie_get_link_speed() helper
  and split validation into per-driver changes.
- Add pcie_get_link_speed() helper for safe pcie_link_speed[] array access (Bjorn)
- Move max-link-speed validation from DWC core to individual drivers; add explicit
  fallback logic only for pci-j721e, brcmstb, mediatek-gen3, rzg3s-host.
- Convert all remaining direct pcie_link_speed[] accesses to use the new helper.
- Update commit messages to reflect the new design.

Changes for v7:
https://patchwork.kernel.org/project/linux-pci/cover/20260308142629.75392-1-18255117159@163.com/

- Add validation in dw_pcie_get_link_speed() (Bjorn)
- Modify it so that two patches constitute one series.

Changes for v6:
https://patchwork.kernel.org/project/linux-pci/patch/20251218132036.308094-1-18255117159@163.com/

- It'd be good to return the actual errno as of_property_read_u32() can return
  -EINVAL, -ENODATA and -EOVERFLOW. (Mani)

Changes for v5:
https://patchwork.kernel.org/project/linux-pci/patch/20251218125909.305300-1-18255117159@163.com/

- Delete the check for speed. (Mani)

Changes for v4:
https://patchwork.kernel.org/project/linux-pci/patch/20251105134701.182795-1-18255117159@163.com/

- Add pcie_max_supported_link_speed.(Ilpo)

Changes for v3:
https://patchwork.kernel.org/project/linux-pci/patch/20251101164132.14145-1-18255117159@163.com/

- Modify the commit message.
- Add Reviewed-by tag.

Changes for v2:
https://patchwork.kernel.org/project/linux-pci/cover/20250529021026.475861-1-18255117159@163.com/
- The following files have been deleted:
  Documentation/devicetree/bindings/pci/pci.txt

  Update to this file again:
  dtschema/schemas/pci/pci-bus-common.yaml
---

Hans Zhang (5):
  PCI: Add pcie_get_link_speed() helper for safe array access
  PCI: dwc: Use pcie_get_link_speed() and validate max-link-speed
  PCI: j721e: Validate max-link-speed from DT
  PCI: controller: Validate max-link-speed
  PCI: of: Remove max-link-speed generation validation

 drivers/pci/controller/cadence/pci-j721e.c       |  3 ++-
 .../pci/controller/dwc/pcie-designware-host.c    |  2 +-
 drivers/pci/controller/dwc/pcie-designware.c     |  2 +-
 drivers/pci/controller/dwc/pcie-qcom-common.c    |  2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c        |  4 ++--
 drivers/pci/controller/dwc/pcie-qcom.c           |  6 +++---
 drivers/pci/controller/dwc/pcie-tegra194.c       |  2 +-
 drivers/pci/controller/pcie-brcmstb.c            |  5 +++--
 drivers/pci/controller/pcie-mediatek-gen3.c      |  2 +-
 drivers/pci/controller/pcie-rzg3s-host.c         |  2 +-
 drivers/pci/of.c                                 | 16 ++++++++--------
 drivers/pci/pci.h                                |  2 ++
 drivers/pci/probe.c                              | 16 ++++++++++++++++
 13 files changed, 42 insertions(+), 22 deletions(-)


base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
-- 
2.34.1


