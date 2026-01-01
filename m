Return-Path: <linux-renesas-soc+bounces-26241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E58CED568
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9641F30051BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CB41D5AD4;
	Thu,  1 Jan 2026 20:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qONnL3la";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L4XYf3Xq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFCF2F3C2A;
	Thu,  1 Jan 2026 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300024; cv=none; b=eV9WlfY0AFawLpRCLlXY01zZPf0Lw+EEa4G+DlvYAt6GqFGf2SVV7vekxn2WsPQpaG16eaMdQq9EQjL1c8L3+xgwclxzlzyXlSyoeePYw3uky+s2pCBbrt9WpWCWufnB/hDvhHplBJzrVdDqc0nnmNJ94j4i1OLny9Y0ERckSVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300024; c=relaxed/simple;
	bh=4SQWaH6m5Hru/R8HOgesOKiFExcFSqq40nng5JozcFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0OHPJ4eZ494ZcLIf/0H1zmspExkjVx6/KyC1b8CXa5svUFFuHBytbTjHB1XioRNrwBVGtpgBeNmZf35qPwPYCHkFuWIBA/Z26iY/R8jh3SBdV0rtIfHSq/YLXe8smdT59hy4MQYCdKpZu5qmooflkxBHUDyglELTklJanr2/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qONnL3la; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L4XYf3Xq; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dhzGr6hScz9syY;
	Thu,  1 Jan 2026 21:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtilydaFBRdK6QbVHukBiWXRQofI1NBv+g3trQghN2Y=;
	b=qONnL3la3BgKPom7XE0m5ey/uWPleSuXxDK8ffOzJCHOqKDkfitSaAvbrgvTWi8NNj1hmb
	eZ+HK1tpUbB9unYc8aYDMJq80+wkIRD+GqERtm00G9BhaPG+JTDzX6ImD5qT/EyI5WbfSl
	8bjuts3Xr2e2mZ7Wyfmm8Cf2CG6oZtRJXMibzoF7xQDSCNVKgaZQt6D2fqMoG1YXloerN4
	/47HElCE+3egDrRi4RYdNauzKNVCAwZ86lb4IYRZLzBeesk7CZOafPnRLeRY6czIy0GlQB
	zDAVtwjFxEQYqrsSJmcj5WKLbA/dcLiJf4ZIIm+eCN4BQcE8qVFzmtiv5x9Jmg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=L4XYf3Xq;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtilydaFBRdK6QbVHukBiWXRQofI1NBv+g3trQghN2Y=;
	b=L4XYf3XqjyMxDiV2NZiKc1a0Uwjwk96J+VQKv3/3Bo6VjQMDK9lUphRfNs04fDXz8Qyg0r
	OJ8KmhQGovV6iiGUjbEd026gzSKforXuVxERtH0jvMFbxm913cZHHEIA9QC4vfU9vRX3+6
	unyCbaFq/VNrLOn0Y7Cz2+KrmkW/CStU6ResIvj0WbpkNEFKhT5V6oSj8JLLs2tVh5P+F7
	EqtxZQbzxIzWPQgK7XRkvI/tJwK2VQC1lglKa9r0lcc/aM49xAQ7S54L4nzVeUckEXdl7Q
	KzSZaN9Hg3ZgkxR319QJ8KoHvRh/vTLxivZ7s2YCkbrEHslGnQQ8AzUFAZVluQ==
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
Subject: [PATCH 06/11] arm64: dts: renesas: r8a77961: Describe PCIe root ports
Date: Thu,  1 Jan 2026 21:35:53 +0100
Message-ID: <20260101203938.159161-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7qmc1g9jswcpbrn3b44w5fb31ra3exff
X-MBO-RS-ID: f372713c550d010451f
X-Rspamd-Queue-Id: 4dhzGr6hScz9syY

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
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 31b11bdab69b9..7f87f248dff60 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2499,6 +2499,16 @@ pciec0: pcie@fe000000 {
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
@@ -2528,6 +2538,16 @@ pciec1: pcie@ee800000 {
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
 
 		fcpf0: fcp@fe950000 {
-- 
2.51.0


