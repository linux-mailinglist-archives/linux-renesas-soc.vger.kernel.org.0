Return-Path: <linux-renesas-soc+bounces-27351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDP6JOCAc2n2wwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:08:32 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8A676B98
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 15:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F8C5306248A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083B42FD1CA;
	Fri, 23 Jan 2026 14:02:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E92286A7;
	Fri, 23 Jan 2026 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176966; cv=none; b=oxPjVb6xS6o7//2dL6j/h9k48HTaQIdB64lGpBjUuDdQeG5bw+68Ecze+hmUf5K2S6OJjT9Pkso2eq4n3HIhWwsQJpw1i4cJZoVCgmEapIBaV0VbbuWCpSP8Nw6UK3B6FPvX5un4SJ3Adnc+Kd2z+YYbnba/0gWhs/WlMbmscqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176966; c=relaxed/simple;
	bh=TYCjwlLKf6yO+3h0JuAc6hjX/aqQqcw65j2iA1b3z0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a43aq6YQgALTVmOJP8BEOU5eNv8H49IPJDx1BXYz2Ucgk5zHnYgc79IENqmjBuVS+IyKA6soZIXbmpTmIa0QfKAo0M3yPrJzCZr0sI6o7dV7bB/PlxFTrZwjIq6gq4n1Kwp7oMSDj+rfKYzaRaTXdtFtWj8hf4xjKDfWg/1wT44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GeqU7Q+UTU6o0D+8Lox+cA==
X-CSE-MsgGUID: a6uDTcZDQF6wZILYysjQmA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jan 2026 23:02:44 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.92])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5E966406E3FB;
	Fri, 23 Jan 2026 23:02:39 +0900 (JST)
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
Subject: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe
Date: Fri, 23 Jan 2026 15:00:31 +0100
Message-ID: <20260123140031.94752-16-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27351-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 2E8A676B98
X-Rspamd-Action: no action

The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
Enable PCIe support.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v2:
 - Removed board-specific dma-ranges.
 - Merged enablement and pinmux assignment in same file

 .../boot/dts/renesas/r9a09g047e57-smarc.dts     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 696903dc7a63..6ec34e7565bc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -122,6 +122,12 @@ key-sleep {
 #endif
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pinctrl {
 	canfd_pins: canfd {
 		can1_pins: can1 {
@@ -167,6 +173,17 @@ rsci9_pins: rsci9 {
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
-- 
2.25.1


