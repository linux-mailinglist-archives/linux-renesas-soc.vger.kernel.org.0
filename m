Return-Path: <linux-renesas-soc+bounces-28124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIdaKnAXi2m3PwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28124-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:33:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0E611A34A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E3003300B1A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2644318BA8;
	Tue, 10 Feb 2026 11:33:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290C8314B77;
	Tue, 10 Feb 2026 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723181; cv=none; b=b46jrhEQPaqw1ZtqNu+cjJZicSkZCWsjKQEfu+kcAh9iNimyDY697bcHTpzH0/ygSFsJIdIWEk7TlZoCeraehPSDPFPS2rJWYEoknQY5qFF2v7EuyUSCCwhPA6CzMLnX7zKIGK4gUDZAtVXYUcDMrlGJN6pQdA4GJbGDY0EUbH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723181; c=relaxed/simple;
	bh=qwVdWqpcTBe4Y4Xc4x9oFHlPMdSld+rpOnI8HePeOYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFeCjtQIDh0YEj01U9nWS0YBYTPWqi3aWfhMEQZoIziS95DgY9YSpF8N7H9R3wcoDnIuoytBA2vNNslD3CTOf7eFikDPl0i3ho66cwDx5nQyyPdXEtQZ8E8ddTIVfo57UgC+CXFDmjb5e242279e7DeKXGc/nK1oEOOI/trWJxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: VBEtuXZATbe+Bh0QA05/LA==
X-CSE-MsgGUID: BBoB6ci5THqyYLgn1pWE6A==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Feb 2026 20:32:59 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.55])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 71BD341A118C;
	Tue, 10 Feb 2026 20:32:53 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: claudiu.beznea.uj@bp.renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org
Cc: robh@kernel.org,
	bhelgaas@google.com,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 08/16] PCI: rzg3s-host: Make configuration reset lines optional
Date: Tue, 10 Feb 2026 12:30:32 +0100
Message-ID: <20260210113041.138430-9-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210113041.138430-1-john.madieu.xa@bp.renesas.com>
References: <20260210113041.138430-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28124-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C0E611A34A
X-Rspamd-Action: no action

Some SoC variants such as RZ/G3E handle configuration reset control
through PCIe AXI registers instead of dedicated reset lines. Make cfg_resets
optional by using devm_reset_control_bulk_get_optional_exclusive() to allow
SoCs to use alternative or complementary reset control mechanisms.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

changes:

v5: No changes
v4: No changes
v3: No changes
v2: Collected Rb tag.

 drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 8f80484bb85e..b3b7db93298d 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1161,9 +1161,9 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
 	if (ret)
 		return ret;
 
-	return devm_reset_control_bulk_get_exclusive(host->dev,
-						     data->num_cfg_resets,
-						     host->cfg_resets);
+	return devm_reset_control_bulk_get_optional_exclusive(host->dev,
+							      data->num_cfg_resets,
+							      host->cfg_resets);
 }
 
 static int rzg3s_pcie_host_parse_port(struct rzg3s_pcie_host *host)
-- 
2.25.1


