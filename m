Return-Path: <linux-renesas-soc+bounces-16966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2205EAB3202
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 10:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0E5B179C4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 08:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8397F5674E;
	Mon, 12 May 2025 08:45:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C92E645
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039534; cv=none; b=plC5JdUgieEf2Z3ZR96zT1Ffdjd/r7zXeIT5eSiYcU87x4/tFk8GC6jLBr2xlSd/PICHNvJcfnnObiksML1ORYjNiaNzlQcMMGfbYaZNVe+i7nrJxzv+jgDej8u5oGD8i/xWSful1q/5GVm3F+trXIxDxMITc/M99OQUK1J7m6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039534; c=relaxed/simple;
	bh=2kWF33JkKQLFwWQMCHHoGu4E4ttZo4RsQM3jQZ2oD7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oKRY5lAqRa7aKJpJSsZwUP/nShAks3RwW+yQm+rJk84YSveQ8XZFELlO1eENdpTFTBAzIvy+0cV5+vNpgewU9XeM3ud1uVAfd9CaVzJa0ejS5Rels6qzuMPhekEqdBNxCWFZ9dksSsEjF3LmqhLrKf6QR81jnQWkaQL3F51xx7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:e731:371c:7707:a2ae])
	by baptiste.telenet-ops.be with cmsmtp
	id o8lN2E0044HZolA018lNU1; Mon, 12 May 2025 10:45:23 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uEOme-00000001PRX-2f3X;
	Mon, 12 May 2025 10:45:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uEOmo-00000006UfR-13Jb;
	Mon, 12 May 2025 10:45:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Disable dtc spi_bus_bridge check
Date: Mon, 12 May 2025 10:45:12 +0200
Message-ID: <fbad3581f297d5b95a3b2813bbae7dba25a523fd.1747039399.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make dtbs:

    arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
      also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
    arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
      also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
    arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'

The Sparrow Hawk uses the MSIOF module in I2S mode instead of SPI mode,
triggering a conflict between the SPI bus bindings and dtc:
  - Serial engines that can be SPI controllers must use "spi" as their
    node names,
  - Dtc assumes nodes named "spi" are always SPI controllers.

Fix this by disabling this specific warning for this board.

Fixes: ca764d5321a2cee7 ("arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/20250506192033.77338015@canb.auug.org.au
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.16.

 arch/arm64/boot/dts/renesas/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 21baaa25346744dd..58a498059cf5f2ca 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single.dtb
 r8a779g2-white-hawk-single-ard-audio-da7212-dtbs := r8a779g2-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 
+DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
-- 
2.43.0


