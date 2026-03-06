Return-Path: <linux-renesas-soc+bounces-28972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JoLEFjoqmkTYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:44:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91852222F8B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 15:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43C4F314C839
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 14:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6EE3B8D6D;
	Fri,  6 Mar 2026 14:36:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254AC3B895D;
	Fri,  6 Mar 2026 14:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807766; cv=none; b=gyMtHbGRQMiw70UyyFBIy9aSWZPYzEEAVuPh0yjdqplGGUlDc2tSvRtCOz31nNANZpBCZ1dz84u0BSY8gt/Eookr72y3Qq09rsxMcvZDr7Yf94thhvhQ4v88vXHY6Aq5smgTSSdURujqbcseBqOhBFJdPIi55L1Fw0geF8L1b8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807766; c=relaxed/simple;
	bh=wdRGkCzrRPOwDiooBadZtyDj5gOuXSOs8dHfDIDE/oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7b/5MklZCvBdUXBHJ0sQWSrEDtXWVrvWE5589bDaVN1CvXnazpAPfMwrB+OF/jEA3aaJEKUpHxDcYU8tlY8JMrUbIWN1gDw+qS7KJ0qqenK5hH1SBMJocUikGDwKmjZTQeLYy1yQvN2/smGuQyqT0J/j9WHmW+IBJc1OcGx2Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: kXyeGxnXT+KRVONchwBtiw==
X-CSE-MsgGUID: QuqQugpGT16EIsA4lcFFBA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Mar 2026 23:36:02 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.98])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A5DF0400B544;
	Fri,  6 Mar 2026 23:35:57 +0900 (JST)
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
Subject: [PATCH v8 13/15] arm64: dts: renesas: r9a09g047: Add PCIe node
Date: Fri,  6 Mar 2026 15:34:20 +0100
Message-ID: <20260306143423.19562-14-john.madieu.xa@bp.renesas.com>
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
X-Rspamd-Queue-Id: 91852222F8B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28972-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,bp.renesas.com:mid,0.213.167.80:email,renesas.com:email,0.198.94.208:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.204.119.192:email]
X-Rspamd-Action: no action

The RZ/G3E SoC family features an x2 PCIe IP. Add the PCIe node.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v8: No changes
v7: No changes
v6: No changes
v5: No changes
v4: No changes
v3: No changes
v2: Roerder interrupts and interrupt names to match binding

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index cbb48ff5028f..2eccaa7ed1c5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -841,6 +841,75 @@ wdt3: watchdog@13000400 {
 			status = "disabled";
 		};
 
+		pcie: pcie@13400000 {
+			compatible = "renesas,r9a09g047-pcie";
+			reg = <0 0x13400000 0 0x10000>;
+			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x8000000>,
+				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
+			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 2 0x00000000>;
+			bus-range = <0x0 0xff>;
+			interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "serr", "serr_cor", "serr_nonfatal",
+					  "serr_fatal", "axi_err", "inta",
+					  "intb", "intc", "intd", "msi",
+					  "link_bandwidth", "pm_pme", "dma",
+					  "pcie_evt", "msg", "all",
+					  "link_equalization_request",
+					  "turn_off_event", "pmu_poweroff",
+					  "d3_event_f0", "d3_event_f1",
+					  "cfg_pmcsr_writeclear_f0",
+					  "cfg_pmcsr_writeclear_f1";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie 0 0 0 0>, /* INTA */
+					<0 0 0 2 &pcie 0 0 0 1>, /* INTB */
+					<0 0 0 3 &pcie 0 0 0 2>, /* INTC */
+					<0 0 0 4 &pcie 0 0 0 3>; /* INTD */
+			clocks = <&cpg CPG_MOD 0xc4>, <&cpg CPG_MOD 0xc5>;
+			clock-names = "aclk", "pmu";
+			resets = <&cpg 0xb2>;
+			reset-names = "aresetn";
+			power-domains = <&cpg>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			renesas,sysc = <&sys>;
+			status = "disabled";
+
+			pcie_port0: pcie@0,0 {
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				ranges;
+				device_type = "pci";
+				vendor-id = <0x1912>;
+				device-id = <0x0039>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+			};
+		};
+
 		tsu: thermal@14002000 {
 			compatible = "renesas,r9a09g047-tsu";
 			reg = <0 0x14002000 0 0x1000>;
-- 
2.25.1


