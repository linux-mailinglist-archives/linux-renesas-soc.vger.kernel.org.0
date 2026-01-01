Return-Path: <linux-renesas-soc+bounces-26244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB875CED57A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACB623003FA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5932BDC26;
	Thu,  1 Jan 2026 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FKOGXWtu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VDkKx4gE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AAE1C1F02;
	Thu,  1 Jan 2026 20:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300035; cv=none; b=M/RjnC9Ris3Rb/vGtcBEJXM1a7OgamWCwEpz/sk3ltc8L6bukLlVW4OJqG0X0dYaMW2w8/R7DuxajxIlpsnxVxgyz7vpesR1OjN872LrCsQ0IQTB9+buMXYSy7GYfNrdx31tqvsiiH3qLu/LLXFj+djr1PFwgvUpjJ7LLyLLiUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300035; c=relaxed/simple;
	bh=SEOGSX8rMt0p+/PrDfzLl+MeE1Uqg/rFrmQLzNv+1XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBXTxAvpb3pwJACIlSWHwkNWeYVXBORrH0mjIKmHJBlbui+wZ4ShJ7yL3KAVjJ8oxovfrJ/vwbXckenPCfGt3mbKfTT79y1PmfQsrPnKaJxQdXU+TAP58KL6Ge8ra2P0T35CRr9YLNfJHIhmTKu+hCDmLC/WD66RbpNkeJNSdAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FKOGXWtu; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VDkKx4gE; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dhzGy41xKz9spn;
	Thu,  1 Jan 2026 21:40:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYXd4rBWr+VoCYfFMCg1Y6PRgql/J88JwBUm3GoZ7zI=;
	b=FKOGXWtupwxuhKtRe/MtXbRZA5BbFZxFq2HSVaHZ3Wp2ztJGttxgXTvPCh70vvZq492r4N
	X+kk0zBsLW/bHDWQ1wywOb3/U6QEfHStBs7z3KRuOrnM5kxwZ/2zWuC8BidKuOF0ssIYyP
	UlrYueP5Y2bU3atZs4dqnt03sJ9mxELhXwt6A42DZdfAeN6nJeVBvHo+ugfJScVvLjtGUm
	XSStS566q+bXTk5FbDU9m/jQ4o5F9oScdxoaJO+MTdrnVXTFcverBvPum/KAlhubNPrVGq
	aB7/NilCPzZmRtOZKNCeSFinTZyfU1nPUeNpmhL8Blz3kxSH8DcHWoP3gcqq/g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sYXd4rBWr+VoCYfFMCg1Y6PRgql/J88JwBUm3GoZ7zI=;
	b=VDkKx4gENKUbqCbWa21GR/2zaee5W78QUD2Zg9PP0/wl0JMWJvvG25FXPuxe4WL6yeGtfT
	6qjikiu+LiooM1BFAgxZi2cfLQ2QvwSkDDzx5ivwpiAlgc9Ai5bRHADdumBy4Rl06ofV8P
	/OboL9RX5+cIj90K007K2WvViqbkFjNbtMd3sDAXC9aopwHEHwA7F6y5I22mMeKS5GQS8/
	OSSCTX2zAeV5nqKETQrV1IbDodIRo8QBMtZaXpr1VnlzVVOo/Rcgnh4amxs1aZ2IaqXkyV
	6UYQc4Dfzr751MUUqsQvMHK2US+te7EYwjGEDV1CT1bTCq9f1g8h7mmjzxGVqw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 08/11] arm64: dts: renesas: r8a77990: Describe PCIe root port
Date: Thu,  1 Jan 2026 21:35:55 +0100
Message-ID: <20260101203938.159161-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4xj4hfx1t18ohj6cenieuw95kagphsmk
X-MBO-RS-ID: f8316f89ca3287b92c3

Add node which describes the root port in the PCIe controller DT node.
This can be used together with the pwrctrl driver to control clock and
power supply to a PCIe slot.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 9b4569782d61d..1e650a4bd81aa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1941,6 +1941,16 @@ pciec0: pcie@fe000000 {
 			iommu-map = <0 &ipmmu_hc 0 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec0_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		vspb0: vsp@fe960000 {
-- 
2.51.0


