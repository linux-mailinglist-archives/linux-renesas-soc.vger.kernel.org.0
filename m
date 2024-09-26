Return-Path: <linux-renesas-soc+bounces-9096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BAD9878E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 20:09:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B6A11C2186A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 18:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C536167D80;
	Thu, 26 Sep 2024 18:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O9o+YpqO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96031166F11
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 18:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727374175; cv=none; b=HpEWBVrSbGin+jt0H8uBf7W1ZlNHDaj0KFgD4/Mm3ny1zhCvNGwg6VXWGjXyhFjqS8XQ7Jtq+4WCvxcZsDpaiZYLcbszHSdqg/T0dz/CEaCJvQlWlHoYfD6VZDjJxfUoNTQ1LX9kPfiRCxPmF6glOwc/tCW/NTkS6WW/77lLBNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727374175; c=relaxed/simple;
	bh=vnoXmPj03gY3HeZFlU/P/fiukyHxubnqAyx25jYQ6PE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bWB6N2nLrwvPbKp7NwRqR162tcu+pIb8seFkRtB7lkD9GHmXyxoUMXGtG9avAEDlJs1ruFfqru7/6eWqmQ0JcwmwBeUr287r7mVk0INLiHgpkGbI+hRceTCCRQXyqStwIGJeX8HhRHQZqhI+4UOEF1bRi9+Bam8OpV04SSIKk84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O9o+YpqO; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727374171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mtm2tEn6+0ysbxRZCa9NK2SpqJBjdy9coOdju9E6VL4=;
	b=O9o+YpqOYzWoFfC6sMVyedxU6uVvTrnsEW0gevy1l9MYltp8/wE72b2jaFnMsd0tetmp57
	fopC0KEdgGMYBecsYa0+adB+rtcmWvGOTWspz+4SPDJY88/tGVx+BpG3Ny7VcvmYccg2IJ
	FSYo6F9xT8hRXieg0gWZGl4H3DwXk0o=
From: Sean Anderson <sean.anderson@linux.dev>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/2] arm64: dts: renesas: ulcb: Add SD/OE pin properties
Date: Thu, 26 Sep 2024 14:09:03 -0400
Message-Id: <20240926180903.479895-3-sean.anderson@linux.dev>
In-Reply-To: <20240926180903.479895-1-sean.anderson@linux.dev>
References: <20240926180903.479895-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add SD/OE pin properties to the devicetree so that Linux can configure
the pin without relying on the OTP. This configuration is based on
inspection of the schematic (which shows the SD/OE pin permanently tied
high).

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 arch/arm64/boot/dts/renesas/ulcb.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index a2f66f916048..2a2cd788ffec 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -234,6 +234,8 @@ versaclock5: clock-generator@6a {
 		#clock-cells = <1>;
 		clocks = <&x23_clk>;
 		clock-names = "xin";
+		idt,shutdown = <0>;
+		idt,output-enable-active = <1>;
 	};
 };
 
-- 
2.35.1.1320.gc452695387.dirty


