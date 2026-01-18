Return-Path: <linux-renesas-soc+bounces-26964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64421D3957A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C6DC30006C6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726AF3314DB;
	Sun, 18 Jan 2026 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AyKVMLIU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Qv4AhdJ0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501A288C25;
	Sun, 18 Jan 2026 13:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744283; cv=none; b=L+c1uXrXKi20ROn2n/QIpZHalEoiFqbXt0zjGbYmTE8rAfa2tWYlVc4JWQntSkEt2SB9JZlsveFxo/uwXD9fhN8QdM56Dgrvo+JUj8a4Ycv14oFsNe7ml/6KYQcszm4EBqtcOMux0r0Jg56sL2RxIpZKgIMbFV9NMmO3NQEt3pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744283; c=relaxed/simple;
	bh=wr2DJptBQhx/ADiRKgV4WyYqAujSYRIY/JtPkp99AXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pd4uWR+51MX2LQTVYBlThjPM8iLTvTFbw7cfZhUfBJQhWj4gNgWcUWv0VVS6tB//Bnnannzf3XG9QDjPNUEQy/+vHrrGtx7IqWd9zVO6FLtHjr5/yKZKqyOaUOqykuQfabnvFtlR9SHjNFzHq+R38eM6ck2mE8Cs7NUkt5ndrCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AyKVMLIU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Qv4AhdJ0; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dvFP3077Zz9tnr;
	Sun, 18 Jan 2026 14:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATEJOv5JRXd5mDEFh5TKeAEKiCU39svbKkcn8dQQ6kA=;
	b=AyKVMLIU82YPC5uzQmcTkvWKSbvjzIGCqZjgt4iOLHzKpud1fqlfDI5l/ukPCiMkHcqmkG
	RNnN+sPJXTwhYdrPnaVWoAYbG+D8Y+lnYVE/HD4dkA/SzvaH6JH5dVnFcd5F4EviYb2eAB
	KV5oHqLkK581J2FONq569Ka4DeY54kXMuo3tCOqfL51SB/bG/6sxs3+p7zWUvnATdgWqS7
	hoBMeC2uJ6Rl8+eCasq3zERw/59chB+Nqo3M5ZszbUuoY6EuoeyfCmUWC5PzmKtMrriTHD
	z3n4k3wzFxUZPv7iKjVd5QD25UFSKHQuMkNwzEiQQuofE3hnejVWNuYH2jUGoQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATEJOv5JRXd5mDEFh5TKeAEKiCU39svbKkcn8dQQ6kA=;
	b=Qv4AhdJ07o9L6xHdrzyU1A1SHFrIFTXDezDCnykBAQdBk+kdaaLeNxDBDPCMPjdXtr+SbL
	HL50IJqmCdqqmYsM0qP7jHj0da8jRCSJmGbuX4u9e+ygA5rGQB95LapPu/yQ6l6soab8Gl
	G46G1BFGNPh3m/epcN3jfvu7sBAUg2QWAXn8p71H6Gd702NOMDqzwb9NWGpc5VArL5YPS1
	k0cHwtynF/vLvoy1qw8IQlRB1DkPJz2tMd0wLd+6eOutBRXj1D/LHd0H6G6dNRhiqTtxRQ
	f90pHL3ujsdlO8FolKoECSACdw+AaxngLPQPjCNhLUWNAZFBkf9bYfm2Atz1sA==
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
Subject: [PATCH v2 2/9] arm64: dts: renesas: r8a77960: Describe PCIe root ports
Date: Sun, 18 Jan 2026 14:49:50 +0100
Message-ID: <20260118135038.8033-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6qzzupo9auurkjxax49ksd8prsxnfg71
X-MBO-RS-ID: da2ec94324d16aa443f

Add nodes which describe the root ports in the PCIe controller DT nodes.
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
V2: No change
---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index e64c7b1aebc47..ad36aa8e75435 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2619,6 +2619,16 @@ pciec0: pcie@fe000000 {
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
 
 		pciec1: pcie@ee800000 {
@@ -2648,6 +2658,16 @@ pciec1: pcie@ee800000 {
 			iommu-map = <0 &ipmmu_hc 1 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec1_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		imr-lx4@fe860000 {
-- 
2.51.0


