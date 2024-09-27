Return-Path: <linux-renesas-soc+bounces-9154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E6988B1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 22:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E047A286C6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 20:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3331C32EF;
	Fri, 27 Sep 2024 20:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TAaacyuA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E801C2DD1
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 20:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727468016; cv=none; b=fYc3rZq7zhLHPSgquYE3QnwbecCq8mg0MHE6NXYmcueY3mHlK2oW8lGINTVnfByJs1c5yX0P8XeulyLHiXmCuc2hzF0bBt84YGB5wpaif70uSFMOywCza1Uqjwb8Mi1dFb7E8NAvMJ0fhZFPHielFMlQLbSv8dOKPANuqvf1fZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727468016; c=relaxed/simple;
	bh=OYlpggxcIKhEZG6OUwarmtV6b8eMoZMubnmGsW0X1F0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dmshTEuMsNRtl1VtExhK14pwokW2pzrhxrqOsFEIeKsIyl/oiX5XLvFgkmmz2EuKzkMJef1795pvMpOjnZw2p8OAYhosuf/qkm6MNuFPsO+SMtDHtVqaTnT0afTmHOWIqx29qx3Hf6/uaZWsVpSw0hfdZGNQF7LyjVDPRjuOQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TAaacyuA; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727468012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O2En2LUWhEsQHsqEJNOotoHkKE7KQmkeHw7ybLj3Q3A=;
	b=TAaacyuAZ2phbSPNJBSf2hQIc73wP9BJuK/+QPeAuC9Y0+1Eb36NCx/XCa2/OHHEyHd2xB
	VFMHpzd33Qn0aAGBWM5e/yDzIevb6MbwM1QEOR0eYC9EfMLULQVY5ALVC99Ko3PZYKHE9b
	2iT21C3wxeBVfh9jF2I+bMLcBHR3IjY=
From: Sean Anderson <sean.anderson@linux.dev>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Ford <aford173@gmail.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/3] arm64: dts: renesas: hihope: Add SD/OE pin properties
Date: Fri, 27 Sep 2024 16:13:12 -0400
Message-Id: <20240927201313.624762-3-sean.anderson@linux.dev>
In-Reply-To: <20240927201313.624762-1-sean.anderson@linux.dev>
References: <20240927201313.624762-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add SD/OE pin properties to the devicetree so that Linux can configure
the pin without relying on the OTP. This is based on Geert's analysis of
the schematic [1].

[1] https://lore.kernel.org/linux-arm-kernel/CAMuHMdUmf=BYrVWGDp4kjLGK=66HSMJbHuMvne-xGLkTYnGv2g@mail.gmail.com/

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 83104af2813e..6abe094fc253 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -198,6 +198,8 @@ versaclock5: clock-generator@6a {
 		#clock-cells = <1>;
 		clocks = <&x304_clk>;
 		clock-names = "xin";
+		idt,shutdown = <0>;
+		idt,output-enable-active = <1>;
 	};
 };
 
-- 
2.35.1.1320.gc452695387.dirty


