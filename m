Return-Path: <linux-renesas-soc+bounces-26242-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 955AFCED56E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 964593003051
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640922F28FC;
	Thu,  1 Jan 2026 20:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TAARxPQY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qNHU0+Y2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9407C224FA;
	Thu,  1 Jan 2026 20:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300027; cv=none; b=Vi+eeVDK0UMwfmMVVgG2B1hHqP2cslCXYbIFtYsEIO58VldNOP2jU+ggd/IReDQOgtyHicQ6br4BBwG8dxj3XNwC+tHHcFVRdby45ZPjrw+gyysMa2RA4Af06RJrSnaKT3lSe9BhUHkj/Mm5PnSyEohvNyRQL8rw0zYUm6aZuNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300027; c=relaxed/simple;
	bh=99p7BgQnNCDA1PALPBtg647jxmzBWv0LbK7lh738DUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxlDvkGKVclZ6Qzilgc7P2Fmh/JTndROXI7kIvpRbsIkCwpF46Kj/dItunv2FBZtn4zalDiSNJtGQI7utylO+qS+5HRQYhvOncMl/dESJlAFZ2E4rRAe3ScYqLmu/Py5VP+wO31IjrlXStPzI5SmiTxXBGGY6LugfkVnpO4iOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TAARxPQY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qNHU0+Y2; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhzGv5GwQz9sl4;
	Thu,  1 Jan 2026 21:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xkQQBcY0vCVit3MxRiSlGpKSZBu+yOk6JMQzU+ULlN4=;
	b=TAARxPQYu2utKSRivz5yhsEJ8xpq7gAnMvF2+1eHA+gXuVEcbhVzwCyVoVUWo9MVfnYtPA
	FPjGNsvlAq17vdMNU5tByLNM6PzKq5NQg54tmKUDrS9g1jUjEgqKu7242DxkGZvqjh2I1U
	/nz8iTH8kyyqLnjbo6w/ecRdhznhmlLHQg/xR8eqkWJjZor1Dq3ll+WVvlQg3aSa78qvux
	Y7I0EjokO2kLWn082qgm1A8v8K0Ha2pkLLFssFpoK/c3hsYNRdoxEBcdFjnPJ8qQ6gKO+A
	1WCZ/jgY1K3XbEE27gWy9m3lmFq5X7jY0Z5qwtYI4PbkMEMcZblR/jA/WW/8TA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qNHU0+Y2;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xkQQBcY0vCVit3MxRiSlGpKSZBu+yOk6JMQzU+ULlN4=;
	b=qNHU0+Y2Wh/3/rE6SCwVVjdT1EceT4gCsSDBqkgBcKxgT6bkndzF0SKtwouSeEaBZSllLN
	Oq9AMT88kGXz0TFidIB7CR3ijoJJ7VK7LCjzQikdCgG0bOqPM17+umIGo7i0P1f9TEF0ff
	d6SRdlVRKWGM2m8o26lgNNnVAI6ov7Y1kGTh6cqFfSDIGH6aIP9CqjOy4X7T+C98HA/HzA
	zX0/w+efS1PSp4ZpK+u5skyPaM9ObqfrdeeP/7/qU6lgUV4Ctq/2UH/ad5i/BQszGF0Tbl
	7XtgUhz1QB+92PUTKyOqULfdbHCQmXNqIuppZR+ZQKSPQ6I+ZGG2f4YU3gOIPg==
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
Subject: [PATCH 07/11] arm64: dts: renesas: r8a77965: Describe PCIe root ports
Date: Thu,  1 Jan 2026 21:35:54 +0100
Message-ID: <20260101203938.159161-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6a076d3078e5c15469f
X-MBO-RS-META: 69kjem8iw9g33xmtnr14188kh68azj6q
X-Rspamd-Queue-Id: 4dhzGv5GwQz9sl4

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
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4e730144e5fd8..c25772429e12f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2494,6 +2494,16 @@ pciec0: pcie@fe000000 {
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
@@ -2523,6 +2533,16 @@ pciec1: pcie@ee800000 {
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
 
 		fdp1@fe940000 {
-- 
2.51.0


