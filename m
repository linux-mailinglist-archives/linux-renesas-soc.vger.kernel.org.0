Return-Path: <linux-renesas-soc+bounces-26240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D79BCED563
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEE213005FF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552782F2619;
	Thu,  1 Jan 2026 20:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YwYAI8bl";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WA/xoVGd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A123322B5A5;
	Thu,  1 Jan 2026 20:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300021; cv=none; b=OMA9U3cXttDJ4sZMp0BxwtWp8sVWtatign+L5BWLzY3ccKRIEAVtiExRLQ4Q19NwI8srzTx9tmbz9JSHpHRW5CW4ibRj1EPwIfXc5HYC8J7kmZPVO+0NbGP8ePNLSg5P6MMf+VcfS5IkjW4X/D41zdOxZgOQ41x3+C6SmNLW6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300021; c=relaxed/simple;
	bh=Wu+9iNrEgSdOY88BfMGbURMg17mR5ivNPi10w4S2hMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTamIdrEg/zL+QxLeMDQUlqZ0gBZyEmg2zc1SkVE5xILAkn0YTwTEXl9fmU+Xwzz0h32yRStQTfyOg/3y2JW0o10KjuidCwYkdqn/5bDDas8TAC7+rso62JCbl8eNahPEJOUzLbwyodDqk7twgcighpPNtIMAxleQT9NcQjhDAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YwYAI8bl; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WA/xoVGd; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dhzGn3tXcz9t9F;
	Thu,  1 Jan 2026 21:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LT8cLq/mHX6yQ3WHHtPZLwnph/YQHgiYvcdPLd4Qvug=;
	b=YwYAI8blj6n3EI3qieRaBBLBRH/ilJ2rzvGeizJ+HLIHgua475GVW88TD7VQgM9xFVuTXF
	Yv8Mmfo3TMfSfVs3Ac/fuIwTQZvXecO2nEsA/+cUBcx1NiuFjbOrgOJZadtzixvIA23IGH
	1KdpbPCmASPV24tQ64xYi0jCAcnvcchwsWjNcse6Q5IGFM92fs4dV/MBJCK7Cat7iE4z9s
	58ERt/QVK9BH2QPhVL1DoSlSTeKR+ShYT9qLUCjeGMZk2hzekMBjySwYTTOfxbQlbqUxBY
	Ag7X61ge2yDokz+rGXiDL6oP/2ulCEz9gzHWGllNAUJqqu/+noE5qDwmu3ji0Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="WA/xoVGd";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LT8cLq/mHX6yQ3WHHtPZLwnph/YQHgiYvcdPLd4Qvug=;
	b=WA/xoVGdgrFPOnCFldjdV4H8sJfJ4LrqtCyaJXZExUXn1zKopHYRd4sc+aSWCs8Wdp/v2L
	ZmOOknr20O2EkqQV1JX61S1VNNGD2wo1aTot+P4XzLhdSoEdN6oUbDW/x65HBNA0jrMRh4
	T+cHA0jNAMfq2N1b27iPJulB4hx0oYSJ1kSnH26ItBGa/pMZyQfeIZwhF2LixteUEPLQz+
	kf6/Ne9mGW4ZSA6DHopjiC5YmVljKKOc8zP+4TGKF15RXLKwgmyCH0BhK5gdKgWaErKuLC
	oHZ2OcLYQPVQnfvtTE5CUODt9ipo539zNMzqYxPKsE7dDO36J9EcXt+jE8yeFA==
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
Subject: [PATCH 05/11] arm64: dts: renesas: r8a77960: Describe PCIe root ports
Date: Thu,  1 Jan 2026 21:35:52 +0100
Message-ID: <20260101203938.159161-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 52907308e78b1b226fa
X-MBO-RS-META: fd38qjdx1j7m4j3aqc7uh3qrguhqcb1u
X-Rspamd-Queue-Id: 4dhzGn3tXcz9t9F

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
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index e03b1f7cbfd6f..e2cdaec4dc2df 100644
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


