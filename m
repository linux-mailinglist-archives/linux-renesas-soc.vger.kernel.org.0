Return-Path: <linux-renesas-soc+bounces-3615-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95212876A88
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 19:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C653B1C20FFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Mar 2024 18:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7670A5646D;
	Fri,  8 Mar 2024 18:09:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813B557335;
	Fri,  8 Mar 2024 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709921385; cv=none; b=DGN9tb4IifRp/aP1CCGAj2eaMHpXxADblwVqNTVZ4bpvGyoDByTOgoLPK/CIKi4qhlUBf05r75wsd0+YTlCCBtycB0botjrfG9spocCtXmM5sn8Uj8z+aOluyA4OqE83/3lJjtvYQa3c5JB2hvWseqBdVrir71b6t44fL6qfqEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709921385; c=relaxed/simple;
	bh=w8DNTqScbuxt5BYOeXoAr/FGiG1zOfzajt7GULwggaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NkpUX2hi1OIIA0jbrMhZynw3m+LoS4SX7P3EOYGCwAVcGIWCKr6EAD5s4ks1YyddeKcASbwHQbE0FQN4HUtXHAG0CN+HZfshIlExX5On/4AbnvH1eVeClvNXEsuT1H5mz7XZPqhOWLle9+QKwnq1xV1E5D+C2sl8Kg0Em3PJyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,110,1708354800"; 
   d="scan'208";a="200889943"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Mar 2024 03:09:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5DADF40138F8;
	Sat,  9 Mar 2024 03:09:40 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs family compatible
Date: Fri,  8 Mar 2024 18:09:19 +0000
Message-Id: <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'renesas,rza2m-usbhs->renesas,rzg2l-usbhs' as family compatible
for RZ/G2L family SOCs as there is a difference in number of pipe
buffers compared to RZ/A2M.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 8721f4c9fa0f..766c54b91acc 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -812,7 +812,7 @@ usb2_phy1: usb-phy@11c70200 {
 
 		hsusb: usb@11c60000 {
 			compatible = "renesas,usbhs-r9a07g043",
-				     "renesas,rza2-usbhs";
+				     "renesas,rzg2l-usbhs";
 			reg = <0 0x11c60000 0 0x10000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(100) IRQ_TYPE_EDGE_RISING>,
 				     <SOC_PERIPHERAL_IRQ(101) IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 9f00b75d2bd0..88634ae43287 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -1217,7 +1217,7 @@ usb2_phy1: usb-phy@11c70200 {
 
 		hsusb: usb@11c60000 {
 			compatible = "renesas,usbhs-r9a07g044",
-				     "renesas,rza2-usbhs";
+				     "renesas,rzg2l-usbhs";
 			reg = <0 0x11c60000 0 0x10000>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 53d8905f367a..e89bfe4085f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -1225,7 +1225,7 @@ usb2_phy1: usb-phy@11c70200 {
 
 		hsusb: usb@11c60000 {
 			compatible = "renesas,usbhs-r9a07g054",
-				     "renesas,rza2-usbhs";
+				     "renesas,rzg2l-usbhs";
 			reg = <0 0x11c60000 0 0x10000>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.25.1


