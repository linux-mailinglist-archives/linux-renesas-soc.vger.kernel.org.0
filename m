Return-Path: <linux-renesas-soc+bounces-27653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LDbOYPUe2klIwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 22:43:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 895A4B4F89
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 22:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A708B3011762
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 21:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CA0363C63;
	Thu, 29 Jan 2026 21:43:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CA236215A;
	Thu, 29 Jan 2026 21:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769722986; cv=none; b=CLI1X7/ygQvgPxa2lU37lzVNL5gkLR1t1nUAn6UPQZog5YUC4kVOXBpPTdpxv1PWJGuW1faMIoVCeA4p0croHeyXFbu0kk3sCDaH4Fd8p44/RuX4jOw9n0+DZ5wX/2QJB5yMV/NVjBsFoyrRaCrtuQ5TNRDp25uubOMmd+A4ZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769722986; c=relaxed/simple;
	bh=i3QAt0peB1d3T35RRLkvccTTRcPKYJSVmLcvmkMPm48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjcoOJrCsDPkNPImHuAGV4XFPwzcEqM7qDDk/F/QsGiOFO1o2T6zpiBnGuBDYStsZ6AWw1JmT+vI+iiQmAD3aHPIasclUfk4HtsmM0f9b6FMktq1UEzSIe/SFk7JPVRmv9mOsR8HRDCo7QzMjqRC5nrJE5iPGATMmxGGzUPPYtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ahtEV/oRSJGpLtpSHtOnVg==
X-CSE-MsgGUID: upsxkLtlRtuktXotQJ3UlQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jan 2026 06:43:04 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.73])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2FD81408FDE1;
	Fri, 30 Jan 2026 06:42:58 +0900 (JST)
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
Subject: [PATCH v4 11/15] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link speed support
Date: Thu, 29 Jan 2026 22:41:25 +0100
Message-ID: <20260129214130.16067-12-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27653-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.875];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 895A4B4F89
X-Rspamd-Action: no action

Extend the link speed configuration to support Gen3 (8.0 GT/s) in addition
to Gen2 (5.0 GT/s). This is required for RZ/G3E PCIe host support, which is
Gen3 capable.

Instead of relying on DT max-link-speed for configuration, read the hardware
capabilities from the PCI_EXP_LNKCAP register to determine the maximum
supported speed. The DT max-link-speed property is now only used as an
optional limit when explicitly specified, which aligns with PCIe subsystem
expectations.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v4: No changes
v3: No changes
v2: Collected tag.

 drivers/pci/controller/pcie-rzg3s-host.c | 26 ++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 76f6d940ba45..985414076a85 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -977,8 +977,9 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
 {
 	u32 remote_supported_link_speeds, max_supported_link_speeds;
 	u32 cs2, tmp, pcie_cap = RZG3S_PCI_CFG_PCIEC;
-	u32 cur_link_speed, link_speed;
+	u32 cur_link_speed, link_speed, hw_max_speed;
 	u8 ltssm_state_l0 = 0xc;
+	u32 lnkcap;
 	int ret;
 	u16 ls;
 
@@ -998,7 +999,22 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
 	ls = readw_relaxed(host->pcie + pcie_cap + PCI_EXP_LNKSTA);
 	cs2 = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
 
-	switch (pcie_link_speed[host->max_link_speed]) {
+	/* Read hardware supported link speed from Link Capabilities Register */
+	lnkcap = readl_relaxed(host->pcie + pcie_cap + PCI_EXP_LNKCAP);
+	hw_max_speed = FIELD_GET(PCI_EXP_LNKCAP_SLS, lnkcap);
+
+	/*
+	 * Use DT max-link-speed only as a limit. If specified and lower
+	 * than hardware capability, cap to that value.
+	 */
+	if (host->max_link_speed > 0 && host->max_link_speed < hw_max_speed)
+		hw_max_speed = host->max_link_speed;
+
+	switch (pcie_link_speed[hw_max_speed]) {
+	case PCIE_SPEED_8_0GT:
+		max_supported_link_speeds = GENMASK(PCI_EXP_LNKSTA_CLS_8_0GB - 1, 0);
+		link_speed = PCI_EXP_LNKCTL2_TLS_8_0GT;
+		break;
 	case PCIE_SPEED_5_0GT:
 		max_supported_link_speeds = GENMASK(PCI_EXP_LNKSTA_CLS_5_0GB - 1, 0);
 		link_speed = PCI_EXP_LNKCTL2_TLS_5_0GT;
@@ -1014,10 +1030,10 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
 	remote_supported_link_speeds &= max_supported_link_speeds;
 
 	/*
-	 * Return if max link speed is already set or the connected device
+	 * Return if target link speed is already set or the connected device
 	 * doesn't support it.
 	 */
-	if (cur_link_speed == host->max_link_speed ||
+	if (cur_link_speed == hw_max_speed ||
 	    remote_supported_link_speeds != max_supported_link_speeds)
 		return 0;
 
@@ -1609,8 +1625,6 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	host->pcie = host->axi + RZG3S_PCI_CFG_BASE;
 
 	host->max_link_speed = of_pci_get_max_link_speed(np);
-	if (host->max_link_speed < 0)
-		host->max_link_speed = 2;
 
 	ret = rzg3s_pcie_host_parse_port(host);
 	if (ret)
-- 
2.25.1


