Return-Path: <linux-renesas-soc+bounces-1887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030A83DAE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 14:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAC481F24D8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 13:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDBA1B81D;
	Fri, 26 Jan 2024 13:31:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E131B817;
	Fri, 26 Jan 2024 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706275907; cv=none; b=AoZ+v98HSUMaD3oqAAYphNobdzGJRy6G84xWJFe8aDLWuoD+upnBX1YxvTh/PcwcMfcd8dJPMfjRziEa5Owi5zDpzGZrFciVuTin5qBCCEBf85oq//I2mQn0LAB2O1VZfTfNOdcBg3Fneav1tQS+iYFLNDtw50vzn4koAoZZyrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706275907; c=relaxed/simple;
	bh=gLP7IdQq00AeVtd4IAcN/CG2JirZ28CygT4e2+OBMac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nkAVGAPkj83OQmMTNLcF9syDxLR7CmscCiRewy1XAV4oB0bNZPFrLJr9Hxr6d7z0DQ89xDjaW2Dq9rNYrKsqau26wPxHjxumUimzchhi6xP1atFkoebQTRZkbZTagzJjFWSjLPRtWoWjpeaKvAW6JZv8k2NgQ9QGRDcYUTJiLrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="195755080"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jan 2024 22:31:45 +0900
Received: from localhost.localdomain (unknown [10.226.93.117])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 53957422D9B2;
	Fri, 26 Jan 2024 22:31:42 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 5/5] arm64: dts: renesas: r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Date: Fri, 26 Jan 2024 13:31:16 +0000
Message-Id: <20240126133116.121981-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce i2c freq from 400->100 kHz on RZ/G2UL SMARC EVK as the captured
image is not proper with the sensor configuration over I2C.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 .../boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
index b41bb4b31a26..bb769c0f3ca5 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
@@ -19,3 +19,7 @@ &ov5645 {
 	enable-gpios = <&pinctrl RZG2L_GPIO(4, 4) GPIO_ACTIVE_HIGH>;
 	reset-gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
 };
+
+&i2c0 {
+	clock-frequency = <100000>;
+};
-- 
2.25.1


