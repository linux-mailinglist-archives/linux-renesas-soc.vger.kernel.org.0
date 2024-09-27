Return-Path: <linux-renesas-soc+bounces-9155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D724C988B1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 22:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D854286CF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 20:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87F91C330C;
	Fri, 27 Sep 2024 20:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rcxxiKrg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DAC1C32FD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 20:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727468018; cv=none; b=Qs0eiitiiNC+jAuAoDo/OIZbgUbr/AtDZDjl2wXQPhqxuUGnLGcFjhtfpa4tjXNMz2b+hxA/RzjjG+MIC1a9MXKLLafRLDCeIVqM9X0qJ05+gsvzLhGtaP5OhAIM+jSqn8HkGF6Ek+qH5C86z5tFXxLchF4dWcZ+0pV7Nai0r5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727468018; c=relaxed/simple;
	bh=neR70FWeqdxs0yYwmEFhXqtSf0MZQGryaX6gVOWU4kk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HY3gqS+x1Hp5PRWhIvAQK16WP+JXAHKHuAs4qs2+bbVf3jAdU+1Wjl8RaW8RHArOZ2EnENafSr/EGFw/2BCJqWbv7nGsbit1y2HfOjUkUjCIDq+e/t/l1dVZDT7+GI0zRSufTnUpYwsxytlLwxJ52YBx26to56AORAVovA7ndZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rcxxiKrg; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727468015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/xNhc8+PZj0WTaGQ0MRXNuLuruFyK61DR8gHEBRuys=;
	b=rcxxiKrgGAE5h+oeQSAHFT7DjCxxTCQWZt3lrCGpZJftAAAtk3SKtsw1o1lwyCK6oCUHjb
	oW/77VnRtIwOkTBTjE2KEU1ABBCJg3LOf1oGljmSq5ftyK1F6y3SViQEKoxq/11YPLdNvG
	StEUj03XkItYIAbEmq9JNcC6QkokF7w=
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
Subject: [PATCH 3/3] arm64: dts: renesas: beacon: Add SD/OE pin properties
Date: Fri, 27 Sep 2024 16:13:13 -0400
Message-Id: <20240927201313.624762-4-sean.anderson@linux.dev>
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
the pin without relying on the OTP. This matches the register
configuration reported by Adam [1] as well as his analysis of the
schematic.

[1] https://lore.kernel.org/linux-arm-kernel/CAHCN7x+tcvih1-kmUs8tVLCAk0Gnj11t0yEZLPWk3UBNyad7Jg@mail.gmail.com/

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 ++
 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 5a14f116f7a1..a258ba0d6b4f 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -364,6 +364,8 @@ versaclock6_bb: clock-controller@6a {
 		#clock-cells = <1>;
 		clocks = <&x304_clk>;
 		clock-names = "xin";
+		idt,shutdown = <0>;
+		idt,output-enable-active = <0>;
 
 		assigned-clocks = <&versaclock6_bb 1>, <&versaclock6_bb 2>,
 				  <&versaclock6_bb 3>, <&versaclock6_bb 4>;
diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 68b04e56ae56..06ad9db420d6 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -166,6 +166,8 @@ versaclock5: versaclock_som@6a {
 		#clock-cells = <1>;
 		clocks = <&x304_clk>;
 		clock-names = "xin";
+		idt,shutdown = <0>;
+		idt,output-enable-active = <0>;
 		/* du_dotclkin0, du_dotclkin2, usb_extal, avb_txcrefclk */
 		assigned-clocks = <&versaclock5 1>,
 				   <&versaclock5 2>,
-- 
2.35.1.1320.gc452695387.dirty


