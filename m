Return-Path: <linux-renesas-soc+bounces-29302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GF1NNnssmnAQwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:42:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE14275C38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 17:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C89673043F8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 16:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E87390C83;
	Thu, 12 Mar 2026 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mM77P+dW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80754390210;
	Thu, 12 Mar 2026 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773333502; cv=none; b=krz3HB9LX+gYkfnJEcY1KNH3pP4XNcGupICuna9AtWczUqeel0T867LVyOLhvtKxcylZJTC8xWMjJHOoF29BEM5b5G+lKAo6OWt4hEjCJl4dKqLkufHBMzAX0zXHIUzhKos0N2xYlphod+fjOOb/qkHZuEfRn/6JsythlzBbSGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773333502; c=relaxed/simple;
	bh=PS08veSgSk3UxGP/F/Lk1A1tp354yiWiPHcmO/0I4H0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vEn6i0TfYSr5FY7BDugn39DhzTM0opnXn45Ns1aMI5jbVXKHmSzNYjYe10H5bheN/MXCYS9R2UpFwvb9vyrbQMD8qC6FBhldjLLU/tqEQK9mn5f7YvRfhbfvIiTZN33EFQM1I9Imv2EE4mjFPPbuguFklGzn3A4uUJL3u1635J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mM77P+dW; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=EK
	AEulDdVQpUy/F6OpD/8nSvWxKf3rH6D2RiMfRuwp8=; b=mM77P+dWkFeNfJifuo
	hzNgYr2j2etbXn1mIt//3mZFUnDmV36czGxa8guAgfzEEaaikrU6M8afVB+7xLFC
	1A9UQQsbZQ0W99NKeGbqhaEKMWyOGe3sXMu36sf79x6LFxIe0nKFrGULWQl714LD
	2G2U43Eun5aGjegfT6ztU/KeI=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnN1Gl67JpMC_OAQ--.12929S3;
	Fri, 13 Mar 2026 00:36:59 +0800 (CST)
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
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v8 1/5] PCI: Add pcie_get_link_speed() helper for safe array access
Date: Fri, 13 Mar 2026 00:36:48 +0800
Message-Id: <20260312163652.113228-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312163652.113228-1-18255117159@163.com>
References: <20260312163652.113228-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnN1Gl67JpMC_OAQ--.12929S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF48JF4fKFW8CrWUXr13urg_yoW8ZF43pF
	W2kw1Fyr10qF13Xr43Zas8uFy5X3ZxGFW7GrW7GasF9F43Jr9xXr4a9rWfJr9akrsrZry2
	qF13tF4UC3W2yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEF1vxUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAssz2my66tRVQAA3z
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,broadcom.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-29302-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,broadcom.com,163.com];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5BE14275C38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pcie_link_speed[] array is indexed by PCIe generation numbers
(1 = 2.5 GT/s, 2 = 5 GT/s, ...).  Several drivers use it directly,
which can lead to out-of-bounds accesses if an invalid generation
number is used.

Introduce a helper function pcie_get_link_speed() that returns the
corresponding enum pci_bus_speed value for a given generation number,
or PCI_SPEED_UNKNOWN if the generation is out of range.  This will
allow us to safely handle invalid values after the range check is
removed from of_pci_get_max_link_speed().

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/pci.h   |  2 ++
 drivers/pci/probe.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce..6bf3e59f42e5 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -108,6 +108,8 @@ struct pcie_tlp_log;
 				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
 
 extern const unsigned char pcie_link_speed[];
+unsigned char pcie_get_link_speed(int speed);
+
 extern bool pci_early_dump;
 
 extern struct mutex pci_rescan_remove_lock;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bccc7a4bdd79..a95afbcee421 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -783,6 +783,22 @@ const unsigned char pcie_link_speed[] = {
 };
 EXPORT_SYMBOL_GPL(pcie_link_speed);
 
+/**
+ * pcie_link_speed_value - Get speed value from PCIe generation number
+ * @speed: PCIe speed (1-based: 1 = 2.5GT, 2 = 5GT, ...)
+ *
+ * Returns the speed value (e.g., PCIE_SPEED_2_5GT) if @speed is valid,
+ * otherwise returns PCI_SPEED_UNKNOWN.
+ */
+unsigned char pcie_get_link_speed(int speed)
+{
+	if (speed <= 0 || speed >= ARRAY_SIZE(pcie_link_speed))
+		return PCI_SPEED_UNKNOWN;
+
+	return pcie_link_speed[speed];
+}
+EXPORT_SYMBOL_GPL(pcie_get_link_speed);
+
 const char *pci_speed_string(enum pci_bus_speed speed)
 {
 	/* Indexed by the pci_bus_speed enum */
-- 
2.34.1


