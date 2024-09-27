Return-Path: <linux-renesas-soc+bounces-9153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4725F988B18
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 22:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAED0286BDC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 20:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3167B1C2DC9;
	Fri, 27 Sep 2024 20:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Mgid25Bv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6651C2DB2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 20:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727468014; cv=none; b=V4xUF6RZ3kfixKu+b9upy47AascLycUw3ABdzZw1xHE1lQtmtM+pYjinA79qQyZDGmmyZhFWo6gUJXR0gkEMdsEApSsYosliouWrKcUQT556TKbN0DtIgUIGA5ifiKTJOZpjJRlyWRNGPPZT8KQ51cpEUKg3/DuhCco0PPos/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727468014; c=relaxed/simple;
	bh=eaYlc4OHUIisBto2qbGbRBiSqBUNHOD90bMGJzAh8QY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uymD43KqDQSYhrQzJZ9ZxdaH3jukEJN2ziXMnQQ1nbWdWGTRq89scuLCdNhwE2jbqrA++EblCrs3HGSlOnzr6cqDJIJG9Hi+kU6izaXuRBblvUEU9J3LB4W/Nl/J0Bk9EA1RArjPeH/SHSzNrgds3eGnIYmNfMSoSKzTEXOKCAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Mgid25Bv; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727468009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtNjTwBLUZhf4+CdFGDYc6vbt+NFBvdBfVqHF0SsxBU=;
	b=Mgid25BvSpZbPoFHxy/+OLdlSdd6zKRB/5cbVYo9NsA4wyfSZ64NPsynF60yhg0tkWdNT5
	TqdHILreLJh6UIo6NSv86BIciJ3yO8S5OASJ+f34e4Nd/nyD82mUxJu+HVPrX3bi+JRuA+
	IZFrvnReIDGhgQXdRoM/U/u6D/5xZO8=
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
Subject: [PATCH 1/3] arm64: dts: renesas: salvator-x: Add SD/OE pin properties
Date: Fri, 27 Sep 2024 16:13:11 -0400
Message-Id: <20240927201313.624762-2-sean.anderson@linux.dev>
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
configuration reported by Geert [1] as well as his analysis of the
schematic.

[1] https://lore.kernel.org/linux-arm-kernel/CAMuHMdUmf=BYrVWGDp4kjLGK=66HSMJbHuMvne-xGLkTYnGv2g@mail.gmail.com/

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 arch/arm64/boot/dts/renesas/salvator-x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index ddee50e64632..5920932cbc2f 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -25,5 +25,7 @@ versaclock5: clock-generator@6a {
 		#clock-cells = <1>;
 		clocks = <&x23_clk>;
 		clock-names = "xin";
+		idt,shutdown = <0>;
+		idt,output-enable-active = <1>;
 	};
 };
-- 
2.35.1.1320.gc452695387.dirty


