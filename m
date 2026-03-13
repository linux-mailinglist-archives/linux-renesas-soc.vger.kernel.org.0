Return-Path: <linux-renesas-soc+bounces-29374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F5LLKFDtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:04:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4123287C77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 16EC13078920
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 16:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4023CD8DB;
	Fri, 13 Mar 2026 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cK0MmJDl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0D83CAE77;
	Fri, 13 Mar 2026 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421025; cv=none; b=MsqVHG4WHzK6gi238L7Af54Usd4+9GYc/S7feFfjP/6kEUAFsOs2INTT1OuZgM2PDINPo2NDKqwqDfNZ9AQuZU/2j22wjl6vylKgmxzu5j7jOqBGZ6C3hQmofH19Deb5B9CWLWtIYz2k2OXX3+STdOMlhc2IUmvsUTelWpIbymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421025; c=relaxed/simple;
	bh=dyqnxGxLuqnzGkcZLb43xdRPAjbpvPuyh3PA8tlPYCg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f9Lj31QFCFMqKDddXbBpBgwVs45/IoupxS7bu4oT34O5HSWd+keaPiLiIUTZMGrvKJkPxHCpO5QU0Y6gqkAnLm5Kl039xpApirR7jjHNKHzgWfzOmcuXrk8FtG73rOUx0oLhf5u5kgCi5ah5l4wsQdOthBbiMvFiboStrLNFOjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cK0MmJDl; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=OS
	3wNR44a9Lcr5qeJNGEMIZI1am9Rwc0ZQ9oLaGb9Ro=; b=cK0MmJDlf9ZvYmwmn+
	asRAiFE8eoyXUOJsmYCxDBQz4hZkk5pzhR4bpX3KaQTISy0u9fWlHOxJx0EPB2Ve
	Ra4sm9qGjJbaKKOw2CeJyJWIlWobu7F6oI+2bKft3852HZ7vHMC4Jhzk1rwYlzLg
	Lyxn1TtkDyMJ6LCTXcJf+0IR4=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAX2JV7QbRpTApJAw--.54345S3;
	Sat, 14 Mar 2026 00:55:25 +0800 (CST)
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
Subject: [PATCH v9 1/5] PCI: Add pcie_get_link_speed() helper for safe array access
Date: Sat, 14 Mar 2026 00:55:18 +0800
Message-Id: <20260313165522.123518-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAX2JV7QbRpTApJAw--.54345S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF48JF4fKFW8CrWUXr13urg_yoW8ZFy5pF
	W2kw1Fyr10qF13Xr43Z3Z8ZFy5X3ZxGFW7GrW7GasFvF43Jr9xXrySgrWfJr9akrsrury2
	qF13tr4UCF12yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_uWlZUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7B72mmm0QX4ApgAA3a
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
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
	TAGGED_FROM(0.00)[bounces-29374-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.infradead.org,bp.renesas.com,broadcom.com,rock-chips.com,163.com];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4123287C77
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
index 13d998fbacce..409aca7d737a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -108,6 +108,8 @@ struct pcie_tlp_log;
 				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
 
 extern const unsigned char pcie_link_speed[];
+unsigned char pcie_get_link_speed(unsigned int speed);
+
 extern bool pci_early_dump;
 
 extern struct mutex pci_rescan_remove_lock;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bccc7a4bdd79..d6592898330c 100644
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
+unsigned char pcie_get_link_speed(unsigned int speed)
+{
+	if (speed >= ARRAY_SIZE(pcie_link_speed))
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


