Return-Path: <linux-renesas-soc+bounces-32733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Fs75Me1gCmqW0gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:44:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2727F5648F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4658D30221CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 00:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFFB61DDC28;
	Mon, 18 May 2026 00:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jrtk3yyV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FE13A1B5;
	Mon, 18 May 2026 00:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779065042; cv=none; b=Ow+jwJCZPkmlq0/2fNwFOvexYaJTHt9/+1b8EmVNPOZcG7IeKBFqNI7uYd7uXotb+xAF3K5Jkpx4NxsHpXVWQWcUG4ofH63siC7iirUFL4xdz1yzX2fTy2fv5ky2RtNJax0vRsQWu4IZLdbUbRaKBgAuF1Mjk+owVRg/jFFF8Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779065042; c=relaxed/simple;
	bh=JfYVBKfwJuxtma2lzdMXINx6rDMMHn85ybTodOf74x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IUJlJpvLGEovdKFsky2flFusRvidG+thyZ4yzUJuVo4W3N61OI5jtknySLSLVFZP9PSh2ZdL96bDozLrlZ6L2PqfOEh7ZAPOCCMdKtH42UZxHCGpp2S/CmoWsMPhGamF3Yi0Tre8rlNiR5SiJOZ+lNzxvWwrIt9pRJuA7wKFJUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jrtk3yyV; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=li
	bXhe/4t1biWmfrc6stRZt7aayY7R8wQ9CZqvdPLA0=; b=jrtk3yyVD5Ff/hj2W7
	L46KQXVPLqg2pjC5ffYX3OSmBXJfUetP01uJQGLkzTa71oGkmly2FGM6WSqgbYfL
	MmatVnaGSN6swkZ/A5pJukYmWN9ID/jdRTJEJmBFXMf8QEW0vUAkvUfVuMs9Nip4
	mES+1Y9/gtMRd3zCW4v/1Cx84=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnj6SIYApq2fikCA--.4779S3;
	Mon, 18 May 2026 08:42:52 +0800 (CST)
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
Subject: [PATCH v4 1/7] PCI: Add pci_host_common_link_train_delay() helper
Date: Mon, 18 May 2026 08:42:40 +0800
Message-ID: <20260518004246.1384532-2-18255117159@163.com>
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
X-CM-TRANSID:_____wCnj6SIYApq2fikCA--.4779S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr15uw48KryxGryDtF4fZrb_yoW8CFyrpa
	98AF13CF40grW3uwsxAa4DWry5X3Z5t3yUK397G3sayr9rtrsavFWvg3yIqF1rJFZ8Zr17
	A3W5K3Z7Cr4xtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziqXdrUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6w1Y+2oKYI2yDQAA33
X-Rspamd-Queue-Id: 2727F5648F0
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
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-32733-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,vger.kernel.org,lists.infradead.org,tuxon.dev,163.com];
	NEURAL_HAM(-0.00)[-1.000];
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
2.43.0


