Return-Path: <linux-renesas-soc+bounces-32734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EA5ODNtgCmqC0gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:44:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FCA5648CA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EFBA300D158
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 00:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4487A1E1DE5;
	Mon, 18 May 2026 00:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qFIrxqYl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA5140E5F;
	Mon, 18 May 2026 00:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779065043; cv=none; b=LMYuCK243YPvasjTkACaSIZlXDng8yNsPL6MzO6dmmEgEoTwMXsaGbDae4PwAZdIAWPsJln6TPLwrJhWC3dokdSKiPIqYHFRMejUFsGhsV/nMMgjSP93auXTS+4I1WRoxhhtULplsCb1vY6uRhk2bt3ZQ02b+fBjdxPCUrfftBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779065043; c=relaxed/simple;
	bh=muHbfrRpIVSSxtoi0GG0IRPpos+mmnyB5QlBbAm9EwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHV2++VPgC5BECMx184k+WGoSISePcqc/awqK11HSpiAhn/SiT0RnvB7e+qJydPloag99s7P8AJHrvgjgInyS3Z6EmXDNWYEvamKvdIBa1ETUd7SxLk6QQJcpB5T7yqs5hbCOSlkMrfNssWXdeTbYTDMUug+oStdes7W+ScafaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qFIrxqYl; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UP
	Hg3PhRQ/iRlu2JQO+wt+J//uW4Lc+cTIqd/znwy0w=; b=qFIrxqYlAAyOpwBXPR
	wvEMCmwLAi4HbuXJMO9BsujHYMAnbT/IPoQy9JYunlrEkMEBRLlA5FMO/HrBbLD0
	78xKL1YydB75uknp+oIB+XCvLjlgVdCPl4cK9gluy33ugXFyXd31+EFIg8aLP/Yv
	JuZklAWk1+0XZdEMjjg5/P4Ok=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCnj6SIYApq2fikCA--.4779S7;
	Mon, 18 May 2026 08:42:56 +0800 (CST)
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
Subject: [PATCH v4 5/7] PCI: aardvark: Add 100 ms delay after link training
Date: Mon, 18 May 2026 08:42:44 +0800
Message-ID: <20260518004246.1384532-6-18255117159@163.com>
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
X-CM-TRANSID:_____wCnj6SIYApq2fikCA--.4779S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWfGF4fJw1UXryftF1fZwb_yoW8GFWrpa
	y3CrZrJrs5tr43ua17Aa4fWFy3Wan0ka47Jr92gw13ZFnrKryUJr1jk3sagF17ArWvvr13
	Ca43t3Z3Gr43XFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziSfO3UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxFZ-GoKYJEOSwAA3j
X-Rspamd-Queue-Id: A0FCA5648CA
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
	TAGGED_FROM(0.00)[bounces-32734-lists,linux-renesas-soc=lfdr.de];
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

The Aardvark PCIe controller driver waits for the link to come up but
does not implement the mandatory 100 ms delay after link training
completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).

The driver already maintains a 'link_gen' field that holds the negotiated
link speed. Use it together with pci_host_common_link_train_delay() to
insert the required delay immediately after confirming that the link
is up.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pci-aardvark.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index e34bea1ff0ac..fd9c7d53e8a7 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -26,6 +26,7 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 
+#include "pci-host-common.h"
 #include "../pci.h"
 #include "../pci-bridge-emul.h"
 
@@ -350,8 +351,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
 
 	/* check if the link is up or not */
 	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
-		if (advk_pcie_link_up(pcie))
+		if (advk_pcie_link_up(pcie)) {
+			pci_host_common_link_train_delay(pcie->link_gen);
 			return 0;
+		}
 
 		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
 	}
-- 
2.43.0


