Return-Path: <linux-renesas-soc+bounces-5666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F39898D3BB4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 18:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6D3C1F257DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 16:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FE0184108;
	Wed, 29 May 2024 16:02:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530FE1836FE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 16:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716998545; cv=none; b=oXkkVb2qV3uZO4czOe8Nu5Pq7ahKmef+pGXw5XY7PivbELnkEU6JH/6EMe8t0BMeiWi84doiWJCAirqKM4KYXlcegSX0OPJXPGJ8hiudwr0epvMjgAh7W4fefGOdrp2cxPl3tpTgWxcufSXkdYSFxhk4FM/+JmSWCoSH1DMm75A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716998545; c=relaxed/simple;
	bh=9wholWkhwfK9XZY5uBUbv2iwN8TpJ9ma3oTH/1JkMYI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K8nEG8obcz5ZTGxxwt4uwIGCc1ZLk8VGGVIW9U4tS20eNvRH2wJ7RdTP8gs3tR/3uXhARS7pZkWvz5xO52U1iaqTsfoU/VJ8Yv41ado1kvs0v3aY1Y+CzqsbeMEHAFef1FTbsYKIcNBFqtiDt9hheuVqBzbQQgiXYGWSO3D1vyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by albert.telenet-ops.be with bizsmtp
	id V42K2C0043VPV9V0642KA2; Wed, 29 May 2024 18:02:21 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLjs-00H5VP-Hk;
	Wed, 29 May 2024 18:02:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCLko-009oac-TI;
	Wed, 29 May 2024 18:02:18 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: defconfig: Enable Marvell 88Q2XXX PHY support
Date: Wed, 29 May 2024 18:02:16 +0200
Message-Id: <c5dcf03facd05e8b9c5ac89b2b81b005b141f086.1716998320.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for Marvell 88Q2XXX 100/1000BASE-T1 Automotive Ethernet
PHYs, as found on the Spider, S4 Starter Kit, and White-Hawk development
boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.11.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfad1cb8a072fa98..66d779547f0f6d66 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -377,6 +377,7 @@ CONFIG_AQUANTIA_PHY=y
 CONFIG_BCM54140_PHY=m
 CONFIG_MARVELL_PHY=m
 CONFIG_MARVELL_10G_PHY=y
+CONFIG_MARVELL_88Q2XXX_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_MICROSEMI_PHY=y
 CONFIG_AT803X_PHY=y
-- 
2.34.1


