Return-Path: <linux-renesas-soc+bounces-26631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AACD15DCD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 00:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01325303166D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 23:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636342C0298;
	Mon, 12 Jan 2026 23:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Y9kG7IlF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ANXM7HMq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D54629E117;
	Mon, 12 Jan 2026 23:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768261612; cv=none; b=H52OnU00mE12PaHi6zAq5Cm2FKrGJVZ7G+GWj/R+xwtpuQTAxRX8MJ7cvVO/2WxFGFFCNAOtxQ7p45VY8WeBbmhvydz3q/lq9NnMDtjGp0huQvc1rc3/kDrOqElugIk9I+HusxcXbRFVw79oQxmm4NoJ5Cb2WiSCM2aUK5RQiXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768261612; c=relaxed/simple;
	bh=AI6g3IezvC2iOKdDWGxHsISg4dkk3ZqX1D4yIJU83a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLAUGrN6afXGNHEo5tLz6zS4s21D6mbGm+fZMW3/h9vRLFopp5TwEVCDRgGqiqDeEKJRttzcUr+E6TYevrt0mWJlZPur6R17TV8spQygB9xXU2KdprScSb/+swtEG4hEpQDWBxH7Qxn9xBBs5EdLeDQSVI8aU5DGQgJ62hueuSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Y9kG7IlF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ANXM7HMq; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dqptw5FTFz9spP;
	Tue, 13 Jan 2026 00:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vAsObKeLs+Vgon6vSaaSKnPA55myfQZCA6nJALjAJ6U=;
	b=Y9kG7IlFHMtOQOnJkaIiCufSmZh96+kX5MzMqrZ4rEBZ5Zc6de1Ox9seoNlR216qjjTdIS
	IWIlqKDFTT6p+TOgUXEJEBa9rJj8yIgvnPXsG9XKes78HsevRlpW8RSzbq3oHlKR9QVn1p
	b97CmEpu2fCj/L2UUpOiTkdbH/720QQvoVM6igemfk27ADkAa/kBp9kXncgPiPItuqnrTK
	sSOGII7LQCyaTOWsJeA0rtLaKUkTjUCLg49Vix/BPQX9/W/UQIxbFagXO3N+aJPji1cRFs
	0vBeF/UDfydxepAHZt9lTT/WLqy9oN+IT9CPn6TJphSUrQfDLJ8TEgM+zmZioQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vAsObKeLs+Vgon6vSaaSKnPA55myfQZCA6nJALjAJ6U=;
	b=ANXM7HMqOV4HZBdZXTj3VXdIf46NFUysaVhYmSSMSLrrnNFfYiR8y+ohRKCavbg1SFpFW7
	tcsWWmvi91AfRw/o6s5BWvQmne667GO3EQesaf/N2Ir7I7/tojS9rUaDNBeVpECDZYQ0fl
	JXOHF3PVjMQ6jH9hEDIh0WaE0Pagl5Z6DBeOhu+tBtO1XUZzT0mwqj0lMfC1fOGzMXbjL9
	dUUP7BWCDA+gHHQbzTwQviMn9mCycpwBOpwSYTlceKUoD6rwjF/8vkvlaIM2Jl1oEBwyOK
	Bea1VeyV9PSZfaSDzKvA1C/6y9PmVD9fOFnyER5jC832h6w1u49HmVe+CRnLsA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Mark OTP and HSCIF0 pins as bootph-all
Date: Tue, 13 Jan 2026 00:45:56 +0100
Message-ID: <20260112234642.225993-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2e354213ba05c962de0
X-MBO-RS-META: ypdydd3izjbcjbnttkndu1kt6mscbknk

The U-Boot SPL is responsible for initializing the hardware and it does
also initialize HSCIF0 and its pinmux, mark the HSCIF0 pinmux as needed
in all bootloader stages. The SPL also uses OTP to determine the exact
V4H SoC variant during DRAM initialization, to determine which is the
maximum allowed DRAM rate, mark OTP as required in all bootloader stages
as well.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 9052d9c954738..bcf8270a3ed9a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -541,6 +541,10 @@ msiof1_snd_endpoint: endpoint {
 	};
 };
 
+&otp {
+	bootph-all;
+};
+
 /* Page 26 / 2230 Key M M.2 */
 &pcie0_clkref {
 	status = "disabled";
@@ -625,6 +629,7 @@ canfd4_pins: canfd4 {
 	hscif0_pins: hscif0 {
 		groups = "hscif0_data", "hscif0_ctrl";
 		function = "hscif0";
+		bootph-all;
 	};
 
 	/* Page 23 / DEBUG */
-- 
2.51.0


