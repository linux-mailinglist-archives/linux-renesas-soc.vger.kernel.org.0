Return-Path: <linux-renesas-soc+bounces-28331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ2yHbSQl2mR0gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 23:37:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED2163416
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 23:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 258DC3014C7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Feb 2026 22:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D14032C937;
	Thu, 19 Feb 2026 22:37:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D522EDD52;
	Thu, 19 Feb 2026 22:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540658; cv=none; b=tDXrR3RZfGmGxqHmtinBDv98iEokswGVDQUE9mpdZXXZnC/NDw3Ya4EKCTDnOn1CV3nPfhJQ2EDsne6ZLQ9S3JADFgBpnLGVkcrozcporSv8+ynIedSSag+PWRkcqIzeXBhzycPFNLKJhMakaPG6s88lFw42gISbMplXJQ+86Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540658; c=relaxed/simple;
	bh=8e+pCou12heex+BCJDtXT9FyqFR/S1jS5xn0ncZjflg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTJTDXc5jJueDFRnpZPeKLPJhkNGPsROJtpXBkNh6KPMh1XiyVgnTCmOUICJIxYTpFtPiQS8rlNKMg+IkuS56cSMVkeighTG7as3cp+OVlGNO129vO8+Q/w9Vt+Hzm3zTEEH4ZAEGgajCUaSD6lfLAKSSVY4NShzwl2CZU+Rkwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: OxbcbcAVRK61ZLMMtYFUUA==
X-CSE-MsgGUID: 7nk0XSVLSM6xnt51gdGtSg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Feb 2026 07:37:35 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.24.0.22])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AF3074006196;
	Fri, 20 Feb 2026 07:37:30 +0900 (JST)
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
Subject: [PATCH v6 16/16] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe
Date: Thu, 19 Feb 2026 23:35:42 +0100
Message-ID: <20260219223542.6364-17-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28331-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 37ED2163416
X-Rspamd-Action: no action

The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
Enable PCIe support.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v6: No changes
v5: No changes
v4: No changes

v3:
 - Splitted enablement into common carrier dtsi and board dts

v2:
 - Removed board-specific dma-ranges.
 - Merged enablement and pinmux assignment in same file

 .../boot/dts/renesas/r9a09g047e57-smarc.dts      | 16 ++++++++++++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi  |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 696903dc7a63..1ba50512f4ef 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -122,6 +122,11 @@ key-sleep {
 #endif
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+};
+
 &pinctrl {
 	canfd_pins: canfd {
 		can1_pins: can1 {
@@ -167,6 +172,17 @@ rsci9_pins: rsci9 {
 		bias-pull-up;
 	};
 
+	pcie-clkreq-n {
+		gpio-hog;
+		gpios = <RZG3E_GPIO(4, 5) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "pcie_clkreq_n";
+	};
+
+	pcie_pins: pcie {
+		pinmux = <RZG3E_PORT_PINMUX(G, 7, 1)>; /* PCIE_RST_OUT# */
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index b607b5d6c259..e2a34577a1a1 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -96,6 +96,10 @@ &i2c0 {
 	clock-frequency = <400000>;
 };
 
+&pcie {
+	status = "okay";
+};
+
 &scif0 {
 	status = "okay";
 };
-- 
2.25.1


