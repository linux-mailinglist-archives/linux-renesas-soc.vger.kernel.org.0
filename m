Return-Path: <linux-renesas-soc+bounces-26238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E15CED553
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFAB43004431
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E381DF748;
	Thu,  1 Jan 2026 20:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GtsHFhkF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MBkZXBFh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB3146D5A;
	Thu,  1 Jan 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300006; cv=none; b=GWxmIjkJEBFOCY31BWCUw8GMdIfT2r62MQ2XK3+ckfXC7zWc91IPk6sPjFx+gm+vwxUWXIEB1BR7drN9X4IehiyPz3gdfVzZQzPnrxxjE2dt1zn5Xc5dzBJ9tAgfhh4J6gzZNUEN+DpzmtN2ymImAtEWYqquw68l6aUgNat6WyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300006; c=relaxed/simple;
	bh=1XwLAUWO1wTvS471UH4+2pORAZgHI5ADEpP0wX0VDU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkokW+VbDIC1xSr+ruHaP4PFvlGsssBAiW1FNQ6P+n2yiMXMgGNke2v7ptBTySYjAd9Pm7q2bKuG3x4xJLUUKfAmzIg5XYinZAsPSXL35HCClJNfHWrTULmBkq9gbzr0TC2pp1TTKxpZ25kt2cZd+DMwL9+1omkEf3xAyX8FdjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GtsHFhkF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MBkZXBFh; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dhzGV0g79z9t8y;
	Thu,  1 Jan 2026 21:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767300002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pNjB8JHF9vUG3sfxi9yuJYE1G0JgkXxQf7v1dbh0Nb0=;
	b=GtsHFhkFwyTyed3HUwdkdkCFdOJp067NjqohznutES7KQqNjXIjQCAGKP7wQshioJFierX
	fzfoYzPlUDRb7fKPBCBdVhNoTi9N2zGmPFfw3NvCmLVMy+5LFg4q3X1RTQMvGfp5s+o4Us
	jK5buuaB1B70PP6IFBavBAHs96Eo3hRjnb+ep5hiCkcn0VcKrYE6j0ltU8tTmUDDRTi3tF
	/hn7V8EFz2oUx/K77F5AuwM1j667d4bjR3icyJI4xPzFc8KtqO7aR48T8q7um2sxPQyNuQ
	iDYwjbdpnEC5yXTz3umxYgza4HhUvV1UnrTsVU0g3okmdY/GaYMfxe8dq6nVyQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pNjB8JHF9vUG3sfxi9yuJYE1G0JgkXxQf7v1dbh0Nb0=;
	b=MBkZXBFhCw3KQJEtY0rqZGFaTgB2TlC2tphxVcxJsijmOU0EidyVZku9mOva/0YNX8gJ5t
	VuYg2tzANMgX2kS4srzb1KxUd5ZRWBmMBmgMpy4lG5YQ68IxRnXPN/xG+COYPVBFQ9wHrG
	QidP075l8UYn6YEBPBjp2RLUv5JtO2oFqh2x5Kps/+Sq+GVlRUm6j5VaXGaY75quGZ5j1z
	KMuGlIiaA5socPlqUeyBrEahKAR+PJzDZ+THjotl3YE1Ehh8LLdx8rZvbqBgZghe/28FZv
	mHy5dZVxLFvH06MZHROQRjcwdUsYas2jb0HyjrfrKecGIOBZfuvnnEouDGuX0A==
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
Subject: [PATCH 03/11] arm64: dts: renesas: ebisu: Enable USB 3.0 PHY
Date: Thu,  1 Jan 2026 21:35:50 +0100
Message-ID: <20260101203938.159161-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: de85bebfd5ffb719207
X-MBO-RS-META: jad7utns9ohqf5ywq53oyczc3hbfc6e5

Enable and configure the USB 3.0 PHY and its matching USB3S0 input
clock on R8A77990 E3 Ebisu board.

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
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index adc4449b809ad..0b1ada18a4f74 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -871,7 +871,17 @@ &usb2_phy0 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3s0_clk {
+	clock-frequency = <100000000>;
+};
+
 &usb3_peri0 {
+	phys = <&usb3_phy0>;
+	phy-names = "usb";
 	companion = <&xhci0>;
 	status = "okay";
 };
-- 
2.51.0


