Return-Path: <linux-renesas-soc+bounces-26239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8F3CED55C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C6A03005EA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E86239E8D;
	Thu,  1 Jan 2026 20:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KQIE+KkW";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tUxLiTHj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1119D071;
	Thu,  1 Jan 2026 20:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300016; cv=none; b=Ag0HRvVLXjEQFEKx0tS0YcYD8H9Uwc0emVKIPGTs2xcdBhtAQco7ljb83eSD2xUl5riOF9jDA9PpIkWP2wdZC7AK5QXu0rVDir9VRrmsE2/WNF0QoRNuu0a1xi7gQPMT53lcKDLorB1J4jQI5eWOrbpinaf/MEWuEtMdMP0InW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300016; c=relaxed/simple;
	bh=oc8dmT94S7mYE0NGMC61D3nmfVswUwd95U/ZuNbqY/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDrtOxyspT4vBAlpNHyWnB3Mk8kKNaDoQZqqir86UV68IpXYd/09dABkpbSlVyyQhU2+++P1rVaJr1sFHoTlEvwBYt2LwDqxUUueTpA1VZDcKvE7eeN6qJv00fi7Qsqcpg1/Ukaodihj6iwfgPAKW72AbFoFjpbCGj8eXEVNG9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KQIE+KkW; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tUxLiTHj; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhzGh6pbnz9sl4;
	Thu,  1 Jan 2026 21:40:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GnCDI/zTe02LYmrbiI1lP2x1HisucV9/vjfmKK3PvNI=;
	b=KQIE+KkWoO++fCPXn3VZoeJ21j95P3XZ/hEkIRXiFIb3bcoVjo/TSpmTttENj0h8YZwNGE
	CUaH35vTOjJ1wj8PaxUXBwKhUXXgVQDxDez3uI1ANIANp6lW+otpyw6G7vGdfxbNQvmr9J
	Mw2SfxH/v8tfdasyfRSEeLBCGxX82zfbWfKS6/IVOCk2/Nvq21GX00GdwWIPiufCzyYpQ5
	RRKwGtZx96OpME/HMCEbmvi8CoebaiT7sqCnPHAvN+c0JYjtb2lrpFUIbPksy1YwOeIJ63
	nsfiSUvE5133GJ4iIM2fWUGA/SPSNyo1gxZBrf3Q2ROVVHu9lYl9s5xTF36W0Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GnCDI/zTe02LYmrbiI1lP2x1HisucV9/vjfmKK3PvNI=;
	b=tUxLiTHjcv6LvFAqOgS8TXTsNAMcgyhDxuqTCfDf9uuQMSWLVPgf2E1DoAIx1aV6ceB/cW
	bJFO4THLeekbHq+icLjecy8FHdChnmpXoSSv7O28TpoWpCl4nEIYdD0q+l3dWROt0k+stU
	dnl3Z01UVVfowtYiQJSjrtjkJ7iSgwxE57fg6AIkX6NKpq5nCHlxnmA32Ga/R8rPnmS0TA
	KMEM+cW8tnP1dA74gWZxEl0abnQ76HQhWfVOA4W73SwMLexMutfi3KjBjHlKYZEaVZCVNb
	Lbo0pqHFtK1XK0LDvlux+obEH9IaKUs081YtLiwViChMJQ7Nf+Le7bllvB1X6w==
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
Subject: [PATCH 04/11] arm64: dts: renesas: r8a77951: Describe PCIe root ports
Date: Thu,  1 Jan 2026 21:35:51 +0100
Message-ID: <20260101203938.159161-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: h5g7kbidsiaj7ufgb145wizedd7etbqj
X-MBO-RS-ID: fcbd0409e30c99e4e16

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
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 1ac24e614aa9d..466794eac4d3a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -2826,6 +2826,16 @@ pciec0: pcie@fe000000 {
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
@@ -2855,6 +2865,16 @@ pciec1: pcie@ee800000 {
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
 
 		pciec0_ep: pcie-ep@fe000000 {
-- 
2.51.0


