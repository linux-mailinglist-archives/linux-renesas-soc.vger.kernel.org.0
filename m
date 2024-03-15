Return-Path: <linux-renesas-soc+bounces-3818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F03D87D3C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 19:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A52111F241A2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 18:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF161F176;
	Fri, 15 Mar 2024 18:39:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9010D1F619;
	Fri, 15 Mar 2024 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710527999; cv=none; b=uaiyFtnAGOBnlW7mgawhC+HJ3qUh70JSzitAkvOVo5gFo0vbh0vc1qpc8iVwMN5irKKz3K74pnl9yoslh1Dt96lQnthtK66LIyP/cGElY0tkO3W4qo7CBU3u38oKDIFqi7rHzzywWtuKOP24CMlFqgF5n2oz/Uj0vtH30uQ0F3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710527999; c=relaxed/simple;
	bh=HLw1dxRHvtddRMKlWt4luDuZuTymJz5pk1mjwWmLtAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rX6ihITyDngSARvCAQUjm6l3LcUUjFHATBuSbjUbgJ2qkngEvqBZSRmRfWOrszSKeY1ShidIy0tfg1gmGwg0g/k8JJC2aA4umYFwVhIX9hoN7COQUt7jcklu6uHKUwz12SCYAKoFzQu01VPF+bdwatT9kCg8Jyor5EljiOHoXhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,129,1708354800"; 
   d="scan'208";a="201861088"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Mar 2024 03:39:56 +0900
Received: from localhost.localdomain (unknown [10.226.93.102])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 42DA34066236;
	Sat, 16 Mar 2024 03:39:52 +0900 (JST)
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
Subject: [PATCH v3 7/7] arm64: dts: renesas: r9a07g0{43,44,54}: Update RZ/G2L family compatible
Date: Fri, 15 Mar 2024 18:39:21 +0000
Message-Id: <20240315183921.375751-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
References: <20240315183921.375751-1-biju.das.jz@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
 * Added tags from Geert.
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


