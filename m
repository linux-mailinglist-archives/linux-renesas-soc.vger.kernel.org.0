Return-Path: <linux-renesas-soc+bounces-22885-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ABBBCCB4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 13:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C7C96354E2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 11:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D942ED871;
	Fri, 10 Oct 2025 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NNLA+xbT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1869B24167A;
	Fri, 10 Oct 2025 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760094679; cv=none; b=s4es+NSMTAQk3WrQeyYynvRjnUkbRUZK7jclptwmuHA5fPb9zIP+vpRkoTi7Gnv5p29re2kIMEcAwRIoVlI/rqChg7FySVy7PbWni+y0aOjgphrovzvV+qKRkp419pjugkwopZMchEOfE3/elxHgHon6ceVx0IDpPORMeNa8fug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760094679; c=relaxed/simple;
	bh=HZZH7WO7MYNIDuK1JbyTtNSFT3Zpq2r5jFfK8Vd/rH0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n5aQxKn29WM3sfpa9CTuRFXzg14MyO+DRJDkjWCATOHnW5bP0lbMyqdVz4I5ZTqGt/lSroZ9C3hswI1zFLV8b3y4Ldr+Q9wUG+8oNcgYmHCmPtrIs7MEVn5JZ3Js0GlK+JwkZmxh/UM/YqIIARrKqpHB12Le8elWFJPKKau8hjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NNLA+xbT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE9C2593;
	Fri, 10 Oct 2025 13:09:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760094580;
	bh=HZZH7WO7MYNIDuK1JbyTtNSFT3Zpq2r5jFfK8Vd/rH0=;
	h=From:Date:Subject:To:Cc:From;
	b=NNLA+xbTNp3/fnTp7xZNgxc6liW96C0QSG9Pfg1czV2vHsa0wyvrRpe2kyVIC5Ja8
	 5Y+oNR5Yhs6cDNGiuvQvNr9Gy6aXr6C++MfZy4m5a6yS0cd3QF/Z0y36Ur8cWUNdqz
	 JaB86pzWSuu9FUyRegRF9az8UrNSXoSRHm1tYB6g=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 10 Oct 2025 12:11:01 +0100
Subject: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAMTp6GgC/12OWwqDMBQFtyL3u4G8jNGtFCkx96YG0VpjpSDuv
 aH+lH7OgTPMDomWSAmaYoeFtpjiY8ogLgX43k13YhEzg+SyFFxwNrghzjdae86Uk9I4Y0IdOOT
 DvFCI76/s2p680POVnes5QucSMf8Yx7g2hdOq4k7wDtELVWusla1qjqXVlpCC8VYE7Tz8tjTFX
 wmuiWFJAZWVtguq2QS0x/EBGn4mINkAAAA=
X-Change-ID: 20251010-kakip_eth0-3a226a66f9f0
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=HZZH7WO7MYNIDuK1JbyTtNSFT3Zpq2r5jFfK8Vd/rH0=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo6OnSCnPGnPZoAuqOdNmY2oRVZbHZ+tMxACuml
 no5LGtsUKiJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaOjp0gAKCRDISVd6bEV1
 Mt4VD/0cEJxa+ChT6t5ixYJT5AZFsQjcfJbfWPQs/nVtotIcZZkWdd+QU5fM1HC2Rbgk2552kuG
 7nheaiY6+HF+lwwVLYhCN9oFJ4GOf20UfJwdQxxYxC7H5g92NltYb0voXIYDpOtM9ZH7um7Nekg
 eyaTGItDJQEmpjkIwI9GExRjxTQPYt29O4Rp9FdS9rppKIY/M7q/X6uSTq0RyGYA62IMBkZpvz9
 bY+pIQ2ocq22pjzw8UnXWHzEWQuEECA/dVeRzZjnPreSXqXg6PcoU+EYHuDpfqiDlOQyiuHt7BV
 erlrrmpOd+3WS/DPc+toXMg3p0V/z99TZB6Be2FbH8d4ZQLXYjuZTDm1fzxyV9PjSxd7FGPK2ow
 5TOZt2QVQteoL2L6peSGPi6f5PvltbAOaeMWmwtZ+G8mssFTCS3AWVFS5Mmgm4s8WjZ33Cuz+Tt
 LAPb6mr/HRB2Iw0DTVTjLBxKPtfl29Xoekf0QBAhfGvhXxCUOz//PG/OLM+fd0tP8vm4dm4X0fS
 OqLXK8jxpQ+oOg4R1N/kCCuAkfCVO0gvDTlkAFszxxqBJJ9SAqEu0gB+Zi/1yTbRhp5XyPS+141
 s2+keUV9Mup3u1OGyrYCHWXyk6p9U7uWgDFlPF/KkX1BFM54v32CnKcQ89GpOAwCCgPf41/PFZz
 WjyppMftqA6pIVQ==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Enable the eth0 node and define its phy.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
index 88a1beb731f57870a7d09cdbff1b58373f7119f5..37062adb1e04abca4cb208f66a20286b376c25f8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -16,6 +16,7 @@ / {
 	compatible = "yuridenki,kakip", "renesas,r9a09g057h48", "renesas,r9a09g057";
 
 	aliases {
+		ethernet0 = &eth0;
 		serial0 = &scif;
 		mmc0 = &sdhi0;
 	};
@@ -50,6 +51,33 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
 	};
 };
 
+&eth0 {
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy3>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&mdio0 {
+	phy3: ethernet-phy@3 {
+		compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";
+		reg = <3>;
+		rxc-skew-psec = <0>;
+		txc-skew-psec = <0>;
+		rxdv-skew-psec = <0>;
+		txdv-skew-psec = <0>;
+		rxd0-skew-psec = <0>;
+		rxd1-skew-psec = <0>;
+		rxd2-skew-psec = <0>;
+		rxd3-skew-psec = <0>;
+		txd0-skew-psec = <0>;
+		txd1-skew-psec = <0>;
+		txd2-skew-psec = <0>;
+		txd3-skew-psec = <0>;
+	};
+};
+
 &ivc {
 	status = "okay";
 };
@@ -91,6 +119,11 @@ &ostm7 {
 };
 
 &pinctrl {
+	eth0_pins: eth0 {
+		pins = "ET0_TXC_TXCLK";
+		output-enable;
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_RXD", "SCIF_TXD";
 	};

---
base-commit: a4370a10bddc1394d938790d5848edef6c81f4ac
change-id: 20251010-kakip_eth0-3a226a66f9f0
prerequisite-change-id: 20251010-kakip_dts-d5efd3828bf3:v1
prerequisite-patch-id: ce592b624666134fa79fc0ba8a7eeae413690234
prerequisite-patch-id: 177daefac529708187987f7f0e45591e3ac3d2e9
prerequisite-patch-id: 2a392ed12d2bed2a225dd896956fea7a99a8ed39

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


