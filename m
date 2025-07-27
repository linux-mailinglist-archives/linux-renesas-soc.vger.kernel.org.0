Return-Path: <linux-renesas-soc+bounces-19706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC80B1328D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 01:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E21033A677E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Jul 2025 23:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A014D2522BA;
	Sun, 27 Jul 2025 23:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TKyVpY3e";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lAXQlp/w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3011A254E;
	Sun, 27 Jul 2025 23:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753660766; cv=none; b=CCcjU97NYU1wgEfNHmapPd0XRqjhiTRQGhXWA2eR700nqVvwssES6h/aSscYshIS8emkL918Zph1CROL761L72DpCvXameNLAPH+yyffj0qV6BGyWpJisYlWGBwihIKfMyqep/irz614RjRQdg5bS+aIeOHxKLKQ8c2LSztMBhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753660766; c=relaxed/simple;
	bh=IDPYYq6+Y7hVelxWz1YJTxIp2lHzHE4a58b7PCwGess=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qgsTEw0+TOcBS9oHyw/h4JIpFwz9E7ueaJ7SzuYbF3A1VxpD0vywaCJNiwBA+gNKqoISpUduN1NlUwBDstTXxW4yMKOJGpzs9V+kC5pnQzykiUZvW2Yj6j2c9SLW/LO3hdajOBAwRAIiAzVpHdM5erza0Yv6JcL/108waPuvhfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TKyVpY3e; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lAXQlp/w; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bqz9Q4SzKz9ts4;
	Mon, 28 Jul 2025 01:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753660762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bwZHfv7bs22p4Cd8SYFjyk554kcj5vyp15h3G865eEE=;
	b=TKyVpY3e0Ezo05THuHsVjXU/1Au1XHtzYyy/wpZ0vjU5HHtZMPHsgcnRvTMGYUCvwMU9Vy
	3Lodl3zuCTP7gZUlRX8hLhWBPpnIm1KRAhYKMjLJ01r0rJ1W/K8iyk3wZDPfnyLpuOoD0V
	ruVZVwmEdKwoAmuPQ7wPuaayJciWv9SAgEtrAX4dLxpjLGqM/tmq3HGwwKEXSVO+2d5vQ2
	fv/3cgxo/TJR+o36U0Kq/XqO+2Endcs6KECE8aVq+GIs/5gtu61qRb/mpF26+ChpnPtYtG
	Kf5p0DoZTmmtyvCUUyyvH1RL1gtxQlSS8GsUp986ZrJKXY8LhaF1RHoxtlXXCA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753660760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bwZHfv7bs22p4Cd8SYFjyk554kcj5vyp15h3G865eEE=;
	b=lAXQlp/wAco/VJfFAoj+xA+R2PIFhVSiVLS6QLzNGqTZ0k6bHhJJ4ckiBPB9EFuBnsHz4Z
	VScNwsGsxNNspa1qFNve6jK1HJ+FzMXtWUq8d7GvSS+8d3WBzmerqo+8nixKATqVWuhe/Z
	X6gdlU4JmHh3BivobECsCg2XS23EaIMfve8mBJqO3aU+X/mTaRVcUGHdt5xCIIoUxLJ+Xf
	HFvHpZTcicSwLOj+yxT8jx4Dj+JKx3q2OHN0V+ebnDq0xHtP6/c0f8Oszg99L76jy6kSU3
	hf3hasTzLOLKz/vChpcAZx6cTnjpnt8oXMczU+7TSZ0dKwO0xAz8aAGsltks8Q==
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
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Invert microSD voltage selector on Retronix R-Car V4H Sparrow Hawk EVTB1
Date: Mon, 28 Jul 2025 01:58:11 +0200
Message-ID: <20250727235905.290427-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c9c00573611d0c9b9cd
X-MBO-RS-META: ks969f3mpqpgnwzwryfpo3os8kbkwktd

Invert the polarity of microSD voltage selector on Retronix R-Car V4H
Sparrow Hawk board. The voltage selector was not populated on prototype
EVTA1 boards, and is implemented slightly different on EVTB1 boards. As
the EVTA1 boards are from a limited run and generally not available,
update the DT to make it compatible with EVTB1 microSD voltage selector.

Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
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
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index dfbf2ce7e23a..9d702b74c288 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -194,7 +194,7 @@ vcc_sdhi: regulator-vcc-sdhi {
 		regulator-max-microvolt = <3300000>;
 		gpios = <&gpio8 13 GPIO_ACTIVE_HIGH>;
 		gpios-states = <1>;
-		states = <3300000 0>, <1800000 1>;
+		states = <1800000 0>, <3300000 1>;
 	};
 };
 
-- 
2.47.2


