Return-Path: <linux-renesas-soc+bounces-9413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A41990430
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9374AB23388
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6039621F42B;
	Fri,  4 Oct 2024 13:22:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B026215F69
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048169; cv=none; b=ZuvNC6WopYPenwHbfqya2wdTHhpN9evXTvR1khkYNRT7Ljn+8exS3GGwasybEu5D2aFeLo4WAxF8g22hzTSztPxd0lkTp0InAZ6iLuC4w/STaS8Hy0FyNHHWlZYKsFpwl3DnvbHCf/c7D95E7N5ZasyetFfjIAmgqUjjuSLtD3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048169; c=relaxed/simple;
	bh=VHRchS1sR1T0efmS1i4HpM2O1WiLOHaNuqx5H+0LbEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b7EqMvwvFmnxf8jONAr5iJoqH3H1EXt+PMLk0HmDj69DmGptY+mpPvL7QRmB4FgSOYWuvMA/ZQKcif/WjP0k+oW9mKy7JoiNu/nTtHS03p06+/O7LPkAsNDQ8Efg/kVxEkiQPvqn6Gw2ddhmBn/e8Fbmwz72aAijm0fDSqf1x0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by laurent.telenet-ops.be with cmsmtp
	id LDNb2D00F4NXpdT01DNbUM; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGJ-001ElC-IR;
	Fri, 04 Oct 2024 15:22:35 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yV9-Sj;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 19/20] arm64: dts: renesas: beacon-renesom: Use interrupts-extended for touchscreen
Date: Fri,  4 Oct 2024 14:53:01 +0200
Message-Id: <c1ee39ab194f1d04d56af6804fd9e7632710154f.1728045620.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728045620.git.geert+renesas@glider.be>
References: <cover.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupt.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index fd1dd2875644dd60..729d165f909a5257 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -440,8 +440,7 @@ wm8962_endpoint: endpoint {
 	touchscreen@26 {
 		compatible = "ilitek,ili2117";
 		reg = <0x26>;
-		interrupt-parent = <&gpio5>;
-		interrupts = <9 IRQ_TYPE_EDGE_RISING>;
+		interrupts-extended = <&gpio5 9 IRQ_TYPE_EDGE_RISING>;
 		wakeup-source;
 	};
 
-- 
2.34.1


