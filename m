Return-Path: <linux-renesas-soc+bounces-28970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMhUGobnqmkTYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:41:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6679E222E61
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9251A302C519
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 14:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C223ACEFF;
	Fri,  6 Mar 2026 14:35:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BF33ACF1B;
	Fri,  6 Mar 2026 14:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807754; cv=none; b=TSWjSam0H/u8umbLl5IpvNDqpMxRFyn3mcaYGp8PrRIXJUbBCKCSYo06nBnuhPSDJU2Dyxn5I+HkJh87fzEBnu9PSBfgqE17Kb7hPDFQ9eCSochBFtVpHCi/s2ZsZZCgdYhaE7fHMCBrA5OwTRASXJ2lmS+yvdL1jawRe7ZOklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807754; c=relaxed/simple;
	bh=WSlO/51NidY9+BtDj0hXBRX5vAjxyoZKwPtt7SUPzas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzwKFDFaJCTVX3WC8PEY2Tl3x0sQ+KOW3Ttc1NlJnZWGZPtS3GedBe27q9gH4ZTSlrCuVbhPVTR2YytwQRI16dy9SnRawEShC3ly9UkxzQ71i9z3G1pNmsKLySur9C/K/RO6Kmc0BKtlNkrg/8KAn7Segl9vUdQsGo88KD8fo98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: LPeBvmEAShWy9A2X2k1/cQ==
X-CSE-MsgGUID: yyn2+aJiQV6zOMxsXtXypA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2026 23:35:51 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.98])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 830444008546;
	Fri,  6 Mar 2026 23:35:45 +0900 (JST)
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
Subject: [PATCH v8 11/15] PCI: rzg3s-host: Add PCIe Gen3 (8.0 GT/s) link speed support
Date: Fri,  6 Mar 2026 15:34:18 +0100
Message-ID: <20260306143423.19562-12-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6679E222E61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28970-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Action: no action

Extend the link speed configuration to support Gen3 (8.0 GT/s) in
addition to Gen2 (5.0 GT/s). This is required for RZ/G3E PCIe host
support, which is Gen3 capable.

Instead of relying on DT max-link-speed for configuration, read the
hardware capabilities from the PCI_EXP_LNKCAP register to determine the
maximum supported speed. The DT max-link-speed property is now only used
as an optional limit when explicitly specified, which aligns with PCIe
subsystem expectations.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v8: Typo fix in commit description
v7:Fixed checkpatch 75-char line length warning in commit
   description
v6: No changes
v5: No changes
v4: No changes
v3: No changes
v2: Collected tag.

 drivers/pci/controller/pcie-rzg3s-host.c | 26 ++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index bf9dc76fe975..44ce056d62c6 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1004,8 +1004,9 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
 {
 	u32 remote_supported_link_speeds, max_supported_link_speeds;
 	u32 cs2, tmp, pcie_cap = RZG3S_PCI_CFG_PCIEC;
-	u32 cur_link_speed, link_speed;
+	u32 cur_link_speed, link_speed, hw_max_speed;
 	u8 ltssm_state_l0 = 0xc;
+	u32 lnkcap;
 	int ret;
 	u16 ls;
 
@@ -1025,7 +1026,22 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
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
@@ -1041,10 +1057,10 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
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
 
@@ -1631,8 +1647,6 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
 	host->pcie = host->axi + RZG3S_PCI_CFG_BASE;
 
 	host->max_link_speed = of_pci_get_max_link_speed(np);
-	if (host->max_link_speed < 0)
-		host->max_link_speed = 2;
 
 	ret = rzg3s_pcie_host_parse_port(host);
 	if (ret)
-- 
2.25.1


