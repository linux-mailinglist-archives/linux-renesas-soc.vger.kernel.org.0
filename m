Return-Path: <linux-renesas-soc+bounces-10949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618B9E55D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFC8A288663
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 12:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F671D515A;
	Thu,  5 Dec 2024 12:53:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBA218AA0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733403238; cv=none; b=AxfBRl3V5RssN1dQsNZLUP7EXoReG7Jcbq7FKLZfEETHQT3RVFgaiYLDWnmnXXq93PlOwy7JzldgpkfRKTHllLLBCIv/qYkVZvhzrW/FaJxto8W94pCdWAt9mdb8Vi5RGkzlFDNWREIQnJ9rm5wqTT1NHKFAac2ow/YIYOVDpTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733403238; c=relaxed/simple;
	bh=QfWCcZQ+18+6RdNvz1Ex3nK7wDI1RB2erkOgGqI8LRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dlSV28kDGoiDQqJTzJv1cuK4faDH/YXl7PsBaJ4g8IcICc/TtgfuVMWz2rQAj334iZqCCy9pOZKN3FHpRGuhzbZwS304Yg7X+y4Z/a1cWwvt6dO+XdagqYTtbJXPLeKLumBgGiU+M3A7OS32axWk60c982KM3LHJtBKI6+b7ySo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by laurent.telenet-ops.be with cmsmtp
	id l0tt2D0083EEtj2010ttVM; Thu, 05 Dec 2024 13:53:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMe-000LOh-BU;
	Thu, 05 Dec 2024 13:53:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMf-00EQDQ-2T;
	Thu, 05 Dec 2024 13:53:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: white-hawk-single: Add R-Car Sound support
Date: Thu,  5 Dec 2024 13:53:49 +0100
Message-Id: <7c840b6e08e0af8a6b9bd5516969eb585f16e10a.1733402907.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733402907.git.geert+renesas@glider.be>
References: <cover.1733402907.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

White Hawk Single boards can use the same ARD-AUDIO-DA7212 external
audio board as the White Hawk board stack.  Add support for building
DTBs for them, and document the small differences in connector labels.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile                       | 4 ++++
 .../boot/dts/renesas/white-hawk-ard-audio-da7212.dtso      | 7 ++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index dea812ba55f3132e..68031d0f28fb2a54 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -91,8 +91,12 @@ r8a779g0-white-hawk-ard-audio-da7212-dtbs := r8a779g0-white-hawk.dtb white-hawk-
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single.dtb
+r8a779g2-white-hawk-single-ard-audio-da7212-dtbs := r8a779g2-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single.dtb
+r8a779g3-white-hawk-single-ard-audio-da7212-dtbs := r8a779g3-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779H0) += r8a779h0-gray-hawk-single.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso b/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
index e6cf304c77ee9225..1308a35561365f51 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
+++ b/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the White Hawk board with ARD-AUDIO-DA7212 Board
+ * Device Tree Source for the White Hawk (Single) board with ARD-AUDIO-DA7212
+ * Board
  *
  * You can find and buy "ARD-AUDIO-DA7212" at Digi-Key
  *
@@ -27,12 +28,12 @@
  * +----------------------------+
  * |Breakout board		|
  * |				|	+---------------+
- * |CN34 (I2C CN)		|	|J1		|
+ * |CN(30)34 (I2C CN)		|	|J1		|
  * |	I2C0_SCL	   pin3 |<----->| pin20 SCL	|
  * |	I2C0_SDA	   pin5 |<----->| pin18 SDA	|
  * |				|	+---------------+
  * |				|	+-----------------------+
- * |CN4 (Power)		        |	|J7			|
+ * |CN(300)4 (Power)	        |	|J7			|
  * |	3v3 (v)		   pin9 |<----->| pin4  / pin8  3.3v	|
  * |	GND (v)	    pin3 / pin4 |<----->| pin12 / pin14 GND	|
  * +----------------------------+	+-----------------------+
-- 
2.34.1


