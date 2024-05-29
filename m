Return-Path: <linux-renesas-soc+bounces-5662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6BE8D3B3A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 17:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9CC51C24487
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 15:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBE5335C7;
	Wed, 29 May 2024 15:42:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D15181B98
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997328; cv=none; b=DkgX8oMHQsHmR5UPrIb32GvvAFMyFREeMK72VSbNsZNZDzuoDo8SlTJeT7GP5GhZbfwfryt69r5pGkONWvgm8PABUbIOwjKZwolItpm5P/0rVDS7CTXuVlRGZR3vovwGPEQ2wItdfkO7bOX+MIe8gcwNCu3iB+8UTzEeB7AW9oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997328; c=relaxed/simple;
	bh=YydTu2YSxX2Wl5o2WNaCDPmzmTbFaoeIRFeX1q6WsPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JyxFz0VV7YKkf49b30yDwtvELWy3cwuhBBkWtBi7kWzPsj32bjxMRMs+XDn7TmMT4evaronCfgrJWVpYCI8HPod62IAp5bAeEjhnvekkiysIhIetvGFLl7nJzW9ZI48jwXs1agUJ9gaClyJS0x8/1rgnOYoVAWNBhCpe3oqJDw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by xavier.telenet-ops.be with bizsmtp
	id V3i22C00c3VPV9V013i2aa; Wed, 29 May 2024 17:42:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLQG-00H2xj-AV;
	Wed, 29 May 2024 17:42:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLRC-009nPa-Ma;
	Wed, 29 May 2024 17:42:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 1/3] arm64: renesas: defconfig: Enable Synopsys DesignWare eDMA support
Date: Wed, 29 May 2024 17:41:57 +0200
Message-Id: <d783b3ce0ad6b3f103c6085894886098d6b6ab63.1716997002.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716997002.git.geert+renesas@glider.be>
References: <cover.1716997002.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Synopsys DesignWare eDMA controller support, to increase
performance of the R-Car Gen4 PCIe controller in endpoint mode.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 1519280104d2104c..cd40cebd49c21d56 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -346,6 +346,7 @@ CONFIG_RTC_DRV_ISL1208=y
 CONFIG_RTC_DRV_RX8581=y
 CONFIG_RTC_DRV_DA9063=y
 CONFIG_DMADEVICES=y
+CONFIG_DW_EDMA=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_RZ_DMAC=y
-- 
2.34.1


