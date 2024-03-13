Return-Path: <linux-renesas-soc+bounces-3754-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E81CF87B0F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 20:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 260CA1C26E98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 19:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E501C6CDA1;
	Wed, 13 Mar 2024 18:16:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C221660873;
	Wed, 13 Mar 2024 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710353799; cv=none; b=u4f7w5/2CFWRr/oa16Lf4f5h8zCt9yuOyJAa1tV8jv3s6lDpmVvhSBbo5ErfM7QD51MaH1+/zw0TVLvxPtFOvGm1CF841vcJEprVc1+MFPFFUkw30Ym/dM+zQ/fwJa+gKsbynmPOkCziZnAZVpygmevhrFkBPZqwzjLUdULonAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710353799; c=relaxed/simple;
	bh=VsPSTx4FAn5TYxFLv+5eIGzlaYTwOKhJImeGwmZOZU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=umh+uolbn5S03118NclOKFNRvOM280md032fqQ9PF7v6wiPG7BbESEbUxF7P6ReELAHH23ii4lRVdXccEJvE4StMen12qzBNMRAkqdKLkHoICN/0tQslyakISucAdBQ63leNh+s5IJD7oEu2TTXikfTBhgUficD7NG4GN5odCjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,123,1708354800"; 
   d="scan'208";a="201538768"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Mar 2024 03:16:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.104])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 05F1E4045877;
	Thu, 14 Mar 2024 03:16:26 +0900 (JST)
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
Subject: [PATCH v2 5/5] arm64: dts: renesas: r9a07g0{43,44,54}: Update RZ/G2L family compatible
Date: Wed, 13 Mar 2024 18:16:02 +0000
Message-Id: <20240313181602.156840-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
References: <20240313181602.156840-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of pipe buffers on RZ/G2L family SoCs is 10, whereas on RZ/A2M
it is 16. Replace 'renesas,rza2m-usbhs->renesas,rzg2l-usbhs' as family SoC
compatible to handle this difference and use the SoC specific compatible
in driver to avoid the ABI breakage with older DTB.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description about ABI breakage.
 * Updated commit header as it is RZ/G2L specific.
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


