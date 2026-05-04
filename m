Return-Path: <linux-renesas-soc+bounces-31957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HXDBtOz+GmWzAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:57:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF304C0421
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D062C3050999
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27EB3E51CF;
	Mon,  4 May 2026 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JunxcpI8";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gpgY908g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481953E4C96;
	Mon,  4 May 2026 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905980; cv=none; b=SmWSuPG7JmWUQchxkNmhqDikcib1EiUVzZpqwNg3HiolzAvTvCrNuy1JFtXPqcBHrwVuaTA3vlwPCVzxapcHsFxs0CIFJDA0wcjeplGnwgvDY+BHiV7WuHAnPo2JRp5PB6Z5lgWQyEKIW8+4sV1XQOstR/wzCBkNeTocJNFdHiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905980; c=relaxed/simple;
	bh=M6m64Alv3/G5nUuVbF/mMTSj1zP8t4uIxvjGeMHwUaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPiPMhq/MeqsOHDeRC+HGTulN50Mb8o06esq8SxUcnJv0mICQSPFh/vglUnKnRUQt5iNLHZ5WB0JGyVkyYo4ZyI1SQnSO8p0etGrqo4hJSIQL/a0Ow+qb3fMqQykMOwvK5605XtB7noykeL+IdLRWehOgon7kHps6SpazJ0PXII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JunxcpI8; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gpgY908g; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8PbY5l5hz9tDq;
	Mon,  4 May 2026 16:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvxusKnQ+RxbDoINErdXsrXujJmge6ENoCKAoCTHUKw=;
	b=JunxcpI8W165YVzuTFR7sT8Sjz8VMXHvVT4EBuFvGMa7nZgcVJjeb1Np6GcAJPoeIU7KQ5
	9U2sfD28d0eA+rQqITil3RvDEAqRLs0XN/Jn6wtqVjP2A3S9NUs+TTcPmsqJB/tGZ1ky06
	kktZgLmmMMIYhi6ELRx2yvkKByzJYINlgvvprioqstO/X2HOTo8FMUhNgq8ApFoij6WTM0
	ZOmnFThoUl05uqySLBKkTQwVoaF08tmWpOmbtlo6j3cjl0USrckQIwtk+wfSIG304hHKtF
	jBDwkL0KPzi3vAdQs7JzCrHlRDxhDElSWlS3spLWfxi/ujs5qXSKs+6dqAzCNw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=gpgY908g;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvxusKnQ+RxbDoINErdXsrXujJmge6ENoCKAoCTHUKw=;
	b=gpgY908guuyVN9y2BQ2UGiK57I7P7bK4NghF0SEwfLZmSvCifFjUHmxhSet9njreZblXdR
	Yi/8Jyok6CDiwCVgg1us+GYswRqLpbaf/Rxn5u3YrnDBx4x6GYp3z05i2bZlHA32BvDQXl
	1aYeituXffzpqkFuoUtrNSlyEZAZVF0jzy9OPxOj776gZcL0YwdA6n91SFgOgQXUfgLOjs
	Gj8Ky1S6WNvFgwqaWlylLgKnX13i/rwocbEk+sxQi7mcWYh04U2Hd62kADNOvoLahgkOtp
	EdU/CFxrexFEBaTnDfzKwxozQhd9iHk+KqRIz4/6usEgSPaEyC8cZ8Q5xmqJ7g==
To: linux-arm-kernel@lists.infradead.org
Cc: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
Date: Mon,  4 May 2026 16:43:28 +0200
Message-ID: <20260504144534.43745-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 74ac9964edfaab90fd9
X-MBO-RS-META: s1ctykzbmfi1ieuh3muaxegkhdah6es3
X-Rspamd-Queue-Id: 8BF304C0421
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31957-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,mailbox.org,redhat.com,kernel.org,glider.be,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>

Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
variant of the R8A77965 (M3-N) with reduced set of peripherals.

Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Drop DU until it can be tested
    - Reinstate sdhi3, switch SDHI to dedicated M3Le compatible strings
    - Add no-mmc DT property to SDHI3/MMC1, because MMC1 is not supported
    - Disable ohci1, ehci1, usb2_phy1
---
 arch/arm64/boot/dts/renesas/r8a779md.dtsi | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779md.dtsi b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
new file mode 100644
index 0000000000000..f30654141341a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car M3Le (R8A779MD) SoC
+ *
+ * Copyright (C) 2025-2026 Renesas Electronics Corp.
+ */
+
+#include "r8a77965.dtsi"
+
+/ {
+	compatible = "renesas,r8a779md", "renesas,r8a77965";
+};
+
+/delete-node/ &csi20;
+/delete-node/ &drif00;
+/delete-node/ &drif01;
+/delete-node/ &drif10;
+/delete-node/ &drif11;
+/delete-node/ &drif20;
+/delete-node/ &drif21;
+/delete-node/ &drif30;
+/delete-node/ &drif31;
+/delete-node/ &du;
+/delete-node/ &ehci1;
+/delete-node/ &hdmi0;
+/delete-node/ &lvds0;
+/delete-node/ &mlp;
+/delete-node/ &ohci1;
+/delete-node/ &pciec1;
+/delete-node/ &sata;
+/delete-node/ &usb2_phy1;
+/delete-node/ &usb3_peri0;
+/delete-node/ &usb3_phy0;
+/delete-node/ &vin0csi20;
+/delete-node/ &vin1csi20;
+/delete-node/ &vin2csi20;
+/delete-node/ &vin3csi20;
+/delete-node/ &vin4csi20;
+/delete-node/ &vin5csi20;
+/delete-node/ &vin6csi20;
+/delete-node/ &vin7csi20;
+/delete-node/ &xhci0;
+
+&sdhi0 {
+	compatible = "renesas,sdhi-r8a779md", "renesas,rcar-gen3-sdhi";
+};
+
+&sdhi1 {
+	compatible = "renesas,sdhi-r8a779md", "renesas,rcar-gen3-sdhi";
+};
+
+&sdhi2 {
+	compatible = "renesas,sdhi-r8a779md", "renesas,rcar-gen3-sdhi";
+};
+
+&sdhi3 {
+	compatible = "renesas,sdhi-r8a779md", "renesas,rcar-gen3-sdhi";
+	no-mmc;
+};
-- 
2.53.0


