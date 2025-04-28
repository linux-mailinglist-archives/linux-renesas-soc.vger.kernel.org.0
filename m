Return-Path: <linux-renesas-soc+bounces-16405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03280A9F07D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 14:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E2CB3B0E59
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 12:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F61EEAA;
	Mon, 28 Apr 2025 12:18:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37AD4C91
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842715; cv=none; b=MtEatiCo6angEhneyzD574ljI/VvMb4HwQHgomlPPhh1AHJJp9QWXbtA9aEYtormTL506pPZ+3IElTtRCBycignS6oQFO/Tf4Fo0Kk9bYz3Ce+xuiZsfAYOVBjG9C0TmOTIsdds7NE3j9LElykXviME7KWt9a5fBRGLhX27JeLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842715; c=relaxed/simple;
	bh=wroCUxFb0ZLupIX8yIeTCQLdGqf2dOtz1ICN1pphF5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cRz6Xd2h61IHGYdfIadoHVi8q9ijyrxSevTQ6qwtYmFXXlSqdusVFGn795GZgEnxYidccS7AdPWhUsbLBpSBVuoKagSPylFMKOBdiat3fy1x5CkoN+xibH4BYoBaK6CgBPcYGVtvvSp2Ws15qyWEetHsCl3I+42BPCuYcMO3aIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b9c4:1670:abc0:a1fc])
	by albert.telenet-ops.be with cmsmtp
	id icJX2E00D4Aed8c06cJXQk; Mon, 28 Apr 2025 14:18:31 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9NRO-00000000FA8-29N3;
	Mon, 28 Apr 2025 14:18:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9NRP-00000006xwc-2bPW;
	Mon, 28 Apr 2025 14:18:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Enable more Sparrow Hawk support
Date: Mon, 28 Apr 2025 14:18:30 +0200
Message-ID: <b798900b9ffb0c7f88ce0b960be011d345a243c1.1745842607.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable more support for the Retronix Sparrow Hawk development board:
  - PWM fan,
  - Renesas 9-series PCIe clock generator.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index c6e1fa75134a482b..74f5b13415425318 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -197,6 +197,7 @@ CONFIG_GPIO_RCAR=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_BD9571MWV=y
 CONFIG_SENSORS_ISL28022=y
+CONFIG_SENSORS_PWM_FAN=y
 CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
@@ -372,6 +373,7 @@ CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_MAX96712=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
-- 
2.43.0


