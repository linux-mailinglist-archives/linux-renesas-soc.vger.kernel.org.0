Return-Path: <linux-renesas-soc+bounces-30691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G2tCqcvzWn7aQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 16:45:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D6037C608
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 16:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC9AD30D180E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 14:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8899A2D63E5;
	Wed,  1 Apr 2026 14:34:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED147274B43;
	Wed,  1 Apr 2026 14:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054054; cv=none; b=KeFrckcHTVLDKrQK5YTm4AqFSSMdzGCZB3UiBahlqaTt/gqVV7fbpdgeGsv44AQxdPuiSaz50bRKgJhz/ss9z54MzLpJ3UvdHCxS/GXQ5K+ja7ZG3DeqDt5ujrWYBHxI6at10hRcYZ6bbl3RRpWCpimw8R2FcNywRbTA+l0asu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054054; c=relaxed/simple;
	bh=sWOORqm4zZMJjRATz6N4YPGXWzTJrPr0OC8wyxwYLAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUNTEIO5UGQ1u0a75YpHuyU4mAqUMEZotInjEUW3c8GnPFoQ/gPyIlYwbO3CREX+sonsfSg55JLKp4bLtvkj+O94OZ9qUxhXuFX9ltuS2K3eqm5biypr2vKFJ3wuvs4pbsWKg+j7IH9KMXM9Zsus2RTC9n5xqKro4o83wygaf5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: BQmi9ERdSTygLBIFM2V5kA==
X-CSE-MsgGUID: /x7OaB2IT3aL7SXiNAM9ig==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Apr 2026 23:34:05 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.25])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C9F4C400FCDF;
	Wed,  1 Apr 2026 23:34:02 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org
Cc: robh@kernel.org,
	john.madieu@gmail.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH] PCI: rzg3s-host: Treat link-down as -ENODEV instead of error
Date: Wed,  1 Apr 2026 16:33:47 +0200
Message-ID: <20260401143347.8463-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30691-lists,linux-renesas-soc=lfdr.de];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: B7D6037C608
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rzg3s_pcie_host_init() failing to establish a PCIe link does not
necessarily indicate a hardware or driver error; it may simply mean no
card is inserted. Demote the message from dev_err_probe() to dev_info()
and return -ENODEV so the driver defers gracefully rather than printing
a spurious error.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index bfc210e696ed..03be10aa5b54 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1653,9 +1653,10 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init IRQ domain\n");
 
-	ret = rzg3s_pcie_host_init(host);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to initialize the HW!\n");
+	/* Failure to get a link might just be that no cards are inserted */
+	if (rzg3s_pcie_host_init(host)) {
+		dev_info(dev, "PCIe link down!\n");
+		ret = -ENODEV;
 		goto teardown_irqdomain;
 	}
 
-- 
2.25.1


