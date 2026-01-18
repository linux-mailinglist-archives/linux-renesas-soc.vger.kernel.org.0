Return-Path: <linux-renesas-soc+bounces-26965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A392D39579
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FD5F3009C3C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D0E331A44;
	Sun, 18 Jan 2026 13:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PNF1NTZ9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="grU0bNMj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DEA2D47EA;
	Sun, 18 Jan 2026 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744286; cv=none; b=GtuKWsty+MUihi9O3676jdionwq12eBBIMAo01XuP4Huc5eFGPLENIgnQNYQ52sk84mEPelGwHK4mX8Hn1geINfZNDB2c8bs9QR2FBJDWQcFFMZMZV7Lu0JPhLiBQYrPTfQwlSsYMfG/twZLn5RFesuc3XDNx9dgU1vUoJqlg0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744286; c=relaxed/simple;
	bh=H5+eI3z35P6wdSHG787rO15Tr7n/hENV05QuNPKEdbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AP4Epaa7748Rhn7iy191HGqjY/Q+uhKanmwdhgr2M7Vl8rltTj8AO9UcE1yDq+OvXJqyYtE3CoiuowV04ERZ96WVR55etO9UW4ze8fBRXOzvR8YWb0M3HxA6oATsUqEqzgLlagwKdCsPrJG3Y+3BpDPC+6ge6jMJmw3NVitgpjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PNF1NTZ9; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=grU0bNMj; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dvFP013d5z9vGs;
	Sun, 18 Jan 2026 14:51:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mqe4PbllTfgw4Q02xodLd6RTh+/U7Ogr9KsLmiZ0FFI=;
	b=PNF1NTZ9+Au46jOTwJC8vnbxGzoLbvXUdnCzTu2EgplkC51Tu4spYzOGBj0cvJU+fXKUtY
	XdF7EOoywC3g12Cge1EpDzFUv7MN5E3s1mXtlEoAy+RLYo9rneovEGtGH8XS/XUfdrKhnj
	rqNlIJcO4Iq5YJgCLJ/Yvaq31qrOWoxiaFJhum+DaHl3dLDp5JqDkYcuuGJi9PHtuu2N5Y
	GrWICyzgVZjc3LRDKMV3TxeNBGsGGOylNS/uHWGte47kwHDIR5CSb87Fa4IvtL9XSb9dY4
	XBOekkkz/LcubB6fk2rX8IH+bxuXXIJc/eygAke8GNrxxo7tHF3v2/j1vou7wA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mqe4PbllTfgw4Q02xodLd6RTh+/U7Ogr9KsLmiZ0FFI=;
	b=grU0bNMjrbqClxoNJEiG03GKVw33SL+2zbBEpZgjRnlag/DPsUSWPZ7V3gi+eisRbxxfX8
	5fiS++l7ha/FLVsv5fT7wBytkDmfG37RKjsO0ZXkw/ieg1mCgfyVafmXxd0hnNnnUmIVTt
	oB9CFUs2bWduNwjlEVAqYcUbWOEkC9/WDDtu1dr9wLNU/eruTMhXF2RfbeqlSQImClllVl
	egu0RjT800o4YUNuVQQESRshOQIxGgxa1mAiskDWVIb72Vw2ZWoo7Wz4TxhGrNUhAm2dDo
	LiP3iPj/HyyKYUCv39MsEw//cp7Sxoo9P9Bd1G/gqdzuA+74zb4ps9qb0cy2Cg==
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
Subject: [PATCH v2 1/9] arm64: dts: renesas: r8a77951: Describe PCIe root ports
Date: Sun, 18 Jan 2026 14:49:49 +0100
Message-ID: <20260118135038.8033-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a7e0bc5619c45772485
X-MBO-RS-META: ibmwn9r77op8gd43ajeduq89keftzdx8

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
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 477cf37ab2434..fa702f87de6d0 100644
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


