Return-Path: <linux-renesas-soc+bounces-32335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI6aDtJwAWoSZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:01:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B74508574
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59D06301464F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 06:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3513E3612F4;
	Mon, 11 May 2026 06:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AOGpWrBk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D0237A4AF;
	Mon, 11 May 2026 06:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778479249; cv=none; b=OCFTKAzNFgFWJa9QbXUsKWdrBmcLCnH5SmutylAWhr184UMk4UWvnUM9pQkOjg2XD17r+HeOaR1eXy8U2Q6398elGYk1UvdDZaSmKwjjmYWI68h/jsmO+BWH9iwwLF/yMo/hLbfBcW+9mKvRro5G6xVIp6+44yfldyxI5luxat0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778479249; c=relaxed/simple;
	bh=cS0gPoIZztMU6uUA/maOjPHae7NRcrAb51ohsfYsz6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Am04Urt02MZxZE3DfGYKXDynO+jl30a3hhP+cjL+MEOQFM3W7LqwuOiiyVTE3JKTOwYPSSB5j7+PtyboyeLn+1DsnAAC5fCrvaQdMq+NsB8ovVSLiIEXIBlgADYObk2yTB4w6D2J+QZ4HgRZMaUcy3EX+OniYMQEnhkNRbWFCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AOGpWrBk; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cf
	tsOZtxX29kXCinzIdqB457AE+U27lG7aeLpYLPKCg=; b=AOGpWrBklUKzXiHe2e
	RmH+uBtaO+tn+gDtsITdEf3uD00xsvLlIzYTWEKKYgjPmqae3s74XytRXwTM7MSm
	GfmPj4SYpIVWELdmhCsmrNnyG2z6I35CmztiTlg6+1AB2Ogdr9s4kQ9Lec2m4NBb
	lU+4ubeQT0WG3InU0r7WRV538=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn9yk8cAFqPHQVAw--.46705S3;
	Mon, 11 May 2026 13:59:27 +0800 (CST)
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
Subject: [PATCH v3 1/7] PCI: Add pci_host_common_link_train_delay() helper
Date: Mon, 11 May 2026 13:59:17 +0800
Message-Id: <20260511055923.37117-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511055923.37117-1-18255117159@163.com>
References: <20260511055923.37117-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn9yk8cAFqPHQVAw--.46705S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr15uw48KryxGryDtF4fZrb_yoW8CFyrpa
	98AF13CF40grW3uwsxAa4DWryYq3Z5t3yUK397G3sayr9rtrsavFWv93yIqF1rJFZ8Zr17
	A3W5K3Z7Cr4xtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGNtfUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwwAHqmoBcEDaRwAA3o
X-Rspamd-Queue-Id: A2B74508574
X-Rspamd-Server: lfdr
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
	FREEMAIL_TO(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-32335-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,vger.kernel.org,lists.infradead.org,tuxon.dev,163.com];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream
Port supporting Link speeds greater than 5.0 GT/s, software must wait a
minimum of 100 ms after Link training completes before sending any
Configuration Request.

Introduce a static inline helper pci_host_common_link_train_delay() that
checks the given max_link_speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, etc.) and
calls msleep(100) only when the speed is greater than 5.0 GT/s.

This allows multiple host controller drivers to share the same mandatory
delay without duplicating the logic.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pci-host-common.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb..d709f7e3e11a 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -10,6 +10,9 @@
 #ifndef _PCI_HOST_COMMON_H
 #define _PCI_HOST_COMMON_H
 
+#include <linux/delay.h>
+#include "../pci.h"
+
 struct pci_ecam_ops;
 
 int pci_host_common_probe(struct platform_device *pdev);
@@ -20,4 +23,18 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+/**
+ * pci_host_common_link_train_delay - Wait 100 ms if link speed > 5 GT/s
+ * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s, ...)
+ *
+ * Must be called after Link training completes and before the first
+ * Configuration Request is sent.
+ */
+static inline void pci_host_common_link_train_delay(int max_link_speed)
+{
+	if (max_link_speed > 2)
+		msleep(PCIE_RESET_CONFIG_WAIT_MS);
+}
+
 #endif
-- 
2.34.1


