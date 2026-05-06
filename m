Return-Path: <linux-renesas-soc+bounces-32138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFtuLbld+2n2aAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:26:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 574064DD2D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A5F23000FD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D76B494A13;
	Wed,  6 May 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="joWJy+qj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DE2481A82;
	Wed,  6 May 2026 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081125; cv=none; b=sf1PVkgdrmAHr78u0hlT9/QiqzwDbTS7pBSK7qnF9zoAgkeix02Qh52pv+fDsMe7O+cyqiNOTCsOJQzSa3ZH9+6JKcTvIsVff0mcwZa1J1+slL8K8RQ2PniZvLk4O3mDdJBkurvyH2Xfs0Y6QXfTrsIY+CbBpnWEiEQjkIjZ6Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081125; c=relaxed/simple;
	bh=GhIUQhK/ACVD4fdxZ164YUvoWXZbPzyuCKLehj/SzdA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DvD0WhqSRoSQWEYqP1CvWcyVvHhVcoXYGQe/FyJ/6btMUVcADnxgAJg3NZNv7ojAKT02poCULUSVmamA+k8tblnPxmHNQsY2Cvk4UmAFZNAibnAyNGe5414mUOitTC08DzabtYo/kWDXOEiBbV4ri68uD6ngbz1650KEwXuVOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=joWJy+qj; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=pD
	yIM4BKweQBnCpgrNGgNcV7Vbp6Q+A8dmpeii+IQGo=; b=joWJy+qjTJCNktMpzt
	ZqXslnzQhJb1oT/i6kVzHaxMfME0l3i7P69BPzq7402unsiX/DLgq1c7c5w8Opts
	FeoNmeCBC/CLmqIJVT+84XHBaEZAvXAOhCVNxaV+0C4teOKBqAIAArIXYq1xkeFU
	2WIITz0TSsY1VyPDzjF9cu12o=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAXH5wkXftpfKPsDg--.7909S2;
	Wed, 06 May 2026 23:24:21 +0800 (CST)
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
Subject: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link training
Date: Wed,  6 May 2026 23:23:46 +0800
Message-Id: <20260506152346.166056-9-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506152346.166056-1-18255117159@163.com>
References: <20260506152346.166056-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXH5wkXftpfKPsDg--.7909S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1DXw47ZryDZFy8XryfCrg_yoWkurg_u3
	9xCFn7Aw4UGr9akF12y34rZryYy342qr10qa10vF13ta4I9r1rXw1fZF4jy3WUWa15JFyv
	yryqyr109r9rujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRM7KItUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAW5XWn7XSU5xwAA3x
X-Rspamd-Queue-Id: 574064DD2D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
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
	TAGGED_FROM(0.00)[bounces-32138-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ti.com,vger.kernel.org,lists.infradead.org,163.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The Renesas RZ/G3S PCIe host driver currently does not enforce the
mandatory 100 ms delay after link training completes for speeds > 5.0 GT/s,
required by PCIe r6.0 sec 6.6.1.

The driver already has a 'max_link_speed' field (derived from the device
tree). Add a call to pcie_wait_after_link_train() in
rzg3s_pcie_host_init() after reading the link status, ensuring that the
delay is applied before any Configuration Request is sent downstream.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index d86e7516dcc2..6ab59c5464cf 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1390,6 +1390,8 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
 	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
 	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
 
+	pcie_wait_after_link_train(host->max_link_speed);
+
 	return 0;
 
 config_deinit_post:
-- 
2.34.1


