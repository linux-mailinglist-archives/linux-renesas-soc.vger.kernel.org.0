Return-Path: <linux-renesas-soc+bounces-32334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOysJqtwAWoSZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:01:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3B50853C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02E56300B04E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 06:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5A433B97A;
	Mon, 11 May 2026 06:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="He7KE0CX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E7437CD32;
	Mon, 11 May 2026 06:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778479244; cv=none; b=dJYXL1y6Ej+/3qXeO0I9cQi0oD+bkNHKoSVDXa4lmJyQ6k/N/LVfdIKiXakibTpFmx2rdRa219SNI4pCTPT+GPq4rr1jhu6plRHrhXOh9yhGBmvLg1I/s1SzI9k8lymrQ1EspkO32/T386SjsvAOYgV5vFT08UGhUHIxOQWJzSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778479244; c=relaxed/simple;
	bh=vsOIjRenkm3Ua3PGEVq5zLtIJuo8T6YnUo3IuCxYFyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e9RRIkwEB/sGYnvyQ4mDGmJsV3ov+HCAZUtxr2QrjO2oMKUUY3WyyIHv6F0dNMckCwUnviBDho7i2vqDLCDPLha4kS4tRxQmmZs8Wa8KjOCbg8ZcGncYUnSrFAnfwdh9+0NLbG0L7KEK3BJoyjpF1zcrqcYWwG8j34w1nne5X+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=He7KE0CX; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hv
	/1t/xGsQygAr/vopI1Yy4bj8nhzgu3manFIYqiKFY=; b=He7KE0CXg8bR10NsVH
	pcJV9X76hZYnFm/9lfgZrZ5UIaZhx2VpNgb/D3HxSRwOzoTvHiEFOSQ5/Uliw50z
	/JGdpUgP+ryZyY+LkzknGzUbyh+tQZFM+1QFuLCHO2l5b3ZvqF8pORJ7yZBwBF2k
	I0QId1gYDu34JLI+Wl1JfrA2E=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn9yk8cAFqPHQVAw--.46705S8;
	Mon, 11 May 2026 13:59:33 +0800 (CST)
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
Subject: [PATCH v3 6/7] PCI: mediatek-gen3: Add 100 ms delay after link up
Date: Mon, 11 May 2026 13:59:22 +0800
Message-Id: <20260511055923.37117-7-18255117159@163.com>
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
X-CM-TRANSID:_____wDn9yk8cAFqPHQVAw--.46705S8
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr4kWw4fAw18WF4rJF1kZrb_yoWkKrcE9a
	yxZFWfZayjkrySkFnayFyrZr9Yy3s7Wr10qF4fKF13Aa48urn0qrZavryDAF4kGw43tF12
	yryqk3W8WFykCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRAJ5r3UUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wUIq2oBcEXJTQAA3X
X-Rspamd-Queue-Id: 13A3B50853C
X-Rspamd-Server: lfdr
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
	FREEMAIL_TO(0.00)[google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com,cadence.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-32334-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,vger.kernel.org,lists.infradead.org,tuxon.dev,163.com];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The MediaTek Gen3 PCIe host driver lacks the required 100 ms delay after
link training completes for speeds > 5.0 GT/s, as specified in PCIe r6.0
sec 6.6.1.

The driver already stores max_link_speed (from the device tree). After
mtk_pcie_startup_port() successfully brings up the link, call
pci_host_common_link_train_delay() to comply with the specification.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..5abddec4e9be 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -30,6 +30,7 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include "pci-host-common.h"
 #include "../pci.h"
 
 #define PCIE_BASE_CFG_REG		0x14
@@ -570,6 +571,8 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		goto err_power_down_device;
 	}
 
+	pci_host_common_link_train_delay(pcie->max_link_speed);
+
 	return 0;
 
 err_power_down_device:
-- 
2.34.1


