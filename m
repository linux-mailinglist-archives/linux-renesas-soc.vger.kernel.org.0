Return-Path: <linux-renesas-soc+bounces-23951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C74C241AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 10:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6855C424449
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 09:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AC232E724;
	Fri, 31 Oct 2025 09:07:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFFA32E6AD
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901648; cv=none; b=YiyCO4sqQGUFt1gxDqZY0ErZ1t3VPUu+MI2uGok/Lrxn3JVimXahbRRdrdSAfgLXc6LgbmjJtwKjmqT6H6bXqV39rRJua9AcdAX437+1s5jq4N1z7gH7mthEwVLzeYtSwX9AmCIIm4Zcb8cVMPzTpOMB1ZQG0BZy+5BCrA1m48A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901648; c=relaxed/simple;
	bh=403TyY4ad+mHZoDa6O8RhNC9qD+mjBTEjsyj+TxD0qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qaS1pByCkpHi4eqmY/8siXJwcD9eJyoxeUGkEedb5XzhmJ0Mq4CChdHrnPM4ltvMpRn1zOsngzZrad02VzeO+jbGbC3RWL2QjZzGCSP9yCmxGXOVvMZIC+OYKzrWH9/1RmcyzYSGMP7k3SHP8qThsBj3xafFxoEzEzs1E6N3jW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60683C4CEF8;
	Fri, 31 Oct 2025 09:07:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Enable GPIO reset controller support
Date: Fri, 31 Oct 2025 10:07:20 +0100
Message-ID: <3d14309943541d370d92768e8448a6a6ac2e0985.1761901540.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of commit 690de2902dca98ae ("i2c: muxes: pca954x: Use reset
controller only") in v6.18-rc1, the NXP PCA954x I2C mux/switch driver
relies on GPIO reset controller support for proper reset operation.

Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Closes: https://lore.kernel.org/r/87a51um1y1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 8803b90c625885f3..5f15b48663b53f84 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -404,6 +404,7 @@ CONFIG_PWM_RENESAS_RCAR=y
 CONFIG_PWM_RENESAS_RZG2L_GPT=y
 CONFIG_PWM_RENESAS_RZ_MTU3=y
 CONFIG_PWM_RENESAS_TPU=y
+CONFIG_RESET_GPIO=y
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_RZV2H_USB2PHY=y
 CONFIG_PHY_CAN_TRANSCEIVER=y
-- 
2.43.0


