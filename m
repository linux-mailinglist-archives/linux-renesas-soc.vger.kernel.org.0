Return-Path: <linux-renesas-soc+bounces-9110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5719881EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 11:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F1C71C229C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 09:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D882A1BAEC0;
	Fri, 27 Sep 2024 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H0xHxpkS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFED19882E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430875; cv=none; b=A6AK7ikzvNV03jbwMbqYYWjEMh+hB13a0WqPf1gj9xDocSHm4R1XRsVA3Ydu+E57KwxDlYMD5QvAerx/t7cSt4vuYpgZShkmvXe2qK3eiAF8qpvq5ezjR4ATfYHa/P8wGaEf3fdHCG0Vt+HJ7C1QDafP5jMulZ9TYYedS2JUXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430875; c=relaxed/simple;
	bh=8hX/k3SfkbVK0d2MUD7Tw/Qi1D62BNJQz86UvKgLeMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+Z8PqlpFQi03Rp1FY7l6oZhwU2AS8qHdVIvL5gpD57tmQKWoOCvUa/00ts6kmxD2kAK4XXBKhs+9ROGwYi7s87PES/q/r9RTtpR58fe9KQ7z6ylAHAW9UDiRsmBnLTrYg34tV4HUo8U0Y9f/nL+u44kzhutVEaQsQrpI+6ZP2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H0xHxpkS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ccdjzgJA7XMaVzQqsBS2TIGMGdhgY5QR01SFeBa6kqI=; b=H0xHxp
	kS8o0vlziFjhnTAU/lklFsySlqgaet99vtM4X2lHDEv2glerDvtxMfbliRkVM6rR
	M1SjR49EvcIhfh2yT71YsThX50DSsldeouin3zwCb9QgiXKVxsc3CNZjTzGH26XJ
	13Irfg58zAb0gn4WzaK+jlfvh2hU8tJ9Sw6W35+yAewnkDfv15ieDJZiZlTLyZ1Z
	wNLgC9GgHDs1DiK0DtTyq9u+mW7ARZLH73z69jus1Ng3stzSBVL6T+iYt4zYuzRx
	VvRIvFwyHXXU2NG6nBhaEPUn07qbhQkN0d9WKNF3jtZWTvJroPxewjOr0WHl3Wm+
	YS6mqjrx3wAdtzjg==
Received: (qmail 1283544 invoked from network); 27 Sep 2024 11:54:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2024 11:54:30 +0200
X-UD-Smtp-Session: l3s3148p1@RO1i1xYjDUltKPLv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: renesas: rza2mevb: use interrupts-extended for gpio-keys
Date: Fri, 27 Sep 2024 11:54:18 +0200
Message-ID: <20240927095414.10241-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
References: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupt.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
index cd2324b8e8ff..f69a7fe56b6e 100644
--- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
@@ -55,8 +55,7 @@ keyboard {
 		pinctrl-0 = <&keyboard_pins>;
 
 		key-3 {
-			interrupt-parent = <&irqc>;
-			interrupts = <0 IRQ_TYPE_EDGE_BOTH>;
+			interrupts-extended = <&irqc 0 IRQ_TYPE_EDGE_BOTH>;
 			linux,code = <KEY_3>;
 			label = "SW3";
 			wakeup-source;
-- 
2.45.2


