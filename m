Return-Path: <linux-renesas-soc+bounces-22108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD89B8C100
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 08:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B1177E49B0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 06:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403022D63F9;
	Sat, 20 Sep 2025 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jmMwvWFm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E145823373D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Sep 2025 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758350694; cv=none; b=mgg1dssrVltktgw/8qU90r7BOZhDdwt7g9MunAD4lxLBhm0atn2n8NhmS8ZfLZmKh7hatxCejkBCU+mxoah8zu2nk8G1MneUx8YEe0iwSlpHjb3yFdbwSe3VJ9/CSNlN3tGx+ldKmuKhQdqIANIPVMsFiGsT+7GAKTtuKrI2CY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758350694; c=relaxed/simple;
	bh=vWZrEYsYkuX6mUArduhpirnfzBtwp8yyYJ4zdu+2hvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjrL6xGAGoKOFMT0Vhku7MEFZ+LBIVhttZxsgUGKcjKnv5YMJVScPLoiSJqAd8pAiKm+gR+O+sAMrQGhAj4Jr+RFVf8IiOMdYsBk9uHSdEbAnwXZKqb/3dg18skRIZuXMOs/WImRL6vTfIxw48OX9dtrnHcMFXjy3fjG/uwO4u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jmMwvWFm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tk1I62tLI0Vb8/eRDzu0H/ZdlVw1gol0e2AqPUX9ebo=; b=jmMwvW
	Fmgpa10GtjEYVsSHUpKg84V97uLAVAouRtJwWPHjYBTeI+0I/LtijpV7UDSr21DD
	s5mR2DoqqszhIZpB77mBbmwa9xZB8o78nGMoiBjJI99LuAY7CLSX9D7GvnDl8k4H
	8jBbUXPqBdpVhLjLR7e5yIv5a1RN3QgqACknpprAKvFjI8Jntlukm09jCAl1/VJM
	6oqQYJiFHDrT9PUBMKjzofqzwx+JF6uTnGZC9oZ54l0GNyGwG43HmkvTAgrGu0wB
	m98vTlSEBsgfRcxHc0KVk5BG6e+qN4wIqpnwrIt/nM7vx4gmTTrWRa+Tdgt+3LVo
	1M08kmPr+gItSIQQ==
Received: (qmail 4169214 invoked from network); 20 Sep 2025 08:44:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2025 08:44:41 +0200
X-UD-Smtp-Session: l3s3148p1@EQTF6zU/iJogAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 1/6] arm64: dts: renesas: r8a77951: add SWDT node
Date: Sat, 20 Sep 2025 08:44:28 +0200
Message-ID: <20250920064428.5544-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
References: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index c389ebc7e6ce..b3e935e5a2b1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -365,6 +365,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A7795_CLK_OSC>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a7795",
 				     "renesas,rcar-gen3-gpio";
-- 
2.47.2


